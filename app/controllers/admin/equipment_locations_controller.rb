class Admin::EquipmentLocationsController < ApplicationController
  # GET /equipment_locations
  # GET /equipment_locations.xml
  def index
    @equipment_locations = EquipmentLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_locations }
    end
  end

  # GET /equipment_locations/1
  # GET /equipment_locations/1.xml
  def show
    @equipment_location = EquipmentLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_location }
    end
  end

  # GET /equipment_locations/new
  # GET /equipment_locations/new.xml
  def new
    @equipment_location = EquipmentLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment_location }
    end
  end

  # GET /equipment_locations/1/edit
  def edit
    @equipment_location = EquipmentLocation.find(params[:id])
  end

  # POST /equipment_locations
  # POST /equipment_locations.xml
  def create
    @equipment_location = EquipmentLocation.new(params[:equipment_location])

    respond_to do |format|
      if @equipment_location.save
        flash[:notice] = 'EquipmentLocation was successfully created.'
        format.html { redirect_to([:admin, @equipment_location]) }
        format.xml  { render :xml => @equipment_location, :status => :created, :location => @equipment_location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment_locations/1
  # PUT /equipment_locations/1.xml
  def update
    @equipment_location = EquipmentLocation.find(params[:id])

    respond_to do |format|
      if @equipment_location.update_attributes(params[:equipment_location])
        flash[:notice] = 'EquipmentLocation was successfully updated.'
        format.html { redirect_to([:admin, @equipment_location]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_locations/1
  # DELETE /equipment_locations/1.xml
  def destroy
    @equipment_location = EquipmentLocation.find(params[:id])
    @equipment_location.destroy

    respond_to do |format|
      format.html { redirect_to(admin_equipment_locations_url) }
      format.xml  { head :ok }
    end
  end
end
