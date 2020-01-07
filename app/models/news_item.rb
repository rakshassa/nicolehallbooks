class NewsItem < ApplicationRecord
  has_one_attached :picture
  has_many :news_links

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
