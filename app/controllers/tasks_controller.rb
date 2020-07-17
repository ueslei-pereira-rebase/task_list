class TasksController < ApplicationController

  def new
  end

  def create
    #Modo mais seguro para tratar os dados, formato adotado apratir da versao 4 do rails
    @task = Task.new(params.require(:task).permit(:description, :status))
    #@task = Task.new(description: params[:task][:description], status: params[:task][:status]) --> tambem funciona
    @task.save #salva no banco a tarefa que criamos
    redirect_to root_path #redireciona para pagina inicial
  end

  def edit
    #utilizamos o params, dando uma olhada no routes vemos o nome do parametro na rota de edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:description, :status))
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id]) #nao é necessario @ pois nenhuma view ira usar esse objeto
    task.destroy #destroi a tarefa encontrada
    redirect_to root_path
  end

end
