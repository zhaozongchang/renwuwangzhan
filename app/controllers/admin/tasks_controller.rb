class Admin::TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @tasks = Task.all.recent.paginate(:page => params[:page], :per_page => 8)
  end


  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
    redirect_to admin_tasks_path
  else
    render :new
   end 
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to admin_tasks_path, notice: "更新成功"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to admin_tasks_path, alert: "删除成功"
  end



  private

  def task_params
    params.require(:task).permit(:title, :description, :unacommpolished, :buckle, :deduction, :score)
  end

end
