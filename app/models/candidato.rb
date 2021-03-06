class Candidato < Pessoa
     belongs_to :naturalidade, class_name:"Municipio"
     
     has_many :certificados
     accepts_nested_attributes_for :certificados, :reject_if => :all_blank, allow_destroy: true
    
     has_many :candidato_linguas
     accepts_nested_attributes_for :candidato_linguas, :reject_if => :all_blank, :allow_destroy => true
   
     has_many :formacoes_academicas
     accepts_nested_attributes_for :formacoes_academicas, :reject_if => :all_blank, allow_destroy: true
    
     has_many :experiencias_profissionais
     accepts_nested_attributes_for :experiencias_profissionais, :reject_if => :all_blank, allow_destroy: true

     mount_uploader :curriculo, PessoaUploader 
     mount_uploader :foto, PessoaUploader 

     validates_presence_of :cpf, :dataNascimento, :naturalidade ,:nacionalidade
end
