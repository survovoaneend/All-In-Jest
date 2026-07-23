local gematria = {
    object_type = "Joker",
    order = 299,
    key = "gematria",
    config = {
      extra = {
          mult_mod = 10,
          mult = 0,
          should_trigger = false
      }
    },
    rarity = 1,
    pos = { x = 21, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.before and context.scoring_name then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    local text = retrieve_joker_text(G.jokers.cards[i])
                    if (text:find(context.scoring_name) or text:find(localize(context.scoring_name, 'poker_hands'))) then
                        card.ability.extra.should_trigger = true
                        card.ability.extra.mult = card.ability.extra.mult_mod
                    end
                end
            end
        end
        if context.joker_main and card.ability.extra.should_trigger then
            local mult_val = card.ability.extra.mult
            card.ability.extra.mult = 0
            return {
                mult = mult_val
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {gematria} }
