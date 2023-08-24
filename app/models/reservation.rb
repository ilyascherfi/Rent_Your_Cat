class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  validates :start_date, :end_date, presence: true
  validates :user, uniqueness: { scope: :cat }
  validate :end_date_after_start_date
  validate :cannot_reserve_own_cat
  after_create :calculate_total

  private

  def calculate_total
    days = (end_date - start_date).to_i
    total = cat.price * days
    update(total_price: total)
  end

  def cannot_reserve_own_cat
    if user_id == cat.user_id
      errors.add(:user_id, "cannot reserve their own cat")
    end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
