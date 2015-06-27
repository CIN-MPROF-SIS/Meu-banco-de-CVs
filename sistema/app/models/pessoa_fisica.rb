require 'multiple_table_inheritance'

class PessoaFisica < ActiveRecord::Base
    belongs_to :naturalidade, class_name: "Municipio"
    inherits_from :pessoa
end
