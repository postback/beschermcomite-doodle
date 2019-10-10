class Volunteer < ActiveRecord::Base
  validates_presence_of :name, :email
  has_many :applications, :dependent => :destroy
  has_many :tasks, :through => :applications

  scope :for, lambda {|hour| joins(:applications).where('applications.hour = ?', hour)}
end
