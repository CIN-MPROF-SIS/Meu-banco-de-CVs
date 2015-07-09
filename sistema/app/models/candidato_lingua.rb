class CandidatoLingua < ActiveRecord::Base
    belongs_to :pessoaFisica
    belongs_to :nivel
    belongs_to :lingua
end
