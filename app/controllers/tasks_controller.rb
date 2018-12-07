class TasksController < ApplicationController
  before_action :correct_user, only: [:destroy, :show, :edit, :update]
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = '正常に保存されました。'
      redirect_to @task
    else
      flash.now[:danger] = '保存に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = '正常に保存されました。'
      redirect_to @task
    else
      flash.now[:danger] = '保存に失敗しました。'
      render :edit
    end

  end

  def destroy
    @task.destroy
    
    flash[:success] = '正常に削除されました'
    redirect_to root_url
  end
  
  #Strong Parameter
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
