require_relative "sign_up"
require_relative "register_vehicle"
require_relative "make_appointment"

class Option
  attr_reader :value, :text, :action

  def initialize(value, text,action)
    @text = text
    @value = value
    @action = action
  end

  def show
    "#{@value}: #{@text}"
  end

end

class Menu
  attr_accessor :input
  attr_reader :options

  def initialize
    @options = generate_options
  end

  def choose
    @input = gets.chomp.to_i
  end

  def show
    @options.each do |option|
     puts option.show
    end
  end

  private

  def generate_options
    [
      Option.new(1, "Crear Usuario", SignUp.new),
      Option.new(2, "Registrar Vehiculo", RegisterVehicle.new),
      Option.new(3, "Crear Cita", MakeAppointment.new),
      #Option.new(4, "Actualizaciones", UpdateResourse.new),
      #Option.new(5, "Borrar datos de usuarios", DeleteResourse.new),
      #Option.new(6, "Consulta tu Usuario",   ShowResourse.new),
      #Option.new(7, "Registros", IndexResourse.new)
    ]
  end

end