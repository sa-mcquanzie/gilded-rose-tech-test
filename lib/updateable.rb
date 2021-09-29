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
    unless within_date?
      zero_quality
      return
    end

    appreciate(1)
    appreciate(1) if @sell_in < 11
    appreciate(1) if @sell_in < 6
  end

  def age
    @sell_in -= 1
  end
end
