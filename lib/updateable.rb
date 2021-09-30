module Updateable
  DAY_LENGTH = 1
  DEFAULT_QUALITY_EFFECT = 1
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  INTERVAL_1 = (11..Float::INFINITY).freeze
  INTERVAL_2 = (6..10).freeze
  INTERVAL_3 = (1..5).freeze
  INTERVAL_4 = -(Float::INFINITY..0).freeze

  def update
    case @category
    when :ordinary then update_ordinary
    when :ages_well then update_ages_well
    when :backstage_pass then update_backstage_pass
    when :conjured then update_conjured
    end

    age unless @category == :legendary
  end

  def update_ordinary
    within_date? ? depreciate : depreciate(2)
  end

  def update_ages_well
    appreciate
  end

  def update_conjured
    2.times { update_ordinary }
  end

  def update_backstage_pass
    case @sell_in
    when INTERVAL_1 then appreciate
    when INTERVAL_2 then appreciate(2)
    when INTERVAL_3 then appreciate(3)
    when INTERVAL_4 then @quality = 0
    end
  end

  def age
    @sell_in -= DAY_LENGTH
  end

  def within_date?
    @sell_in.positive?
  end

  def past_date?
    !within_date?
  end

  def appreciate(amount = DEFAULT_QUALITY_EFFECT)
    @quality += amount
    @quality = MAX_QUALITY if @quality > MAX_QUALITY
  end

  def depreciate(amount = DEFAULT_QUALITY_EFFECT)
    @quality -= amount
    @quality = MIN_QUALITY if @quality.negative?
  end
end
