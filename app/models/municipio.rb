class Municipio < ActiveRecord::Base
  belongs_to :unidade_federativa
  
  def to_s
      return self.nome
  end
end
