class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.integer :matricula
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
