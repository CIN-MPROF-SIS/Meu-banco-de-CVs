class Contratante < Pessoa
   belongs_to :municipio
   has_many :vaga
   
   #validates_presence_of  :inscricaoEstadual, :cnpj, :logo, :autorizado
end
