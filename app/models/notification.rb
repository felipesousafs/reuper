class Notification < ApplicationRecord
  belongs_to :user
  has_paper_trail
  acts_as_paranoid


  validates :from, uniqueness: {scope: [:table_type, :is_response], unless: :is_response, message: 'Não é permitido enviar mais de uma solicitação de troca para uma mesma tabela.'}

  def sender
    @sender = User.find(self.from)
  end
end
