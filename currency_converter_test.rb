require 'minitest/pride'
require 'minitest/autorun'
require './currency_converter.rb'
require './currency.rb'


class CurrencyConverterTest < Minitest::Test
  def Test_converter_creation
    Currency_converter.new(conversion: {USD: 1.0, EUR: 0.74})
  end

  def test_equality
    usd_eur = Currency_converter.new(conversion: {USD: 1.0, EUR: 0.74})
    a = Currency.new(amount: 25, code: "USD")

    b = usd_eur.convert(a, :USD)
    assert b == Currency.new(amount:25, code: "USD")
  end

  def test_conversion
    usd_eur = Currency_converter.new(conversion: {USD: 1.0, EUR: 0.74})
    a = Currency.new(amount: 25, code: "USD")

    b = usd_eur.convert(a, :EUR)
    assert b == Currency.new(amount:18.5, code: "EUR")
  end

  def test_conversion_2
    usd_eur_jpy = Currency_converter.new(conversion: {USD: 1.0, EUR: 0.74, JPY: 1.20})
    a = Currency.new(amount: 25, code: "JPY")

    b = usd_eur_jpy.convert(a, :EUR)
    assert b == Currency.new(amount:15.42, code: "EUR")
  end

  def test_unknown_currency
    usd_eur_jpy = Currency_converter.new(conversion: {USD: 1.0, EUR: 0.74, JPY: 1.20})
    a = Currency.new(amount: 25, code: "JPY")

    assert_raises RuntimeError do
      b = usd_eur_jpy.convert(a, :ABC)
    end

    assert_raises RuntimeError do
      a = Currency.new(amount: 10, code: "ABC")
      b = usd_eur_jpy.convert(a, :USD)
    end

  end

end
