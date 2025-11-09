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
    blueprint_compat = false, -- Potental problems
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
            card.ability.extra.sevens = "0"
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 7 then
                    card.ability.extra.sevens = tostring(tonumber(card.ability.extra.sevens) + card.ability.extra.numeratormod)
                end
            end
            if tonumber(card.ability.extra.sevens) > 0 then
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = '+' .. card.ability.extra.sevens .. ' Odds',
                    colour = G.C.GREEN
                })
            end
        end
        if context.mod_probability and context.trigger_obj then
            return {
                numerator = context.numerator + tonumber(card.ability.extra.sevens),
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
