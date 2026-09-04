
G.FUNCS.All_in_Jest_can_use_active_ability_button = function(e)
    local obj = e.config.ref_table.config.center
    local can_use = false
    if obj.all_in_jest and obj.all_in_jest.can_use_ability and type(obj.all_in_jest.can_use_ability) == 'function' and
            G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT then
        can_use = obj.all_in_jest:can_use_ability(e.config.ref_table)
    end
    if e.config.ref_table.debuff then
        can_use = false
    end
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then 
        can_use = false
    end
    if can_use then 
        e.config.colour = G.C.SECONDARY_SET.Enhanced
        e.config.button = 'All_in_Jest_use_active_ability_button'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.All_in_Jest_use_active_ability_button = function(e, mute, nosave)
    stop_use()
    
    local card = e.config.ref_table
    local area = card.area

    e.config.ref_table.config.center.all_in_jest:use_ability(card)
    SMODS.calculate_context({all_in_jest = {using_ability = true, card = card, area = card.from_area}})
end