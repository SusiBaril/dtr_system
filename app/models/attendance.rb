class Attendance < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_label, use: :slugged

  has_many :tasks, dependent: :destroy

  def slug_label
    time_in.strftime("dtr-%Y-%m-%d")
  end
end
