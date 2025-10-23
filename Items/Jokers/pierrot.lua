local pierrot = {
    object_type = "Joker",
    order = 11,

    key = "pierrot",
    config = {
      
    },
    rarity = 1,
    pos = { x = 10, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() <= 10 then
            if context.other_card.debuff then
                 return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    chips = context.other_card:get_chip_bonus()
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {pierrot} }
