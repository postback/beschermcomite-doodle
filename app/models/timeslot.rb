class Timeslot < ActiveRecord::Base
  has_many :applications
end
