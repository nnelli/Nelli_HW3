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

  def test_addition
    a = Currency.new(amount: 100, code: 'USD')
    b = Currency.new(amount: 100, code: 'USD')
    c = a.add(b)
    assert c == Currency.new(amount: 200, code: 'USD')

    assert_raises RuntimeError do
      d = Currency.new(amount: 34, code: 'EUR')
      e = a.add(d)      
    end


  end

  def test_multiplication
    a = Currency.new(amount: 100, code: 'USD')
    b = a.multiply(3)
    assert b == Currency.new(amount:300, code: 'USD')

    assert_raises RuntimeError do
      c = a.multiply("3")
    end

  end

  def test_subtraction
    a = Currency.new(amount: 100, code: 'USD')
    b = Currency.new(amount: 50, code: 'USD')
    c = a.subtract(b)
    assert c == Currency.new(amount: 50, code: 'USD')

    assert_raises RuntimeError do
      d = Currency.new(amount: 34, code: 'EUR')
      e = a.subtract(d)
    end

  end
end
