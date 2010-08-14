class Admin::RequestRepairsController < ApplicationController
  # GET /request_repairs
  # GET /request_repairs.xml
  def index

    if params[:all]=="1"
      @conditions = "repair_id is not null"
    else
      @conditions = "repair_id is null"
    end

    @request_repairs = RequestRepair.paginate :page => params[:page],
      :order => 'created_at DESC', :conditions => [@conditions]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @request_repairs }
    end
  end

  # GET /request_repairs/1
  # GET /request_repairs/1.xml
  def show
    @request_repair = RequestRepair.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request_repair }
    end
  end

  # GET /request_repairs/new
  # GET /request_repairs/new.xml
  def new
    @request_repair = RequestRepair.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request_repair }
    end
  end

  # GET /request_repairs/1/edit
  def edit
    @request_repair = RequestRepair.find(params[:id])
  end

  # POST /request_repairs
  # POST /request_repairs.xml
  def create
    @request_repair = RequestRepair.new(params[:request_repair])

    respond_to do |format|
      if @request_repair.save
        flash[:notice] = 'RequestRepair was successfully created.'
        format.html { redirect_to([:admin, @request_repair]) }
        format.xml  { render :xml => @request_repair, :status => :created, :location => @request_repair }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request_repair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /request_repairs/1
  # PUT /request_repairs/1.xml
  def update
    @request_repair = RequestRepair.find(params[:id])
    
    if params[:repaired] == "true"
      @request_repair.repair_id = -1
    else
      @request_repair.repair_id = nil
    end

    respond_to do |format|
      if @request_repair.update_attributes(params[:request_repair])
        flash[:notice] = 'RequestRepair was successfully updated.'
        format.html { redirect_to([:admin, @request_repair]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request_repair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /request_repairs/1
  # DELETE /request_repairs/1.xml
  def destroy
    @request_repair = RequestRepair.find(params[:id])
    @request_repair.destroy

    respond_to do |format|
      format.html { redirect_to(admin_request_repairs_url) }
      format.xml  { head :ok }
    end
  end
end
