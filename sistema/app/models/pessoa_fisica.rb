class PessoaFisica < ActiveRecord::Base
    belongs_to :municipio
    belongs_to :naturalidade, class_name:"Municipio"
end
