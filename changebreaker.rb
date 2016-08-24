require 'bigdecimal'

class ChangeBreaker
  DENOMINATIONS = [
      BigDecimal.new("100.00"),
      BigDecimal.new("50.00"),
      BigDecimal.new("20.00"),
      BigDecimal.new("10.00"),
      BigDecimal.new("5.00"),
      BigDecimal.new("1.00"),
      BigDecimal.new("0.50"),
      BigDecimal.new("0.25"),
      BigDecimal.new("0.10"),
      BigDecimal.new("0.05"),
      BigDecimal.new("0.01"),
  ]

  def initialize(price, paid)
    @price = BigDecimal.new(price)
    @paid = BigDecimal.new(paid)
    @initial_difference = @paid - @price
    @difference = @paid - @price
    show_info
  end

  def show_info
    puts "Paid: #{@paid.to_f}, Price: #{@price.to_f}, Difference: #{@initial_difference.to_f}"
  end

  def change
    @change.map(&:to_f)
  end

  def make_change
    DENOMINATIONS.each do |denomination|
      if denomination <= @difference
        @difference -= denomination
        @change << denomination
        make_change
      end
    end
  end
end

