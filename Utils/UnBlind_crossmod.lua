aij_UnBlind_current_blinds_ref = G.UIDEF.UnBlind_current_blinds
function G.UIDEF.UnBlind_current_blinds() -- called by the replaced bit of code.	see lovely.toml			♥
    local ret = aij_UnBlind_current_blinds_ref()
    local has_blind_drawn = next(SMODS.find_card("j_aij_blind_drawn"))
    if has_blind_drawn and (ret.nodes and ret.nodes[1] and ret.nodes[1].nodes and ret.nodes[1].nodes[3]) then
        ret.nodes[1].nodes[3] = G.GAME.round_resets.blind_states['Boss'] ~= 'Hide' and UnBlind_create_UIBox_blind('aij_Hidden') or nil
    end
    return ret
end

aij_UnBlind_create_UIBox_blind_ref = UnBlind_create_UIBox_blind
function UnBlind_create_UIBox_blind(type) -- Main definition for the whole of the shop_sign replacement
    if type == "aij_Hidden" then
        local hidden_blind_animation = AnimatedSprite(0,0, 0.75, 0.75, G.ANIMATION_ATLAS["aij_blind_drawn_replacement"] or G.ANIMATION_ATLAS['blind_chips'],  { x = 0, y = 0 })
	      hidden_blind_animation:define_draw_steps({   {shader = 'dissolve', shadow_height = 0.05},  {shader = 'dissolve'}  })
        hidden_blind_animation.float = true
        hidden_blind_animation.states.hover.can = true
        hidden_blind_animation.states.drag.can = false
        hidden_blind_animation.states.collide.can = true
        hidden_blind_animation.config = {force_focus = true}
        local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)

        local t =				--mix_colours(G.C.BLACK, G.C.L_BLACK, 0.5)		--G.C.DYN_UI.MAIN (red)		--G.C.DYN_UI.DARK (very similar to boss_main)		--black is too close to boss_main			--l_dark is too light
        {n=G.UIT.R, config={align = "cm", colour = G.C.DYN_UI.BOSS_DARK, r = 0.1, outline = 1, outline_colour = G.C.DYN_UI.BOSS_MAIN}, nodes={
          {n=G.UIT.R, config={align = "cm", padding = 0.09}, nodes={
            {n=G.UIT.C, config={id = 'blind_extras', align = "cl"}, nodes={
              {n=G.UIT.R, config={id = 'tag_container', align = "cm"}, nodes={
                {n=G.UIT.R, config={id = 'empty_tag_replacement', align = "cm", r = 0.1, padding = 0.05, can_collide = true}, nodes={
                  {n=G.UIT.B, config={id = 'tag_desc', align = "cm", w = 0.75, h = 0.1}, nodes={ }},
                }}
              }},
            }},
            --blind tag and desc container
            {n=G.UIT.C, config={align = "cl", padding = 0}, nodes={
              {n=G.UIT.C, config={id = 'blind_desc', align = "cm", padding = 0.05 }, nodes={
                --blind tag pos + boss desc
                --BLIND CHIP animation here btw ♥
                {n=G.UIT.O, config={object = hidden_blind_animation, focus_with_object = true}},
              }},
            }},
            --select blind container
            {n=G.UIT.C, config={align = "cl", padding = 0.05 }, nodes={
              --select blind "button" (defeated or upcoming)
              {n=G.UIT.C, config={
                id = 'select_blind_button',
                align = "cm",
                ref_table = {},
                colour = G.C.UI.TEXT_INACTIVE,
                minh = 0.75,
                minw = 0.3,
                padding = 0.0,
                r = 3,
                emboss = 0.08,
              },
              nodes={
                --min score
                {n=G.UIT.R, config={align = "cm", minw = 2.5}, nodes={
                  --"reward: ???
                  {n=G.UIT.C, config={align = "cm"}, nodes={
                    {n=G.UIT.T, config={text = "???", scale = 0.32, colour = G.C.WHITE, shadow = true}}
                  }},
                  {n=G.UIT.B, config={ w=0.1, h=0.1 }},
                  --"? ???"
                  {n=G.UIT.C, config={align = "cm", minh = 0.4}, nodes={
                    {n=G.UIT.O, config={w=0.3,h=0.3, colour = G.C.BLUE, object = stake_sprite, hover = true, can_collide = false}},
                    {n=G.UIT.B, config={h=0.1,w=0.05}},
                    {n=G.UIT.T, config={text = "???", scale = 0.47 * 0.45, colour = G.C.WHITE, shadow = true}}
                  }},
                }},
              }}
            }},
          }}
        }}
        return t
    else
        return aij_UnBlind_create_UIBox_blind_ref(type)
    end
end

aij_UnBlind_create_UIBox_blind_popup_ref = UnBlind_create_UIBox_blind_popup
function UnBlind_create_UIBox_blind_popup(blind, vars, blind_col) --definition for the blind tooltip popup.	--called in main
    if blind.key == "bl_aij_the_clay" then
        vars = "???"
    end
    return aij_UnBlind_create_UIBox_blind_popup_ref(blind, vars, blind_col)
end

aij_UnBlind_create_UIBox_blind_tag_ref = UnBlind_create_UIBox_blind_tag
function UnBlind_create_UIBox_blind_tag(blind_choice) --Renders the tag that's availavle if the blind is skipped_rank	--called in main
    if G.GAME.all_in_jest.blind_tags.has_multiple and G.GAME.all_in_jest.blind_tags.amt > 1 then
        G.GAME.all_in_jest.blind_tags = G.GAME.all_in_jest.blind_tags or {}
        if not G.GAME.all_in_jest.blind_tags[blind_choice] then return nil end
        local jest_tag_nodes = {}
        for i = 1, G.GAME.all_in_jest.blind_tags.amt do
            local _tag = Tag(G.GAME.all_in_jest.blind_tags[blind_choice][i], nil, blind_choice)
            local _tag_ui, _tag_sprite = _tag:generate_UI()
            -- _tag_sprite.T.scale = 0.5
            _tag_ui.nodes[1].config.w = _tag_ui.nodes[1].config.w / G.GAME.all_in_jest.blind_tags.amt
            _tag_ui.nodes[1].config.h = _tag_ui.nodes[1].config.h / G.GAME.all_in_jest.blind_tags.amt
            _tag_sprite.states.collide.can = true
            jest_tag_nodes[#jest_tag_nodes + 1] = _tag_ui
        end
        return 
        {n=G.UIT.R, config={id = 'tag_container', ref_table = _tag, align = "cm"}, nodes={
          {n=G.UIT.R, config={id = 'tag_'..blind_choice, align = "cm", r = 0.1, padding = 0.05, can_collide = true, ref_table = _tag_sprite}, nodes={
            {n=G.UIT.C, config={id = 'tag_desc', align = "cm", minh = 0.8}, nodes=jest_tag_nodes },
          }}
        }}
    else
        return aij_UnBlind_create_UIBox_blind_tag_ref(blind_choice)
    end
end