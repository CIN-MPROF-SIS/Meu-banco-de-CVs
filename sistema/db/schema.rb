# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150627215543) do

  create_table "faixa_salarials", force: :cascade do |t|
    t.string   "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faixas_salariais", force: :cascade do |t|
    t.string   "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graus_formacao", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linguas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderadores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string   "nome"
    t.integer  "unidade_federativa_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "municipios", ["unidade_federativa_id"], name: "index_municipios_on_unidade_federativa_id"

  create_table "niveis", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "subtype",     null: false
    t.string   "nome",        null: false
    t.string   "email",       null: false
    t.string   "telefone",    null: false
    t.string   "logradouro",  null: false
    t.string   "complemento"
    t.string   "numero"
    t.string   "cep",         null: false
    t.integer  "cidade_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pessoas", ["cidade_id"], name: "index_pessoas_on_cidade_id"

  create_table "pessoas_fisicas", force: :cascade do |t|
    t.date     "dataNascimento",  null: false
    t.integer  "naturalidade_id", null: false
    t.string   "nacionalidade",   null: false
    t.string   "cpf",             null: false
    t.string   "foto"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pessoas_fisicas", ["naturalidade_id"], name: "index_pessoas_fisicas_on_naturalidade_id"

  create_table "unidade_federativas", force: :cascade do |t|
    t.string   "sigla"
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades_federativas", force: :cascade do |t|
    t.string   "sigla"
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
