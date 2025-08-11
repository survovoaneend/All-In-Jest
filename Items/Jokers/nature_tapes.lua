local nature_tapes = {
    object_type = "Joker",
    order = 71,

    key = "nature_tapes",
    config = {
      extra = {
          cur_mult = 0,
          mult_mod = 5
      }
    },
    rarity = 3,
    pos = { x = 17, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.cur_mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.config.mult then
                card.ability.extra.cur_mult = card.ability.extra.cur_mult + card.ability.extra.mult_mod
                return {
                    message = localize('k_upgrade_ex')
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.cur_mult > 0 then
                return {
                    mult = card.ability.extra.cur_mult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {nature_tapes} }
