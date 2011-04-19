class Gnome < ActiveRecord::Base
  
  validates_presence_of :name
  
  belongs_to :user
  has_many :favoritizations
  has_many :users, :through => :favoritizations
  def self.most_recent
    first(:order => 'created_at DESC')
  end
  
end
