class UserSessionsController < ApplicationController

  skip_before_filter :require_authentification, :only => [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t('access.login_msg')
      redirect_to "/"
    else
      render :action => 'new'
    end
  end

  def destroy
    unless current_user
      redirect_to root_url
      return
    end
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = t('access.logout_msg')
    redirect_to root_url
  end

end
