class Pessoa < ActiveRecord::Base
    belongs_to :cidade
    acts_as_superclass
end
