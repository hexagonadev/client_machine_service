require_relative "menu"

module  Display
  def self.start
    menu = Menu.new
    found = true

    while found do
      puts ""
      puts "¡Bienvenido a tu mecanico favorito!"
      puts ""
      menu.show
      menu.choose
      result = menu.options.select { |option| option.value == menu.input }
      puts result[0].action.start
      found = false if menu.choose == 2
    end

  end
end
