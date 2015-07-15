class PagesController < ApplicationController

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
