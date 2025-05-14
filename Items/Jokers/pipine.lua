local pipine = {
    object_type = "Joker",
    order = 1043,
     ignore = true,
    key = "pipine",
    config = {
      discards = 5
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 2, y = 8},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 2, y = 9},
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.discards}}
    end,
  
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.discards
        ease_discard(card.ability.discards)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.discards
        ease_discard(-card.ability.discards)
    end,
  
}
return { name = {"Jokers"}, items = {pipine} }
