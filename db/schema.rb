# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_03_165648) do

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.integer "matricula"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emprestimos", force: :cascade do |t|
    t.string "aluno"
    t.string "matricula"
    t.string "livro"
    t.integer "codigo"
    t.date "data_emprestimo"
    t.date "data_devoluncao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "livros", force: :cascade do |t|
    t.string "titulo"
    t.string "autor"
    t.integer "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
