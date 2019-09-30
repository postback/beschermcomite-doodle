# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  # Define your fields
  field :event_name, type: :string, default: "Feestje"
  field :event_date, type: :string, default: "12 oktober 2019"
  field :event_hours, type: :string, default: "11u - 21u"
  field :event_owner, type: :string, default: "mouton.vincent@gmail.com"
  field :event_desc, type: :string, default: "Lange text"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
