class Command
  attr_reader :name, :parameters

  def to_hash
    {
      name: name,
      parameters: parameters
    }
  end
end
