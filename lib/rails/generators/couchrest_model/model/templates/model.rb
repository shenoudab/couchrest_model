<% module_namespacing do -%>
 class <%= class_name %><%= " < options[:casted] ? #{casted_hash.classify} : #{parent_class_name.classify}"   %>
<% if options[:casted] -%>
  include CouchRest::Model::CastedModel
<% end -%>
<% model_attributes.each_with_index do |attribute, i| -%>
  property :<%= attribute.name %><%= ", :type => #{attribute.type_class}" %>
<% end -%>
<% if options[:timestamps] -%>
  timestamps!
<% end -%>
end
end
<% end -%>