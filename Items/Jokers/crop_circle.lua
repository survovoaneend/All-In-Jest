local crop_circle = {
    object_type = "Joker",
    order = 403,
    key = "crop_circle",
    config = {
        extra = {
            cards = 1
        }
    },
    rarity = 2,
    pos = { x = 20, y = 14 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards
            }
        }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable then
            if context.consumeable.ability.set == 'Planet' then
                for i = 1, card.ability.extra.cards do
                    local enhance = SMODS.poll_enhancement({guaranteed = true, key = 'crop_circle'..i})
                    if G.hand and #G.hand.cards > 0 then
                        local ran_card = pseudorandom_element(G.hand.cards, pseudoseed('crop_circle'..i))
                        play_sound('card1', 0.9 + i*0.05, 0.5) 
                        ran_card:juice_up(0.2, 0.1)
                        ran_card:set_ability(G.P_CENTERS[enhance])
                        local juice_card = context.blueprint_card or card
                        juice_card:juice_up(0.5, 0.2)
                    end
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { crop_circle } }
