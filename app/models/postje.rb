class Postje < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :applications, :dependent => :destroy
  has_many :volunteers, :through => :applications
end
