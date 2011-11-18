class NewslettertimingprogrammingsController < ApplicationController
  # GET /newslettertimingprogrammings
  # GET /newslettertimingprogrammings.json
  def index
    @newslettertimingprogrammings = Newslettertimingprogramming.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @newslettertimingprogrammings }
    end
  end

  # GET /newslettertimingprogrammings/1
  # GET /newslettertimingprogrammings/1.json
  def show
    @newslettertimingprogramming = Newslettertimingprogramming.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @newslettertimingprogramming }
    end
  end

  # GET /newslettertimingprogrammings/new
  # GET /newslettertimingprogrammings/new.json
  def new
    @newslettertimingprogramming = Newslettertimingprogramming.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @newslettertimingprogramming }
    end
  end

  # GET /newslettertimingprogrammings/1/edit
  def edit
    @newslettertimingprogramming = Newslettertimingprogramming.find(params[:id])
  end

  # POST /newslettertimingprogrammings
  # POST /newslettertimingprogrammings.json
  def create
    @newslettertimingprogramming = Newslettertimingprogramming.new(params[:newslettertimingprogramming])

    respond_to do |format|
      if @newslettertimingprogramming.save
        format.html { redirect_to @newslettertimingprogramming, :notice => 'Newslettertimingprogramming was successfully created.' }
        format.json { render :json => @newslettertimingprogramming, :status => :created, :location => @newslettertimingprogramming }
      else
        format.html { render :action => "new" }
        format.json { render :json => @newslettertimingprogramming.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newslettertimingprogrammings/1
  # PUT /newslettertimingprogrammings/1.json
  def update
    @newslettertimingprogramming = Newslettertimingprogramming.find(params[:id])

    respond_to do |format|
      if @newslettertimingprogramming.update_attributes(params[:newslettertimingprogramming])
        format.html { redirect_to @newslettertimingprogramming, :notice => 'Newslettertimingprogramming was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @newslettertimingprogramming.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newslettertimingprogrammings/1
  # DELETE /newslettertimingprogrammings/1.json
  def destroy
    @newslettertimingprogramming = Newslettertimingprogramming.find(params[:id])
    @newslettertimingprogramming.destroy

    respond_to do |format|
      format.html { redirect_to newslettertimingprogrammings_url }
      format.json { head :ok }
    end
  end
end
