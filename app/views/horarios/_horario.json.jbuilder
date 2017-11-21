json.extract! horario, :id, :tipo_permitido, :created_at, :updated_at
json.horario_itens horario.horario_itens do |horario_item|
  json.partial! 'horario_itens/horario_item', horario_item: horario_item
end
