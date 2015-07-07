class PessoaFisica < ActiveRecord::Base
    belongs_to :municipio
    belongs_to :naturalidade, class_name:"Municipio"
    has_many :certificados
   
    has_many :pessoa_fisica_vaga
    has_many :vagas, :through => :pessoa_fisica_vaga
   
    accepts_nested_attributes_for :certificados, allow_destroy: true
    
end
