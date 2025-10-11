local jeff_the_joker = {
    object_type = "Joker",
    order = 89,

    key = "jeff_the_joker",
    config = {
        extra = {
            x_mult = 1,
            x_mult_per_destroy = 0.5,
        }
    },
    rarity = 2,
    pos = { x = 9, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        -- Display the current multiplier stored in the card's ability table
        local current_xmult = card.ability.extra.x_mult or 1
        return { vars = { current_xmult, card.ability.extra.x_mult_per_destroy } }
    end,

    calculate = function(self, card, context)
        -- Effect Trigger: Selecting the Small Blind
        if not context.blueprint and context.setting_blind and context.blind.name == "Small Blind" then
            local destroyed_count = 0
            local cards_to_destroy = {}

            for _, v in ipairs(G.jokers.cards) do
                if v ~= card and not SMODS.is_eternal(v, card) and v.config.center_key ~= "j_aij_jeff_the_joker" then
                    table.insert(cards_to_destroy, v)
                    destroyed_count = destroyed_count + 1
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                end
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.joker_buffer = 0
                    card:juice_up(0.8, 0.8)
                    for _, v in ipairs(cards_to_destroy) do
                        v:start_dissolve(nil, true, 1.6)
                    end

                    play_sound('slice1', 0.96+math.random()*0.08)
                    return true
                end
            }))

            if destroyed_count > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "x_mult",
                    scalar_value = "x_mult_per_destroy",
                    operation = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = initial + (destroyed_count * change)
                    end,
                    message_key = 'a_xmult'
                })
                card:juice_up(0.6, 0.6)
                return nil, true
            end
        end

        if context.joker_main then
            if card.ability.extra.x_mult and card.ability.extra.x_mult > 1 then
                return {
                    xmult = card.ability.extra.x_mult,
                }
            end
        end
    end
}
return { name = { "Jokers" }, items = { jeff_the_joker } }
