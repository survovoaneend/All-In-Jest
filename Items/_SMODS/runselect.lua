SMODS.RunSelect.Internals.aij_poly_chips = {}
local polychrome_stake = {
    object_type = "RunSelectPage",
    key = "polychrome_settings",
    quick_start_text = function(self, choice)
        local points = 0
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            if choice[v] and choice[v] > 0 then
                points = points + All_in_Jest.PolyStakeChips[v].points[choice[v]]
            end
        end
        return localize({ type = "variable", key = "a_aij_points", vars = { points } })
    end,
    optional = function(self)
        return SMODS.RunSelect.Setup.choices.stake_choice == "stake_aij_polychrome"
    end,
    generate_pool = function(self)
        local pool = {}
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            pool[#pool+1] = All_in_Jest.PolyStakeChips[v]
        end
        return pool
    end,
    set_default = function(self, choice)
        local default = {}
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            default[v] = choice and choice[v] or 0
        end
        return default
    end,
    aij_create_poly_chips = function(self)
        for i = 1, 8 do
            local chip = self.pool[(SMODS.RunSelect.Internals.aij_poly_page - 1)*8 + i]
            if not chip then break end
            local box_x = 2.3 + ((i-1)%4)*G.CARD_W*1.066
            local box_y = -1.93 + math.floor((i-1)/4)*G.CARD_H*1.05
            local chip_ui = UIBox({
                definition = self:aij_create_chip(chip, i),
                config = {
                    instance_type = "ALERT",
                    align = 'cl',
                    offset = {x=box_x,y=box_y},
                    major = G.OVERLAY_MENU:get_UIE_by_ID('run_select'),
                },
            })
            SMODS.RunSelect.Internals.aij_poly_chips[i] = {n=G.UIT.O, config={object = chip_ui}}
        end
    end,
    aij_create_chip = function(self, chip, i)
        local unlocked = chip:check_for_unlock()
        local stack = 0
        if unlocked and SMODS.RunSelect.Setup.choices[self.key] and SMODS.RunSelect.Setup.choices[self.key][chip.key] then
            stack = SMODS.RunSelect.Setup.choices[self.key][chip.key]
        end

        local chip_card = Card(0, 0, G.CARD_W/2 - 0.1, 1, nil, G.P_CENTERS.j_joker, {aij_poly_chip = chip.key})
        chip_card.no_shadow = true
        chip_card.facing = 'back'
        chip_card.sprite_facing = 'back'
        chip_card.config.center = All_in_Jest.PolyStakeChips[chip.key]
        chip_card.states.drag.can = false
        chip_card.children.back:remove()
        if unlocked then
            chip_card.children.back = SMODS.create_sprite(0, 0, 1, 1, chip.atlas, chip.pos, chip_card.config.center.sprite_args)
        else
            chip_card.children.back = SMODS.create_sprite(0, 0, 1, 1, 'locked_stake', {x=0, y=0}, chip_card.config.center.sprite_args)
        end

        chip_card.children.back.states.hover = chip_card.states.hover
        chip_card.children.back.states.click = chip_card.states.click
        chip_card.children.back.states.drag = chip_card.states.drag
        chip_card.children.back.states.collide.can = false
        chip_card.children.back:set_role({major = chip_card, role_type = 'Glued', draw_major = chip_card})

        return {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
            {n=G.UIT.C,
                config = {
                    align = "tm",
                    minw = G.CARD_W,
                    minh = G.CARD_H,
                    colour = G.C.BLACK, outline = 1.5, outline_colour = G.C.UI.TEXT_DARK, padding = 0.1, r = 0.05
                },
                nodes = {
                    {n=G.UIT.R, config={align = "bm", minh = 0.5, maxw = G.CARD_W - 0.2}, nodes = {
                        {n=G.UIT.T, config={text = unlocked and localize({ type = "name_text", set = "PolyStakeChips", key = chip.key }) or "???", colour = G.C.WHITE, scale = 0.5}},
                    }},
                    {n=G.UIT.R, config={align = "cm", minh = G.CARD_H - 1.6, maxw = G.CARD_W - 0.2}, nodes = {
                        {n=G.UIT.C, config={align = "cm", minw = G.CARD_W/2 - 0.1}, nodes = {
                            {n=G.UIT.O, config={id = "modifier_chip", object = chip_card}}
                        }},
                        {n=G.UIT.C, config={align = "cm", minw = G.CARD_W/2 - 0.1, maxw = G.CARD_W/2 - 0.1}, nodes = {
                            {n=G.UIT.R, config={align = "cm", minh = 0.5}, nodes = {
                                {n=G.UIT.T, config={text = localize('k_aij_points'), colour = G.C.UI.TEXT_DARK, scale = 0.5}},
                            }},
                            {n=G.UIT.R, config={align = "cm", minh = 0.5}, nodes = {
                                {n=G.UIT.O, config={id = "points_text", object = All_in_Jest.create_mod_points_text(chip.key, stack)}}
                            }}
                        }},
                    }},
                    All_in_Jest.create_poly_chip_cycle({
                        chip_key = chip.key,
                        max_value = chip.stack,
                        current_value = stack,
                        disabled = not unlocked
                    }),
                }
            },
        }}
    end,
    definition = function(self)
        local points = 0
        local choice = SMODS.RunSelect.Setup.choices[self.key]
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            if choice[v] and choice[v] > 0 then
                points = points + All_in_Jest.PolyStakeChips[v].points[choice[v]]
            end
        end

        SMODS.RunSelect.Internals.aij_poly_page = 1
        self:aij_create_poly_chips()
        -- main
        local chips_def = {n=G.UIT.C, config={align = "cm", minh = 0.45+G.CARD_H*2, minw = 0.7+G.CARD_W*4, colour = G.C.BLACK, padding = 0.15, r = 0.1, emboss = 0.05}, nodes={
            {n = G.UIT.R, config = { align = "tm" }, nodes = {}}
        }}

        -- stake tower
        SMODS.RunSelect.Functions.build_stake_tower()
        local tower_def = {n=G.UIT.C, config={align = "bm", minh = 0.45+G.CARD_H*2, minw = 1.5, maxw = 1.5, colour = G.C.BLACK, padding = 0.05, r = 0.1, emboss = 0.05}, nodes={
            {n=G.UIT.R, config={align = "bm"}, nodes={
                {n = G.UIT.O, config = {object = SMODS.RunSelect.Internals.stake_tower}}
            }},
            {n=G.UIT.R, config={minh=0.2}}
        }}
        All_in_Jest.populate_poly_tower(true)

        -- stats
        local deck_name = localize({set = 'Back', key = SMODS.RunSelect.Setup.choices.deck_choice, type = 'name_text'})
        local pb = G.PROFILES[G.SETTINGS.profile].aij_poly_points or {points = 0, ante = "N/A"}
        local deck_pb = G.PROFILES[G.SETTINGS.profile].deck_usage[SMODS.RunSelect.Setup.choices.deck_choice] and G.PROFILES[G.SETTINGS.profile].deck_usage[SMODS.RunSelect.Setup.choices.deck_choice].aij_poly_points or {points = 0, ante = "N/A"}
        local stats_def = {n=G.UIT.C, config={align = "tm", minh = 0.45+G.CARD_H*2, minw = 3, maxw = 3, colour = G.C.BLACK, padding = 0.15, r = 0.1, emboss = 0.05}, nodes={
            {n = G.UIT.R, config = {align = "cm", minw = G.CARD_H, maxw = G.CARD_H, minh = 1.34, colour = G.C.BLACK, outline = 1.5, outline_colour = G.C.UI.TEXT_DARK, padding = 0.1, r = 0.05}, nodes = {
                {n=G.UIT.C, config = {align = "cm"}, nodes = {
                    {n=G.UIT.R, config = {align = "cm"}, nodes = {
                        {n=G.UIT.T, config = {text = localize('k_aij_total_points'), scale = 0.4, colour = G.C.GREY}},
                    }},
                    {n=G.UIT.R, config = {align = "cm", minh = 0.05}, nodes = {}},
                    {n=G.UIT.R, config = {align = "cm"}, nodes = {
                        {n=G.UIT.O, config={id = "aij_total_points", object = All_in_Jest.create_total_points_text()}},
                        {n=G.UIT.O, config={id = "aij_total_points_suffix", object = DynaText({string = {" "..localize('k_aij_points')}, colours = {(points > 0) and G.C.UI.TEXT_LIGHT or G.C.GREY}, shadow = true, scale = 0.5})}},
                    }},
                    {n=G.UIT.R, config = {align = "cm", minh = 0.05}, nodes = {}},
                }},
            }},
            {n = G.UIT.R, config = {align = "tm", minw = G.CARD_H, maxw = G.CARD_H, minh = 2, colour = G.C.BLACK, outline = 1.5, outline_colour = G.C.UI.TEXT_DARK, padding = 0.1, r = 0.05}, nodes = {
                {n=G.UIT.C, config = {align = "cm"}, nodes = {
                    {n=G.UIT.R, config = {align = "cm", minh = 0.4}, nodes = {
                        {n=G.UIT.T, config = {text = deck_name, scale = 0.7/math.max(1.75, string.len(deck_name)/8), colour = G.C.GREY}},
                    }},
                    {n=G.UIT.R, config = {align = "cm", minh = 0.5}, nodes = {
                        {n=G.UIT.T, config = {text = localize('k_aij_pb'), scale = 0.5, colour = G.C.UI.TEXT_LIGHT}}
                    }},
                    {n=G.UIT.R, config = {align = "cm", minh = 0.05}, nodes = {}},
                    {n=G.UIT.R, config = {align = "bm"}, nodes = {
                        {n=G.UIT.C, config = {align = "bm"}, nodes = {
                            {n=G.UIT.R, config = {align = "cl"}, nodes = {
                                {n=G.UIT.T, config = {text = localize('k_aij_points'), scale = 0.4, colour = G.C.GREY}},
                            }},
                            {n=G.UIT.R, config = {align = "cm"}, nodes = {
                                {n=G.UIT.O, config={object = DynaText({
                                    string = {tostring(deck_pb.points)},
                                    colours = {(deck_pb.points > 0) and G.C.FILTER or G.C.GREY},
                                    shadow = true, bump = (deck_pb.points > 0), scale = 0.5,
                                })}},
                            }},
                        }},
                        {n=G.UIT.C, config = {align = "bm", minw = 0.5}, nodes = {}},
                        {n=G.UIT.C, config = {align = "bm"}, nodes = {
                            {n=G.UIT.R, config = {align = "cr"}, nodes = {
                                {n=G.UIT.T, config = {text = localize('k_ante'), scale = 0.4, colour = G.C.GREY}},
                            }},
                            {n=G.UIT.R, config = {align = "cm"}, nodes = {
                                {n=G.UIT.O, config={object = DynaText({
                                    string = {tostring(deck_pb.ante)},
                                    colours = {(deck_pb.points > 0) and G.C.FILTER or G.C.GREY},
                                    shadow = true, bump = (deck_pb.points > 0), scale = 0.5,
                                })}},
                            }},
                        }},
                    }},
                }},
            }},
            {n = G.UIT.R, config = {align = "tm", minw = G.CARD_H, maxw = G.CARD_H, minh = 2, colour = G.C.BLACK, outline = 1.5, outline_colour = G.C.UI.TEXT_DARK, padding = 0.1, r = 0.05}, nodes = {
                {n=G.UIT.C, config = {align = "cm"}, nodes = {
                    {n=G.UIT.R, config = {align = "cm", minh = 0.4}, nodes = {
                        {n=G.UIT.T, config = {text = localize('k_aij_all_time'), scale = 0.4, colour = G.C.GREY}},
                    }},
                    {n=G.UIT.R, config = {align = "cm", minh = 0.5}, nodes = {
                        {n=G.UIT.T, config = {text = localize('k_aij_pb'), scale = 0.5, colour = G.C.UI.TEXT_LIGHT}}
                    }},
                    {n=G.UIT.R, config = {align = "cm", minh = 0.05}, nodes = {}},
                    {n=G.UIT.R, config = {align = "bm"}, nodes = {
                        {n=G.UIT.C, config = {align = "bm"}, nodes = {
                            {n=G.UIT.R, config = {align = "cl"}, nodes = {
                                {n=G.UIT.T, config = {text = localize('k_aij_points'), scale = 0.4, colour = G.C.GREY}},
                            }},
                            {n=G.UIT.R, config = {align = "cm"}, nodes = {
                                {n=G.UIT.O, config={object = DynaText({
                                    string = {tostring(pb.points)},
                                    colours = {(pb.points > 0) and G.C.FILTER or G.C.GREY},
                                    shadow = true, bump = (pb.points > 0), scale = 0.5,
                                })}},
                            }},
                        }},
                        {n=G.UIT.C, config = {align = "bm", minw = 0.5}, nodes = {}},
                        {n=G.UIT.C, config = {align = "bm"}, nodes = {
                            {n=G.UIT.R, config = {align = "cr"}, nodes = {
                                {n=G.UIT.T, config = {text = localize('k_ante'), scale = 0.4, colour = G.C.GREY}},
                            }},
                            {n=G.UIT.R, config = {align = "cm"}, nodes = {
                                {n=G.UIT.O, config={object = DynaText({
                                    string = {tostring(pb.ante)},
                                    colours = {(pb.points > 0) and G.C.FILTER or G.C.GREY},
                                    shadow = true, bump = (pb.points > 0), scale = 0.5,
                                })}},
                            }},
                        }},
                    }},
                }},
            }},
        }}

        -- pages
        local switch_func = function(args)
            SMODS.RunSelect.Functions.clean_up(true)
            SMODS.RunSelect.Internals.aij_poly_page = args.to
            self:aij_create_poly_chips()
        end
        local total_pages = math.ceil(#All_in_Jest.PolyStakeChip.obj_buffer / 8)
        local cycle_args = {total_pages = total_pages, page_label = {page = 1, text = localize('k_page')..' 1/'..total_pages}}
        local buttons_def = {n=G.UIT.C, config={align = "cm", minw = chips_def.config.minw + 5.75}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={pass_through = cycle_args, switch_func = switch_func, r = 0.1, colour = SMODS.RunSelect.Colours.nav_button, minw = 1.5, align = 'tm', shadow = true, direction = -1, button = 'cycler_default', hover = true, minh = 0.5}, nodes = {
                    {n=G.UIT.T, config = {text = '<', scale = 0.5, colour = G.C.WHITE}}
                }},
                {n=G.UIT.C, config = {align = 'cm', minw = 4}, nodes = {
                    {n=G.UIT.O, config = {object = DynaText({string = {{ref_table = cycle_args.page_label, ref_value = 'text'}}, scale = 0.5, colours = {G.C.WHITE}, pop_in_rate = 0, silent = true})}}
                }},
                {n=G.UIT.C, config={pass_through = cycle_args, switch_func = switch_func, r = 0.1, colour = SMODS.RunSelect.Colours.nav_button, minw = 1.5, align = 'tm', shadow = true, direction = 1, button = 'cycler_default', hover = true, minh = 0.5}, nodes = {
                    {n=G.UIT.T, config = {text = '>', scale = 0.5, colour = G.C.WHITE}}
                }},
                {n=G.UIT.C, config = {align = 'cm', minw = 3.75}, nodes = {}},
                {n=G.UIT.C, config={r = 0.05, colour = G.C.RED, minw = 2, align = 'cm', shadow = true, button = 'aij_poly_disable', hover = true, minh = 0.5}, nodes = {
                    {n=G.UIT.T, config = {text = localize('k_aij_disable_all'), scale = 0.4, colour = G.C.WHITE}}
                }},
            }},
        }}

        return {n=G.UIT.C, nodes = {
            {n=G.UIT.R, config = {padding = 0.1}, nodes = {
                chips_def,
                tower_def,
                stats_def,
            }},
            {n=G.UIT.R, config = {align = 'tl', padding = 0.05, minh = 0.8}, nodes = {
                buttons_def,
            }},
        }}
    end,
    start_run = function(self, choice)
        G.GAME.aij_poly_chips = {}
        G.GAME.aij_poly_points = 0
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            G.GAME.aij_poly_chips[v] = 0
            if type(choice) == "table" and choice[v] and choice[v] > 0 then
                local chip = All_in_Jest.PolyStakeChips[v]
                G.GAME.aij_poly_chips[v] = choice[v]
                G.GAME.aij_poly_points = G.GAME.aij_poly_points + chip.points[choice[v]]
                chip:apply(choice[v])
            end
        end
    end,
}

