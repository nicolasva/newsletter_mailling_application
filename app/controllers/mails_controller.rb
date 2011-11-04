class MailsController < ApplicationController
  # GET /mails
  # GET /mails.json
  respond_to :html, :json
  #def index
  #  @mails = Mail.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render :json => @mails }
  #  end
  #end

  # GET /mails/1
  # GET /mails/1.json
  def show
  #  @mail = Mail.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render :json => @mail }
  #  end
     params[:mail].each_with_index do |id, index|
     	Mail.position(index+1,id)
     end

     render :nothing => true
  end

  # GET /mails/new
  # GET /mails/new.json
  #def new
  #  @mail = Mail.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render :json => @mail }
  #  end
  #end

  # GET /mails/1/edit
  def edit
    @mail = Mail.find(params[:id])
    @subcontact = @mail.subcontacts.find(cookies[:subcontact_id])
    @categoryall = @subcontact.categoryalls.find(cookies[:categoryall_id])
    @mailstart = @categoryall.mailstart
  end

  # POST /mails
  # POST /mails.json
  #def create
  #  @mail = Mail.new(params[:mail])

  #  respond_to do |format|
  #    if @mail.save
  #      format.html { redirect_to @mail, :notice => 'Mail was successfully created.' }
  #      format.json { render :json => @mail, :status => :created, :location => @mail }
  #    else
  #      format.html { render :action => "new" }
  #      format.json { render :json => @mail.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /mails/1
  # PUT /mails/1.json
  def update
    @mail = Mail.find(params[:id])

    #respond_to do |format|
    #  if @mail.update_attributes(params[:mail])
    #    format.html { redirect_to @mail, :notice => 'Mail was successfully updated.' }
    #    format.json { head :ok }
    #  else
    #    format.html { render :action => "edit" }
    #    format.json { render :json => @mail.errors, :status => :unprocessable_entity }
    #  end
    #end
    if @mail.update_attributes(params[:mail])
    	flash[:notice] = t("mailstarts.update.notice_success") 
    	params.keys.each do |k|
		set_params(k)
	end
    else
	flash[:notice] = t("mailstarts.update.notice_failure") 
    	respond_with(@mail)
    end
  end

  # DELETE /mails/1
  # DELETE /mails/1.json
  #def destroy
  #  @mail = Mail.find(params[:id])
  #  @mail.destroy

  #  respond_to do |format|
  #    format.html { redirect_to mails_url }
  #    format.json { head :ok }
  #  end
  #end
end
