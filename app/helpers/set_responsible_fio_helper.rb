# frozen_string_literal: true

module SetResponsibleFioHelper
  def set_responsible_fio(id)
    space = ' '
    a = User.find_by id: id
    a.first_name + space + a.last_name
  end
end
