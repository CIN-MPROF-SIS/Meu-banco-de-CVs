class Certificado < ActiveRecord::Base
    belongs_to :candidato
    belongs_to :pessoa
end
