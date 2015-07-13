class PessoaFisicaVaga < ActiveRecord::Base
  belongs_to :vaga
  belongs_to :pessoa_fisica
end
