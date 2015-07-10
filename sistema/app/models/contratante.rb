class Contratante < Pessoa
   
   has_many :vaga
   
   #validates_presence_of  :inscricaoEstadual, :cnpj, :logo, :autorizado
end
