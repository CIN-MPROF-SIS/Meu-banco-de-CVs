class CandidatoLingua < ActiveRecord::Base
    belongs_to :candidato
    belongs_to :nivel
    belongs_to :lingua
end
