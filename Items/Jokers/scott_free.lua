local scott_free = {
    object_type = "Joker",
    order = 988,

    key = "scott_free",
    config = {
        extra = {
            dollars = 2
        }
    },
    attributes = { "economy" },
    rarity = 2,
    pos = { x = 12, y = 45},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
         if context.individual and context.cardarea == G.hand and context.end_of_round then
            if not next(SMODS.get_enhancements(context.other_card)) then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card
                    }
                else
                    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                    return {
                        dollars = card.ability.extra.dollars,
                        card = card,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.dollar_buffer = 0
                                    return true
                                end
                            }))
                        end
                    }
                end
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
    if enhancement_tally > 4 then
        return true
    else
        return false
    end
  end,
}
return { name = {"Jokers"}, items = {scott_free} }