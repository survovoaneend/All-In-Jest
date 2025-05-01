local jesters_privelege = {
    object_type = "Joker",
    order = 95,

    key = "jesters_privelege",
    config = {
      
    },
    rarity = 3,
    pos = { x = 15, y = 3 },
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    add_to_deck = function(self, card, from_debuff)
      G.GAME.jest_legendary_pool.in_shop = true
      G.GAME.jest_legendary_pool.rate = 0.99 -- 1%
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.jest_legendary_pool.in_shop = false
    end,
}
return { name = {"Jokers"}, items = {jesters_privelege} }
