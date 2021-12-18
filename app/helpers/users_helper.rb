# frozen_string_literal: true

module UsersHelper
  def user_fields(key, val)
    @user_keys = {
      fio: 'ФИО',
      category: 'Категория',
      description: 'Краткое описание',
      level: 'Уровень категории',
      experience: 'Опыт',
      education: 'Образование',
      add_education: 'Дополнительное образование',
      center: 'Место работы',
      procedure: 'Процедуры',
      phone: 'Телефон'
    }

    content_tag(:p) do
      content_tag(:strong) do
        "#{@user_keys[key]}: " + val.to_s
      end
    end
  end
end
