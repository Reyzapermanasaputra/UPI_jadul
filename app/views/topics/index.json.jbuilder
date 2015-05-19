json.array!(@topics) do |topic|
  json.extract! topic, :id, :level, :description
  json.url topic_url(topic, format: :json)
end
