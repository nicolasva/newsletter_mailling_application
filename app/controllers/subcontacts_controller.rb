class SubcontactsController < ApplicationController
  # GET /subcontacts
  # GET /subcontacts.json
  respond_to :html, :json
  def index
   unless request.path == "/result_dragondropsubcontacts" || (request.path.scan(/^\/(.{1,})\?.{1,}$/)[0].nil? || request.path.scan(/^\/(.{1,})\?.{1,}$/) == "subcontactsremove")
    	categoryall = Categoryall.find(params[:categoryall_id].to_i)
    	@subcontacts = categoryall.subcontacts
   else
	if !request.path.scan(/^\/(.{1,})\?.{1,}$/)[0].nil? || request.path.scan(/^\/(.{1,})\?.{1,}$/) == "subcontactremove"
		#subcontact = Subcontact.find(params[:subcontact_id])
	        #categoryall = Categoryall.find(params[:categoryall_id_source]) 
	        #render :text => subcontact.categoryalls.include?(categoryall)
		#list_subcontacts = ""
	      cpt = 0
	      list_subcontacts = ""
	    unless params[:categoryall_id_source] == "no_id"
	      categoryall = Categoryall.find(params[:categoryall_id_source])
	      unless params[:subcontacts].nil? || params[:subcontacts].empty? || params[:categoryall_id_source] == "no_id"
		params[:subcontacts].each_with_index do |id, index|
			#list_subcontacts += "#{id}-"
			subcontact = Subcontact.find(id)
				unless subcontact.categoryalls.include?(categoryall)
					list_subcontacts += "#{id}"
					cpt = cpt + 1
					if cpt < params[:subcontacts].length
						list_subcontacts += "-"
					end
				end
		end
	      end
	    end

		render :json => list_subcontacts

		#render :text => list_subcontacts
	end
   end
    #@subcontacts = Subcontact.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render :json => @subcontacts }
    #end
    #respond_with(@subcontacts)
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
   unless (request.path.scan(/^\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0].nil? || request.path.scan(/^\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0][0] == "choosesubcontacts_to_categoryalls")
    @subcontact = Subcontact.find(params[:id])
    @categoryall = @subcontact.categoryalls.find(cookies[:categoryall_id])
    @mailstart = @categoryall.mailstart
    @mail = @subcontact.mails.nil? ? "" : @subcontact.mails.first
   end
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
	unless request.env["HTTP_REFERER"].scan(/^.{1,}\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0].nil? || request.env["HTTP_REFERER"].scan(/^.{1,}\/(.{1,})\/.{1,}\/.{1,}\/.{1,}$/)[0][0] == "choosesubcontacts_to_categoryalls"
    		if @subcontact.update_attributes(params[:subcontact])  
    			flash[:notice] = t("mailstarts.update.notice_success")

    			params.keys.each do |k|
				set_params(k)
			end
    		else
			flash[:notice] = t("mailstarts.update.notice_failure") 
			respond_with(@subcontact)
    		end
	else
		categoryall_source = @subcontact.categoryalls.find(params[:subcontact][:categoryall_id_source].to_i)
			categoryall_source.subcontacts.delete(@subcontact) if params[:subcontact][:copy_cut_subcontact] == "cut"

		categoryall = Categoryall.find(params[:subcontact][:categoryall_ids].to_i)
	   	     unless categoryall.subcontacts.include?(@subcontact)
			 flash[:notice] = categoryall.subcontacts.push(@subcontact) ? (params[:subcontact][:copy_cut_subcontact] == "cut" ? "Ce sous-contact a bien été déplacé dans cette catégorie" : "Ce sous-contact a bien été ajouté dans cette catégorie") : "Ce sous-contact n'a pas été ajouté dans cette catégorie"
			
		     else
			flash[:notice] = "Ce sous-contact est déjà dans cette catégorie"
		     end

		flash[:notice] = "Ce sous-contact à bien été importé dans cette catégorie"
		#redirect_to edit_mailstart_path(categoryall_source.mailstart)
		redirect_to "/result_dragondropsubcontacts"
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
