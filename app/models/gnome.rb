class Gnome < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :gender
  validates_presence_of :cost
  
  belongs_to :user
  has_many :favoritizations
  has_many :users, :through => :favoritizations
  
  has_attached_file :photo,
                      :styles => {
                     
                      :default_url => '/images/default_shield.png',
                      :storage => :s3,
                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                      :path => "cs446/mw_assoc/#{Rails.env}/:attachment/:id/:style.:extension"
  
  def self.most_recent
    first(:order => 'created_at DESC')
  end
  
end
