require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation
    Currency.new(amount: 100, code: 'USD')
  end

  def test_equal_currencies
    a = Currency.new(amount: 100, code: 'USD')
    b = Currency.new(amount: 100, code: 'USD')
    assert a == b

    c = Currency.new(amount: 34, code: 'EUR')
    refute a == c
  end
end
