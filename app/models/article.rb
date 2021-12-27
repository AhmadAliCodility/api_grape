class Article < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true
  validates :body, presence: true
end
