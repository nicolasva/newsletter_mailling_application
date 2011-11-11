class MailstartsController < ApplicationController
  # GET /mailstarts
  # GET /mailstarts.json
  respond_to :html, :json
  def index
    @mailstarts = Mailstart.order(:position).where(:user_id=>current_user.id)

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render :json => @mailstarts }
    #end
    respond_with @mailstart
  end

  # GET /mailstarts/1
  # GET /mailstarts/1.json
  def show
	  params[:mailstart].each_with_index do |id, index|
	  	Mailstart.position(index+1,id)
	  end

	  render :nothing => true
  end

  # GET /mailstarts/new
  # GET /mailstarts/new.json
  def new
    nb_mailstart = Mailstart.count
    nb_mailstart ||= 1 
    @mailstart = Mailstart.new(:mail=>"addr_by_default_#{nb_mailstart}@webmail.com", :user_id=>current_user.id, :position=>Mailstart.maximum(:position))
    @mailstart.save

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render :json => @mailstart }
    #end
    #respond_with @mailstart
    render :edit
  end

  # GET /mailstarts/1/edit
  def edit
    @mailstart = Mailstart.find(params[:id])
    @categoryall = @mailstart.categoryalls.nil? ? "" : @mailstart.categoryalls.first
    @subcontact = @categoryall.nil? || @categoryall.subcontacts.nil? ? "" : @categoryall.subcontacts.first
    @email = @subcontact.nil? || @subcontact.emails.nil? ? "" : @subcontact.emails.first
    respond_with @mailstart
  end

  # POST /mailstarts
  # POST /mailstarts.json
  #def create
  #  @mailstart = Mailstart.new(params[:mailstart])

  #  respond_to do |format|
  #    if @mailstart.save
  #      format.html { redirect_to @mailstart, :notice => 'Mailstart was successfully created.' }
  #      format.json { render :json => @mailstart, :status => :created, :location => @mailstart }
  #    else
  #      format.html { render :action => "new" }
  #      format.json { render :json => @mailstart.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /mailstarts/1
  # PUT /mailstarts/1.json
  def update
    @mailstart = Mailstart.find(params[:id])

    #respond_to do |format|
    #  if @mailstart.update_attributes(params[:mailstart])
    #    format.html { redirect_to @mailstart, :notice => 'Mailstart was successfully updated.' }
    #    format.json { head :ok }
    #  else
    #    format.html { render :action => "edit" }
    #    format.json { render :json => @mailstart.errors, :status => :unprocessable_entity }
    #  end
    #end
    if @mailstart.update_attributes(params[:mailstart]) 
	    flash[:notice] = t("mailstarts.update.notice_success") 
    	    params.keys.each do |k|
	    	set_params(k)
	    end
	    #redirect_to mailstarts_path
    else
	    flash[:notice] = ("mailstarts.update.notice_failure") 
    	    respond_with(@mailstart)
    end

  end

  # DELETE /mailstarts/1
  # DELETE /mailstarts/1.json
  def destroy
    @mailstart = Mailstart.find(params[:id])
    @mailstart.destroy ? t("mailstarts.destroy.notice_success") : t("mailstarts.destroy.notice_failure") 

    #respond_to do |format|
    #  format.html { redirect_to mailstarts_url }
    #  format.json { head :ok }
    #end
    respond_with(@mailstart)
  end
end
