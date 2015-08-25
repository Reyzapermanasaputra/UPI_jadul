json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :name, :password, :topic_id
  json.url evaluation_url(evaluation, format: :json)
end
