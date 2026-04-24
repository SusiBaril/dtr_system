class Attendance < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_label, use: :slugged

  def slug_label
    time_in.strftime("dtr-%Y-%m-%d")
  end
end
