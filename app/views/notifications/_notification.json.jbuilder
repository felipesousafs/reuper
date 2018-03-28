json.(notification, :created_at, :updated_at)

json.id notification.id
json.from notification.from
json.task_id notification.task_id
json.user_id notification.user_id
json.read notification.read
json.created_at notification.created_at
json.is_response notification.is_response
json.table_type notification.table_type
json.subject notification.subject
json.description notification.description