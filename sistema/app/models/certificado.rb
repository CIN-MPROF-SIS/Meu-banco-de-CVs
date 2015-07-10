class Certificado < ActiveRecord::Base
    belongs_to :pessoaFisica
    belongs_to :pessoa
end
