class IndexController < ApplicationController

  def home
  end

  def role_selection
    @role = params[:role]
    respond_to do |format|
      format.js   { render partial: '/index/role.js.erb' }
    end
  end

end
