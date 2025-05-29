local aphantasia = {
    object_type = "Joker",
    order = 268,
    key = "aphantasia",
    ignore = true,
    config = {
      
    },
    rarity = 2,
    pos = { x = 15, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
          local scored_card = context.other_card
          if scored_card.config.center ~= G.P_CENTERS.c_base then
            context.other_card.ability.jest_chaotic_card = true
          end
        end
    end
  
}
return { name = {"Jokers"}, items = {aphantasia} }
