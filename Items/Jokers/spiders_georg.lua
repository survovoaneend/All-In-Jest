local spiders_georg = {
    object_type = "Joker",
    order = 205,
    ignore = true,

    key = "spiders_georg",
    config = {
      
    },
    rarity = 1,
    pos = { x = 19, y = 7},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {spiders_georg} }
