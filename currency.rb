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
    c = "",

    if @code == b.code
      Currency.new(amount: @amount + b.amount, code: @code)
    elsif @code != b.code
      puts "Not the same currency type, cannot add together."
    end
  end

end
