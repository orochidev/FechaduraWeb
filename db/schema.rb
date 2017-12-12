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

ActiveRecord::Schema.define(version: 20171205033610) do

  create_table "agendamentos", force: :cascade do |t|
    t.time "horario_inicio"
    t.time "horario_fim"
    t.integer "dia"
    t.string "tipo_permitido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calouros", force: :cascade do |t|
    t.string "nome"
    t.integer "idade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credenciais", force: :cascade do |t|
    t.string "type"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login"
    t.string "password_digest"
    t.integer "pessoa_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.integer "pessoa_id"
    t.integer "sala_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "registrado_em"
  end

  create_table "horario_itens", force: :cascade do |t|
    t.time "horario_inicio"
    t.time "horario_fim"
    t.integer "dia"
    t.integer "horario_id"
    t.boolean "valido"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horarios", force: :cascade do |t|
    t.string "tipo_permitido"
    t.integer "sala_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "type"
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.string "nick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "salas", force: :cascade do |t|
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descricao"
  end

end
