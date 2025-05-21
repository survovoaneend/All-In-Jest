local jerko = {
    object_type = "Joker",
    order = 196,
    ignore = true,
    key = "jerko",
    config = {
      extra = {
        mult = 4,
        min = 10,
        max = 30
      }
    },
    rarity = 1,
    pos = { x = 10, y = 7},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
    -- for some reason steamodded really doesn't want jokers to retrigger themselves
    calculate = function(self, card, context)
      if context.retrigger_joker_check or context.retrigger_joker then
        local retriggers = pseudorandom('jerko', card.ability.extra.min, card.ability.extra.max)
        local ind = 1
        for i,v in ipairs(G.jokers.cards) do
          if v == card  then
            ind = i
          end
        end
        local joker = G.jokers.cards[ind]
        if context.other_card == joker then
            return {
            repetitions = retriggers,
            card = card,
            message = localize('k_again_ex')
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
return { name = {"Jokers"}, items = {jerko} }
