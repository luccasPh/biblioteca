json.extract! aluno, :id, :nome, :matricula, :email, :telefone, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
