class Notifier < ActionMailer::Base

  def notification(volunteer)
    @volunteer = volunteer
    mail(:to => volunteer.email,
         :from => "info@beschermcomite.be",
         :return_path => Setting.event_owner,
         :bcc => Setting.event_owner,
         :subject => "Uurrooster #{Setting.event_name}")
  end
end
