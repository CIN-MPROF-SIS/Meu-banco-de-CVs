class SessionsController < ApplicationController
    
    def new 
	
    end


    def create
      @usuario = Usuario.find_by_login(params[:session][:login])
          if @usuario && @usuario.authenticate(params[:session][:password])
            session[:usuario_id] = @usuario.id
            
            redirect_to root_path
          else
             redirect_to '/login', notice: 'O nome de usuário ou senha está incorreta.' 
          end 
    end
    
    def destroy 
        session[:usuario_id] = nil 
        redirect_to '/' 
    end
    
    
end
