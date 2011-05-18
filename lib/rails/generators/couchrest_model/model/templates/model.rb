<% module_namespacing do -%>
class <%= class_name %><%= options[:casted] ? " < #{casted_hash.classify} " : " < #{parent_class_name.classify}"   %>
<% if options[:casted] -%>
  include CouchRest::Model::CastedModel
<% end -%>

<% if options[:timestamps] -%>
  timestamps!
<% end -%>
end
<% end -%>