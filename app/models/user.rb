
class User
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def event_hash
    { namespace: "Users", id: id, email: name }
  end
end
