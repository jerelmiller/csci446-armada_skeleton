class Favoritization < ActiveRecord::Base
  belongs_to :user
  belongs_to :gnome
end
