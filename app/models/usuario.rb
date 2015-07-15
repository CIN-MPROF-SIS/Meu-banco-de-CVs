class Usuario < ActiveRecord::Base
    
     belongs_to :pessoa
    
     has_secure_password
    
     def candidato? 
      self.papel == 'candidato' 
     end
    
     def moderador? 
      self.papel == 'moderador' 
     end
     
     def contratante? 
      self.papel == 'contratante' 
     end
     
     validates_uniqueness_of :login
     
end
