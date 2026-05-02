class Task < ApplicationRecord
  belongs_to :attendance

  validates :title, presence: true
end
