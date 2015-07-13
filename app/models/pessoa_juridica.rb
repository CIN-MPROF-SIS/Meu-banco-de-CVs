class PessoaJuridica < ActiveRecord::Base
    belongs_to :municipio
    has_many :vaga
end
