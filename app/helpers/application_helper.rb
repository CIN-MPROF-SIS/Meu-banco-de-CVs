module ApplicationHelper
  def title
    base_title = "Projeto Sistema de apoio a entrevista e seleção de candidatos a vagas de emprego"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.jpg", :alt => "SELECAD+", :class => "logo")
  end
end
