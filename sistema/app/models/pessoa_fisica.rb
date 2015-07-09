class PessoaFisica < ActiveRecord::Base
    belongs_to :municipio
    belongs_to :naturalidade, class_name:"Municipio"
   
    has_many :pessoas_fisicas_vagas
    has_many :vagas, :through => :pessoas_fisicas_vagas
   
    has_many :certificados
    accepts_nested_attributes_for :certificados, :reject_if => :all_blank, allow_destroy: true
    
    has_many :candidato_linguas
    accepts_nested_attributes_for :candidato_linguas, :reject_if => :all_blank, :allow_destroy => true
    
end
