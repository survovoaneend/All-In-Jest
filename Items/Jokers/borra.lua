local borra = {
    object_type = "Joker",
    order = 1029,

    key = "borra",
    config = {
      extra = {
          mult = 0,
          mult_mod = 0.25
      }
    },
    attributes = { 'mult', 'scaling', },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 8, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 8, y = 5},
  
    loc_vars = function(self, info_queue, card)
        local triggers = localize('aij_borra_triggers')
        local gain_text = (localize('k_aij_borra_gains', 'extra_joker_dictionary'))..' '
        local when_text = ' '..(localize('k_aij_borra_when', 'extra_joker_dictionary'))
        return {
            main_start = {
				{n=G.UIT.T, config={text = gain_text,colour = G.C.UI.TEXT_DARK, scale = 0.32}},
                {n=G.UIT.T, config={text = '+',colour = G.C.MULT, scale = 0.32}},
                {n=G.UIT.T, config={ref_table = card.ability.extra, ref_value = "mult_mod",colour = G.C.MULT, scale = 0.32}},
                {n=G.UIT.T, config={text = when_text,colour = G.C.UI.TEXT_DARK, scale = 0.32}},
			},
			main_end = {
				{n=G.UIT.O, config={object = DynaText({string = triggers,
				colours = {G.C.FILTER},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
			},
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        local triggers = (context.setting_ability and not context.unchanged) or (context.individual and context.cardarea == G.play) or (context.press_play) or (context.ante_change) or (context.joker_type_destroyed) or (context.card_added) or (context.playing_card_added) or (context.tag_triggered) or (context.tag_added) or (context.skip_blind) or (context.poker_hand_changed) or (context.reroll_shop) or (context.using_consumeable) or (context.selling_card) or (context.buying_card) or (context.ending_booster) or (context.open_booster) or (context.skipping_booster) or (context.ending_shop) or (context.starting_shop) or (context.blind_defeated) or (context.discard) or (context.setting_blind) or (context.destroy_card and context.cardarea == G.play)
        if triggers and not context.blueprint then
            if (context.setting_ability and not context.unchanged) then
                local can_proceed = false
                local enhancements = get_current_pool("Enhanced")
                for k, v in pairs(enhancements) do
                    if (context.old == 'c_base' or context.old == v) then 
                        can_proceed = true
                    end
                end
                if can_proceed then
                    SMODS.scale_card(card, {
                      ref_table = card.ability.extra,
                      ref_value = "mult",
                      scalar_value = "mult_mod",
                      no_message = true,
                    })
                end
                return {
                    message = localize("k_upgrade_ex"),
                    blocking = false,
                    volume = 0.3,
                    message_card = card
                }
            else
                SMODS.scale_card(card, {
                  ref_table = card.ability.extra,
                  ref_value = "mult",
                  scalar_value = "mult_mod",
                  no_message = true,
                })
                return {
                    message = localize("k_upgrade_ex"),
                    blocking = false,
                    volume = 0.3,
                    message_card = card
                }
            end
        end
        if context.joker_main then
            return {
              mult = card.ability.extra.mult
            }
        end
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if not card then
            card = self:create_fake_card()
        end
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            AUT = full_UI_table,
            vars =
                specific_vars or {}
        }
        -- All in Jest
        if target.vars.aij_multi_copier_card then
            card = target.vars.aij_multi_copier_card
            local index = target.vars.aij_multi_copier_card_index
            local new_ability = target.vars.aij_multi_copier_card_ability
                
            if card.added_to_deck then
                All_in_Jest.hotswap_copied_ability(card, index)
            else
                All_in_Jest.set_copied_ability(card, G.P_CENTERS[target.key], nil, new_ability)
            end
            
            new_ability[card.config.center.key .. "_compat_ui"] = new_ability[card.config.center.key .. "_compat_ui"] or ''
            new_ability[card.config.center.key .. "_compat_check"] = nil
            local compatible = G.P_CENTERS[new_ability.key][card.config.center.key .. "_compat"]
            compatible = compatible ~= false
            local main_end = (card.area and card.area == G.jokers) and {
                {n=G.UIT.C, config={align = "tm", minh = 0.4}, nodes={
                    {n=G.UIT.C, config={align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06}, nodes={
                        {n=G.UIT.T, config={text = ' ' .. (compatible and localize('k_compatible') or localize('k_incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
                    }}
                }}
            } or nil
            desc_nodes[#desc_nodes + 1] = main_end
            
            target.vars.aij_multi_copier_card = nil
            target.vars.aij_multi_copier_card_index = nil
            target.vars.aij_multi_copier_card_ability = nil
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    All_in_Jest.set_copied_ability(card, {config = {}})
                    return true
                end
            }))
        end
        if target.vars.aij_copier_card then
            card = target.vars.aij_copier_card
            target.vars.aij_copier_card = nil
        end
        -- End of All in Jest patch
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
            target.set = res.set or target.set
            target.scale = res.scale
            target.text_colour = res.text_colour
            if desc_nodes == full_UI_table.main then
                full_UI_table.box_starts = res.box_starts
                full_UI_table.box_ends = res.box_ends
            end
        end

        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            full_UI_table.name = self.set == 'Enhanced' and 'temp_value' or localize { type = 'name', set = res.name_set or target.set, key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or target.vars or {} }
        elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
            desc_nodes.name = localize{type = 'name_text', key = res.name_key or target.key, set = res.name_set or target.set, vars = res.name_vars or target.vars or {} }
            if (not full_UI_table.from_detailed_tooltip or full_UI_table.info[1] == desc_nodes) 
                and not full_UI_table.no_styled_name then
                desc_nodes.name_styled = {}
    
                localize{type = 'name', key = res.name_key or target.key, set = res.name_set or target.set, nodes = desc_nodes.name_styled, fixed_scale = 0.63, no_pop_in = true, no_shadow = true, y_offset = 0, no_spacing = true, no_bump = true, vars = res.name_vars or target.vars} 
                desc_nodes.name_styled = SMODS.info_queue_desc_from_rows(desc_nodes.name_styled, true)
                desc_nodes.name_styled.config.align = "cm"
            end
        end
        if card.ability and card.ability.from_guess_the_jest then
            target = { type = 'other', key = 'guess_the_jest_hidden', nodes = desc_nodes, AUT = full_UI_table, }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes, AUT = full_UI_table, }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end
        localize(target)
        desc_nodes.background_colour = res.background_colour
    end
}
return { name = {"Jokers"}, items = {borra} }
