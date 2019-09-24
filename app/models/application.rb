class Application < ActiveRecord::Base
  validates_presence_of :volunteer_id, :postje_id, :timeslot_id
  validates_uniqueness_of :volunteer_id, :scope => :timeslot_id
  belongs_to :volunteer
  belongs_to :postje
  belongs_to :timeslot
end
