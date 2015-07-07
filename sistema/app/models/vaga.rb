class Vaga < ActiveRecord::Base
  belongs_to :contratante , class_name:"PessoaJuridica"
  belongs_to :faixa_salarial , class_name:"FaixaSalarial"
  belongs_to :cidade , class_name:"Municipio"
  
  has_many :pessoa_fisica_vaga
  has_many :pessoa_fisica, :through => :pessoa_fisica_vaga
  
end
