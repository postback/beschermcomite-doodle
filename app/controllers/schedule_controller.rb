class ScheduleController < ApplicationController

  def show
    @postjes = Postje.order('sorting')
    @timeslots = Timeslot.order('sorting')
    @locks = Lock.all.map {|l| "#{l.timeslot_id}::#{l.postje_id}"}
    @notes = Hash.new('')
    Note.all.each {|n| @notes["#{n.timeslot_id}::#{n.postje_id}"] = n.note}
  end

  def update
    if params[:volunteers_for]
      volunteer = Volunteer.find_or_create_by(:email => params[:email], :name => params[:name])
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
      flash[:notice] = "Vergeten selecteren? Kies eerst een of meerdere posten door het vakje aan te vinken."
    end
    redirect_to schedule_path
  end

  # GET /schedule/settings
  def settings
    @postjes = Postje.all
    @timeslots = Timeslot.order('sorting')
    @locks = Lock.all.map {|l| "#{l.timeslot_id}::#{l.postje_id}"}
    @notes = Hash.new('')
    Note.all.each {|n| @notes["#{n.timeslot_id}::#{n.postje_id}"] = n.note}
  end

  # POST /schedule/settings
  def save_settings
    Lock.destroy_all
    params[:lock].each do |lock|
      timeslot_id, postje_id = lock.split('::')
      l = Lock.new :timeslot_id => timeslot_id, :postje_id => postje_id
      l.save
    end
    Note.destroy_all
    params[:note].each do |slot, note|
      next if note.blank?
      timeslot_id, postje_id = slot.split('::')
      n = Note.new :timeslot_id => timeslot_id, :postje_id => postje_id, :note => note
      n.save
    end

    flash[:notice] = "Settings werden opgeslaan."
    redirect_to '/settings'
  end

end
