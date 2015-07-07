class Usuario < ActiveRecord::Base
    
    
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
     
end
