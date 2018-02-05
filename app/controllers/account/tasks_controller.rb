class Account::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to account_tasks_path, alert: "删除成功"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :unacommpolished, :buckle, :deduction, :score)
  end

end
