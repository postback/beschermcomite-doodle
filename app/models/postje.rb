class Postje < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :sorting
  validates_uniqueness_of :name

  has_many :applications, :dependent => :destroy
  has_many :volunteers, :through => :applications
end
