class CandidatoVaga < ActiveRecord::Base
    belongs_to :vaga
    belongs_to :candidato
end
