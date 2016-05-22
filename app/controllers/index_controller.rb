class IndexController < ApplicationController

  def home
    @news = News.all.page(params[:page]).per(5)
    @info = Info.last
  end

  def role_selection
    @role = params[:role]
    respond_to do |format|
      format.js   { render partial: '/index/role.js.erb' }
    end
  end

end
