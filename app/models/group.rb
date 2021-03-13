class Group < ApplicationRecord
	has_many :news_items, dependent: :nullify
end
