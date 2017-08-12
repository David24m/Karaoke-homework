class Guest

  attr_accessor(:name, :money, :favourite)

  def initialize(name, money, favourite)
    @name = name
    @money = money
    @favourite = favourite
  end

end
