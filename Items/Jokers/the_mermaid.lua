local the_mermaid = {
    object_type = "Joker",
    order = 298,
    key = "the_mermaid",
    config = {
      
    },
    attributes = { 'discard' },
    rarity = 2,
    pos = { x = 14, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    add_to_deck = function(self, card, from_debuff)
        G.GAME.aij_discard_button = true
        G.GAME.aij_booster_discards = G.GAME.aij_booster_discards or 0
        G.GAME.aij_booster_discards = G.GAME.aij_booster_discards + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.aij_booster_discards = G.GAME.aij_booster_discards or 0
        G.GAME.aij_booster_discards = G.GAME.aij_booster_discards - 1
    end,
}
return { name = {"Jokers"}, items = {the_mermaid} }
