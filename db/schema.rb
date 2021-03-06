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

ActiveRecord::Schema.define(version: 20150715032021) do

  create_table "candidato_linguas", force: :cascade do |t|
    t.integer  "candidato_id", null: false
    t.integer  "nivel_id",     null: false
    t.integer  "lingua_id",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "candidato_linguas", ["candidato_id", "nivel_id", "lingua_id"], name: "idx_candidato_lingua", unique: true
  add_index "candidato_linguas", ["candidato_id"], name: "index_candidato_linguas_on_candidato_id"
  add_index "candidato_linguas", ["lingua_id"], name: "index_candidato_linguas_on_lingua_id"
  add_index "candidato_linguas", ["nivel_id"], name: "index_candidato_linguas_on_nivel_id"

  create_table "candidatos_vagas", force: :cascade do |t|
    t.integer "candidato_id",                 null: false
    t.integer "vaga_id",                      null: false
    t.boolean "selecionado",  default: false
  end

  add_index "candidatos_vagas", ["candidato_id", "vaga_id"], name: "index_candidatos_vagas_on_candidato_id_and_vaga_id", unique: true
  add_index "candidatos_vagas", ["candidato_id"], name: "index_candidatos_vagas_on_candidato_id"
  add_index "candidatos_vagas", ["vaga_id"], name: "index_candidatos_vagas_on_vaga_id"

  create_table "certificados", force: :cascade do |t|
    t.string   "descricao",    null: false
    t.integer  "candidato_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "certificados", ["candidato_id"], name: "index_certificados_on_candidato_id"

  create_table "experiencias_profissionais", force: :cascade do |t|
    t.string   "empresa",       null: false
    t.string   "areaAtuacao",   null: false
    t.date     "dataInicio",    null: false
    t.date     "dataConclusao"
    t.integer  "candidato_id",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "experiencias_profissionais", ["candidato_id"], name: "index_experiencias_profissionais_on_candidato_id"

  create_table "faixas_salariais", force: :cascade do |t|
    t.string   "valor",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formacoes_academicas", force: :cascade do |t|
    t.string   "instituicao",      null: false
    t.float    "cargaHoraria",     null: false
    t.date     "dataInicio",       null: false
    t.date     "dataConclusao"
    t.integer  "candidato_id",     null: false
    t.integer  "grau_formacao_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "formacoes_academicas", ["candidato_id"], name: "index_formacoes_academicas_on_candidato_id"
  add_index "formacoes_academicas", ["grau_formacao_id"], name: "index_formacoes_academicas_on_grau_formacao_id"

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

  create_table "opcoes", force: :cascade do |t|
    t.string   "descricao",                  null: false
    t.boolean  "gabarito",   default: false, null: false
    t.integer  "questao_id",                 null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "opcoes", ["questao_id"], name: "index_opcoes_on_questao_id"

  create_table "pessoas", force: :cascade do |t|
    t.string  "nome",                  null: false
    t.string  "email",                 null: false
    t.string  "telefone",              null: false
    t.string  "logradouro",            null: false
    t.string  "complemento"
    t.string  "numero",                null: false
    t.string  "bairro",                null: false
    t.integer "municipio_id",          null: false
    t.string  "cep",                   null: false
    t.string  "type"
    t.string  "cpf"
    t.date    "dataNascimento"
    t.integer "naturalidade_id"
    t.string  "nacionalidade"
    t.string  "foto"
    t.string  "curriculo"
    t.string  "tipoPessoaContratante"
    t.string  "inscricaoEstadual"
    t.string  "cnpj"
    t.string  "logo"
  end

  add_index "pessoas", ["municipio_id"], name: "index_pessoas_on_municipio_id"
  add_index "pessoas", ["naturalidade_id"], name: "index_pessoas_on_naturalidade_id"

  create_table "questionarios", force: :cascade do |t|
    t.string   "descricao",  null: false
    t.integer  "vaga_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questionarios", ["vaga_id"], name: "index_questionarios_on_vaga_id"

  create_table "questoes", force: :cascade do |t|
    t.string   "descricao",       null: false
    t.float    "nota",            null: false
    t.integer  "questionario_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "questoes", ["questionario_id"], name: "index_questoes_on_questionario_id"

  create_table "respostas", force: :cascade do |t|
    t.integer  "opcao_id",     null: false
    t.integer  "candidato_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "respostas", ["candidato_id"], name: "index_respostas_on_candidato_id"
  add_index "respostas", ["opcao_id"], name: "index_respostas_on_opcao_id"

  create_table "unidades_federativas", force: :cascade do |t|
    t.string   "sigla",      null: false
    t.string   "nome",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string  "login",                           null: false
    t.string  "password_digest",                 null: false
    t.boolean "status",          default: false
    t.string  "papel",                           null: false
    t.integer "pessoa_id"
  end

  add_index "usuarios", ["pessoa_id"], name: "index_usuarios_on_pessoa_id"

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
