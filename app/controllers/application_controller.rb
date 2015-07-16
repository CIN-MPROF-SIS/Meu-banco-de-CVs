class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user 
  
  
  
  def current_user 
    #session.clear
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id] 
  end

  def require_user 
    redirect_to '/login' unless current_user 
  end
  
  def require_candidato 
    redirect_to '/' unless current_user.candidato?
  end
  
  def require_contratante 
    redirect_to '/' unless current_user.contratante? 
  end

  def require_ativo
      
      if !current_user.nil? && current_user.candidato?
        redirect_to new_candidato_path unless current_user.status
      end
      
      if !current_user.nil? && current_user.contratante?
        redirect_to new_contratante_path unless current_user.status
      end
  end

end
