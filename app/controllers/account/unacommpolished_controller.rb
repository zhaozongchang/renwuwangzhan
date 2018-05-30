class Account::UnacommpolishedController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks.recent.paginate(:page => params[:page], :per_page => 8)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to account_unacommpolished_path, alert: "删除成功"
  end
end
