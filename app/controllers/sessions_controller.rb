class SessionsController < ApplicationController
    
    def new 
	
    end


    def create
      @usuario = Usuario.find_by_login(params[:session][:login])
          if @usuario && @usuario.authenticate(params[:session][:password])
            session[:usuario_id] = @usuario.id
            redirect_to '/'
          else
            redirect_to 'login'
          end 
    end
    
    def destroy 
        session[:usuario_id] = nil 
        redirect_to '/' 
    end
    
    def require_moderador 
        redirect_to '/' unless current_user.moderador? 
    end



    
end
