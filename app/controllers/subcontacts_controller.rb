class SubcontactsController < ApplicationController
  # GET /subcontacts
  # GET /subcontacts.json
  respond_to :html, :json
  def index
    @subcontacts = Subcontact.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render :json => @subcontacts }
    #end
    respond_with(@subcontacts)
  end

  # GET /subcontacts/1
  # GET /subcontacts/1.json
  def show
    unless request.path == "/mailstarts/categoryalls/subcontacts/sort"
    	@subcontact = Subcontact.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render :json => @subcontact }
    #end
    	respond_with(@subcontact)
    else
	    params[:subcontact].each_with_index do |id, index|
	    	Subcontact.position(index+1,id)
	    end

	    render :nothing => true
    end
  end

  # GET /subcontacts/new
  # GET /subcontacts/new.json
  #def new
  #  @subcontact = Subcontact.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render :json => @subcontact }
  #  end
  #end

  # GET /subcontacts/1/edit
  def edit
    @subcontact = Subcontact.find(params[:id])
    @categoryall = @subcontact.categoryalls.find(cookies[:categoryall_id])
    @mailstart = @categoryall.mailstart
    @mail = @subcontact.mails.nil? ? "" : @subcontact.mails.first
    respond_with(@subcontact)
  end

  # POST /subcontacts
  # POST /subcontacts.json
  #def create
  #  @subcontact = Subcontact.new(params[:subcontact])

  #  respond_to do |format|
  #    if @subcontact.save
  #      format.html { redirect_to @subcontact, :notice => 'Subcontact was successfully created.' }
  #      format.json { render :json => @subcontact, :status => :created, :location => @subcontact }
  #    else
  #      format.html { render :action => "new" }
  #      format.json { render :json => @subcontact.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /subcontacts/1
  # PUT /subcontacts/1.json
  def update
    @subcontact = Subcontact.find(params[:id])

    #respond_to do |format|
    #  if @subcontact.update_attributes(params[:subcontact])
    #    format.html { redirect_to @subcontact, :notice => 'Subcontact was successfully updated.' }
    #    format.json { head :ok }
    #  else
    #    format.html { render :action => "edit" }
    #    format.json { render :json => @subcontact.errors, :status => :unprocessable_entity }
    #  end
    #end
    if @subcontact.update_attributes(params[:subcontact])  
    	flash[:notice] = t("mailstarts.update.notice_success")

    	params.keys.each do |k|
		set_params(k)
	end
    else
	flash[:notice] = t("mailstarts.update.notice_failure") 
	respond_with(@subcontact)
    end
  end

  # DELETE /subcontacts/1
  # DELETE /subcontacts/1.json
  def destroy
    @subcontact = Subcontact.find(params[:id])
    @subcontact.destroy

    #respond_to do |format|
    #  format.html { redirect_to subcontacts_url }
    #  format.json { head :ok }
    #end
    respond_with(@subcontact)
  end
end
