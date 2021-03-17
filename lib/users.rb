
class User
  attr_accessor :id, :name, :last_name, :email, :errors

  def self.index(search = {})
    response = RestClient.get("localhost:3000/users/", { accept: 'application/json', params: search})
    users = JSON.parse(response.body)
    users['users'].map do |user|
      User.new(user)
    end
  end
  #e = 'asdasd'
  #s = {search: {email: e}}

  def self.show(id)
    response = RestClient.get("localhost:3000/users/#{id}", { accept: 'application/json'} )
    attributes = JSON.parse(response.body)
    User.new(attributes['user'])
  end

  def self.create(params)
    payload = params
    response = RestClient.post('localhost:3000/users', payload.to_json, {content_type: :json, accept: :json})
    attributes = JSON.parse(response.body)
    # {
    #   id: nil,
    #   name: nil,
    #   last: "123123",
    #   email: "a@a.com",
    #   errors: ['Name no puede estar en blanco']
    # }
    User.new(attributes['user'])
  end

  def self.update(id, params)
    payload = params
    response = RestClient.put("localhost:3000/users/#{id}", payload.to_json, {content_type: :json, accept: :json})
    attributes = JSON.parse(response.body)
    User.new(attributes['user'])
  end

  def self.delete(id)
    response = RestClient.delete("localhost:3000/users/#{id}", { accept: 'application/json'} )
    attributes = JSON.parse(response.body)
    User.new(attributes['user'])
  end

  def initialize(options = {})
    @id = options['id']
    @name = options['name']
    @last_name = options['last_name']
    @email = options['email']
    @errors = options['errors'] || []
  end


  def save
    params = {
      name: @name,
      last_name: @last_name,
      email: @email
    }
    user = User.create(params)

    commit_user(user)

    if self.id
      true
    else
      false
    end
  end

  def update
    params = {
      name: @name,
      last_name: @last_name,
      email: @email
    }
    user = User.update(self.id, params)
    commit_user(user)

    if user.errors.any?
      false
    else
      true
    end
  end

  def delete
    user = User.delete(self.id)
    commit_user(user)

    if user.errors.any?
      false
    else
      true
    end
  end

  def show
    user = User.show(self.id)
    commit_user(user)

    if user.errors.any?
      false
    else
      true
    end
  end

  private

  def commit_user(resource)
    self.id        = resource.id
    self.name      = resource.name
    self.last_name = resource.last_name
    self.email     = resource.email
    self.errors    = resource.errors
  end
end