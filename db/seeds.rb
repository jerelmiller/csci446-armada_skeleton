require 'open-uri'
require 'active_record/fixtures'

#PaperTrail.whodunnit = 'Seed Data Script'


# Seed the roles.
Role.create!(:name => 'developer', :description => 'The system developer. There is no higher access level.')
Role.create!(:name => 'administrator', :description => 'A system administrator. Full access to all features.')
Role.create!(:name => 'member', :description => 'A typical application user.')


# Seed developer users.
#r = Role.find_by_name('developer')


#jermille = User.new(:first_name => 'Jerel',
 #                   :last_name => 'Miller',
 #                   :email => 'jermille@mines.edu',
 #                   :password => 'changeme',
 #                   :password_confirmation => 'changeme',
 #                   :role => r)
#jermille.save_without_session_maintenance


#awesterm = User.new(:first_name => 'Alec',
 #                   :last_name => 'Westerman',
 #                   :email => 'awesterm@mines.edu',
 #                   :password => 'changeme',
 #                   :password_confirmation => 'changeme',
 #                   :role => r)
#awesterm.save_without_session_maintenance

#yong = User.new(:first_name => 'Yong',
 #               :last_name => 'Bakos',
 #               :email => 'ybakos@mines.edu',
 #               :password => 'changeme',
 #               :password_confirmation => 'changeme',
 #               :role => r)
#yong.save_without_session_maintenance

Fixtures.create_fixtures("#{Rails.root}/test/fixtures","users")
Fixtures.create_fixtures("#{Rails.root}/test/fixtures","gnomes")

