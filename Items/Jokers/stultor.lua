local stultor = {
    object_type = "Joker",
    order = 181,

    key = "stultor",
    config = {
      extra = {
          free_rerolls = 1
      }
    },
    rarity = 2,
    pos = { x = 24, y = 6},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.free_rerolls,
            }
        }
    end,
  
    calculate = function(self, card, context)
      
    end,
    add_to_deck = function(self, card, from_debuff)
        local orig_value = G.GAME.jest_free_stultor_rerolls
        G.GAME.jest_free_stultor_rerolls = G.GAME.jest_free_stultor_rerolls + card.ability.extra.free_rerolls
        if orig_value <= 0 and G.GAME.jest_free_stultor_rerolls > 0 and G.STATE == G.STATES.BLIND_SELECT then
            
            -- This quickly removed the original blind_prompt area (where the reroll button goes)
            -- And replaces it with a new one
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
                            UIBox_button({label = {localize('b_reroll_boss'), localize('$')..'0'}, button = "jest_free_reroll_boss", func = 'jest_free_reroll_boss_button'})
                        }},
                        config = {align="cm", offset = {x=0,y=0},major = G.HUD:get_UIE_by_ID('row_blind'), bond = 'Weak'}
                    }
                    return true
                end)
            }))
                
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.jest_free_stultor_rerolls = G.GAME.jest_free_stultor_rerolls - card.ability.extra.free_rerolls
    end,
}
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        G.GAME.jest_free_stultor_rerolls = 0
        local sultors = SMODS.find_card("j_aij_stultor")
        for i = 1, #sultors do
            G.GAME.jest_free_stultor_rerolls = G.GAME.jest_free_stultor_rerolls + sultors[i].ability.extra.free_rerolls
        end
    end
    
    local ref = ease_anteref(mod)
    return ref
end
return { name = {"Jokers"}, items = {stultor} }
