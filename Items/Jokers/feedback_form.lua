local feedback_form = {
    object_type = "Joker",
    order = 180,

    key = "feedback_form",
    config = {
      extra = {
          xmult = 1.5
      }
    },
    rarity = 2,
    pos = { x = 23, y = 6},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local unique_enhancements = 0
            
            for k, v in pairs(SMODS.get_enhancements(context.other_card)) do
                if v then
                    local count = 0
                    for i = 1, #context.scoring_hand do
                        if SMODS.get_enhancements(context.scoring_hand[i])[k] then
                            count = count + 1
                        end
                    end
                    if count == 1 then
                        unique_enhancements = unique_enhancements + 1
                    end
                end
            end
            
            if unique_enhancements > 0 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {feedback_form} }