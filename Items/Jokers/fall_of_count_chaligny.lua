local fall_of_count_chaligny = {
    object_type = "Joker",
    order = 342,
    key = "fall_of_count_chaligny",
    config = {
    },
    rarity = 1,
    pos = { x = 13, y = 13},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        if MP.UTILS.is_standard_ruleset() and MP.LOBBY.code then
            return {key = "j_aij_mp_fall_of_count_chaligny"}
        end
    end,
  
    calculate = function(self, card, context)
        if context.aij_before_setting_blind and not card.getting_sliced and not context.blueprint then
            if not card.getting_sliced and All_in_Jest.get_current_blind_mult() ~= 1 then
                card:juice_up()
                play_sound('tarot2', 0.76, 0.4)
                All_in_Jest.ease_blind_requirement(1 - All_in_Jest.get_current_blind_mult(), nil, true)
                G.GAME.blind.aij_original_chips = G.GAME.blind.chips
                G.GAME.blind.mult = 1
                G.GAME.blind.aij_original_mult = G.GAME.blind.mult
                return true
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {fall_of_count_chaligny} }
