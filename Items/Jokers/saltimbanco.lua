local saltimbanco = {
    object_type = "Joker",
    order = 108,
    ignore = true,
    key = "saltimbanco",
    config = {
      
    },
    rarity = 1,
    pos = { x = 3, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.probability_trigger and G.play ~= nil then
            if context.probability_trigger.numerator > 0 and context.probability_trigger.denominator > 0 then
                local xmlt = 1 + (1 - (context.probability_trigger.numerator/context.probability_trigger.denominator))
                return {
                    message = localize{type='variable',key='a_xmult',vars={xmlt}},
                    Xmult_mod = xmlt,
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {saltimbanco} }
