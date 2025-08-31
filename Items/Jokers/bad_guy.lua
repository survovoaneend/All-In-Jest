local bad_guy = {
    object_type = "Joker",
    order = 368,
    
    key = "bad_guy",
    config = {

    },

    rarity = 2,
    pos = { x = 1, y = 20},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        if not card.edition or (card.edition and not card.edition.key == 'e_foil') then
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil end
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss and #G.hand.cards > 0 then
            local foiled_card = pseudorandom_element(G.hand.cards, "bad_guy")
            foiled_card:set_edition('e_foil')
            return {
                message = localize('k_aij_foiled_again'),
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {bad_guy} }
