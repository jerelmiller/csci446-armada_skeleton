class Gnome < ActiveRecord::Base
  
  validates_presence_of :name
  
  belongs_to :user
  
  def self.most_recent
    first(:order => 'created_at DESC')
  end
  
end
