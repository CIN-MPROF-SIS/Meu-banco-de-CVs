class Questao < ActiveRecord::Base
    belongs_to :questionario
    
    has_many :opcoes
    accepts_nested_attributes_for :opcoes, :reject_if => :all_blank, allow_destroy: true
end
