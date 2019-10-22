module AdminsBackofficeHelper
  # def translate_attribute(object, method)
  #   object.model.human_attribute_name(method)
  # end

  # def translate_attribute(object = nil , method = nil)
  #   if object && method
  #     object.model.human_attribute_name(method)
  #   else
  #     "Informe os parâmetros corretamente!"
  #   end
  # end

  def translate_attribute(object = nil , method = nil)
    # usando ternário
    (object && method) ? object.model.human_attribute_name(method) : "Informe os parâmetros corretamente!"
  end

end
