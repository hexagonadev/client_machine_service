class UserDelete

  def destroy(id)
    user = RestClient::Request.execute(method: :delete, url: "localhost:3000/users/#{id}",
           headers: { accept: 'application/json' })
    puts user
  end
end