class FaixaSalarial < ActiveRecord::Base
    
    def to_s
      return self.valor
    end
end
