class EmailsController < ApplicationController
  # GET /mails
  # GET /mails.json
  respond_to :html, :json
  def index
  #  @mails = Mail.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render :json => @mails }
  #  end
      unless request.path.split("/")[1] == "mailsremove" || request.path == "/result_dragondropmails"
	subcontact = Subcontact.find(params[:subcontact_id].to_i)
	@emails = subcontact.emails
      else
	  unless request.path == "/result_dragondropmails"
	      cpt = 0
	      list_mails = ""
	    unless params[:mail_id_source] == "no_id"
	      subcontact = Subcontact.find(params[:mail_id_source])
	      unless params[:mails].nil? || params[:mails].empty? || params[:mail_id_source] = "no_id"
		params[:mails].each_with_index do |id, index|
			#list_subcontacts += "#{id}-"
			email = Email.find(id)
				unless email.subcontacts.include?(subcontact)
					list_mails += "#{id}"
					cpt = cpt + 1
					if cpt < params[:mails].length
						list_mails += "-"
					end
				end
		end
	     end
	   end

		render :json => list_mails
	end
      end
  end

  # GET /mails/1
  # GET /mails/1.json
  def show
  #  @mail = Mail.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render :json => @mail }
  #  end
     params[:mail].each_with_index do |id, index|
     	Email.position(index+1,id)
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
    @email = Email.find(params[:id])
   unless (request.path.scan(/^\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0].nil? || request.path.scan(/^\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0][0] == "choosemails_to_subcontacts")
    @subcontact = @email.subcontacts.find(cookies[:subcontact_id])
    @categoryall = @subcontact.categoryalls.find(cookies[:categoryall_id])
    @mailstart = @categoryall.mailstart
   end
    respond_with(@email)
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
    @email = Email.find(params[:id])

    unless request.env["HTTP_REFERER"].scan(/^.{1,}\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0].nil? || request.env["HTTP_REFERER"].scan(/^.{1,}\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0][0] == "choosemails_to_subcontacts"
       if @email.update_attributes(params[:mail])
    	   flash[:notice] = t("mailstarts.update.notice_success") 
    	   params.keys.each do |k|
		   set_params(k)
	   end
       else
	flash[:notice] = t("mailstarts.update.notice_failure") 
    	respond_with(@email)
       end
    else
	     subcontact_source = @email.subcontacts.find(params[:mail][:subcontact_id_source].to_i)
                    subcontact_source.mails.delete(@email) if params[:mail][:copy_cut_mail] == "cut"

	     subcontact = Subcontact.find(params[:mail][:subcontact_ids].to_i)
	           unless subcontact.mails.include?(@email)
		   	flash[:notice] = subcontact.mails.push(@email) ? (params[:mail][:copy_cut_mail] == "cut" ? t("mails.update.notice_success_mail_cut_subcontact") : t("mails.update.notice_success_mail_copy_subcontact")) : t("mails.update.notice_failure_mail_not_add_subcontact")
		   else
			flash[:notice] = t("mails.update.notice_failure_mail_exist_in_subcontact")
		   end

		   redirect_to "/result_dragondropmails"
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
