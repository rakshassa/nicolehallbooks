class NewsItem < ApplicationRecord
  validates :posted_date, presence: true
  validates :title, presence: true, length: { in: 1..100 }
  validates :friendly_link, length: { in: 0..25 }, allow_blank: true

  has_one_attached :picture
  belongs_to :group, optional: true

  scope :books, -> { where(is_book: true) }
  scope :news, -> { where(is_news: true) }

  def display_types
    return "None" unless is_book || is_news

    retval = []
    retval << "Book" if is_book
    retval << "News" if is_news

    retval.join(', ')
  end
end
