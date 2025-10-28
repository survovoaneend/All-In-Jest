local bad_apple = {
    object_type = "Joker",
    order = 84,

    key = "bad_apple",
    config = {
        extra = {
        xmult = 1,
        xmult_mod = 0.2,
        -- BUG: not initially randomized
        light_suits = "3",
        dark_suits = "2"
        }
    },
    rarity = 3,
    pos = { x = 4, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_mod,
                card.ability.extra.light_suits,
                card.ability.extra.dark_suits
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            local random_value = pseudorandom("bad_apple", 0, 5)
            card.ability.extra.light_suits = tostring(random_value)
            card.ability.extra.dark_suits = tostring(5 - random_value)
            return {
                message = localize('k_reset'),
                card = card
            }
        end
        if context.before and not context.blueprint then
            local dark_count, light_count = 0, 0
            for _, card in ipairs(context.scoring_hand) do
                if card:is_suit('Spades', false, true) or card:is_suit('Clubs', false, true) or (PB_UTIL and PB_UTIL.is_suit(card, 'dark', false, true)) then
                    dark_count = dark_count + 1
                elseif card:is_suit('Hearts', false, true) or card:is_suit('Diamonds', false, true) or (PB_UTIL and PB_UTIL.is_suit(card, 'light', false, true)) then
                    light_count = light_count + 1
                end
            end
            if dark_count == tonumber(card.ability.extra.dark_suits) and light_count == tonumber(card.ability.extra.light_suits) then
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "xmult",
	                scalar_value = "xmult_mod",
                })
            end
        end
        if context.joker_main then 
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end

}
return { name = { "Jokers" }, items = { bad_apple } }
