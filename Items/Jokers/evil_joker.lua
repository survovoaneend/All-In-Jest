local evil_joker = {
    object_type = "Joker",
    order = 347,
    key = "evil_joker",
    config = {
      extra = {
        x_mult = 3,
      }
    },
    rarity = 3,
    pos = { x = 18, y = 13},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        local jokers = {}
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) then
                jokers[i] = G.jokers.cards[i]
            end
        end
        if #jokers > 0 then
            local temp_card = pseudorandom_element(jokers, pseudoseed('bad_sun'))
            G.E_MANAGER:add_event(Event({
                func = function()
                    temp_card:start_dissolve()
                    return true
                end
            }))
        end
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.x_mult
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {evil_joker} }
