class Notifier < ActionMailer::Base

  def notification(volunteer)
    @volunteer = volunteer
    mail(:to => volunteer.email,
         :from => "info@beschermcomite.be",
         :return_path => Settings.event_owner,
         :bcc => Settings.event_owner,
         :subject => "Uurrooster #{Settings.even_name}")
  end
end
