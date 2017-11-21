json.array!(@turnos) do |turno|
  json.extract! turno, :id
  json.url turno_url(turno, format: :json)
end
