class Favoritization < ActiveRecord::Base
  belongs_to :user
  belongs_to :gnome

  validates_presence_of :user
  validates_presence_of :gnome

  def self.create_with(user_id, shield_id)
  	self.create(:user => User.find(user_id), :shield => Shield.find(shield_id))
  end
end
