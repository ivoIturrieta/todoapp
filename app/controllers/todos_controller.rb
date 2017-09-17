class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created succesfully"
      redirect_to todo_path(@todo)
    else
      render "new"
    end
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Todo was updated succesfully"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end
  
  def index
    @todos = Todo.all
  end
  
  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
end