class Admin::DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.xml
  def index
    unless current_user.has_perm?("departments_departments_can_list")
      permission_deny
    else
      @departments = Department.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @departments }
      end
    end
  end

  # GET /departments/1
  # GET /departments/1.xml
  def show
    unless current_user.has_perm?("departments_departments_can_show")
      permission_deny
    else
      @department = Department.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @department }
      end
    end
  end

  # GET /departments/new
  # GET /departments/new.xml
  def new
    unless current_user.has_perm?("departments_departments_can_create")
      permission_deny
    else
      @department = Department.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @department }
      end
    end
  end

  # GET /departments/1/edit
  def edit
    unless current_user.has_perm?("departments_departments_can_edit")
      permission_deny
    else
      @department = Department.find(params[:id])
    end
  end

  # POST /departments
  # POST /departments.xml
  def create
    unless current_user.has_perm?("departments_departments_can_create")
      permission_deny
    else
      @department = Department.new(params[:department])

      respond_to do |format|
        if @department.save
          flash[:notice] = 'Department was successfully created.'
          format.html { redirect_to([:admin, @department]) }
          format.xml  { render :xml => @department, :status => :created, :location => @department }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.xml
  def update
    unless current_user.has_perm?("departments_departments_can_edit")
      permission_deny
    else
      @department = Department.find(params[:id])

      respond_to do |format|
        if @department.update_attributes(params[:department])
          flash[:notice] = 'Department was successfully updated.'
          format.html { redirect_to([:admin, @department]) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.xml
  def destroy
    unless current_user.has_perm?("departments_departments_can_destroy")
      permission_deny
    else
      @department = Department.find(params[:id])
      @department.destroy

      respond_to do |format|
        format.html { redirect_to(admin_departments_url) }
        format.xml  { head :ok }
      end
    end
  end
end
