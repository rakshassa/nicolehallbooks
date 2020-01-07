class Character < ApplicationRecord
  scope :playable, -> { where(playable: 0) }
  scope :npc, -> { where(playable: 1) }
  scope :with_trait, ->(trait_id) { joins(:character_traits).where("character_traits.trait_id = ?", trait_id) }

  has_many :character_traits
  has_many :character_gears

  has_many :health_mods
  has_many :damage_mods
  has_many :armor_mods
  has_many :focus_mods
  has_many :resist_mods
  has_many :speed_mods
  has_many :accuracy_mods

  has_many :unlocked_characters

  def traits
    character_traits.joins(:trait).pluck("traits.name")
  end

  def has_basic
    return false if basic_name.blank?
    return false if basic_texts.blank?

    true
  end

  def has_special
    return false if special_name.blank?
    return false if special_texts.blank?

    true
  end

  def has_ultimate
    return false if ultimate_name.blank?
    return false if ultimate_texts.blank?

    true
  end

  def has_passive
    return false if passive_name.blank?
    return false if passive_texts.blank?

    true
  end
end
