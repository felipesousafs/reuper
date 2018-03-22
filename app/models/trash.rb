class Trash < ApplicationRecord
  belongs_to :user

  def send_response_notification(notification, resp)
    if resp
      id = notification.from
      resp_notification = Notification.new
      resp_notification.subject = '[Resposta] Sua solicitação de troca foi aceita.'
      resp_notification.user_id = id
      resp_notification.from = notification.user_id
      resp_notification.description = User.find(id).name + ' aceitou sua solicitação de troca.'
      resp_notification.task_id = self.id
      resp_notification.is_response = true
      resp_notification.table_type = notification.table_type
      resp_notification.save!
    end
  end
  def swap(notification, resp)
    if resp
      id = notification.from
      trash = Trash.where(user_id: id).first
      trash.update!(user_id: self.user_id)
      self.update!(user_id: id)
      send_response_notification(notification, resp)
    end

  end
end