-- based on create_option_cycle
function All_in_Jest.create_poly_chip_cycle(args)
    args = args or {}
    args.chip_key = args.chip_key or All_in_Jest.PolyStakeChip.obj_buffer[1]
    args.max_value = args.max_value or 1
    args.current_value = args.current_value or 0
    if args.disabled then
        args.max_value = 1
        args.current_value = 0
    end

    local pips = {}
    for i = 1, args.max_value do 
        pips[#pips+1] = {n=G.UIT.B, config={w = 0.1, h = 0.1, r = 0.05, id = 'pip_'..i, colour = args.current_value >= i and G.C.WHITE or G.C.BLACK}}
    end

    local active = not args.disabled
    local l_active = active and args.current_value > 0
    local r_active = active and args.current_value < args.max_value
    local t = {n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, colour = G.C.CLEAR, focus_args = {type = 'cycle'}}, nodes={
        {n=G.UIT.C, config={id = 'cycle_l', align = "cm",r = 0.1, minw = 0.4, hover = l_active, colour = l_active and G.C.RED or G.C.UI.TEXT_DARK, button = active and 'aij_polychip_cycle' or nil, ref_table = args, ref_value = '-', focus_args = {type = 'none'}}, nodes={
            {n=G.UIT.T, config={id = 'cycle_lt', text = '-', scale = 0.4, colour = l_active and G.C.UI.TEXT_LIGHT or G.C.UI.TEXT_INACTIVE}}
        }},
        {n=G.UIT.C, config={id = 'cycle_main', align = "cm", minw = G.CARD_W - 1.4, minh = 0.5, r = 0.1, padding = 0.05, colour = active and G.C.RED or G.C.UI.TEXT_DARK}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes=pips}
        }},
        {n=G.UIT.C, config={id = 'cycle_r', align = "cm",r = 0.1, minw = 0.4, hover = r_active, colour = r_active and G.C.RED or G.C.UI.TEXT_DARK, button = active and 'aij_polychip_cycle' or nil, ref_table = args, ref_value = '+', focus_args = {type = 'none'}}, nodes={
            {n=G.UIT.T, config={id = 'cycle_rt', text = '+', scale = 0.4, colour = r_active and G.C.UI.TEXT_LIGHT or G.C.UI.TEXT_INACTIVE}}
        }},
    }}

    return {n=G.UIT.R, config={align = "cm", colour = G.C.CLEAR, padding = 0.0}, nodes = {t}}
