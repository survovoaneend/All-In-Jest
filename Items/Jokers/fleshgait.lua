local fleshgait = {
    object_type = "Joker",
    order = 364,
    key = "fleshgait",
    config = {
    },
    rarity = 2,
    pos = { x = 13, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if not card.ability.patches then
                All_in_Jest.add_patch(context.other_card, nil, nil, 'fleshgait')
            end
        end
    end,

    in_pool = function(self, args)
        if G.GAME then
            if (G.GAME.selected_back and G.GAME.selected_back.name == 'b_aij_patchwork') or (G.GAME.selected_sleeve and G.GAME.selected_sleeve == 'sleeve_aij_patchwork') then
                return false 
            end
        end
        return true
    end,
}
return { name = {"Jokers"}, items = {fleshgait} }
