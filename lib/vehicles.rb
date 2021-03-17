class Vehicle
  attr_accessor :id, :kind, :brand, :model, :engine_size, :year, :color, :vin, :user_id, :errors

  def self.index(user_id, search = {})

    response = RestClient.get("localhost:3000/users/#{user_id}/vehicles", { accept: 'application/json', params: search} )
    vehicles = JSON.parse(response.body)
    vehicles['vehicles'].map do |vehicle|
      Vehicle.new(vehicle)
    end
  end

  def self.show(id)
    response = RestClient.get("localhost:3000/vehicles/#{id}", { accept: 'application/json'})
    attributes = JSON.parse(response.body)
    Vehicle.new(attributes['vehicle'])
  end

  def self.create(user_id, params)

    payload = params
    response = RestClient.post("localhost:3000/users/#{user_id}/vehicles", payload.to_json, {content_type: :json, accept: :json})
    attributes = JSON.parse(response.body)
    Vehicle.new(attributes['vehicle'])
  end

  def self.update(id, params)
    payload = params
    response = RestClient.put("localhost:3000/vehicles/#{id}", payload.to_json, {content_type: :json, accept: :json})
    attributes = JSON.parse(response.body)
    Vehicle.new(attributes['vehicle'])
  end

  def self.delete(id)
    response = RestClient.delete("localhost:3000/vehicles/#{id}", { accept: 'application/json' })
    attributes = JSON.parse(response.body)
    Vehicle.new(attributes['vehicle'])
  end

  def initialize(options = {})
    @id = options['id']
    @kind = options['kind']
    @brand = options['brand']
    @model = options['model']
    @engine_size = options['engine_size']
    @year = options['year']
    @color = options['color']
    @vin = options['vin']
    @user_id = options['user_id']
    @errors = options['errors'] || []
  end

  def save
    params = {
      kind: @kind,
      brand: @brand,
      model: @model,
      engine_size: @engine_size,
      year: @year,
      color: @color,
      vin: @vin,
      user_id: @user_id
    }
    vehicle = Vehicle.create(id, params)

    commit_vehicle(vehicle)

    if self.id
      true
    else
      false
    end
  end

  def update
    params = {
      kind: @kind,
      brand: @brand,
      model: @model,
      engine_size: @engine_size,
      year: @year,
      color: @color,
      vin: @vin,
      user_id: @user_id
    }
    vehicle = Vehicle.update(self.id, params)
    commit_vehicle(vehicle)

    if vehicle.errors.any?
      false
    else
      true
    end
  end

  def delete
    vehicle = Vehicle.delete(self.id)
    commit_vehicle(vehicle)

    if vehicle.errors.any?
      false
    else
      true
    end
  end

  def show
    vehicle = Vehicle.show(self.id)
    commit_vehicle(vehicle)

    puts "Kind:     #{kind}"
    puts "Brand:    #{brand}"
    puts "Model:    #{model}"
    puts "Motor:    #{engine_size}"
    puts "Año:      #{year}"
    puts "Color:    #{color}"
    puts "Placa:    #{vin}"
  end

  private

  def commit_vehicle(resource)

    vehicle          = resource
    self.id          = vehicle.id
    self.kind        = vehicle.kind
    self.brand       = vehicle.brand
    self.model       = vehicle.model
    self.engine_size = vehicle.engine_size
    self.year        = vehicle.year
    self.color       = vehicle.color
    self.vin         = vehicle.vin
    self.errors      = vehicle.errors
  end

end