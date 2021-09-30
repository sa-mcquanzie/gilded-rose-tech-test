module Updateable
  def update
    case @category
    when :ordinary
      update_ordinary
    when :ages_well
      update_ages_well
    when :backstage_pass
      update_backstage_pass
    else
    end

    age
  end

  def update_ordinary
    within_date? ? depreciate(1) : depreciate(2)
  end

  def update_ages_well
    appreciate(1)
  end

  def update_backstage_pass
    case @sell_in
    when 11..Float::INFINITY  
      appreciate(1)
    when 6..10
      appreciate(2)
    when 1..5
      appreciate(3)
    when -Float::INFINITY..0
      make_quality_zero
    end
  end

  def age
    @sell_in -= 1
  end

  def within_date?
    @sell_in.positive?
  end

  def past_date?
    !within_date?
  end

  def appreciate(amount)
    @quality += amount
    @quality = 50 if @quality > 50
  end

  def depreciate(amount)
    @quality -= amount
    @quality = 0 if @quality.negative?
  end

  def make_quality_zero
    @quality = 0
  end
end
