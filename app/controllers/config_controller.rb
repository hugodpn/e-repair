class ConfigController < ApplicationController

  skip_before_filter :require_authentification, :only => [:index]


  def index
  end

end