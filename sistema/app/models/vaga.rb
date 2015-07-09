class Vaga < ActiveRecord::Base
  belongs_to :contratante , class_name:"PessoaJuridica"
  belongs_to :faixa_salarial , class_name:"FaixaSalarial"
  belongs_to :cidade , class_name:"Municipio"
  
  has_many :pessoas_fisicas_vagas
  has_many :pessoas_fisicas, :through => :pessoas_fisicas_vagas
  
end
