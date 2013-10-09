class HomeController < ApplicationController
  def index

  end

  def translate
    if params[:text]
      @text = params[:text]
      @phonetic_text = Translator.new.translate(params[:text])
    end
    render :index
  end
end
