module ApplicationHelper
  def display_errors_for(model)
    out = if model.errors.any?
      content_tag(:div, class: ["error_explanation"]) do
        content_tag(:h2, "#{pluralize(model.errors.count, 'error')} prohibited this topic from being posted:") + content_tag(:ul, model.errors.full_messages.reduce('') { |str, msg| str += " " + content_tag(:li, msg) }.html_safe )
      end
    end
  end
end
