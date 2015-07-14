class Questionario < ActiveRecord::Base
    belongs_to :vaga
    
    has_many :questoes
    accepts_nested_attributes_for :questoes, :reject_if => :all_blank, allow_destroy: true
end
