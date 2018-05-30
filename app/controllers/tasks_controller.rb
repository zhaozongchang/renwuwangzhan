class TasksController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
    redirect_to tasks_path
  else
    render :new
   end
  end

  def show
   @task = Task.find(params[:id])
  end

  def edit

  end

  def update

    if @task.update(task_params)
    redirect_to tasks_path
  else
    render :edit
  end
end

  def destroy

    @task.destroy
    redirect_to tasks_path,notice: "删除成功"
  end


  private

  def find_task_and_check_permission
    @task = Task.find(params[:id])

    if current_user != @task.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def task_params
    params.require(:task).permit(:title, :description, :unacommpolished, :buckle, :deduction, :score)
  end
end
