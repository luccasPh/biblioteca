class AddColumnLivroIdToEmprestimo < ActiveRecord::Migration[5.2]
  def change
    add_reference :emprestimos, :livro, foreign_key: true
  end
end
