json.extract! aluno, :id, :created_at, :updated_at, :nome, :email, :type
json.url aluno_url(aluno, format: :json)
