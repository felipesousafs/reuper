class Trash < ApplicationRecord
  belongs_to :user
  has_paper_trail
  acts_as_paranoid

  def send_response_notification(notification, resp)
    id = notification.from
    resp_notification = Notification.new
    resp_notification.subject = 'Resposta sobre solicitação de troca.'
    resp_notification.user_id = id
    resp_notification.from = notification.user_id
    resp_notification.task_id = self.id
    resp_notification.is_response = true
    resp_notification.read = false
    resp_notification.table_type = notification.table_type
    if resp
      resp_notification.description = 'Parabéns! Sua solicitação de troca foi aceita.'
    else
      resp_notification.description = 'Bad news. Sua solicitação de troca foi recusada.'
    end
    resp_notification.save!
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
  def deny_request(notification, resp)
    send_response_notification(notification, resp)
  end
end
