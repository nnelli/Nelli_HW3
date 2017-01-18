require './currency.rb'

class Currency_converter
  attr_reader :conversion

  def initialize(conversion:)
    @conversion = conversion
  end

  def convert(currency, new_code)
    old_rate = @conversion[currency.code.to_sym]
    new_rate = @conversion[new_code]

    if old_rate == nil or new_rate == nil
      raise "This is an unknown currency."
    else
      conversion_rate = new_rate/old_rate

      Currency.new(amount: (currency.amount * conversion_rate).round(2),code: new_code.to_s)
    end
  end
end
