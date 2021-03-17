require_relative "../vehicles"
require_relative "../users"
require_relative "../appointments"
require_relative "menu"
require_relative "register_vehicle"
require_relative "make_appointment"

class UpdateResourse

  def start
    system('clear')
    puts "Actualizaciones:"
    puts "1. Actualizar usuario"
    puts "2. Actualizar vehiculo"
    puts "3. Actualizar cita"

    input = Menu.new.choose

    if input == 1
      update_user
    elsif input == 2
      update_vehicle
    else
     update_appointment
    end

  end

  def update_user
    system('clear')

    value = true
    while value
      user = User.new
      find_user(user)
      system('clear')
      puts "Ingrese su datos Actualizados:"
      puts "Email:"
      user.email = gets.chomp
      puts "Nombre:"
      user.name = gets.chomp
      puts "Apellido:"
      user.last_name = gets.chomp

      if user.update

        system('clear')
        puts ""
        puts "Usuario ACTUALIZADO con exito"
        puts ""

        puts "Bienvenid@, usuario:#{user.email}
              ¿Desea volver al menu SI: 1 / NO: 2"

        value = false
      else
        user.errors.each {|message| puts message}
        puts ""
      end
    end
  end

  def update_vehicle
    system('clear')
    value = true
    while value do
      vehicle = Vehicle.new
      search = RegisterVehicle.new
      search.user_valid(vehicle)
      puts ""
      search_vehicle(vehicle)
      system('clear')
      puts "A continuación podrá ingresar los datos de su vehiculo ACTUALIZADOS:"
      search.vehicle_dates(vehicle)

      if vehicle.update
        puts ""
        puts "¡Vehiculo ACTUALIZADO con exito!
              ¿Desea volver al menu?
              SI: 1 / NO: 2"
        value = false

      else
        vehicle.errors.each {|message| puts message}
      end
    end
  end

  def update_appointment
    system('clear')
    value = true

    while value do
      appointment = Appointment.new
      search = MakeAppointment.new
      search.search_user(appointment)
      puts ""
      search_appointment(appointment)
      system('clear')
      puts "Ingrese los siguientes datos para actualizar su cita:"
      search.register_appointment(appointment)

      if appointment.update
        puts ""
        puts "¡Su cita esta ACTUALIZADA!"
        puts ""
        puts "¿Desea volver al menu?
            SI: 1 / NO: 2"
        value = false
      else
        appointment.errors.each{|message| puts message}

      end
    end
  end

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

  def search_vehicle(vehicle)
    valid = true

    while valid do
      puts "Indique la placa de su Vehiculo"
      vin = gets.chomp
      search = {search: {vin: vin}}
      vehicle_id = Vehicle.index(vehicle.user_id, search)

      if vehicle_id != nil
       vehicle.id = vehicle_id[0].id
       valid = false
      else
        puts vehicle.errors(:vin, 'esta placa no se encuentra registrada, intente de nuevo')
      end
    end
  end

  def search_appointment(appointment)
    valid = true

    while valid do
      puts "Indique la placa de su Vehiculo"
      vin = gets.chomp
      search = {search: {vin: vin}}
      vehicle = Vehicle.index(appointment.user_id, search)[0]

      search2 = {search: {vehicle_id: vehicle.id}}
      appointment_id = Appointment.index(appointment.user_id,search2)

      if appointment_id != nil
        appointment.id = appointment_id[0].id
        appointment.vehicle_id = vehicle.id
        valid = false
      else
        puts appointment.errors(:vin, 'esta placa no se encuentra registrada, intente de nuevo')
      end
    end
  end

end