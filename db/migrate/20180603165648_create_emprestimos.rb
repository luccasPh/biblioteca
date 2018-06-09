class CreateEmprestimos < ActiveRecord::Migration[5.2]
  def change
    create_table :emprestimos do |t|
      t.string :aluno
      t.string :matricula
      t.string :livro
      t.integer :codigo
      t.date :data_emprestimo
      t.date :data_devoluncao

      t.timestamps
    end
  end
end
