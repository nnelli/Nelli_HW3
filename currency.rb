class Currency
  attr_reader :amount, :code

  def initialize(amount:, code:)
    @amount = amount
    @code = code
  end

  def ==(b)
    @amount == b.amount && @code == b.code
  end

  def add(b)
    if @code == b.code
      Currency.new(amount: @amount + b.amount, code: @code)
    elsif @code != b.code
      puts "Not the same currency type, cannot add together."
    end
  end

  def subtract(b)
    if @code == b.code
      Currency.new(amount: @amount - b.amount, code: @code)
    elsif @code != b.code
      puts "Not the same currency type, cannot subtract."
    end
  end

  def multiply(c)
    if c.class == Fixnum or c.class == Float
      Currency.new(amount: @amount*c, code: @code)
    else
      puts "Not a number, cannot multiply"
    end
  end


end
