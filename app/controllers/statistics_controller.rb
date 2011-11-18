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
    flash[:newsletter] = params[:newsletter]
    tab_result = Array.new
    tab_result = params[:newsletter][:name].empty? ? newsletter_statistic_with_name_empty(params[:newsletter],request.path) : newsletter_statistic_with_name_created_at(params[:newsletter],request.path)
    		@newsletters = tab_result[0]
    		@newsletters_mails_count_total = tab_result[1] 
    		@statistics_by_localization_and_newsletter = tab_result[2] 
    		@newsletter = Newsletter.new(:date_specification=>flash[:newsletter]["date_specification"], :name => flash[:newsletter]["name"])
    respond_with(@newsletters) 
  end
end
