class Members::MyFavoritesController < Members::MembersController
  
  GNOMES_PER_PAGE = 5

  def index   
    @gnomes = Favoritization.find_all_by_user_id(current_user.id).paginate(:page => params[:page], :per_page => GNOMES_PER_PAGE)
    @num_favoritization = Favoritization.find_all_by_user_id(current_user.id).count
  end

	def create
	  @favoritization = Favoritization.create_with(params[:user_id], params[:gnome_id])
	  respond_to do |format|
	  	if @favoritization.save  	
	  		format.html {
				if request.xhr?
					render :partial => 'star', :locals => {:gnome => @favoritization.gnome}
				else
					flash[:notice] = 'Favoritization sucessfully created'
				end
			}
		  else 
			  format.html {
				  if request.xhr?
					  render :partial => 'members/my_favoites/star', :locals => {:gnome => @favoritization.gnome}
			  	else
					  flash[:error] = "Sorry, couldn't create that favorite"
					  redirect_to_members_gnome_path(@favoritization.gnome)
			  	end
			}
			format.xml { render :xml => :favoritization.errors, :status => :unprocessable_entitity }
		  end	  		
	  end
	end																						  
	
	def destroy
		@favoritization = Favoritizaiton.find(params[:id])
		respond_to do |format|
			if @favoritization.destroy
				format.html {
					if request.xhr?
						render :partial => 'members/my_favorites/star',
							   :locals => {:shield => @favoritization.gnome,
							   			   :favoritization => @favoritization}
					else
						flash[:notice] = 'Favoritization sucessfully destroyed'
						redirect_to_members_gnome_path(@favoritization.gnome)
					end
				}
			else
				format.html {
					if reqest.xhr?
						render :partial => 'members/my_favoites/star', :locals => {:shield => @favoritization.gnome}
					else
						flash[:error] = 'Favoritization could not be destroyed'
						redirect_to_members_gnome_path(@favoritizatiion.gnome)
					end
				}
				format.xml { head :unprocessable_enitity}
			end
	end
       
  end
	 	

end
