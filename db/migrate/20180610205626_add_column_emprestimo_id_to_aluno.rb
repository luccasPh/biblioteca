class AddColumnEmprestimoIdToAluno < ActiveRecord::Migration[5.2]
  def change
    add_reference :alunos, :emprestimo, foreign_key: true
  end
end
