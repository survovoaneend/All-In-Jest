local silent_sam = {
    object_type = "Joker",
    order = 151,

    key = "silent_sam",
    config = {
      extra = {
        xmult = 1.2
      }
    },
    rarity = 2,
    pos = { x = 20, y = 5 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.hand and not context.end_of_round then
        if context.other_card.debuff then 
            return {
                message = localize('k_debuffed'),
                colour = G.C.RED,
                card = card,
            }
        else
        return {
            Xmult = card.ability.extra.xmult,
            card = card
        }
    end
      end
    end
  
}
return { name = {"Jokers"}, items = {silent_sam} }
