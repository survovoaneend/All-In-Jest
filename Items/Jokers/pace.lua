local pace = {
    object_type = "Joker",
    order = 1023,

    key = "pace",
    config = {
      extra = {
          price = 4
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 2, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 2, y = 5},
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.price}}
    end,
}
return { name = {"Jokers"}, items = {pace} }
