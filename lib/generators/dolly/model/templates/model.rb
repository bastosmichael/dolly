class <%= class_name %><%= "< #{options[:parent].classify}" if options[:parent] %>

<% unless options[:parent] -%>
  database_name 'db'
  set_design_doc 'dolly' #defaults to 'dolly'

<% end %>
<% attributes.each do |attribute| -%>
  property :<%= attribute.name -%>, <%= attribute.type_class %>
<% end %>
end