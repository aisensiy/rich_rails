class Land
  attr_accessor :id

  def to_hash
    {
      'id': id
    }
  end
end
