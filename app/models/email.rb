
class Email
  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def event_hash
    { namespace: "Emails", id: id, email: email }
  end
end
