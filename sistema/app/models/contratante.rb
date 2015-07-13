class Contratante < Pessoa
   belongs_to :municipio
   has_many :vaga
   
   #validates_presence_of  :inscricaoEstadual, :cnpj, :logo, :autorizado
   
   def to_s
      return self.nome
   end
end
