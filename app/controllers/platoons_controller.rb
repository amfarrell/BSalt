class PlatoonsController < ApplicationController
  # GET /platoons
  # GET /platoons.xml
  def index
    @platoons = Platoon.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @platoons }
    end
  end

  # GET /platoons/1
  # GET /platoons/1.xml
  def show
    @platoon = Platoon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @platoon }
    end
  end

  # GET /platoons/new
  # GET /platoons/new.xml
  def new
    @platoon = Platoon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @platoon }
    end
  end

  # GET /platoons/1/edit
  def edit
    @platoon = Platoon.find(params[:id])
  end

  # POST /platoons
  # POST /platoons.xml
  def create
    @platoon = Platoon.new(params[:platoon])

    respond_to do |format|
      if @platoon.save
        format.html { redirect_to(@platoon, :notice => 'Platoon was successfully created.') }
        format.xml  { render :xml => @platoon, :status => :created, :location => @platoon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @platoon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /platoons/1
  # PUT /platoons/1.xml
  def update
    @platoon = Platoon.find(params[:id])

    respond_to do |format|
      if @platoon.update_attributes(params[:platoon])
        format.html { redirect_to(@platoon, :notice => 'Platoon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @platoon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /platoons/1
  # DELETE /platoons/1.xml
  def destroy
    @platoon = Platoon.find(params[:id])
    @platoon.destroy

    respond_to do |format|
      format.html { redirect_to(platoons_url) }
      format.xml  { head :ok }
    end
  end
end
