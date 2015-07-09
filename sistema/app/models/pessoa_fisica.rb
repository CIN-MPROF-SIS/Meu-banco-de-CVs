class PessoaFisica < ActiveRecord::Base
    belongs_to :municipio
    belongs_to :naturalidade, class_name:"Municipio"
   
    has_many :pessoa_fisica_vaga
    has_many :vagas, :through => :pessoa_fisica_vaga
   
    has_many :certificados
    accepts_nested_attributes_for :certificados, :reject_if => :all_blank, allow_destroy: true
    
    has_many :candidato_linguas
    accepts_nested_attributes_for :candidato_linguas, :reject_if => :all_blank, :allow_destroy => true
    
end
