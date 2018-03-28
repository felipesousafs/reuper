class Calendar < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

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
