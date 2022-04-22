module GroupsHelper
	def build_friendly_link(record)
		custom_id = record.friendly_link
		custom_id = record.id if custom_id.blank?

		news_item_path(custom_id)
	end
end
