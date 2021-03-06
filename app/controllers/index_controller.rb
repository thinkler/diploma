class IndexController < ApplicationController

  def home
    @news = News.all.order('id DESC').page(params[:page]).per(3)
    @info = Info.last
  end

  def role_selection
    @role = params[:role]
    respond_to do |format|
      format.js   { render partial: '/index/role.js.erb' }
    end
  end

end
