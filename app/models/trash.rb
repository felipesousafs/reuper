class Trash < ApplicationRecord
  belongs_to :user

  def send_trade_notification(id, table_type)
    notification = Notification.new
    notification.subject = 'Solicitação de troca em tabela de tarefa.'
    notification.user_id = self.user_id
    notification.from = id
    notification.task_id = self.id
    notification.table_type = table_type
    notification.save!
  end
  def swap(id)
    trash = Trash.where(user_id: id).first
    trash.update!(user_id: self.user_id)
    self.update!(user_id: id)
  end
end
