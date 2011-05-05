class Members::GnomesController < Members::MembersController

  filter_resource_access

  def index
    @gnomes = Gnome.paginate(:page => params[:page], :order => 'created_at DESC')
    @num_gnomes = Gnome.count
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gnomes }
    end
  end

  def show
    @gnome = Gnome.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gnome }
	  	format.js
    end
  end

  def new
    @gnome = Gnome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gnome }
    end
  end

  def edit
    @gnome = Gnome.find(params[:id])
  end

  def create
    @gnome = Gnome.new(params[:gnome])
    @gnome.user = current_user
    respond_to do |format|
      if @gnome.save
        flash[:success] = "#{@gnome.name} was successfully created."
        format.html { redirect_to(members_gnomes_url) }
        format.xml  { render :xml => @gnome, :status => :created, :location => @gnome }
      else
        flash[:error] = 'Gnome could not be created.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @gnome.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @gnome = Gnome.find(params[:id])

    respond_to do |format|
      if @gnome.update_attributes(params[:gnome])
        flash[:success] = "#{@gnome.name} was successfully updated."
        format.html { redirect_to(members_gnomes_url) }
        format.xml  { head :ok }
      else
        flash[:error] = "#{@gnome.name} could not be updated."
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gnome.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @gnome = Gnome.find(params[:id])

    respond_to do |format|
      if @gnome.destroy
        flash[:success] = 'Gnome was successfully deleted.'
        format.html { redirect_to(members_gnomes_url) }
        format.xml  { head :ok }
      else
        flash[:error] = 'Gnome could not be deleted.'
        format.html { redirect_to(members_gnomes_url) }
        format.xml { head :unprocessable_entity }
      end
    end
  end
end
