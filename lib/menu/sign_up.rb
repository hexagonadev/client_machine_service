require_relative "../users"

class SignUp

  def start
    system('clear')
    user = User.new

    found = true

    while found do
      puts "Ingrese su email:"
      user.email = gets.chomp
      puts "Ingrese su nombre:"
      user.name = gets.chomp
      puts "Ingrese su apellido:"
      user.last_name = gets.chomp

      if user.save
        system('clear')
        puts ""
        puts "Usuario CREADO con exito"
        puts ""
        puts "Bienvenid@, usuario:#{user.email}
              ¿Quiere registar su vehiculo? SI: 1 / NO: 2"
        found = false
      else
        user.errors.each {|message| puts message}
        puts ""
      end
    end
  end
end