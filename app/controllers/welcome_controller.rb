class WelcomeController < ApplicationController
  def index
    flash[:notice] = "你好，欢迎！"
  end
end
