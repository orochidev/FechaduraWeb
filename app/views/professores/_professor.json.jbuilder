json.extract! professor, :id, :created_at, :updated_at, :nome, :email, :type, :telefone
json.url professor_url(professor, format: :json)
