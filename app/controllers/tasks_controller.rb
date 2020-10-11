class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    before_action :require_user_logged_in, only: [:index, :new]
    
    before_action :correct_user, only: [:destroy]
    
    def index
        @tasks = Task.all.page(params[:page]).per(3)
    end

    def show
    end

    def new
        @task = Task.new
    end

    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'Task が正常に追加されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Task が追加されませんでした'
            render :new
        end
    end

    def edit
    end

    def update
        
        if @task.update(task_params)
            flash[:success] = 'Task が正常に追加されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Task が追加されませんでした'
            render :edit
        end
    end

    def destroy
        @task.destroy
        
        flash[:success] = 'Task は正常に削除されました'
        redirect_to tasks_url
    end
    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:content, :status)
    end
end
