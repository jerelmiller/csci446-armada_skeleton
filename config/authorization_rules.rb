# Using declarative_authorization.
authorization do
  role :member do
    has_permission_on :members_my_favorites, :to => :favor
    has_permission_on :members_members, :to => :read
    has_permission_on :members_users, :to => :edit
    has_permission_on :members_gnomes, :to => [:read, :create] 
    has_permission_on :members_gnomes, :to => [:edit, :delete] do
      if_attribute :user => is {user}
    end
    has_permission_on :members_my_gnomes, :to => :read
    has_permission_on :members_my_favorites, :to => :read
  end
  role :administrator do
    includes :member
    has_permission_on :admin_admin, :to => :read
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_roles, :to => :manage
    has_permission_on :admin_gnomes, :to => :manage
    has_permission_on :admin_my_gnomes, :to => :read
    has_permission_on :admin_my_favorites, :to => :read
  end
  role :developer do
    includes :administrator
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :edit, :includes => [:edit, :update]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => [:edit]
  privilege :delete, :includes => :destroy
  privilege :favor, :includes => [:read, :create, :delete]
end
