class Gnome < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :gender
  validates_presence_of :cost
  
  belongs_to :user
  has_many :favoritizations
  has_many :users, :through => :favoritizations
  
  
  def self.most_recent
    first(:order => 'created_at DESC')
  end
  
end
