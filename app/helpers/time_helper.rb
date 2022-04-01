# frozen_string_literal: true

module TimeHelper
  def get_days(arg)
    now = DateTime.now.strftime('%d/%m %H:%M')
    res = now.to_i - arg.to_i

    if res == 0
      'Сегодня'
    elsif res == 1
      'Вчера'
    elsif res < 0
      'В прошлом месяце'
    else
      "#{res} дн."
    end
  end
end
