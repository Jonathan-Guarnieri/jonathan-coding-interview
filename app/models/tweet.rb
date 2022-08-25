class Tweet < ApplicationRecord
  def self.paginate(page)
    offset = (page.to_i - 1) * 10
    order(created_at: :desc).limit(10).offset(offset)
  end
end
