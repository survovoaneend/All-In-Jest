local bumper_sticker = {
    object_type = "Joker",
    order = 118,
    

    key = "bumper_sticker",
    config = {
      extra = {
        mult_mod = 1
      }
    },
    rarity = 1,
    pos = { x = 13, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 44, h = 95 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult_mod
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                card = card
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {bumper_sticker} }
