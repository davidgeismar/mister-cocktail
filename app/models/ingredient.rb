class Ingredient < ActiveRecord::Base
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true
end
# private

# def before_destroy
#   return true if .count == 0
#   errors.add :base, "Cannot delete booking with payments"
#   # or errors.add_to_base in Rails 2
#   false
# end
# end
