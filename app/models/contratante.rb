class Contratante < Pessoa
   belongs_to :municipio
   has_many :vaga
   
   #validates_presence_of  :inscricaoEstadual, :cnpj, :logo, :autorizado
   mount_uploader :logo, PessoaUploader 
   
   def to_s
      return self.nome
   end
end
