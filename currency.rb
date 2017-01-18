class Currency
  attr_reader :amount, :code, :amount_w_code
  attr_accessor :amount, :code, :amount_w_code


  def initialize params
    @amount = params[:amount]
    @code = params[:code]
    @amount_w_code = params[:amount_w_code]

    if amount_w_code != nil
      if @amount_w_code[0] == @amount_w_code[0].to_i.to_s
        @amount = @amount_w_code.slice(0,@amount_w_code.length - 2)
        @code = @amount_w_code.slice(@amount_w_code.length - 1,1)
      elsif @amount_w_code[@amount_w_code.length-1] ==  @amount_w_code[@amount_w_code.length-1].to_i.to_s
        @amount = @amount_w_code.slice(1,@amount_w_code.length - 1)
        @code = @amount_w_code.slice(0,1)
      else
        raise "This does not appear to be a currency."
      end
    end
  end

  def ==(b)
    @amount == b.amount && @code == b.code
  end

  def add(b)
    if @code == b.code
      Currency.new(amount: @amount + b.amount, code: @code)
    elsif @code != b.code
      raise "Not the same currency type, cannot add together."
    end
  end

  def subtract(b)
    if @code == b.code
      Currency.new(amount: @amount - b.amount, code: @code)
    elsif @code != b.code
      raise "Not the same currency type, cannot subtract."
    end
  end

  def multiply(c)
    if c.class == Fixnum or c.class == Float
      Currency.new(amount: @amount*c, code: @code)
    else
      raise "Not a number, cannot multiply"
    end
  end


end
