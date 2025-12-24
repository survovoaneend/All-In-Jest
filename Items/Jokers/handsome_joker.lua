-- Card selection in functions.lua as reset_handsome_joker_card()

local handsome_joker_calc_mult = function(xmult_mod)
    local handsome_card = G.GAME.current_round.jest_handsome_joker_card
    local matching_cards = 0
    if G.playing_cards then
        for _, deck_card in ipairs(G.playing_cards) do
            if deck_card:get_id() == handsome_card.id then
                    if SMODS.has_enhancement(deck_card, handsome_card.enhancement) then
                        matching_cards = matching_cards + 1
                    end
            end
        end
    end
    return (matching_cards < 1 and 1) or (1 + matching_cards * xmult_mod)
end

local handsome_joker = {
    object_type = "Joker",
    order = 7,

    key = "handsome_joker",
    config = {
        extra = {
            xmult_mod = 0.5,
        }
    },
    rarity = 3,
    pos = { x = 5, y = 0 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local handsome_card = G.GAME.current_round.jest_handsome_joker_card
        local card_text = "[enhancement] [card]"
        local xmult = handsome_joker_calc_mult(card.ability.extra.xmult_mod)
        if G.playing_cards then 
            if handsome_card and handsome_card.rank and handsome_card.enhancement then
                local enhancement_name = localize { type = 'name_text', set = 'Enhanced', key = handsome_card.enhancement }
                enhancement_name = enhancement_name:gsub(" [Cc]ard$", "")
                card_text = enhancement_name ..
                    " " .. localize(handsome_card.rank, 'ranks')
                
            end
        end

        return {
            vars = {
                card.ability.extra.xmult_mod,
                card_text or "[enhancement] [rank]",
                xmult,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local xmult = handsome_joker_calc_mult(card.ability.extra.xmult_mod)
            return {
                xmult = xmult,
            }
        end
    end

}
return { name = { "Jokers" }, items = { handsome_joker } }
