# frozen_string_literal: true

module SetStatusHelper
  def set_status(id)
    a = Status.find_by id: id
    a.status
  end
end
