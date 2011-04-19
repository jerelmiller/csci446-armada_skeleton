class Admin::GnomesController < Admin::AdminController

  GNOMES_PER_PAGE = 5

  def index
    @gnomes = Gnome.paginate(:page => params[:page], :per_page => GNOMES_PER_PAGE, :order => 'created_at DESC')
    @num_gnomes = Gnome.count
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gnomes }
    end
  end

  def show
    @gnome = Gnome.find(params[:id])
  end

  def new
    @gnome = Gnome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gnome }
    end
  end

  # GET /gnomes/1/edit
  def edit
    @gnome = Gnome.find(params[:id])
  end

  # POST /gnomes
  # POST /gnomes.xml
  def create
    @gnome = Gnome.new(params[:gnome])
    @gnome.user = current_user
    respond_to do |format|
      if @gnome.save
        format.html { redirect_to(admin_gnomes_url, :notice => 'Gnome was successfully created.') }
        format.xml  { render :xml => @gnome, :status => :created, :location => @gnome }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gnome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gnomes/1
  # PUT /gnomes/1.xml
  def update
    @gnome = Gnome.find(params[:id])

    respond_to do |format|
      if @gnome.update_attributes(params[:gnome])
        format.html { redirect_to(admin_gnomes_url, :notice => 'Gnome was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gnome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gnomes/1
  # DELETE /gnomes/1.xml
  def destroy
    @gnome = Gnome.find(params[:id])
    @gnome.destroy

    respond_to do |format|
      format.html { redirect_to(admin_gnomes_url) }
      format.xml  { head :ok }
    end
  end
end
