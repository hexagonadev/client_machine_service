require_relative "../vehicles"
require_relative "../users"

class RegisterVehicle


  def start
    vehicle = Vehicle.new
    found = true

    while found do
      puts "Registro de Vehiculo:"
      puts ""
      user_valid(vehicle) if vehicle.user_id.nil?
      vehicle_dates(vehicle)

      if vehicle.save
        puts ""
        puts "¡Vehiculo registrado con exito!
              ¿Desea volver al menu?
              SI: 1 / NO: 2"
        found = false
      else
        vehicle.errors.each {|message| puts message}
      end
    end
  end

  def user_valid(vehicle)
    value = true
    while value do
      puts "Usuario (email):"
      email = gets.chomp
      search = {search: {email: email}}
      user = User.index(search)

      if user != nil
       vehicle.user_id = user[0].id
        value = false
      else
        puts vehicle.errors(:user_id, 'este usuario es invalido, intente de nuevo')
      end
    end
  end

  def vehicle_dates(vehicle)
    puts "Tipo de Vehiculo"
    vehicle.kind = gets.chomp
    puts "Marca:"
    vehicle.brand = gets.chomp
    puts "Modelo:"
    vehicle.model = gets.chomp
    puts "Motor:"
    vehicle.engine_size = gets.chomp
    puts "Año:"
    vehicle.year = gets.chomp
    puts "Color:"
    vehicle.color = gets.chomp
    puts "Placa:"
    vehicle.vin = gets.chomp
  end

end