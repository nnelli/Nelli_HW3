require './currency.rb'

class Currency_converter
  attr_reader :conversion

  def initialize(conversion:)
    @conversion = conversion
  end

  def convert(currency, new_code)
    old_rate = @conversion[currency.code.to_sym]
    new_rate = @conversion[new_code]

    conversion_rate = new_rate/old_rate

    Currency.new(amount: currency.amount * conversion_rate,code: new_code.to_s)
  end
end
