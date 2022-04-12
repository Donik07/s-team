# frozen_string_literal: true

module DaysWeeksHelper
  def days_weeks
    day = Time.new.wday
    case day
    when 0
      'Воскресенье'
    when 1
      'Понедельник'
    when 2
      'Вторник'
    when 3
      'Среда'
    when 4
      'Четверг'
    when 5
      'Пятница'
    when 6
      'Суббота'
    end
  end
end