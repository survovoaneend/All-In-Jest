local evil_joker = {
    object_type = "Joker",
    order = 347,
    key = "evil_joker",
    config = {
      extra = {
        x_mult = 3,
      }
    },
    lite = true,
    rarity = 3,
    pos = { x = 18, y = 13},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    all_in_jest = {
        only_shop_pool = true,
        only_booster_pool = true
    },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) then
                    jokers[i] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
                local temp_card = pseudorandom_element(jokers, pseudoseed('aij_evil_joker'))
                SMODS.destroy_cards(temp_card)
            end
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
