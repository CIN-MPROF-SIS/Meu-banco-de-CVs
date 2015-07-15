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
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to name, "#", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
    #link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end
