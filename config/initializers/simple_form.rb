class CollectionCheckBoxesInput < SimpleForm::Inputs::CollectionCheckBoxesInput
  def item_wrapper_class
    nested_boolean_style? ? "checkbox-inline" : super
  end
end

class CollectionRadioButtonsInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def item_wrapper_class
    "radio-inline"
  end
end

# http://stackoverflow.com/questions/14972253/simpleform-default-input-class
# https://github.com/plataformatec/simple_form/issues/316

inputs = %w[
  CollectionSelectInput
  DateTimeInput
  FileInput
  GroupedCollectionSelectInput
  NumericInput
  PasswordInput
  RangeInput
  StringInput
  TextInput
]

inputs.each do |input_type|
  superclass = "SimpleForm::Inputs::#{input_type}".constantize

  new_class = Class.new(superclass) do
    def input_html_classes
      super.push('form-control')
    end
  end

  Object.const_set(input_type, new_class)
end

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap3, tag: 'div', class: 'form-group', error_class: 'has-error',
                  defaults: {
                      input_html: { class: 'default-class ' },
                      wrapper_html: { class: "col-lg-6 col-md-6" },
                  } do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label, wrap_with: { class: "col-lg-3 col-md-3" }
        b.wrapper :right_column, tag: :div, class: "col-lg-9 col-md-9"  do |component|
      component.use :input
      component.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      component.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  config.wrappers :group, tag: 'div', class: "form-group", error_class: 'has-error',
                  defaults: {input_html: {class: 'default-class '}} do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label
    b.use :input, wrap_with: {class: "input-group"}
    b.use :hint, wrap_with: {tag: 'span', class: 'help-block'}
    b.use :error, wrap_with: {tag: 'span', class: 'help-block has-error'}
  end

  config.default_wrapper = :bootstrap3

  # Define the way to render check boxes / radio buttons with labels.
  # Defaults to :nested for bootstrap config.
  #   :inline => input + label
  #   :nested => label > input
  config.boolean_style = :nested

  # Default class for buttons
  config.button_class = 'btn'

  # Method used to tidy up errors.
  # config.error_method = :first

  # Default tag used for error notification helper.
  config.error_notification_tag = :div
end