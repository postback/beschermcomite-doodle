class SettingsController < ApplicationController
  before_action :authenticate
  before_action :get_setting, only: [:edit, :update]

  def show
  end

  def create
    setting_params.keys.each do |key|
      next if key.to_s == "site_logo"
      Setting.send("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
    end
    redirect_to settings_path(notice: "Setting was successfully updated.")
  end

  private
    def setting_params
      params.require(:setting).permit(:event_name, :event_desc, :event_hours,
        :event_date)
    end
  end





=begin

    class SettingsController < ApplicationController
    before_filter :authenticate

    def show
      @postjes = Postje.scoped
      @timeslots = Timeslot.order('`order`')
      @locks = Lock.all.map {|l| "#{l.timeslot_id}::#{l.postje_id}"}
      @notes = Hash.new('')
      Note.all.each {|n| @notes["#{n.timeslot_id}::#{n.postje_id}"] = n.note}
    end

    def update
      Settings.event_name = params[:name]
      Settings.event_date = params[:date]
      Settings.event_hours = params[:hours]
      Settings.event_owner = params[:owner]
      Settings.event_desc = params[:desc]

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

=end
