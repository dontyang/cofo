SimpleForm.setup do |config|
  config.wrappers :semantic, tag: 'div', class: 'field', error_class: 'inline field error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input
  end
  config.wrappers :semantic_search, tag: 'div', class: 'column' do |b|
    b.use :html5
    b.use :placeholder
    b.use :input
  end

  config.default_form_class = 'content ui form'
  config.default_wrapper = :semantic
  config.button_class = 'ui primary button'
  config.error_notification_class = 'ui error message'
  config.required_by_default = false
  config.label_class = ''
end
