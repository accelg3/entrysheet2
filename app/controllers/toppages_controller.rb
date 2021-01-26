class ToppagesController < ApplicationController
  def index
    if logged_in?
      redirect_to entrysheet2s_path
    end
    
  end
end
