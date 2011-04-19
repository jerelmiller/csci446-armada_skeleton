# Using declarative_authorization.
authorization do
  role :member do
    has_permission_on :members_members, :to => :read
    has_permission_on :members_users, :to => :edit
    has_permission_on :members_gnomes, :to => :manage
  end
  role :administrator do
    includes :member
    has_permission_on :admin_admin, :to => :read
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_roles, :to => :manage
    has_permission_on :admin_gnomes, :to => :manage
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
end
