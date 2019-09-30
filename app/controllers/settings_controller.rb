class SettingsController < ApplicationController
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
        params.require(:setting).permit(:host, :user_limits, :admin_emails,
          :captcha_enable, :notification_options)
      end
  end