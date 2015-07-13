class UnidadeFederativa < ActiveRecord::Base
    has_many :municipios
    
    def to_s
        return self.sigla
    end
end
