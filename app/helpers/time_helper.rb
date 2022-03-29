# frozen_string_literal: true

module TimeHelper
  def get_days(arg)
    now = DateTime.now.strftime('%d/%m %H:%M')
    res = now.to_i - arg.to_i

    case res
    when 0
      'Сегодня'
    when 1
      'Вчера'
    else
      "#{res} дн."
    end
  end
end
