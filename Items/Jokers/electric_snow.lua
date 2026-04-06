local electric_snow = {
    object_type = "Joker",
    order = 292,
    key = "electric_snow",
    config = {
    },
    rarity = 2,
    pos = { x = 0, y = 15},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        -- Effect in lovely.toml
    end
  
}
return { name = {"Jokers"}, items = {electric_snow} }
