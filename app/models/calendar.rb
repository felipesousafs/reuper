class Calendar < ApplicationRecord
  def tables
    tables = []
    if self.trash
      tables << 'Retirada de lixo'
    end
    if self.food
      tables << 'Alimentação'
    end
    if self.fridge
      tables << 'Limpeza das geladeiras'
    end
    if self.kitchen
      tables << 'Limpeza da cozinha'
    end
    tables
  end
end
