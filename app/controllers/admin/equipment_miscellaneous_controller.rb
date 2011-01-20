class Admin::EquipmentMiscellaneousController < ApplicationController
  # GET /equipment_miscellaneous
  # GET /equipment_miscellaneous.xml
  def index
    @equipment_miscellaneous = EquipmentMiscellaneou.take_in.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_miscellaneous }
    end
  end

  # GET /equipment_miscellaneous/1
  # GET /equipment_miscellaneous/1.xml
  def show
    @equipment_miscellaneou = EquipmentMiscellaneou.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_miscellaneou }
    end
  end

  # GET /equipment_miscellaneous/new
  # GET /equipment_miscellaneous/new.xml
  def new
    @equipment_miscellaneou = EquipmentMiscellaneou.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment_miscellaneou }
    end
  end

  # GET /equipment_miscellaneous/1/edit
  def edit
    @equipment_miscellaneou = EquipmentMiscellaneou.find(params[:id])
  end

  # POST /equipment_miscellaneous
  # POST /equipment_miscellaneous.xml
  def create
    @equipment_miscellaneou = EquipmentMiscellaneou.new(params[:equipment_miscellaneou])

    respond_to do |format|
      if @equipment_miscellaneou.save
        flash[:notice] = 'EquipmentMiscellaneou was successfully created.'
        format.html { redirect_to([:admin, @equipment_miscellaneou]) }
        format.xml  { render :xml => @equipment_miscellaneou, :status => :created, :location => @equipment_miscellaneou }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment_miscellaneou.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment_miscellaneous/1
  # PUT /equipment_miscellaneous/1.xml
  def update
    @equipment_miscellaneou = EquipmentMiscellaneou.find(params[:id])

    respond_to do |format|
      if @equipment_miscellaneou.update_attributes(params[:equipment_miscellaneou])
        flash[:notice] = 'EquipmentMiscellaneou was successfully updated.'
        format.html { redirect_to([:admin, @equipment_miscellaneou]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment_miscellaneou.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_miscellaneous/1
  # DELETE /equipment_miscellaneous/1.xml
  def destroy
    @equipment_miscellaneou = EquipmentMiscellaneou.find(params[:id])
    @equipment_miscellaneou.destroy

    respond_to do |format|
      format.html { redirect_to(admin_equipment_miscellaneous_url) }
      format.xml  { head :ok }
    end
  end

  def take_out

    @equipment_miscellaneou = EquipmentMiscellaneou.find(params[:id])

  end

  def take_out_up

    @equipment_miscellaneou = EquipmentMiscellaneou.find(params[:id])
    
    if !params[:take_out_reason].nil? and params[:take_out_reason] != ""
      @equipment_miscellaneou.take_out_reason = params[:take_out_reason]
      @equipment_miscellaneou.take_out_user_id = params[:take_out_user_id]
      @equipment_miscellaneou.save
      flash[:notice] = 'Equipment was took out.'
      redirect_to(admin_equipment_miscellaneous_url)
    else
      flash[:notice] = 'Can not take out. You should add a reason.'
      redirect_to(admin_equipment_miscellaneous_url)
    end



  end

end
