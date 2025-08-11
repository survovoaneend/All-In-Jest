local the_grim_joker = {
    object_type = "Joker",
    order = 321,
    key = "the_grim_joker",
    config = {
      extra = {
          odds = 2,
      }
    },
    rarity = 2,
    pos = { x = 17, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    pixel_size = { w = 63, h = 95 },
  
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {the_grim_joker} }
