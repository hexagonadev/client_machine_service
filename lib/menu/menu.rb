require_relative "sign_up"
require_relative "register_vehicle"
require_relative "make_appointment"
require_relative "update_resourse"
require_relative "delete_resourse"
require_relative "show_resourse"


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
      Option.new(4, "Actualizaciones", UpdateResourse.new),
      Option.new(5, "Eliminar Datos", DeleteResourse.new),
      Option.new(6, "Consulta tu Usuario", ShowResourse.new)
    ]
  end

end