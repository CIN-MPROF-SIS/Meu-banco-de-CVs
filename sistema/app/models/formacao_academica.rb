class FormacaoAcademica < ActiveRecord::Base
    belongs_to :candidato
    belongs_to :grau_formacao
end
