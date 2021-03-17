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
    user = User.new

    while value do
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
    value = true
    vehicle = Vehicle.new

    while value do
      search = RegisterVehicle.new
      search.user_valid(vehicle)
      search2 = UpdateResourse.new
      search2.search_vehicle(vehicle)
      if vehicle != nil
        system('clear')
        puts "Tu vehiculo es:"
        puts vehicle.show
        puts "¿Desea volver al menu? SI: 1 / NO: 2"
        value = false
      else
        vehicle.errors.each {|message| puts message}
        puts ""
      end
    end
  end

  def show_appointment
    value = true
    appointment = Appointment.new

    while value do
      user = MakeAppointment.new
      user.search_user(appointment)
      search = search = UpdateResourse.new
      search.search_appointment(appointment)

      if appointment != nil
        system('clear')
        puts "Tu cita es:"
        puts appointment.show
        puts "¿Desea volver al menu? SI: 1 / NO: 2"
        value = false
      else
        appointment.errors.each {|message| puts message}
        puts ""
      end
    end
  end

end