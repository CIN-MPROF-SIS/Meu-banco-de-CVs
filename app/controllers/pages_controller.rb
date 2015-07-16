class PagesController < ApplicationController

  def home
    if (Usuario.where(papel: 'moderador').count==0)
         redirect_to new_moderador_path
    else
        if (current_user != nil)
            
              if current_user.candidato?
                  redirect_to vagasdisponiveis_path
              end
              if current_user.contratante?
                   redirect_to vagas_path
              end
              if current_user.moderador?
                   redirect_to autorizarContratantes_path
              end
          
        else
            redirect_to ultimasvagas_path
        end
    end   
  end

  def contato
    @title = "Contato"
  end
  
  def sobre
    @title = "Sobre"
  end
  
  def ajuda
    @title = "Ajuda"
  end
end
