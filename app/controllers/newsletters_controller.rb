class NewslettersController < ApplicationController
  # GET /newsletters
  # GET /newsletters.json
 respond_to :html, :json, :png 
 def index
      unless params[:newsletter] || request.path == "/searchnewsletters"
    	 time_now = Time.now
    	 @newsletters = Newsletter.where("created_at >= :date or updated_at >= :date", {:date =>Time.local(time_now.year,time_now.month,time_now.day,0,0,0)})
      else
	unless request.path == "/searchnewsletters"
	 flash[:newsletter] = params[:newsletter]
	 tab_result = Array.new
	 #tab_result = newsletter_with_name_created_at(params[:newsletter],request.path)
	 tab_result = params[:newsletter][:name].empty? ? newsletter_with_name_empty(params[:newsletter],request.path) : newsletter_with_name_created_at(params[:newsletter],request.path) 
	        @newsletters = tab_result[0]
	else
		@newsletters = Newsletter.autocomplete_newsletter_name(params[:q])
	end
      end 
      @newsletter = (flash[:newsletter].nil? ? Newsletter.new : Newsletter.new(:date_specification=>flash[:newsletter]["date_specification"], :name=>flash[:newsletter]["name"])) unless request.path == "/searchnewsletters"
      flash[:notice].nil? ? respond_with(@newsletters) : redirect_to(newsletters_path)
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
    unless (request.path.scan(/^\/(.{1,})\/.{1,}$/)[0].nil? || request.path.scan(/^\/(.{1,})\/.{1,}$/)[0][0] == "imgnewsletters")
         @newsletter = Newsletter.find(params[:id])
         respond_with(@newsletter)
    else
	 Newsletter.updatetat(params[:id])
	 pixel = Magick::Image.new(1,1)
	 Magick::Draw.new.fill('white').point(1,1).draw(pixel)
	 pixel.write("#{Rails.root}/app/assets/images/statistic_pixel/pixel.png")
	 
	 pixel_read = Magick::Image.read("#{Rails.root}/app/assets/images/statistic_pixel/pixel.png").first
	 
	 send_data pixel_read.to_blob, :filename => "pixel.png",
	 	 		       :dsposition => 'inline',
	 			       :type => 'image/png'
    end
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

    if @newsletter.save
        params.keys.each do |k|
 		#if k.split("_").length-1 == 3
		#	case k.split("_")[0]
		#		when "registersend" 
		#			Sendnewsletters.sendnewsletter(params[:newsletter][:mailstart_id].to_s,@newsletter,request.domain).deliver
		#			flash[:notice] = t "newsletters.create.notice_success_sendind" 
		#		when "register"
		#			flash[:notice] = t "newsletters.create.notice_success" 
		#	end


		#end	
		set_params_newsletter(k)
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
    params[:newsletter][:email_ids] ||= []
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
		set_params_newsletter(k)	
	end	
    else
	    flash[:notice] = t("newsletters.update.notice_failure")
	    render :edit 
    end

    #redirect_to(:back)
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy ? t("newsletters.destroy.notice_success") : t("newsletters.destroy.notice_failure")

    respond_with(@newsletter)
  end
end
