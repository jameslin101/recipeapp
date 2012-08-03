module ApplicationHelper
  def link_to_add_ingredient(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s + "_fields", f: builder)
    end
    link_to '<i class="icon-plus-sign"></i> Add Ingredient'.html_safe, '#', class: "add_ingredient", data: {id: id, fields: fields.gsub("\n", "")}
  end
end
