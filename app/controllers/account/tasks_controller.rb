class Account::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.recent.paginate(:page => params[:page], :per_page => 8)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to account_tasks_path, notice: "更新成功"
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
