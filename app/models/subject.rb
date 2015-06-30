class Subject <ActiveRecord::Base
  has_many :lessons

  validates :title, :presence => true
  validates :number, :presence => true
end
