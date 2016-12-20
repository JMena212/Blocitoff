class TasksController < ApplicationController
  def index
    @task = current_user.tasks
  end

  def new
    @task = Task.new
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
  
  
end
