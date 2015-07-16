class PagesController < ApplicationController

  def home
    if (Usuario.where(papel: 'moderador').count==0)
       puts('Tetse',@usuarios.to_s)
       redirect_to new_moderador_path
    else
      
      if current_user != nil and current_user.candidato?
        redirect_to vagasdisponiveis_path
      else
         redirect_to vagas_path
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
