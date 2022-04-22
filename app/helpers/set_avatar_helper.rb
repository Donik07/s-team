# frozen_string_literal: true

module SetAvatarHelper
  def set_avatar(id)
    a = Avatar.find_by id: id
    a.photo
  end
end
