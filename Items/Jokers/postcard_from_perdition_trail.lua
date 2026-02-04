local postcard_from_perdition_trail = {
    object_type = "Joker",
    order = 203,

    key = "postcard_from_perdition_trail",
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.5
      }
    },
    rarity = 3,
    pos = { x = 17, y = 7},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.before and not context.blueprint then
        local removed_a_seal = false
        local seals_removed = 0
        for i = 1, #context.scoring_hand do
            local cardd = context.scoring_hand[i]
            if cardd.seal then
              cardd:set_seal(nil, true)
              cardd:juice_up()
              seals_removed = seals_removed + 1
              removed_a_seal = true
            end
        end
        if removed_a_seal then
            card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod * seals_removed)
            return {
                message = localize('k_upgrade_ex')
            }
        end
      end
      if context.joker_main then
        return {
           xmult = card.ability.extra.xmult
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {postcard_from_perdition_trail} }
