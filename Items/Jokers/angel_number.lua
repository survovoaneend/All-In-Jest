local angel_number = {
    object_type = "Joker",
    order = 283,
    key = "angel_number",
    config = {
      extra = {
          numeratormod = 1,
          sevens = "0"
      }
    },
    rarity = 2,
    pos = { x = 6, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false, -- Potential problems
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.numeratormod,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.before and context.scoring_hand and not context.blueprint then
            local sevens = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 7 then
                    sevens = sevens + 1
                end
            end
            if tonumber(sevens) > 0 then
                card.ability.extra.sevens = tostring(sevens)
                return {
                    message = localize{type = "variable", key = "a_aij_odds", vars = {sevens * card.ability.extra.numeratormod}},
                    colour = G.C.GREEN
                }
            end
        end
        if context.mod_probability and context.trigger_obj then
            return {
                numerator = context.numerator + tonumber(card.ability.extra.sevens) * card.ability.extra.numeratormod,
                denominator = context.denominator
            }
        end
        if context.all_in_jest and context.all_in_jest.drew_cards or context.end_of_round then
            G.E_MANAGER:add_event(Event({
                func = function() 
				            card.ability.extra.sevens = "0"
                    return true 
                end 
            }))
        end
    end
  
}
return { name = {"Jokers"}, items = {angel_number} }
