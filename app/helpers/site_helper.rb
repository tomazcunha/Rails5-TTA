module SiteHelper

  def msg_jumbotron
    case params[:action]
    when 'index'
      "Últimas perguntas cadastradas..."
    when 'questions'
      "Último termo pesquisado: \"#{params[:term]}\"..."
    when 'subject'
      "Mostrando as questões para o assunto \"#{params[:subject_id]}\", \"#{params[:subject]}\""
    end
  end

    # app/views/site/shared/_questions.html.erb
      # <!-- unless = contrario do if -->
      # <% unless params[:term] %>
      #   <h4>Últimas perguntas cadastradas...</h4>
      # <% else %>
      #   <!-- <h4>Ultimo termo pesquisado: "<%= params[:term] %>"</h4> -->
      #   <h4><%= "Último termo pesquisado: \"#{params[:term]}\"" %></h4>
      # <% end %>

end
