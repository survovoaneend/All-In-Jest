local hei_tiki = {
    object_type = "Joker",
    order = 60,

    key = "hei_tiki",
    config = {
      extra = {
        mult = 0,
        mult_mod = 2
      }
    },
    rarity = 3,
    pos = { x = 6, y = 2 },
    atlas = 'joker_atlas',
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.jokers then
            if hand_chips > mult then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    message = localize('k_upgrade_ex')
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {hei_tiki} }
