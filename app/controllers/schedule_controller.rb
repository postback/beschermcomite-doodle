class ScheduleController < ApplicationController

  def show
    @tasks = Task.order('sorting')
    @timeslots = Timeslot.order('sorting')
    @locks = Lock.all.map {|l| "#{l.timeslot_id}::#{l.task_id}"}
    @notes = Hash.new('')
    Note.all.each {|n| @notes["#{n.timeslot_id}::#{n.task_id}"] = n.note}
  end

  def update
    if params[:volunteers_for]
      volunteer = Volunteer.find_or_create_by(:email => params[:email], :name => params[:name])
      volunteer.grade ||= params[:grade]
      volunteer.pupil ||= params[:pupil]
      volunteer.save
      params[:volunteers_for].each do |application|
        timeslot_id, task_id = application.split('::')
        task = Task.find(task_id)
        timeslot = Timeslot.find(timeslot_id)
        appl = Application.new :timeslot => timeslot, :task => task, :volunteer => volunteer
        appl.save
      end
      Notifier.notification(volunteer).deliver
      flash[:success] = "Uw gegevens werden geregistreerd"
    else
      flash[:warning] = "Vergeten selecteren? Kies eerst een of meerdere posten door het vakje aan te vinken."
    end
    redirect_to schedule_path
  end

  # GET /schedule/settings
  def settings
    @tasks = Task.order('sorting')
    @timeslots = Timeslot.order('sorting')
    @locks = Lock.all.map {|l| "#{l.timeslot_id}::#{l.task_id}"}
    @notes = Hash.new('')
    Note.all.each {|n| @notes["#{n.timeslot_id}::#{n.task_id}"] = n.note}
  end

  # POST /schedule/settings
  def save_settings
    Lock.destroy_all
    params[:lock].each do |lock|
      timeslot_id, task_id = lock.split('::')
      l = Lock.new :timeslot_id => timeslot_id, :task_id => task_id
      l.save
    end
    Note.destroy_all
    params[:note].each do |slot, note|
      next if note.blank?
      timeslot_id, task_id = slot.split('::')
      n = Note.new :timeslot_id => timeslot_id, :task_id => task_id, :note => note
      n.save
    end

    flash[:success] = "Settings werden opgeslaan."
    redirect_to '/schedule/settings'
  end

end
