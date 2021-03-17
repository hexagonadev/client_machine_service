require_relative "../vehicles"
require_relative "../users"
require_relative "../appointments"
require_relative "menu"
require_relative "register_vehicle"
require_relative "make_appointment"


class DeleteResourse

  def start
    system('clear')
    puts "Elija el tipo de datos que desea eliminar:"
    puts "1. Eliminar usuario"
    puts "2. Eliminar vehiculo"
    puts "3. Eliminar cita"

    input = Menu.new.choose

    if input == 1
      delete_user
    elsif input == 2
      delete_vehicle
    else
      delete_appointment
    end
  end
end

def delete_user
  system('clear')
  value = true

  while value do
    user = User.new
    find_user(user)

    if user.delete
    system('clear')
      puts ""
      puts "Usuario ELIMINADO con exito"
      puts "¿Desea volver al menu SI: 1 / NO: 2"
      value = false
    else
      user.errors.each {|message| puts message}
      puts ""
    end
  end
end

def delete_vehicle
  system('clear')
  value = true

  while value do
    vehicle = Vehicle.new
    search = RegisterVehicle.new
    search.user_valid(vehicle)
    vin = UpdateResourse.new
    vin.search_vehicle(vehicle)

    if vehicle.delete
      puts ""
      puts "¡Vehiculo ELIMINADO con exito!
            ¿Desea volver al menu?
            SI: 1 / NO: 2"
      value = false

    else
      vehicle.errors.each {|message| puts message}
    end
  end
end

def delete_appointment
  system('clear')
  value = true

  while value do
    appointment = Appointment.new

    puts "Para eliminar su cita ingrese:"
    user = MakeAppointment.new
    user.search_user(appointment)
    puts ""

    puts "placa del vehiculo:"
    vin = gets.chomp
    search = {search: {vin: vin}}
    vehicle = Vehicle.index(appointment.user_id, search)[0]

    search2 = {search: {vehicle_id: vehicle.id}}
    appointment_id = Appointment.index(appointment.user_id,search2)

    if appointment_id != nil
      appointment.id = appointment_id[0].id
      value = false
    else
      puts appointment.errors(:vin, 'esta placa no se encuentra registrada, intente de nuevo')
    end
  end

  if appointment.delete
    puts ""
    puts "¡Su cita esta ELIMINADA!"
    puts ""
    puts "¿Desea volver al menu?
        SI: 1 / NO: 2"
    value = false
  else
    appointment.errors.each{|message| puts message}

  end

end

private

def find_user(user)
  value = true
  while value do
    puts "Usuario (email):"
    email = gets.chomp
    search = {search: {email: email}}
    user_id = User.index(search)

    if user_id != nil
      user.id = user_id[0].id
      value = false
    else
      puts user_id.errors(:user_id, 'este usuario es invalido, intente de nuevo')
    end
  end
end