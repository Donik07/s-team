# frozen_string_literal: true

module ApplicationHelper
  def title_name(page_name = '')
    base_name = 'S-team'
    if page_name.present?
      "#{base_name} | #{page_name}"
    else
      base_name
    end
  end
end
