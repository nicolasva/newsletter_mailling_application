class NewslettersController < ApplicationController
  # GET /newsletters
  # GET /newsletters.json
 respond_to :html, :json 
 def index
      unless params[:newsletter]
    	 time_now = Time.now
    	 @newsletters = Newsletter.where("created_at >= :date or updated_at >= :date", {:date =>Time.local(time_now.year,time_now.month,time_now.day,0,0,0)})
      else
	 flash[:newsletter] = params[:newsletter]
	 unless params[:newsletter][:name].empty?
		@newsletters = newsletter_with_name_created_at(params[:newsletter])
	 else
		@newsletters = newsletter_with_name_empty(params[:newsletter])
	 end
      end 
      @newsletter = flash[:newsletter].nil? ? Newsletter.new : Newsletter.new(:date_specification=>flash[:newsletter]["date_specification"], :name=>flash[:newsletter]["name"])
   	 flash[:notice].nil? ? respond_with(@newsletters) : redirect_to(newsletters_path)
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
    @newsletter = Newsletter.find(params[:id])
    respond_with(@newsletter)
  end

  def language
	cookies[:language] = params[:id]

	redirect_to(:back)
  end

  # GET /newsletters/new
  # GET /newsletters/new.json
  def new
    @newsletter = Newsletter.new

    respond_with(@newsletter)
  end

  # GET /newsletters/1/edit
  def edit
    @newsletter = Newsletter.find(params[:id])
    respond_with(@newsletter)
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(params[:newsletter])

    #respond_to do |format|
    #  if @newsletter.save
    #    format.html { redirect_to @newsletter, :notice => 'Newsletter was successfully created.' }
    #    format.json { render :json => @newsletter, :status => :created, :location => @newsletter }
    #  else
    #    format.html { render :action => "new" }
    #    format.json { render :json => @newsletter.errors, :status => :unprocessable_entity }
    #  end
    #end 
        #params.keys.each do |k|
	#	set_params(k)
	#end	
    if @newsletter.save
        params.keys.each do |k|
		#set_params(k)
 		if k.split("_").length-1 == 3
			case k.split("_")[0]
				when "registersend" 
					Sendnewsletters.sendnewsletter(params[:newsletter][:mailstart_id].to_s,@newsletter).deliver
					flash[:notice] = t "newsletters.create.notice_success_sendind" 
				when "register"
					flash[:notice] = t "newsletters.create.notice_success" 
			end


		end	
	end	
    	redirect_to edit_newsletter_path(@newsletter)
    else
	flash[:notice] = t "newsletters.create.notice_failure" 
	respond_with(@newsletter)
    end
  end

  # PUT /newsletters/1
  # PUT /newsletters/1.json
  def update
    params[:newsletter][:subcontact_ids] ||= []
    params[:newsletter][:mail_ids] ||= []
    @newsletter = Newsletter.find(params[:id])

    #respond_to do |format|
    #  if @newsletter.update_attributes(params[:newsletter])
    #    format.html { redirect_to @newsletter, :notice => 'Newsletter was successfully updated.' }
    #    format.json { head :ok }
    #  else
    #    format.html { render :action => "edit" }
    #    format.json { render :json => @newsletter.errors, :status => :unprocessable_entity }
    #  end
    #end
    if @newsletter.update_attributes(params[:newsletter]) 
        params.keys.each do |k|
		#set_params(k)
 		if k.split("_").length-1 == 3
			case k.split("_")[0]
				when "modifsend"	
					Sendnewsletters.sendnewsletter(params[:newsletter][:mailstart_id].to_s,@newsletter).deliver
					flash[:notice] = t("newsletters.update.notice_success_sendind") 
				when "modif"
					flash[:notice] = t("newsletters.update.notice_success") 
			end


		end	
	end	
    else
	    flash[:notice] = t("newsletters.update.notice_failure") 
    end

    #redirect_to(:back)
    render :edit 
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy ? t("newsletters.destroy.notice_success") : t("newsletters.destroy.notice_failure")

    respond_with(@newsletter)
  end

  private
  def newsletter_with_name_created_at(newsletter_hash)
	  unless newsletter_hash["created_at(1i)"].empty? || newsletter_hash["created_at(2i)"].empty? || newsletter_hash["created_at(3i)"].empty?
		time_params_form_at = Time.local(newsletter_hash["created_at(1i)"].to_i,newsletter_hash["created_at(2i)"].to_i,newsletter_hash["created_at(3i)"].to_i,0,0,0)
	  	if newsletter_hash["date_specification"]
			time_params_form_on = Time.local(newsletter_hash["created_on(1i)"].to_i,newsletter_hash["created_on(2i)"].to_i,newsletter_hash["created_on(3i)"].to_i,0,0,0)
			if time_params_form_at < time_params_form_on
				@newsletters = Newsletter.where(:created_at=>time_params_form_at..time_params_form_on)
			end
		else
			@newsletters = Newsletter.where(:created_at=>time_params_form_at)
		end
	  else
	 		@newsletters = Newsletter.where(:name => newsletter_hash[:name])
	  end

	  return @newsletters
  end

  def newsletter_with_name_empty(newsletter_hash)
	       unless newsletter_hash["created_at(1i)"].empty? || newsletter_hash["created_at(2i)"].empty? || newsletter_hash["created_at(3i)"].empty?  
	       		time_params_form_at = Time.local(newsletter_hash["created_at(1i)"].to_i,newsletter_hash["created_at(2i)"].to_i,newsletter_hash["created_at(3i)"].to_i)
			if newsletter_hash[:date_specification]
				time_params_form_on = Time.local(newsletter_hash["created_on(1i)"].to_i,newsletter_hash["created_on(2i)"].to_i,newsletter_hash["created_on(3i)"].to_i)
				if time_params_form_at < time_params_form_on
					@newsletters = Newsletter.where(:created_at=>time_params_form_at..time_params_form_on)	
				end
			else
				@newsletters = Newsletter.where(:created_at=>time_params_form_at)
			end
	       end

	       return @newsletters
  end

end
