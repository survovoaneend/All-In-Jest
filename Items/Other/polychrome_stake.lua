local polychrome_stake = {
    object_type = "Stake",
    key = "polychrome",
    applied_stakes = {},
    pos = { x = 0, y = 0 },
    atlas = "chips_atlas",
    sticker_pos = { x = 4, y = 2 },
	sticker_atlas = "stickers_atlas",
    unlocked = false,
}

-- lock polychrome behind gold stake
local is_unlocked_ref = SMODS.stake_is_unlocked
function SMODS.stake_is_unlocked(stake_key, deck_key)
    if stake_key == 'stake_aij_polychrome' then
        if G.PROFILES[G.SETTINGS.profile].all_unlocked then return true end
        if not G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key] then
            return false
        end
        local wins = G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].wins_by_key['stake_gold']
        return (wins and wins > 0)
    end
    return is_unlocked_ref(stake_key, deck_key)
end

-- make the sprite drawn as polychrome wherever it's used
local get_stake_sprite_ref = get_stake_sprite
function get_stake_sprite(_stake, _scale)
    local stake_sprite = get_stake_sprite_ref(_stake, _scale)
    if G.P_CENTER_POOLS['Stake'][_stake] and G.P_CENTER_POOLS['Stake'][_stake].key == 'stake_aij_polychrome' then
        stake_sprite.draw = function(_sprite)
            _sprite.ARGS.send_to_shader = _sprite.ARGS.send_to_shader or {}
            _sprite.ARGS.send_to_shader[1] = math.min(_sprite.VT.r*3, 1) + G.TIMERS.REAL/(18) + (_sprite.juice and _sprite.juice.r*20 or 0) + 1
            _sprite.ARGS.send_to_shader[2] = G.TIMERS.REAL

            Sprite.draw_shader(_sprite, 'dissolve')
            Sprite.draw_shader(_sprite, 'polychrome', nil, _sprite.ARGS.send_to_shader)
        end
    end
    return stake_sprite
end

local sprite_draw_shader_ref = Sprite.draw_shader
function Sprite:draw_shader(_shader, ...)
    if self == G.shared_stickers['aij_polychrome'] and _shader == 'voucher' then
        sprite_draw_shader_ref(self, 'polychrome', ...)
    else
        sprite_draw_shader_ref(self, _shader, ...)
    end
end

-- save polychrome stake wins
-- we don't save the stake win itself, just the points
local joker_win_ref = set_joker_win
function set_joker_win()
    if G.GAME.aij_poly_points then
        for k, v in pairs(G.jokers.cards) do
            if v.config.center_key and v.ability.set == 'Joker' then
                G.PROFILES[G.SETTINGS.profile].joker_usage[v.config.center_key] = G.PROFILES[G.SETTINGS.profile].joker_usage[v.config.center_key] or convert_usage_entry{count = 1, order = v.config.center.order, wins = {}, losses = {}, wins_by_key = {}, losses_by_key = {}}
                G.PROFILES[G.SETTINGS.profile].joker_usage[v.config.center_key].aij_poly_points = math.max(G.PROFILES[G.SETTINGS.profile].joker_usage[v.config.center_key].aij_poly_points or 0, G.GAME.aij_poly_points)
            end
        end
        G:save_settings()
    else
        joker_win_ref()
    end
end

local deck_win_ref = set_deck_win
function set_deck_win()
    if G.GAME.aij_poly_points then
        G.PROFILES[G.SETTINGS.profile].aij_poly_points = G.PROFILES[G.SETTINGS.profile].aij_poly_points or {points = 0, ante = G.GAME.round_resets.ante - 1}
        if G.GAME.aij_poly_points > G.PROFILES[G.SETTINGS.profile].aij_poly_points.points then
            local prev_points = G.PROFILES[G.SETTINGS.profile].aij_poly_points.points
            G.PROFILES[G.SETTINGS.profile].aij_poly_points.points = G.GAME.aij_poly_points
            G.PROFILES[G.SETTINGS.profile].aij_poly_points.ante = G.GAME.round_resets.ante - 1
            if not G.PROFILES[G.SETTINGS.profile].all_unlocked then
                for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
                    local chip = All_in_Jest.PolyStakeChips[v]
                    if not chip.unlocked and chip.point_requirement and (prev_points < chip.point_requirement) and (G.PROFILES[G.SETTINGS.profile].aij_poly_points.points >= chip.point_requirement) then
                        chip:check_for_unlock()
                        G:save_notify(chip)
                        All_in_Jest.unlock_polychip(chip)
                    end
                end
            end
        end
        if G.GAME.selected_back and G.GAME.selected_back.effect and G.GAME.selected_back.effect.center and G.GAME.selected_back.effect.center.key then
            local deck_key = G.GAME.selected_back.effect.center.key
            G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key] = G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key] or convert_usage_entry{count = 1, order = G.GAME.selected_back.effect.center.order, wins = {}, losses = {}, wins_by_key = {}, losses_by_key = {}}
            G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points = G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points or {points = 0, ante = G.GAME.round_resets.ante}
            if G.GAME.aij_poly_points > G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points.points then
                G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points.points = G.GAME.aij_poly_points
                G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points.ante = G.GAME.round_resets.ante - 1
            end
        end
        G:save_settings()
    else
        deck_win_ref()
    end
end

