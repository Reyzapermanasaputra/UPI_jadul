json.array!(@lecturers) do |lecturer|
  json.extract! lecturer, :id, :nip, :name, :place, :birth, :work_unit, :address, :phone, :email, :role_id
  json.url lecturer_url(lecturer, format: :json)
end