end

G.FUNCS.aij_polychip_cycle = function(e)
    local from_value = e.config.ref_table.current_value
    if e.config.ref_value == '-' then
        e.config.ref_table.current_value = math.max(e.config.ref_table.current_value - 1, 0)
    else
        e.config.ref_table.current_value = math.min(e.config.ref_table.current_value + 1, e.config.ref_table.max_value)
    end
    if from_value == e.config.ref_table.current_value then return end
    SMODS.RunSelect.Setup.choices['aij_polychrome_settings'][e.config.ref_table.chip_key] = e.config.ref_table.current_value
    local cycle_main = e.UIBox:get_UIE_by_ID('cycle_main')
    cycle_main:juice_up(0.2)

    local cycle_l = e.UIBox:get_UIE_by_ID('cycle_l')
    local cycle_lt = e.UIBox:get_UIE_by_ID('cycle_lt')
    if e.config.ref_table.current_value == 0 then
        cycle_l.config.hover = false
        cycle_l.config.colour = G.C.UI.TEXT_DARK
        cycle_lt.config.colour = G.C.UI.TEXT_INACTIVE
    else
        cycle_l.config.hover = true
        cycle_l.config.colour = G.C.RED
        cycle_lt.config.colour = G.C.UI.TEXT_LIGHT
    end
    local cycle_r = e.UIBox:get_UIE_by_ID('cycle_r')
    local cycle_rt = e.UIBox:get_UIE_by_ID('cycle_rt')
    if e.config.ref_table.current_value == e.config.ref_table.max_value then
        cycle_r.config.hover = false
        cycle_r.config.colour = G.C.UI.TEXT_DARK
        cycle_rt.config.colour = G.C.UI.TEXT_INACTIVE
    else
        cycle_r.config.hover = true
        cycle_r.config.colour = G.C.RED
        cycle_rt.config.colour = G.C.UI.TEXT_LIGHT
    end

    for i = 1, e.config.ref_table.max_value do
        local pip = e.UIBox:get_UIE_by_ID('pip_'..i, e.parent.parent)
        pip.config.colour = (e.config.ref_table.current_value >= i) and G.C.WHITE or G.C.BLACK
    end

    local text_node = e.UIBox:get_UIE_by_ID('points_text')
    if text_node then
        text_node.config.object:remove()
        text_node.config.object = All_in_Jest.create_mod_points_text(e.config.ref_table.chip_key, e.config.ref_table.current_value)
        text_node.UIBox:recalculate()
    end
    local total_text_node = G.OVERLAY_MENU:get_UIE_by_ID('aij_total_points')
    if total_text_node then
        total_text_node.config.object:remove()
        total_text_node.config.object = All_in_Jest.create_total_points_text()
        total_text_node.UIBox:recalculate()
        local has_points = false
        local choice = SMODS.RunSelect.Setup.choices['aij_polychrome_settings']
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            if choice[v] and choice[v] > 0 then
                has_points = true
                break
            end
        end
        G.OVERLAY_MENU:get_UIE_by_ID('aij_total_points_suffix').config.object.colours = {has_points and G.C.UI.TEXT_LIGHT or G.C.GREY}
    end

    All_in_Jest.populate_poly_tower(false)
