class Admin::NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.all.order('id DESC').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    if @news.save
       redirect_to admin_news_index_path, notice: 'news was successfully created.'
    else
      render :new
    end
  end

  def update
    if @news.update(news_params)
      redirect_to admin_news_index_path, notice: 'news was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to admin_news_index_path, notice: 'news was successfully destroyed.'
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :body, :pic)
  end

end
