class Admin::ReasonFaultsController < ApplicationController
  # GET /reason_faults
  # GET /reason_faults.xml
  def index
    unless current_user.has_perm?("reason_faults_reason_faults_can_list")
      permission_deny
    else
      @reason_faults = ReasonFault.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @reason_faults }
      end
    end
  end

  # GET /reason_faults/1
  # GET /reason_faults/1.xml
  def show
    unless current_user.has_perm?("reason_faults_reason_faults_can_show")
      permission_deny
    else
      @reason_fault = ReasonFault.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @reason_fault }
      end
    end
  end

  # GET /reason_faults/new
  # GET /reason_faults/new.xml
  def new
    unless current_user.has_perm?("reason_faults_reason_faults_can_create")
      permission_deny
    else
      @reason_fault = ReasonFault.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @reason_fault }
      end
    end
  end

  # GET /reason_faults/1/edit
  def edit
    unless current_user.has_perm?("reason_faults_reason_faults_can_edit")
      permission_deny
    else
      @reason_fault = ReasonFault.find(params[:id])
    end
  end

  # POST /reason_faults
  # POST /reason_faults.xml
  def create
    unless current_user.has_perm?("reason_faults_reason_faults_can_create")
      permission_deny
    else
      @reason_fault = ReasonFault.new(params[:reason_fault])

      respond_to do |format|
        if @reason_fault.save
          flash[:notice] = 'ReasonFault was successfully created.'
          format.html { redirect_to([:admin, @reason_fault]) }
          format.xml  { render :xml => @reason_fault, :status => :created, :location => @reason_fault }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @reason_fault.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /reason_faults/1
  # PUT /reason_faults/1.xml
  def update
    unless current_user.has_perm?("reason_faults_reason_faults_can_edit")
      permission_deny
    else
      @reason_fault = ReasonFault.find(params[:id])

      respond_to do |format|
        if @reason_fault.update_attributes(params[:reason_fault])
          flash[:notice] = 'ReasonFault was successfully updated.'
          format.html { redirect_to([:admin, @reason_fault]) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @reason_fault.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /reason_faults/1
  # DELETE /reason_faults/1.xml
  def destroy
    unless current_user.has_perm?("reason_faults_reason_faults_can_destroy")
      permission_deny
    else
      @reason_fault = ReasonFault.find(params[:id])
      @reason_fault.destroy

      respond_to do |format|
        format.html { redirect_to(admin_reason_faults_url) }
        format.xml  { head :ok }
      end
    end
  end
end
