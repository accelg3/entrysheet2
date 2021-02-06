class Entrysheet2sController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_q, only: [:index, :serch]
  def index
     
      @entrysheet2s=params[:tag_id].present? ? Tag.find(params[:tag_id]).entrysheet2s.order(id: :desc).page(params[:page]).per(8) : Entrysheet2.order(id: :desc).page(params[:page]).per(8)
    
    
  end
  
  def correctedindex
    @entrysheet2=Entrysheet2.find(params[:id])
    @correctedentrysheet2s=@entrysheet2.correctedentrysheet2s.order(id: :desc).page(params[:page]).per(6)
  end

  def show
    @entrysheet2=Entrysheet2.find(params[:id])
    
  end

  def new
    @entrysheet2=Entrysheet2.new
  end

  def create
    @entrysheet2=current_user.entrysheet2s.build(entrysheet2_params)
   
    if @entrysheet2.save
      
      flash[:ssuccess]='Esが正常に投稿されました'
      redirect_to @entrysheet2
    else
      @entrysheet2 = current_user.entrysheet2s.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render :new
    end
  end
  
  def download
    @entrysheet2=Entrysheet2.find(params[:id])
    
    filepath=@entrysheet2.esfileup.current_path
    
   
    send_file(filepath)
  end
  
  def help
    
  end
  
  def serch
    @q = Entrysheet2.ransack(params[:q])
    @results=@q.result.page(params[:page]).per(6)
  end
  
  

  
  
  private
    
    def set_q
      @q = Entrysheet2.ransack(params[:q])
    end
    
    def entrysheet2_params
      params.require(:entrysheet2).permit(:company,:idea,:industry,:business,:esfileup, tag_ids: [])
    end
  
end
