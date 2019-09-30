class SettingsController < ApplicationController
    before_action :authenticate, :get_setting, only: [:edit, :update]

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