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

ActiveRecord::Schema.define(version: 20150707202025) do

  create_table "candidato_linguas", force: :cascade do |t|
    t.integer  "pessoa_fisica_id", null: false
    t.integer  "nivel_id",         null: false
    t.integer  "lingua_id",        null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "candidato_linguas", ["lingua_id"], name: "index_candidato_linguas_on_lingua_id"
  add_index "candidato_linguas", ["nivel_id"], name: "index_candidato_linguas_on_nivel_id"
  add_index "candidato_linguas", ["pessoa_fisica_id", "nivel_id", "lingua_id"], name: "idx_candidato_lingua", unique: true
  add_index "candidato_linguas", ["pessoa_fisica_id"], name: "index_candidato_linguas_on_pessoa_fisica_id"

  create_table "certificados", force: :cascade do |t|
    t.string   "descricao",        null: false
    t.integer  "pessoa_fisica_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "certificados", ["pessoa_fisica_id"], name: "index_certificados_on_pessoa_fisica_id"

  create_table "faixas_salariais", force: :cascade do |t|
    t.string   "valor",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graus_formacao", force: :cascade do |t|
    t.string   "descricao",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linguas", force: :cascade do |t|
    t.string   "descricao",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string   "nome",                  null: false
    t.integer  "unidade_federativa_id", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "municipios", ["unidade_federativa_id"], name: "index_municipios_on_unidade_federativa_id"

  create_table "niveis", force: :cascade do |t|
    t.string   "descricao",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas_fisicas", force: :cascade do |t|
    t.string   "cpf",             null: false
    t.string   "nome",            null: false
    t.string   "email",           null: false
    t.string   "telefone",        null: false
    t.string   "logradouro",      null: false
    t.string   "complemento"
    t.string   "numero",          null: false
    t.string   "bairro",          null: false
    t.integer  "municipio_id",    null: false
    t.string   "cep",             null: false
    t.date     "dataNascimento",  null: false
    t.integer  "naturalidade_id", null: false
    t.string   "nacionalidade",   null: false
    t.string   "foto"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pessoas_fisicas", ["municipio_id"], name: "index_pessoas_fisicas_on_municipio_id"
  add_index "pessoas_fisicas", ["naturalidade_id"], name: "index_pessoas_fisicas_on_naturalidade_id"

  create_table "pessoas_fisicas_vagas", force: :cascade do |t|
    t.integer "pessoa_fisica_id", null: false
    t.integer "vaga_id",          null: false
  end

  add_index "pessoas_fisicas_vagas", ["pessoa_fisica_id", "vaga_id"], name: "index_pessoas_fisicas_vagas_on_pessoa_fisica_id_and_vaga_id", unique: true
  add_index "pessoas_fisicas_vagas", ["pessoa_fisica_id"], name: "index_pessoas_fisicas_vagas_on_pessoa_fisica_id"
  add_index "pessoas_fisicas_vagas", ["vaga_id"], name: "index_pessoas_fisicas_vagas_on_vaga_id"

  create_table "pessoas_juridicas", force: :cascade do |t|
    t.string   "nome",              null: false
    t.string   "email",             null: false
    t.string   "telefone",          null: false
    t.string   "logradouro",        null: false
    t.string   "complemento"
    t.string   "numero",            null: false
    t.string   "cep",               null: false
    t.string   "bairro",            null: false
    t.integer  "municipio_id",      null: false
    t.string   "inscricaoEstadual", null: false
    t.string   "cnpj",              null: false
    t.string   "logo"
    t.boolean  "autorizado",        null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "pessoas_juridicas", ["municipio_id"], name: "index_pessoas_juridicas_on_municipio_id"

  create_table "unidades_federativas", force: :cascade do |t|
    t.string   "sigla",      null: false
    t.string   "nome",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.boolean  "status"
    t.string   "papel"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "vagas", force: :cascade do |t|
    t.integer  "contratante_id",         null: false
    t.integer  "faixa_salarial_id",      null: false
    t.integer  "cidade_id",              null: false
    t.string   "quantidade"
    t.string   "cargo"
    t.string   "descricao"
    t.date     "data_cadastro"
    t.date     "data_inicio_inscricao"
    t.date     "data_termino_inscricao"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "vagas", ["cidade_id"], name: "index_vagas_on_cidade_id"
  add_index "vagas", ["contratante_id"], name: "index_vagas_on_contratante_id"
  add_index "vagas", ["faixa_salarial_id"], name: "index_vagas_on_faixa_salarial_id"

end
