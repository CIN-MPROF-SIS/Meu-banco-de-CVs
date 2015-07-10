class FormacaoAcademica < ActiveRecord::Base
    belongs_to :pessoaFisica
    belongs_to :grau_formacao
end
