module TrashesHelper
  def generate_table
    if Trash.all.empty? # Se a tabela de lixo estiver vazia,
      residentes = User.without_role(:conselho).order(:name) # obtém apenas os residentes que não são membros do conselho
      day = start # Dia que começa a contagem da tabela
      populate(residentes, day)
    else
      Trash.where(done: false).destroy_all
      if Trash.where(when: Trash.last.when).size == 1
        Trash.last.destroy
      end
      day = Trash.last.when
      day = day.next_weekday
      residentes = User.without_role(:conselho).where.not(id: Trash.select(:user_id).all).order(:name)
      populate(residentes, day)
    end
  end

  def populate(residentes, day)
    count = 0
    residentes.each_with_index do |residente, index|
      if count == 2
        day = day.next_weekday
        count = 0
      end
      saved = false
      while !saved do
        if day.on_weekday? # Tabela de retirada do lixo só funciona de Segunda-Sexta
          if Calendar.where(date: day, trash: true).empty?
            # Save 2 users in the trash table this day
            trash = Trash.new
            trash.user_id = residente.id
            trash.when = day
            trash.done = false
            if trash.save!
              count = count+1
              saved = true
            end
          else
            day = day.next_weekday
          end
        else
          day = day.next_weekday
        end
      end
    end
  end
  def start
    today = Date.today.to_datetime
    start = Calendar.where(is_holiday: false).last.inicio_semestre.at_beginning_of_day
    if today > start
      start = today
    end
    start
  end
end
