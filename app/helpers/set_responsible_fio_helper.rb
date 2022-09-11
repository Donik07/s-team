# frozen_string_literal: true

module SetResponsibleFioHelper
  def set_responsible_fio(id)
    a = User.find_by id: id
    a.first_name + ' ' + a.last_name
  end
end
