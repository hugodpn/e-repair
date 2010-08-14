class MainController < ApplicationController

  skip_before_filter :require_authentification, :only => [:index]

  def initialize
    
  end

  def index
    if current_user.nil?
      redirect_to :controller => "user_sessions", :action => "new"
    end
  end
  
end
