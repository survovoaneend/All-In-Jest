local one_little_duck = {
    object_type = "Joker",
    order = 266,
    
    key = "one_little_duck",
    config = {
      extra = {
        mult = 0,
        mult_gain = 2
      }
    },
    rarity = 1,
    pos = { x = 13, y = 10},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_gain
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local twos_unscored = 0
            for _, played_card in ipairs(context.full_hand) do
                local is_scoring = false
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if played_card == scoring_card then is_scoring = true end
                end
                
                if not is_scoring and played_card:get_id() == 2 then
                    twos_unscored = twos_unscored + 1
                end
            end
            
            if twos_unscored > 0 then
                card.ability.extra.mult = card.ability.extra.mult + (twos_unscored * card.ability.extra.mult_gain)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {one_little_duck} }
