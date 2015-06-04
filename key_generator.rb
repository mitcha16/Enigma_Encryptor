class Generator
  def generate
    key = []
    5.times do
      key.push(Random.new.rand(10))
    end
    return key.to_s
  end
end