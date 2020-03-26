class TodosController < ApplicationController 
    def index
        render plain: Todo.order(:id).map {|todo| todo.to_pleasant_string}.join("\n")
    end

    def show
        id = params[:id]
        render plain: Todo.find(id).to_pleasant_string
    end

    def create
        todo_text = params[:todo_text]
        due_date = DateTime.parse(params[:due_date])
        new_todo = Todo.create!(todo_text: todo_text, due_date:due_date,completed:false)
        response_text="Hey , your new todo is created with the id #{new_todo.id}"
        render plain: response_text
    end
end