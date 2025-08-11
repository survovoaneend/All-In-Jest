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

    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then
            G.GAME.blind.mult = 1
            G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end
  
}
return { name = {"Jokers"}, items = {fall_of_count_chaligny} }
