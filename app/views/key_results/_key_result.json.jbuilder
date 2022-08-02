json.extract! key_result, :id, :name, :description, :period, :type_metric, :start_value, :target, :current_value, :progress, :objective_id, :owner_id, :created_at, :updated_at
json.url key_result_url(key_result, format: :json)
