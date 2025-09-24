local feedback_form = {
    object_type = "Joker",
    order = 180,

    key = "feedback_form",
    config = {
      extra = {
          mult = 7
      }
    },
    rarity = 1,
    pos = { x = 23, y = 6},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local temp_val = true
            local enhancements = {}
            for i = 1, #context.scoring_hand do
                local has_enhancement = false
                for k, v in pairs(SMODS.get_enhancements(context.scoring_hand[i])) do
                    if enhancements[k] then
                        temp_val = false
                    else
                        enhancements[k] = v
                        has_enhancement = true
                    end
                end
                if not has_enhancement then
                    temp_val = false
                end
            end
            if temp_val then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {feedback_form} }