ActionController::Routing::Routes.draw do |map|
  map.resources :gnomes


  map.root :controller => "gnomes", :action => "index"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  
  map.register 'register', :controller => 'users', :action => 'new'
  map.resources :users, :only => [:new, :create]

  map.namespace :admin do |admin|
    admin.resources :roles
    admin.resources :users
    admin.resources :gnomes
    admin.mygnomes 'mygnomes', :controller => "my_gnomes", :action => "index"
    admin.show_content 'show_content', :controller => "gnomes_controller", :action => "show_content"
    admin.root :controller => 'admin', :action => 'index'
  end

  map.namespace :members do |members|
    members.resources :users, :only => [:show, :edit, :update]
    members.resources :gnomes
    members.mygnomes 'mygnomes', :controller => "my_gnomes", :action => "index"
    members.root :controller => 'members', :action => 'index'
  end

end
