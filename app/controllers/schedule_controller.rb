class ScheduleController < ApplicationController
  def show
    @postjes = Postje.all
    @timeslots = Timeslot.order('`order`')
    @locks = Lock.all.map {|l| "#{l.timeslot_id}::#{l.postje_id}"}
    @notes = Hash.new('')
    Note.all.each {|n| @notes["#{n.timeslot_id}::#{n.postje_id}"] = n.note}
  end

  def update
    if params[:volunteers_for]
      volunteer = Volunteer.find_or_create_by_email_and_name(params[:email], params[:name])
      volunteer.klas ||= params[:klas]
      volunteer.leerling ||= params[:leerling]
      volunteer.save
      params[:volunteers_for].each do |application|
        timeslot_id, postje_id = application.split('::')
        postje = Postje.find(postje_id)
        timeslot = Timeslot.find(timeslot_id)
        appl = Application.new :timeslot => timeslot, :postje => postje, :volunteer => volunteer
        appl.save
      end
      Notifier.notification(volunteer).deliver
      flash[:notice] = "Uw gegevens werden geregistreerd"
    else
      flash[:notice] = "Er is een fout gebeurd. U dient eerst een of meerdere posten te selecteren door het vakje rechtsboven aan te vinken."
    end
    redirect_to schedule_path
  end

end
