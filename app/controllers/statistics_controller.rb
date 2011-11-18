class StatisticsController < ApplicationController
  # GET /statistics
  # GET /statistics.json
  respond_to :html, :json, :png
  def index
    time_now = Time.now
    time_now_min = time_now - 2592000
    #@statistics_count_by_newsletter = Statistic.joins(:newsletter).where(:newsletters => {:created_at => time_now_min..time_now}).group(:newsletter_id).count
    @newsletter = Newsletter.new
    @newsletters = Newsletter.where(:created_at => time_now_min..time_now)
    @newsletters_mails_count_total = Newsletter.joins(:emails).where(:created_at => time_now_min..time_now).count
    @statistics_by_localization_and_newsletter = Statistic.joins(:newsletter).where(:newsletters => {:created_at => time_now_min..time_now}).group(:localization,:newsletter_id).count
    respond_with(@newsletters)
  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
    #@statistic = Statistic.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render :json => @statistic }
    #end
    #render :text => request.path
    #respond_with(@statistic)
    flash[:newsletter] = params[:newsletter]
    tab_result = Array.new
    tab_result = params[:newsletter][:name].empty? ? newsletter_statistic_with_name_empty(params[:newsletter],request.path) : newsletter_statistic_with_name_created_at(params[:newsletter],request.path)
    		@newsletters = tab_result[0]
    		@newsletters_mails_count_total = tab_result[1] 
    		@statistics_by_localization_and_newsletter = tab_result[2] 
    		@newsletter = Newsletter.new(:date_specification=>flash[:newsletter]["date_specification"], :name => flash[:newsletter]["name"])
    respond_with(@newsletters) 
  end

  # GET /statistics/new
  # GET /statistics/new.json
  def new
    @statistic = Statistic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @statistic }
    end
  end

  # GET /statistics/1/edit
  def edit
    @statistic = Statistic.find(params[:id])
  end

  # POST /statistics
  # POST /statistics.json
  def create
    if request.path.split("/")[request.path.split("/").length-2] == "pixelstatistic"
	city = IpGeocoder.geocode(request.remote_ip).city 
	city ||= "no city"
	newsletter_hash = Hash.new
	params_newsletter_hash = Hash.new
	params_newsletter_hash = { :newsletter_id => params[:newsletter_id], :ip => request.remote_ip, :localization => city }
	newsletter_hash = { :newsletter => params_newsletter_hash}
        Statistic.save_statistic(newsletter_hash[:newsletter])
        pixel = Magick::Image.new(1,1)
	Magick::Draw.new.fill('white').point(1,1).draw(pixel)
	pixel.write("#{Rails.root}/app/assets/images/statistic_pixel/pixel.png")
	 
	pixel_read = Magick::Image.read("#{Rails.root}/app/assets/images/statistic_pixel/pixel.png").first
	 
	send_data pixel_read.to_blob, :filename => "pixel.png",
	 	 		      :dsposition => 'inline',
	 			      :type => 'image/png'
    else
    	@statistic = Statistic.new(params[:statistic])

    	respond_with(@statistic)
    end
  end

  # PUT /statistics/1
  # PUT /statistics/1.json
  def update
    @statistic = Statistic.find(params[:id])

    respond_to do |format|
      if @statistic.update_attributes(params[:statistic])
        format.html { redirect_to @statistic, :notice => 'Statistic was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @statistic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic = Statistic.find(params[:id])
    @statistic.destroy

    respond_to do |format|
      format.html { redirect_to statistics_url }
      format.json { head :ok }
    end
  end
end
