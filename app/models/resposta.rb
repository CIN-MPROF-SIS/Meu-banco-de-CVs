class Resposta < ActiveRecord::Base
    belongs_to :opcao
    belongs_to :candidato
end
