class CorrectedentrysheetsController < ApplicationController

  def index

  end

  def show
    @correctedentrysheet=Correctedentrysheet.find(params[:id])
  end

  def new
    @correctedentrysheet=Correctedentrysheet.new
  end
  
  def create
    @entrysheet2=Entrysheet2.find(params[:id])
    @correctedentrysheet=@entrysheet2.correctedentrysheets.build(entrysheet2_params)
    if @correctedentrysheet.save
      flash[:ssuccess]='Esが正常に投稿されました'
      redirect_to root_url
    else
      @correctedentrysheets = @entrysheet2.correctedentrysheets.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render :new
    end
  
  end
end
