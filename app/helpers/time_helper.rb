module TimeHelper
  def get_days arg
    now = DateTime.now.strftime('%d/%m %H:%M')
    res = now.to_i - arg.to_i

    if res == 0
      'Сегодня'
    elsif res == 1
      'Вчера'
    else
      res.to_s + ' дн.'
    end
  end
end