end

G.FUNCS.aij_poly_disable = function(e)
    for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
        SMODS.RunSelect.Setup.choices['aij_polychrome_settings'][v] = 0
    end
    SMODS.RunSelect.Functions.clean_up(true)
    SMODS.RunSelect.Pages['aij_polychrome_settings']:aij_create_poly_chips()
    local total_text_node = G.OVERLAY_MENU:get_UIE_by_ID('aij_total_points')
    if total_text_node then
        total_text_node.config.object:remove()
        total_text_node.config.object = All_in_Jest.create_total_points_text()
        total_text_node.UIBox:recalculate()
        local has_points = false
        local choice = SMODS.RunSelect.Setup.choices['aij_polychrome_settings']
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            if choice[v] and choice[v] > 0 then
                has_points = true
                break
            end
        end
        G.OVERLAY_MENU:get_UIE_by_ID('aij_total_points_suffix').config.object.colours = {has_points and G.C.UI.TEXT_LIGHT or G.C.GREY}
    end
    All_in_Jest.populate_poly_tower(false)
end

function All_in_Jest.create_mod_points_text(key, value)
    key = key or All_in_Jest.PolyStakeChip.obj_buffer[1]
    value = value or 0
    if value == 0 then
        return DynaText({string = {"+0"}, colours = {G.C.UI.TEXT_DARK}, scale = 0.5})
    else
        return DynaText({string = {"+"..All_in_Jest.PolyStakeChips[key].points[value]}, colours = {G.C.FILTER}, shadow = true, bump = true, scale = 0.5})
    end
