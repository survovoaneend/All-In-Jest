local silly_billy = {
    object_type = "Joker",
    order = 210,

    key = "silly_billy",
    config = {
      extra = {
        mult = 3 
      }
    },
    rarity = 1,
    pos = { x = 24, y = 7},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
            local count = 0
            for _, playing_card in ipairs(context.full_hand) do
                if playing_card.edition then count = count + 1 end
                if playing_card.seal then count = count + 1 end
                if next(SMODS.get_enhancements(playing_card)) then count = count + 1 end
            end
            if count > 0 then
                return {
                    mult = count * card.ability.extra.mult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {silly_billy} }
