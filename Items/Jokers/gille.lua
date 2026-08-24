local gille = {
    object_type = "Joker",
    order = 212,

    key = "gille",
    config = {
      
    },
    attributes = { "tag" },
    rarity = 2,
    pos = { x = 20, y = 7},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    add_to_deck = function(self, card, from_debuff)
        G.GAME.aij_tag_rerolls = G.GAME.aij_tag_rerolls or 0
        local orig_value = G.GAME.aij_tag_rerolls
        G.GAME.aij_tag_rerolls = G.GAME.aij_tag_rerolls + 1
        if orig_value <= 0 and G.GAME.aij_tag_rerolls > 0 and G.STATE == G.STATES.BLIND_SELECT then
            
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = (function()
                    if G.blind_prompt_box then
                        G.blind_prompt_box:remove()
                    end
                    G.blind_prompt_box = UIBox{
                        definition = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR, padding = 0.2}, nodes={
                            {n=G.UIT.R, config={align = "cm"}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = localize('ph_choose_blind_1'), colours = {G.C.WHITE}, shadow = true, bump = true, scale = 0.6, maxw = 5}), id = 'prompt_dynatext1'}}
                            }},
                            {n=G.UIT.R, config={align = "cm"}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = localize('ph_choose_blind_2'), colours = {G.C.WHITE}, shadow = true, bump = true, scale = 0.7, maxw = 5, silent = true}), id = 'prompt_dynatext2'}}
                            }},
                            (G.GAME.jest_free_stultor_rerolls > 0) and
                            UIBox_button({label = {localize('b_reroll_boss'), localize('$')..'0'}, button = "jest_free_reroll_boss", func = 'jest_free_reroll_boss_button'}) or
                            (G.GAME.used_vouchers["v_retcon"] or G.GAME.used_vouchers["v_directors_cut"]) and
                            UIBox_button({label = {localize('b_reroll_boss'), localize('$')..'10'}, button = "reroll_boss", func = 'reroll_boss_button'}) or nil,
                            UIBox_button({label = {localize('b_aij_reroll_tags'), localize('$')..(G.GAME.current_round.reroll_cost or 5)}, button = "aij_reroll_tag", func = 'aij_reroll_tag_button'}),
                        }},
                        config = {align="cm", offset = {x=0,y=0},major = G.HUD:get_UIE_by_ID('row_blind'), bond = 'Weak'}
                    }
                    return true
                end)
            })) 
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.aij_tag_rerolls = G.GAME.aij_tag_rerolls or 0
        G.GAME.aij_tag_rerolls = G.GAME.aij_tag_rerolls - 1
    end,
}
return { name = {"Jokers"}, items = {gille} }
