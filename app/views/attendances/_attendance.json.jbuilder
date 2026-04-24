json.extract! attendance, :id, :time_in, :time_out, :rendered_hours, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
