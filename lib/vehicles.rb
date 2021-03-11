class Vehicle
  attr_accessor :id, :kind, :brand, :model, :engine_size, :year, :color, :vin, :errors
  @@header = { accept: 'application/json'}

  def self.index(user_id, search = {})
    response = RestClient.get("localhost:3000/users/#{user_id[:user_id]}/vehicles", { accept: 'application/json'} )
    vehicles = JSON.parse(response.body)
    vehicles.map do |vehicle|
      Vehicle.new(vehicle)
    end
  end

  def self.show(id)
    response = RestClient.get("localhost:3000/vehicles/#{id[:id]}", @@header)
    vehicle = JSON.parse(response.body)
    puts vehicle.inspect

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
    vehicle = JSON.parse(response.body)
    Vehicle.new(attributes['vehicle'])
  end

  def self.delete(id)
    response = RestClient.delete("localhost:3000/vehicles/#{id}", { accept: 'application/json' })
    vehicle = JSON.parse(response.body)
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
    @errors = options['errors']
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
    }
    vehicle = Vehicle.create(params)

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
    }
    vehicle = Vehicle.update(self.id, params)
    commit_vehicle(vehicle)

    true if vehicle
  end

  def delete
    params = {
      kind: @kind,
      brand: @brand,
      model: @model,
      engine_size: @engine_size,
      year: @year,
      color: @color,
      vin: @vin,
    }
    vehicle = Vehicle.delete(self.id)
    commit_vehicle(vehicle)

    true if vehicle
  end

  def show
    params = {
      kind: @kind,
      brand: @brand,
      model: @model,
      engine_size: @engine_size,
      year: @year,
      color: @color,
      vin: @vin,
    }
    vehicle = Vehicle.show(self.id)
    commit_vehicle(vehicle)

    true if vehicle
  end

  private

  def commit_vehicle(resource)

    vehicle          = resource
    self.id          = vehicle.id
    self.kind        = vehicle.name
    self.brand       = vehicle.last_name
    self.model       = vehicle.name
    self.engine_size = vehicle.engine_size
    self.year        = vehicle.year
    self.color       = vehicle.color
    self.vin         = vehicle.vin
    self.errors      = vehicle.errors
  end

end