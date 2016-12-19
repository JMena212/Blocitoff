class TasksController < ApplicationController
  def index
    @task = current_user.tasks
  end

  def new
    @task = Task.new
  end
end
