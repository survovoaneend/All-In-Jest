local atlases = {
  {
    key = "joker_atlas",
    path = "jokers.png",
    px = 71,
    py = 95
  },

  {
    key = "achievement_atlas",
    path = "achievements.png",
    px = 71,
    py = 71
  },

  {
    key = "hires_joker",
    path = "HiRes_Joker.png",
    px = 1050,
    py = 1409
  },

  {
    key = "misc_atlas",
    path = "misc.png",
    px = 71,
    py = 95
  },

  {
    key = "jumbo_joker",
    path = "jumbo_joker.png",
    px = 81,
    py = 111
  },

  {
    key = "trophy_kill",
    path = "trophy_kill.png",
    px = 91,
    py = 95
  },

  {
    key = "deck_atlas",
    path = "decks.png",
    px = 71,
    py = 95
  },

  {
    key = "sleeve_atlas",
    path = "sleeves.png",
    px = 73,
    py = 95
  },

  {
    key = "stickers_atlas",
    path = "stickers.png",
    px = 71,
    py = 95
  },

  {
    key = 'blinds',
    path = 'blinds.png',
    px = 34,
    py = 34,
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
  },

  {
    key = 'blinds_pit',
    path = 'blinds_pit.png',
    px = 34,
    py = 34,
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
  },

  {
    key = 'blinds_final',
    path = 'blinds_final.png',
    px = 34,
    py = 34,
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
  },

  {
    key = "legendary_atlas",
    path = "legendaries.png",
    px = 71,
    py = 95
  },

  {
    key = "consumable_atlas",
    path = "consumables.png",
    px = 71,
    py = 95
  },

  {
    key = "enhancements_atlas",
    path = "enhancements.png",
    px = 71,
    py = 95
  },

  {
    key = "multi_enhancements_atlas",
    path = "multi_enhancements.png",
    px = 71,
    py = 95
  },

  {
    key = "multi_simulated_atlas",
    path = "multi_simulated.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 10,
    px = 71,
    py = 95
  },

  {
    key = "multi_enhancements_foregrounds_atlas",
    path = "fusion_parts/foregrounds.png",
    px = 71,
    py = 95
  },

  {
    key = "vouchers_atlas",
    path = "vouchers.png",
    px = 71,
    py = 95
  },

  {
    key = 'tag_atlas',
    path = 'tag.png',
    px = 34,
    py = 34
  },

  {
    key = 'familiar_atlas',
    path = 'familiar.png',
    px = 71,
    py = 95
  },

  {
    key = 'partner_atlas',
    path = 'partner_atlas.png',
    px = 46,
    py = 58,
  },

  {
    key = 'booster_atlas',
    path = 'boosters.png',
    px = 71,
    py = 95
  },

  {
    key = 'mystery_atlas',
    path = 'mystery.png',
    px = 71,
    py = 95
  },

  {
    key = 'modicon',
    px = 32,
    py = 32,
    path = 'modicon.png'
  },

  {
    key = 'blind_drawn_replacement',
    path = 'unknown_blind.png',
    px = 34,
    py = 34,
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
  }
}


for i = 1, #atlases do
    atlases[i].object_type = "Atlas"
end
return { name = { "Atlases" }, items = atlases }
