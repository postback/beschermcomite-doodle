class Application < ActiveRecord::Base
  validates_presence_of :volunteer_id, :postje_id, :timeslot_id
  validates_uniqueness_of :volunteer_id, :scope => :timeslot_id
  belongs_to :volunteer
  belongs_to :postje
  belongs_to :timeslot

  scope :by_timeslot, ->(timeslot)  { where(timeslot_id: timeslot) }
  scope :by_postje,   ->(postje)    { where(postje_id: postje) }
  scope :search,      ->(query)     { where('email LIKE ?', "%#{query}%") or where('name LIKE ?', "%#{query}%") }

  def self.filter(params)
    query = Application
    query = query.by_timeslot(params[:timeslot]) if params[:timeslot].present?
    query = query.by_postje(params[:postje]) if params[:postje].present?
    query = query.joins(:volunteer).search(params[:search].strip.downcase) if params[:search].present?
    query = query.order(:created_at)
  end

end
