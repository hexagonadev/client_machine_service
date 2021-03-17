require_relative "../vehicles"
require_relative "../users"
require_relative "../appointments"
require_relative "update_resourse"

class ShowResourse

  def start
    system('clear')
    puts "Elija el tipo de datos que desea ver:"
    puts "1. Ver usuario"
    puts "2. Ver vehiculos"
    puts "3. Ver citas"

    input = Menu.new.choose

    if input == 1
      show_user
    elsif input == 2
      show_vehicle
    else
      show_appointment
    end
  end

  def show_user
    value = true
    while value do
      user = User.new

      search = UpdateResourse.new
      search.find_user(user)

      if user != nil
        system('clear')
        puts "Tu usuario es:"
        puts user.show
        puts "¿Desea volver al menu? SI: 1 / NO: 2"
        value = false
      else
        user.errors.each {|message| puts message}
        puts ""
      end
    end
  end

  def show_vehicle

  end

  def show_appointment

  end

end