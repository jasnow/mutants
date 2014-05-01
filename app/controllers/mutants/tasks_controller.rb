module Mutants
  class TasksController < ApplicationController
    def index
      @tasks = Mutants::Task.order(:id).all
    end

    def new
      @task = Mutants::Task.new
    end

    def create
      @task = Mutants::Task.new task_params
      if @task.save
        flash[:notice] = "Task has been created successfully!"
        redirect_to edit_task_path(@task)
      else
        flash.now[:alert] = "Cannot create task!"
        render :new
      end
    end

    def edit

    end

    private

    def task_params
      params[:mutants_task].permit(:name)
    end
  end
end