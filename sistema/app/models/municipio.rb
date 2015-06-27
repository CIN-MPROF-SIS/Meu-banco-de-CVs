class Municipio < ActiveRecord::Base
  belongs_to :unidade_federativa
end
