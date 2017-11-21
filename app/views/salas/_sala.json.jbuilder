json.extract! sala, :id, :created_at, :updated_at, :codigo
json.url sala_url(sala, format: :json)
json.horarios sala.horarios do |horario|
  json.partial! 'horarios/horario', horario: horario
end
