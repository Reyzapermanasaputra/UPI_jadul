json.array!(@assigments) do |assigment|
  json.extract! assigment, :id, :title, :due_time, :description, :topic_id
  json.url assigment_url(assigment, format: :json)
end
