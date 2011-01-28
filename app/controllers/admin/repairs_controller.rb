class Admin::RepairsController < ApplicationController
  # GET /repairs
  # GET /repairs.xml
  def index

    unless current_user.has_perm?("repairs_repairs_can_list")
      permission_deny
    else

      if !params[:repaired].nil?
        @conditions = "date_out is not null"
      else
        @conditions = "date_out is null"
      end
      #    @repairs = Repair.all :conditions => @conditions

      @repairs = Repair.paginate :page => params[:page], :order => 'created_at DESC',
        :conditions => [@conditions]
    
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @repairs }
      end
    end
  end

  # GET /repairs/1
  # GET /repairs/1.xml
  def show
    unless current_user.has_perm?("repairs_repairs_can_show")
      permission_deny
    else
      @repair = Repair.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @repair }
      end
    end
  end

  # GET /repairs/new
  # GET /repairs/new.xml
  def new
    unless current_user.has_perm?("request_repairs_request_repairs_can_repair")
      permission_deny
    else
      if params[:request]
        @repair = Repair.new
        @repair.request_repair_id = params[:request]
        @request_repair = RequestRepair.find(params[:request])

        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @repair }
        end
      else
        invalid_action
      end
    end
  end

  # GET /repairs/1/edit
  def edit
    unless current_user.has_perm?("repairs_repairs_can_edit")
      permission_deny
    else
      @repair = Repair.find(params[:id])
    end
  end

  # POST /repairs
  # POST /repairs.xml
  def create
    unless current_user.has_perm?("request_repairs_request_repairs_can_repair")
      permission_deny
    else
      @repair = Repair.new(params[:repair])

      respond_to do |format|
        if @repair.save
          flash[:notice] = 'Repair was successfully created.'

          @repair.request_repair.set_repair @repair.id

          format.html { redirect_to([:admin, @repair]) }
          format.xml  { render :xml => @repair, :status => :created, :location => @repair }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @repair.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /repairs/1
  # PUT /repairs/1.xml
  def update
    unless current_user.has_perm?("repairs_repairs_can_edit")
      permission_deny
    else
      @repair = Repair.find(params[:id])

      respond_to do |format|
        if @repair.update_attributes(params[:repair])
          flash[:notice] = 'Repair was successfully updated.'
          format.html { redirect_to([:admin, @repair]) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @repair.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /repairs/1
  # DELETE /repairs/1.xml
  def destroy
    unless current_user.has_perm?("repairs_repairs_can_destroy")
      permission_deny
    else
      @repair = Repair.find(params[:id])
      @repair.destroy

      respond_to do |format|
        format.html { redirect_to(admin_repairs_url) }
        format.xml  { head :ok }
      end
    end
  end
end
