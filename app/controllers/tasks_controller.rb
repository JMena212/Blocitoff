class TasksController < ApplicationController
 
 
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end
  
  def create
      @task = current_user.tasks.new(task_params)
      if @task.save
           # #20
      respond_to do |format|
         format.html {redirect_to root_path}
         format.js
       flash[:notice] = "Task was saved successfully."
      end
      else
       flash.now[:alert] = "Error creating task. Please try again."
       render :new
      end
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task updated"
    else
      flash[:alert] = 'Error creating task. Please try again'
    end
    redirect_to root_path
  end
 
  def destroy 
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task Removed"
    else
      flash[:alert] = "Task not removed"
    end
  end
 
  private
  
  def task_params
      params.require(:task).permit(:body, :completed)
  end 

end
