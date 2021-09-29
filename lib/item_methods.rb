module ItemMethods
  def within_date?
    @sell_in.positive?
  end

  def past_date?
    !within_date?
  end

  def appreciate(amount)
    @quality += amount
    @quality = 50 if self.quality > 50
  end

  def depreciate(amount)
    @quality -= amount
    @quality = 0 if @quality.negative?
  end

  def make_quality_zero
    @quality = 0
  end
end
