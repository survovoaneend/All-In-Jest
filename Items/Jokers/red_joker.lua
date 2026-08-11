local red_joker = {
    object_type = "Joker",
    order = 457,
    key = "red_joker",
    config = {
        extra = {
            mult = 0,
            mult_mod = 1,
        }
    },
    attributes = { 'mult', 'scaling', 'reset' },
    rarity = 1,
    pos = { x = 8, y = 22 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult, 
                card.ability.extra.mult_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            context.other_card.ability.red_joker_indicator = context.other_card.ability.red_joker_indicator or {}
            if not context.other_card.ability.red_joker_indicator[card.sort_id] then
                context.other_card.ability.red_joker_indicator[card.sort_id] = true
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "mult",
	                scalar_value = "mult_mod",
                })
            else
                for _, v in ipairs(G.playing_cards) do
                    if context.other_card.ability.red_joker_indicator[card.sort_id] then
                        context.other_card.ability.red_joker_indicator[card.sort_id] = nil
                    end
                end
                card.ability.extra.mult = 0
                return {
                    message = localize('k_reset'),
                    card = card
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end
}
return { name = { "Jokers" }, items = { red_joker } }
