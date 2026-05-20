local ghosthunter = {
    object_type = "Joker",
    order = 532,
    key = "ghosthunter",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 17, y = 25 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local text_1 = ''
        local text_2 = ''
        if (G.GAME.selected_back and G.GAME.selected_back.name == 'Ghost Deck') or (next(SMODS.find_card("j_aij_ghosthunter")) and SMODS.find_card("j_aij_ghosthunter")[1] ~= card) then
            text_1 = localize('k_aij_ghosthunter_ghost_1', 'extra_joker_dictionary')
            text_2 = localize('k_aij_ghosthunter_ghost_2', 'extra_joker_dictionary').." "..localize('k_aij_ghosthunter_ghostless_2', 'extra_joker_dictionary')
        else
            text_1 = localize('k_aij_ghosthunter_ghostless_1', 'extra_joker_dictionary')
            text_2 = localize('k_aij_ghosthunter_ghostless_2', 'extra_joker_dictionary')
        end
        return {
            vars = {
                text_1,
                text_2
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.spectral_rate = G.GAME.spectral_rate + 2
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.spectral_rate = G.GAME.spectral_rate - 2
    end,
}

return { name = { "Jokers" }, items = { ghosthunter } }
