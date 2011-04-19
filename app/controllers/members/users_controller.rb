class Members::UsersController < Members::MembersController

  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  before_filter :require_no_user, :only => [:new, :create]

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to members_user_url(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

end