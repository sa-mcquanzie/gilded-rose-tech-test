require_relative 'item_helpers'

module Updateable
  include ItemHelpers

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
    within_date?(self) ? depreciate(self, 1) : depreciate(self, 2)
  end

  def update_ages_well
    appreciate(self, 1)
  end

  def update_backstage_pass
    unless within_date?(self)
      zero_quality(self)
      return
    end

    appreciate(self, 1)
    appreciate(self, 1) if self.sell_in < 11
    appreciate(self, 1) if self.sell_in < 6
  end

  def age
    self.sell_in -= 1
  end
end
