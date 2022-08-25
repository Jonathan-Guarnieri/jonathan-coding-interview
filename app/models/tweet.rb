class Tweet < ApplicationRecord
  scope :by_user, -> (user) { where(user: user) if user.present? }

  def self.paginate(page)
    offset = (page.to_i - 1) * 10
    order(created_at: :desc).limit(10).offset(offset)
  end
end
