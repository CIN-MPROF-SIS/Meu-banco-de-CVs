DROP TABLE IF EXISTS "candidato_linguas"; 

CREATE TABLE "candidato_linguas" ("id" serial primary key, "candidato_id" integer NOT NULL, "nivel_id" integer NOT NULL, "lingua_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("candidato_linguas", ["candidato_id", "nivel_id", "lingua_id"], {:name=>"idx_candidato_lingua", :unique=>true})

CREATE UNIQUE INDEX  "idx_candidato_lingua" ON "candidato_linguas"  ("candidato_id", "nivel_id", "lingua_id");
-- add_index("candidato_linguas", ["candidato_id"], {:name=>"index_candidato_linguas_on_candidato_id"})

CREATE  INDEX  "index_candidato_linguas_on_candidato_id" ON "candidato_linguas"  ("candidato_id");
-- add_index("candidato_linguas", ["lingua_id"], {:name=>"index_candidato_linguas_on_lingua_id"})
CREATE  INDEX  "index_candidato_linguas_on_lingua_id" ON "candidato_linguas"  ("lingua_id");
-- add_index("candidato_linguas", ["nivel_id"], {:name=>"index_candidato_linguas_on_nivel_id"})
CREATE  INDEX  "index_candidato_linguas_on_nivel_id" ON "candidato_linguas"  ("nivel_id");
-- create_table("candidatos_vagas")
DROP TABLE IF EXISTS "candidatos_vagas" ;
CREATE TABLE "candidatos_vagas" ("id" serial primary key, "candidato_id" integer NOT NULL, "vaga_id" integer NOT NULL, "selecionado" boolean DEFAULT 'f'); 
-- add_index("candidatos_vagas", ["candidato_id", "vaga_id"], {:name=>"index_candidatos_vagas_on_candidato_id_and_vaga_id", :unique=>true})
  CREATE UNIQUE INDEX  "index_candidatos_vagas_on_candidato_id_and_vaga_id" ON "candidatos_vagas"  ("candidato_id", "vaga_id");
-- add_index("candidatos_vagas", ["candidato_id"], {:name=>"index_candidatos_vagas_on_candidato_id"})
 CREATE  INDEX  "index_candidatos_vagas_on_candidato_id" ON "candidatos_vagas"  ("candidato_id");
-- add_index("candidatos_vagas", ["vaga_id"], {:name=>"index_candidatos_vagas_on_vaga_id"})
CREATE  INDEX  "index_candidatos_vagas_on_vaga_id" ON "candidatos_vagas"  ("vaga_id");
-- create_table("certificados")
  DROP TABLE IF EXISTS "certificados" ;
 CREATE TABLE "certificados" ("id" serial primary key, "descricao" character varying NOT NULL, "candidato_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("certificados", ["candidato_id"], {:name=>"index_certificados_on_candidato_id"})
 CREATE  INDEX  "index_certificados_on_candidato_id" ON "certificados"  ("candidato_id");
-- create_table("contratantes")
  DROP TABLE IF EXISTS "contratantes" ;
 CREATE TABLE "contratantes" ("id" serial primary key, "nome" character varying, "email" character varying, "telefone" character varying, "logradouro" character varying, "complemento" character varying, "numero" character varying, "bairro" character varying, "cep" character varying, "municipio_id" integer, "inscricaoEstadual" character varying, "cnpj" character varying, "logo" character varying, "autorizado" boolean, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("contratantes", ["municipio_id"], {:name=>"index_contratantes_on_municipio_id"})
 CREATE  INDEX  "index_contratantes_on_municipio_id" ON "contratantes"  ("municipio_id");
-- create_table("experiencias_profissionais")
 DROP TABLE IF EXISTS "experiencias_profissionais" ;
 CREATE TABLE "experiencias_profissionais" ("id" serial primary key, "empresa" character varying NOT NULL, "areaAtuacao" character varying NOT NULL, "dataInicio" date NOT NULL, "dataConclusao" date, "candidato_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("experiencias_profissionais", ["candidato_id"], {:name=>"index_experiencias_profissionais_on_candidato_id"})
CREATE  INDEX  "index_experiencias_profissionais_on_candidato_id" ON "experiencias_profissionais"  ("candidato_id");
-- create_table("faixas_salariais")
 DROP TABLE IF EXISTS "faixas_salariais" ;
  CREATE TABLE "faixas_salariais" ("id" serial primary key, "valor" character varying NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- create_table("formacoes_academicas")
  DROP TABLE IF EXISTS "formacoes_academicas" ;
  CREATE TABLE "formacoes_academicas" ("id" serial primary key, "instituicao" character varying NOT NULL, "cargaHoraria" float NOT NULL, "dataInicio" date NOT NULL, "dataConclusao" date, "candidato_id" integer NOT NULL, "grau_formacao_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("formacoes_academicas", ["candidato_id"], {:name=>"index_formacoes_academicas_on_candidato_id"})
 CREATE  INDEX  "index_formacoes_academicas_on_candidato_id" ON "formacoes_academicas"  ("candidato_id");
-- add_index("formacoes_academicas", ["grau_formacao_id"], {:name=>"index_formacoes_academicas_on_grau_formacao_id"})
 CREATE  INDEX  "index_formacoes_academicas_on_grau_formacao_id" ON "formacoes_academicas"  ("grau_formacao_id");
-- create_table("graus_formacao")
  DROP TABLE IF EXISTS "graus_formacao" ;
  CREATE TABLE "graus_formacao" ("id" serial primary key, "descricao" character varying NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- create_table("linguas")
 DROP TABLE IF EXISTS "linguas" ;
 CREATE TABLE "linguas" ("id" serial primary key, "descricao" character varying NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- create_table("municipios")
  DROP TABLE IF EXISTS "municipios" ;
  CREATE TABLE "municipios" ("id" serial primary key, "nome" character varying NOT NULL, "unidade_federativa_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("municipios", ["unidade_federativa_id"], {:name=>"index_municipios_on_unidade_federativa_id"})
  CREATE  INDEX  "index_municipios_on_unidade_federativa_id" ON "municipios"  ("unidade_federativa_id");
-- create_table("niveis")
  DROP TABLE IF EXISTS "niveis" ;
  CREATE TABLE "niveis" ("id" serial primary key, "descricao" character varying NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- create_table("opcoes")
  DROP TABLE IF EXISTS "opcoes" ;
  CREATE TABLE "opcoes" ("id" serial primary key, "descricao" character varying NOT NULL, "gabarito" boolean DEFAULT 'f' NOT NULL, "questao_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 

-- add_index("opcoes", ["questao_id"], {:name=>"index_opcoes_on_questao_id"})
 CREATE  INDEX  "index_opcoes_on_questao_id" ON "opcoes"  ("questao_id");

-- create_table("pessoas")
DROP TABLE IF EXISTS "pessoas" ;
 CREATE TABLE "pessoas" ("id" serial primary key, "nome" character varying NOT NULL, "email" character varying NOT NULL, "telefone" character varying NOT NULL, "logradouro" character varying NOT NULL, "complemento" character varying, "numero" character varying NOT NULL, "bairro" character varying NOT NULL, "municipio_id" integer NOT NULL, "cep" character varying NOT NULL, "type" character varying, "cpf" character varying, "dataNascimento" date, "naturalidade_id" integer, "nacionalidade" character varying, "foto" character varying, "curriculo" character varying, "inscricaoEstadual" character varying, "cnpj" character varying, "logo" character varying, "autorizado" boolean); 
-- add_index("pessoas", ["municipio_id"], {:name=>"index_pessoas_on_municipio_id"})
 CREATE  INDEX  "index_pessoas_on_municipio_id" ON "pessoas"  ("municipio_id");
-- add_index("pessoas", ["naturalidade_id"], {:name=>"index_pessoas_on_naturalidade_id"})
  CREATE  INDEX  "index_pessoas_on_naturalidade_id" ON "pessoas"  ("naturalidade_id");
-- create_table("questionarios")
DROP TABLE IF EXISTS "questionarios" ;
CREATE TABLE "questionarios" ("id" serial primary key, "descricao" character varying NOT NULL, "vaga_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("questionarios", ["vaga_id"], {:name=>"index_questionarios_on_vaga_id"})
CREATE  INDEX  "index_questionarios_on_vaga_id" ON "questionarios"  ("vaga_id");
-- create_table("questoes")
DROP TABLE IF EXISTS "questoes" ;
CREATE TABLE "questoes" ("id" serial primary key, "descricao" character varying NOT NULL, "nota" float NOT NULL, "questionario_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("questoes", ["questionario_id"], {:name=>"index_questoes_on_questionario_id"})
 CREATE  INDEX  "index_questoes_on_questionario_id" ON "questoes"  ("questionario_id");
-- create_table("respostas")
DROP TABLE IF EXISTS "respostas"; 
  CREATE TABLE "respostas" ("id" serial primary key, "opcao_id" integer NOT NULL, "candidato_id" integer NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("respostas", ["candidato_id"], {:name=>"index_respostas_on_candidato_id"})
CREATE  INDEX  "index_respostas_on_candidato_id" ON "respostas"  ("candidato_id");
-- add_index("respostas", ["opcao_id"], {:name=>"index_respostas_on_opcao_id"})
CREATE  INDEX  "index_respostas_on_opcao_id" ON "respostas"  ("opcao_id");

DROP TABLE IF EXISTS "unidades_federativas" ;
CREATE TABLE "unidades_federativas" ("id" serial primary key, "sigla" character varying NOT NULL, "nome" character varying NOT NULL, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- create_table("usuarios")
 DROP TABLE IF EXISTS "usuarios" ;
 CREATE TABLE "usuarios" ("id" serial primary key, "login" character varying NOT NULL, "password_digest" character varying NOT NULL, "status" boolean DEFAULT 't', "papel" character varying NOT NULL, "pessoa_id" integer); 
-- add_index("usuarios", ["pessoa_id"], {:name=>"index_usuarios_on_pessoa_id"})
 CREATE  INDEX  "index_usuarios_on_pessoa_id" ON "usuarios"  ("pessoa_id");
-- create_table("vagas")
  DROP TABLE IF EXISTS "vagas"; 
 CREATE TABLE "vagas" ("id" serial primary key, "contratante_id" integer NOT NULL, "faixa_salarial_id" integer NOT NULL, "cidade_id" integer NOT NULL, "quantidade" character varying, "cargo" character varying, "descricao" character varying, "data_cadastro" date, "data_inicio_inscricao" date, "data_termino_inscricao" date, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL); 
-- add_index("vagas", ["cidade_id"], {:name=>"index_vagas_on_cidade_id"})
 CREATE  INDEX  "index_vagas_on_cidade_id" ON "vagas"  ("cidade_id");
-- add_index("vagas", ["contratante_id"], {:name=>"index_vagas_on_contratante_id"})
CREATE  INDEX  "index_vagas_on_contratante_id" ON "vagas"  ("contratante_id");
-- add_index("vagas", ["faixa_salarial_id"], {:name=>"index_vagas_on_faixa_salarial_id"})
CREATE  INDEX  "index_vagas_on_faixa_salarial_id" ON "vagas"  ("faixa_salarial_id");
