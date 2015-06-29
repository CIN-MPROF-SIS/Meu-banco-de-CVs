class PessoaFisica < ActiveRecord::Base
    belongs_to :municipio
    belongs_to :naturalidade, class_name:"Municipio"
    has_many :certificados
    accepts_nested_attributes_for :certificados, allow_destroy: true
end
