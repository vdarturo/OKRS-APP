json.extract! initiative, :id, :name, :description, :start_date, :end_date, :type_metric, :start_value, :target, :current_value, :progress, :key_result_id, :owner_id, :created_at, :updated_at
json.url initiative_url(initiative, format: :json)
