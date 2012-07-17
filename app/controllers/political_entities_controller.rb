class PoliticalEntitiesController < ApplicationController
  # GET /political_entities
  # GET /political_entities.xml
  def index
    @political_entities = PoliticalEntity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @political_entities }
    end
  end

  # GET /political_entities/1
  # GET /political_entities/1.xml
  def show
    @political_entity = PoliticalEntity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @political_entity }
    end
  end

  # GET /political_entities/new
  # GET /political_entities/new.xml
  def new
    @political_entity = PoliticalEntity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @political_entity }
    end
  end

  # GET /political_entities/1/edit
  def edit
    @political_entity = PoliticalEntity.find(params[:id])
  end

  # POST /political_entities
  # POST /political_entities.xml
  def create
    @political_entity = PoliticalEntity.new(params[:political_entity])

    respond_to do |format|
      if @political_entity.save
        format.html { redirect_to(@political_entity, :notice => 'PoliticalEntity was successfully created.') }
        format.xml  { render :xml => @political_entity, :status => :created, :location => @political_entity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @political_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /political_entities/1
  # PUT /political_entities/1.xml
  def update
    @political_entity = PoliticalEntity.find(params[:id])

    respond_to do |format|
      if @political_entity.update_attributes(params[:political_entity])
        format.html { redirect_to(@political_entity, :notice => 'PoliticalEntity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @political_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /political_entities/1
  # DELETE /political_entities/1.xml
  def destroy
    @political_entity = PoliticalEntity.find(params[:id])
    @political_entity.destroy

    respond_to do |format|
      format.html { redirect_to(political_entities_url) }
      format.xml  { head :ok }
    end
  end
end