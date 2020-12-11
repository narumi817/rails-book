class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    # アクションからビューに渡したいデータはインスタンス変数に入れる
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

      # save では検証がエラーになると falseが返ってくる (save! だと検証エラーになると例外が発生する) 
      # 検証に問題なければDBに保存される
      # 検証だけしたい場合は valid? をつかう
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
