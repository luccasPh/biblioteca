json.extract! emprestimo, :id, :aluno, :matricula, :livro, :codigo, :data_emprestimo, :data_devoluncao, :created_at, :updated_at
json.url emprestimo_url(emprestimo, format: :json)
