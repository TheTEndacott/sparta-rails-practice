class Meal < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  def dish_name
    "#{dish}"
  end
end
