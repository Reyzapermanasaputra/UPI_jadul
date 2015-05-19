json.array!(@courses) do |course|
  json.extract! course, :id, :name_course, :code_course, :sks, :program_study, :semester, :prerequisite, :description, :lecturer_id
  json.url course_url(course, format: :json)
end