end

function All_in_Jest.create_total_points_text(args)
    args = args or {}
    local points = 0
    local choice = SMODS.RunSelect.Setup.choices['aij_polychrome_settings']
    for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
        if choice[v] and choice[v] > 0 then
            points = points + All_in_Jest.PolyStakeChips[v].points[choice[v]]
        end
    end
    return DynaText({
        string = {tostring(points)},
        colours = {args.colour or All_in_Jest.get_poly_points_color(points)},
        shadow = true, bump = true,
        scale = args.scale or 0.5
    })
end

function All_in_Jest.get_poly_points_color(points)
    local pb = G.PROFILES[G.SETTINGS.profile].aij_poly_points and G.PROFILES[G.SETTINGS.profile].aij_poly_points.points or 0
    if points == 0 then
        return G.C.GREY
    elseif pb > 0 and points > pb then
        return G.C.DARK_EDITION
    end
    return G.C.FILTER
end

function All_in_Jest.populate_poly_tower(silent)
    if SMODS.config.run_select_performance then silent = true end
    remove_all(SMODS.RunSelect.Internals.stake_tower.cards)
    SMODS.RunSelect.Internals.stake_tower.cards = {}
    remove_all(SMODS.RunSelect.Internals.stake_tower_holding.cards)
    SMODS.RunSelect.Internals.stake_tower_holding.cards = {}

    local tower_area = SMODS.RunSelect.Internals.stake_tower_holding
    local tower_cards = {}
    for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
        if SMODS.RunSelect.Setup.choices['aij_polychrome_settings'] and SMODS.RunSelect.Setup.choices['aij_polychrome_settings'][v] > 0 then
            for __ = 1, SMODS.RunSelect.Setup.choices['aij_polychrome_settings'][v] do
                local chip_card = Card(tower_area.T.x, tower_area.T.y, 0.99, 0.99, nil, G.P_CENTERS.j_joker, {aij_poly_chip = v})
                chip_card.no_shadow = true
                chip_card.facing = 'back'
                chip_card.sprite_facing = 'back'
                chip_card.config.center = All_in_Jest.PolyStakeChips[v]
                chip_card.states.collide.can = true
                chip_card.states.drag.can = false
                chip_card.children.back:remove()
                chip_card.children.back = SMODS.create_sprite(chip_card.T.x, chip_card.T.y, chip_card.T.w, chip_card.T.h, chip_card.config.center.atlas, chip_card.config.center.pos, chip_card.config.center.sprite_args)

                chip_card.children.back.states.hover = chip_card.states.hover
                chip_card.children.back.states.click = chip_card.states.click
                chip_card.children.back.states.drag = chip_card.states.drag
                chip_card.children.back:set_role({major = chip_card, role_type = 'Glued', draw_major = chip_card})

                chip_card.params.run_select_stake_tower = {G.P_STAKES['stake_aij_polychrome'].order, 'stake_aij_polychrome'}
                chip_card.params.hover = 0
                chip_card.children.back.states.collide.can = true
                SMODS.RunSelect.Internals.stake_tower_holding:emplace(chip_card)
                table.insert(tower_cards, chip_card)
                if not silent then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.02,
                        func = (function()
                            play_sound('chips2', math.random()*0.2 + 0.99, 0.35)
                            if SMODS.RunSelect.Internals.stake_tower.cards then SMODS.RunSelect.Internals.stake_tower:draw_card_from(SMODS.RunSelect.Internals.stake_tower_holding) end
                            return true
                        end)
                    }), 'run_select')
                else
                    SMODS.RunSelect.Internals.stake_tower:draw_card_from(SMODS.RunSelect.Internals.stake_tower_holding)
                end
            end
        end
    end

    local poly_card = SMODS.RunSelect.Pages.stake_choice:create_selection_card('stake_aij_polychrome', nil, SMODS.RunSelect.Internals.stake_tower_holding)
    poly_card.params.run_select_stake_tower = {G.P_STAKES['stake_aij_polychrome'].order, 'stake_aij_polychrome'}
    poly_card.children.back.states.collide.can = true
    SMODS.RunSelect.Internals.stake_tower_holding:emplace(poly_card)
    table.insert(tower_cards, poly_card)

    if not silent then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.02,
            func = (function()
                play_sound('chips2', math.random()*0.2 + 0.99, 0.35)
                if SMODS.RunSelect.Internals.stake_tower.cards then SMODS.RunSelect.Internals.stake_tower:draw_card_from(SMODS.RunSelect.Internals.stake_tower_holding) end
                return true
            end)
        }), 'run_select')
    else
        SMODS.RunSelect.Internals.stake_tower:draw_card_from(SMODS.RunSelect.Internals.stake_tower_holding)
    end

    for i, card in ipairs(tower_cards) do
        card.params.hover = #tower_cards - i
    end
