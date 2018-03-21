class HomeController < ApplicationController
  def tarefas
    @trashes = Trash.order(:when)
  end
end