local set_high_score_ref = check_and_set_high_score
function check_and_set_high_score(score, amt)
    set_high_score_ref(score, amt)
    if G.GAME.seeded then return end
    if G.GAME.aij_poly_points and G.GAME.aij_poly_points > 0 and score == 'furthest_ante' and type(amt) == 'number' and amt > 8 then
        G.PROFILES[G.SETTINGS.profile].aij_poly_points = G.PROFILES[G.SETTINGS.profile].aij_poly_points or {points = 0, ante = amt - 1}
        if G.GAME.aij_poly_points >= G.PROFILES[G.SETTINGS.profile].aij_poly_points.points then
            G.PROFILES[G.SETTINGS.profile].aij_poly_points.ante = math.max(G.PROFILES[G.SETTINGS.profile].aij_poly_points.ante, amt - 1)
        end
        if G.GAME.selected_back and G.GAME.selected_back.effect and G.GAME.selected_back.effect.center and G.GAME.selected_back.effect.center.key then
            local deck_key = G.GAME.selected_back.effect.center.key
            G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points = G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points or {points = 0, ante = amt - 1}
            if G.GAME.aij_poly_points >= G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points.points then
                G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points.ante = math.max(G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].aij_poly_points.ante, amt - 1)
            end
        end
    end
end

-- change Applied Stakes ui to show modifiers
local current_stake_ref = G.UIDEF.SMODS_current_stake
function G.UIDEF.SMODS_current_stake()
    if G.GAME.aij_poly_points and G.GAME.aij_poly_points > 0 then
        local _stake_center = G.P_STAKES['stake_aij_polychrome']
        local _stake_desc = {}
        localize{type = 'descriptions', key = 'stake_aij_polychrome', set = 'Stake', nodes = _stake_desc}
        local stake_sprite = get_stake_sprite(_stake_center.order, 0.8)

        local applied_stake = {n=G.UIT.R, config={align = "cl", padding = 0.05}, nodes={
            {n=G.UIT.C, config={align = "cm", padding = 0.1, r=true, colour=G.C.BLACK}, nodes={
                {n=G.UIT.O, config={object = stake_sprite}}
            }},
            {n=G.UIT.C, config={align='cm'}, nodes = {
                {n=G.UIT.C, config={align = "cm", padding = 0.05, colour = get_stake_col(_stake_center.order), r = 0.05, stretch = true, diff = 2.4}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05, colour = adjust_alpha(G.C.WHITE, 0.95), r = 0.05, minw = 5.5, stretch = true, diff = 2.5}, nodes={
                        {n=G.UIT.R, config={align = "cm", padding = 0.03, minh = 0.7, minw = 3.8}, nodes={transparent_multiline_text(_stake_desc)}}
                    }}
                }}
            }},
            {n=G.UIT.C, config={minw = 0.1}}
        }}

        local stakes = {}
        for _, v in ipairs(All_in_Jest.PolyStakeChip.obj_buffer) do
            if G.GAME.aij_poly_chips[v] > 0 then
                local chip = All_in_Jest.PolyStakeChips[v]
                local chip_desc = {}
                localize{type = 'descriptions', key = v, set = 'PolyStakeChips', nodes = chip_desc}
                if G.GAME.aij_poly_chips[v] > 1 then
                    table.insert(chip_desc, {{n = G.UIT.T, config = {
                        scale = 0.32, colour = G.C.UI.TEXT_INACTIVE, text = localize({type = 'variable', key = 'a_aij_applied_stake', vars = {G.GAME.aij_poly_chips[v]}})
                    }}})
                end
                local chip_sprite = SMODS.create_sprite(0, 0, 0.8, 0.8, chip.atlas, chip.pos)
                chip_sprite.states.drag.can = false

                local stake_node = {n=G.UIT.R, config={align = "cl", padding = 0.05}, nodes={
                    {n=G.UIT.C, config={align = "cm", padding = 0.1, r=true, colour=G.C.BLACK}, nodes={
                        {n=G.UIT.O, config={object = chip_sprite}}
                    }},
                    {n=G.UIT.C, config={align='cm'}, nodes = {
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, colour = G.C.DARK_EDITION, r = 0.05, stretch = true, diff = 1.3}, nodes={
                            {n=G.UIT.R, config={align = "cm", padding = 0.05, colour = adjust_alpha(G.C.WHITE, 0.95), r = 0.05, minw = 5.5, stretch = true, diff = 1.4}, nodes={
                                {n=G.UIT.R, config={align = "cm", padding = 0.03, minh = 0.7, minw = 3.8}, nodes={transparent_multiline_text(chip_desc)}}
                            }}
                        }}
                    }},
                    {n=G.UIT.C, config={minw = 0.1}}
                }}
                table.insert(stakes, 1, stake_node)
            end
        end

        local box = SMODS.UIScrollBox({
            content = {
                definition = {n = G.UIT.ROOT, config = { align = "cm", colour = G.C.CLEAR }, nodes = stakes},
                config = { align = "cm" },
            },
            overflow = {node_config = {maxh = 4.7}},
            sync_mode = "offset",
        })
        local current_col = {
            {n=G.UIT.C, config = {align='tl', r=true, colour=G.C.BLACK}, nodes = {
                applied_stake,
                {n=G.UIT.R, config = {minh = 0.05, colour = G.C.L_BLACK}},
                {n=G.UIT.R, nodes = {{n=G.UIT.O, config = { object = box }}}}
            }}
        }
        if box then
            local bar = SMODS.GUI.scrollbar({
                h = 6,
                w = 0.3,
                knob_h = 0.8,
                colour = G.C.RED,
                bg_colour = { 0, 0, 0, 0.15 },
                scroll_collision_obj = box,
                scroll_mult = 1.6,
            })
            bar.config.align = "tm"
            table.insert(current_col, bar)
        end
        
        return {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR, r = 0.1, padding = 0.1}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                {n=G.UIT.T, config={text = 'Applied stakes', scale = 0.65, colour = G.C.WHITE}}
            }},
            {n=G.UIT.R, config = {align = 'cm', padding = 0.2}, nodes = current_col}
        }}
    end
    return current_stake_ref()
end

return { name = { "Stakes" }, items = { polychrome_stake } }
