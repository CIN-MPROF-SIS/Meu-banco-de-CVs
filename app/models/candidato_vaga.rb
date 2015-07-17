class CandidatoVaga < ActiveRecord::Base
    attr_accessor :nota
    
    belongs_to :vaga
    belongs_to :candidato
end
