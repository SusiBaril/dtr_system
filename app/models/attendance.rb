class Attendance < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_label, use: :slugged

  has_many :tasks, dependent: :destroy

  def slug_label
    return "dtr-unknown" if time_in.blank?
    time_in.strftime("dtr-%Y-%m-%d")
  end
end