end

local clean_up_ref = SMODS.RunSelect.Functions.clean_up
function SMODS.RunSelect.Functions.clean_up(early)
    clean_up_ref(early)
    for _, v in ipairs(SMODS.RunSelect.Internals.aij_poly_chips) do
        v.config.object:remove()
        v.config.object = nil
    end
    SMODS.RunSelect.Internals.aij_poly_chips = {}
end

local card_stop_hover = Card.stop_hover
function Card:stop_hover()
    if self.params.aij_poly_chip then
        SMODS.RunSelect.Internals.hover_index = 0
    end
    card_stop_hover(self)
end

local card_hover_ref = Card.hover
function Card:hover()
    if self.params.aij_poly_chip and (not self.states.drag.is or G.CONTROLLER.HID.touch) and not self.no_ui then
        SMODS.RunSelect.Internals.hover_index = self.params.hover or 0
        local info_queue = {
            {set = 'PolyStakeChips', key = self.config.center.key},
        }
        self.config.center:loc_vars(info_queue)
        if not self.config.center:check_for_unlock() then
            info_queue = {
                {set = 'PolyStakeChips', key = 'locked', vars = {self.config.center.point_requirement}}
            }
        end

        local tooltips = {}
        local function create_info_tooltip(tooltip_data)
            local desc = generate_card_ui(tooltip_data, {main = {},info = {},type = {},name = 'done',badges = {}, from_detailed_tooltip = true}, nil, tooltip_data.set, nil)
            return {n=G.UIT.R, config={align = 'cm'}, nodes={
                {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.JOKER_GREY, 0.5), r = 0.1, padding = 0.05, emboss = 0.05}, nodes={
                    info_tip_from_rows(desc.info[1], desc.info[1].name),
                }}
            }}
        end
        for _, v in ipairs(info_queue) do
            table.insert(tooltips, {n=G.UIT.R, config = {align="cm", padding = 0.05}, nodes = {create_info_tooltip(v)}})
        end

        self.config.h_popup = {n = G.UIT.C, config={align='cm', colour = G.C.CLEAR}, nodes = {
            {n=G.UIT.C, config={align='cm'}, nodes = tooltips},
        }}

        self.config.h_popup_config = self:align_h_popup()
        Node.hover(self)
        return
    end
    card_hover_ref(self) 
end

return { name = { "RunSelectPages" }, items = { polychrome_stake } }
