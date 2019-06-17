json.extract! course, :id, :title, :class_level, :matiere, :corps, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
