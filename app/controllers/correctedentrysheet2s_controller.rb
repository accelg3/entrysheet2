class Correctedentrysheet2sController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @correctedentrysheet2s=@entrysheet2.correctedentrysheet2s.order(id: :desc).page(params[:page]).per(6)
  end

  def show
    @correctedentrysheet2=Correctedentrysheet2.find(params[:id])
  end

  def new
     @correctedentrysheet2=Correctedentrysheet2.new
     
  end

  def create
    
    
    @correctedentrysheet2=current_user.correctedentrysheet2s.build(correctedentrysheet2_params)
    if @correctedentrysheet2.save
      flash[:ssuccess]='添削後Esが正常に投稿されました'
      redirect_to @correctedentrysheet2
    else
      @correctedentrysheet2s = current_user.correctedentrysheet2s.order(id: :desc).page(params[:page])
      flash.now[:danger] = '添削後ESの投稿に失敗しました。'
      render :new
    end
  end
  def download2
    @correctedentrysheet2=Correctedentrysheet2.find(params[:id])
    
    filepath=@correctedentrysheet2.correctedesfile.current_path
    
    send_file(filepath)
    
  end
  
  private
  def correctedentrysheet2_params
    params.require(:correctedentrysheet2).permit(:memo,:correctedesfile,:entrysheet2_id)
  end
  
end
