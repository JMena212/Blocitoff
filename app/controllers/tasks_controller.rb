class TasksController < ApplicationController
 
 
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task was saved successfully"
      redirect_to root_path
    else
      flash[:alert] = 'Error creating task. Please try again.'
      render :new
    end
  end
  
  def create
      @task = Task.new(task_params)
      if @task.save
           # #20
       flash[:notice] = "Task was saved successfully."
       redirect_to @task
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
 
  private
  
  def task_params
      params.require(:task).permit(:body, :completed)
  end 

end
