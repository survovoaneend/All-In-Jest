local master_of_pegs = {
    object_type = "Joker",
    order = 950,

    key = "master_of_pegs",
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.25
        }
    },
    attributes = {'xmult', 'scaling', 'enhancements'},
    rarity = 2,
    pos = { x = 24, y = 43 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local enhancement_tally_full = 0
        local active_text = "("..localize('k_inactive')..")"
        local enhancement_tally_remaining = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.deck.cards) do
                if card.config.center ~= G.P_CENTERS.c_base then
                    enhancement_tally_remaining = enhancement_tally_remaining + 1
                end
            end
        end
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center ~= G.P_CENTERS.c_base then
                    enhancement_tally_full = enhancement_tally_full + 1
                end
            end
        end
        if enhancement_tally_remaining <= 0 then 
            active_text = "("..localize('k_active')..")"
        else
            active_text = "("..localize('k_inactive')..")"
        end
        
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult + card.ability.extra.xmult_gain * enhancement_tally_full,
                active_text
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local enhancement_tally_full = 0
            local final_xmult = 1
            if G.GAME and G.playing_cards then
                for _, card in ipairs(G.playing_cards) do
                    if card.config.center ~= G.P_CENTERS.c_base then
                        enhancement_tally_full = enhancement_tally_full + 1
                    end
                end
            end
            local enhancement_tally_remaining = 0
            if G.GAME and G.playing_cards then
                for _, card in ipairs(G.deck.cards) do
                    if card.config.center ~= G.P_CENTERS.c_base then
                        enhancement_tally_remaining = enhancement_tally_remaining + 1
                    end
                end
            end
            final_xmult = card.ability.extra.xmult + (card.ability.extra.xmult_gain * enhancement_tally_full)
            if enhancement_tally_remaining <= 0 then
                return {
                    xmult = final_xmult
                }
            end
        end
    end,
    in_pool = function(self, args)
        local enhancement_tally = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center ~= G.P_CENTERS.c_base then
                    enhancement_tally = enhancement_tally + 1
                end
            end
        end
        if enhancement_tally > 0 then
            return true
        else
            return false
        end
    end,
}
return { name = { "Jokers" }, items = { master_of_pegs } }
