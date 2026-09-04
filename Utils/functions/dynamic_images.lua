
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- Functions relevant to creating sprites during run-time
-- Used primarily for fusion enhancements
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

function aij_update_hand_text(area)
    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(area)

    local calculated_text = nil
    if text == 'aij_Royal Flush' then
        calculated_text = 'aij_Royal Flush'
        text = 'Straight Flush'
    end

    local backwards = nil
    for k, v in pairs(area) do
        if v.facing == 'back' then
            backwards = true
            break
        end
    end
    if backwards then
        update_hand_text({immediate = true, nopulse = nil, delay = 0}, {handname='????', level='?', mult = '?', chips = '?'})
        for name, parameter in pairs(SMODS.Scoring_Parameters) do
            update_hand_text({immediate = true, nopulse = nil, delay = 0}, {[name] = '?'})
        end
    else
        update_hand_text({
            sound = G.GAME.current_round.current_hand.handname ~= disp_text and 'button' or nil, 
            volume = 0.4, 
            immediate = true, 
            nopulse = nil,
            delay = G.GAME.current_round.current_hand.handname ~= disp_text and 0.4 or 0}, 
            {handname=disp_text, level=G.GAME.hands[calculated_text or text].level, 
            mult = G.GAME.hands[calculated_text or text].mult, 
            chips = G.GAME.hands[calculated_text or text].chips})
    end
    if area == G.hand.highlighted then
        if G.GAME.Astral_pins and text ~= G.aij_cur_astral_hand then
            All_in_Jest.astral_visuals(text, 'only_remove', All_in_Jest.old_colours or nil, true)      
            if text == "NULL" then
                G.aij_cur_astral_hand = nil
            end
            if G.aij_astral_pin_area then
                for _, v in pairs(G.aij_astral_pin_area.cards) do
                    v:remove()
                end
            end
        end
        if G.GAME.Astral_pins then
            if text ~= G.aij_cur_astral_hand then
                All_in_Jest.astral_visuals(text, 'no_remove')
            end
            if text then
                G.aij_cur_astral_hand = text
            end
        end
    end
end

function aij_pasteAlpha(base, layer, posb, posl, args)
    args = args or {}
    posb = posb or {x=0, y=0}
    posl = posl or {x=0, y=0}

    local lw, lh = layer:getWidth(), layer:getHeight()
    local bw, bh = base:getWidth(), base:getHeight()

    local lpx = args.lpx and args.lpx * G.SETTINGS.GRAPHICS.texture_scaling or lw
    local lpy = args.lpy and args.lpy * G.SETTINGS.GRAPHICS.texture_scaling or lh
    local bpx = args.bpx and args.bpx * G.SETTINGS.GRAPHICS.texture_scaling or bw
    local bpy = args.bpy and args.bpy * G.SETTINGS.GRAPHICS.texture_scaling or bh

    local lx0 = posl.x * lpx
    local ly0 = posl.y * lpy
    local bx0 = posb.x * bpx
    local by0 = posb.y * bpy

    local lx1 = math.min(lx0 + lpx, lw)
    local ly1 = math.min(ly0 + lpy, lh)
    local bx1 = math.min(bx0 + bpx, bw)
    local by1 = math.min(by0 + bpy, bh)

    local getPixel = layer.getPixel

    for x = 0, math.min(lx1 - lx0, bx1 - bx0) - 1 do
        for y = 0, math.min(ly1 - ly0, by1 - by0) - 1 do

            local r, g, b, a = getPixel(layer, lx0 + x, ly0 + y)
            if args.blend then 
                local rb, gb, bb, ab = getPixel(base, lx0 + x, ly0 + y)
                args.blend = {rb, gb, bb, ab} 
            end

            if (not args.reverse and a > 0) or (args.reverse and a <= 0) then
                if args.blend then
                    local nr, ng, nb, na = aij_blend_pixels(r, g, b, a, args.blend, args)
                    base:setPixel(bx0 + x, by0 + y, nr, ng, nb, args.force_alpha or na)
                else
                    base:setPixel(bx0 + x, by0 + y, r, g, b, args.force_alpha or a)
                end
            end
        end
    end
end

function aij_recolour_atlas(old_colour, new_colour, base_atlas, front, args)
    args = args or {}

    local r1 = old_colour[1]
    local g1 = old_colour[2]
    local b1 = old_colour[3]
    local r2 = new_colour[1]
    local g2 = new_colour[2]
    local b2 = new_colour[3]
    local new_atlas_name = base_atlas.name .. "_aij_recoloured_" .. (r1 * 256 ^ 3 + g1 * 256 ^ 2 + b1 * 256) .. "_" .. (r2 * 256 ^ 3 + g2 * 256 ^ 2 + b2 * 256)

    if not SMODS.get_atlas(new_atlas_name) then
        local atlas_image_data = args.image_data or (base_atlas and base_atlas.image_data and base_atlas.image_data:clone())

        atlas_image_data:mapPixel(function(x, y, r, g, b, a)
            return aij_recolour_pixel(x, y, r, g, b, a, old_colour, new_colour, args.tolerance, args)
        end)
        if args.return_val then return atlas_image_data end

        local atlas_type = base_atlas.atlas_table or "ASSET_ATLAS"
        
        G[atlas_type][new_atlas_name] = {}
        SMODS.get_atlas(new_atlas_name).name = new_atlas_name
        SMODS.get_atlas(new_atlas_name).type = base_atlas.type
        SMODS.get_atlas(new_atlas_name).atlas_table = atlas_type
        SMODS.get_atlas(new_atlas_name).px = base_atlas.px
        SMODS.get_atlas(new_atlas_name).py = base_atlas.py
        SMODS.get_atlas(new_atlas_name).frames = base_atlas.frames
        SMODS.get_atlas(new_atlas_name).image_data = atlas_image_data
        SMODS.get_atlas(new_atlas_name).image = love.graphics.newImage(atlas_image_data, {
            mipmaps = true,
            dpiscale = G.SETTINGS.GRAPHICS.texture_scaling
        })

        return SMODS.get_atlas(new_atlas_name)
    else
        if args.return_val then return SMODS.get_atlas(new_atlas_name).image_data end
        return SMODS.get_atlas(new_atlas_name)
    end

end

function aij_recolour_pixel(x, y, r, g, b, a, old_colour, new_colour, tolerance, args)
    tolerance = tolerance or 0.01
    args.tolerance = args.tolerance or tolerance
    args.pos = {x = x, y = y}

    if args.skip_check or (math.abs(r - old_colour[1]) <= tolerance
                            and math.abs(g - old_colour[2]) <= tolerance
                            and math.abs(b - old_colour[3]) <= tolerance) then
        if args.return_pixel then return args.return_pixel(r, g, b, a, old_colour, new_colour, args) end
        return new_colour[1], new_colour[2], new_colour[3], args.replace_alpha and new_colour[4] or a
    end

    return r, g, b, a
end

-- Assumes r, g, b are in [0, 1]
function rgb_to_hsv(r, g, b)
    assert(r <= 1 and g <= 1 and b <= 1, "rgb_to_hsv assumes values in range of [0, 1]")
    
    local max_colour = math.max(r, g, b)
    local min_colour = math.min(r, g, b)

    local hue = max_colour
    local sat = max_colour
    local val = max_colour

    local delta = max_colour - min_colour
    sat = max_colour == 0 and 0 or delta / max_colour

    if (delta < 0.0001) then
        hue = 0
    else
        if max_colour == r then
            hue = (g - b) / delta + (g < b and 6 or 0)
        elseif max_colour == g then
            hue = (b - r) / delta + 2
        elseif max_colour == b then
            hue = (r - g) / delta + 4
        end

        hue = hue / 6
    end

    return hue, sat, val
end

-- Assumes hue, sat, val are in [0, 1]
function hsv_to_rgb(hue, sat, val)
    assert(hue <= 1 and sat <= 1 and val <= 1, "rgb_to_hsv assumes values in range of [0, 1]")
    
    local r = 0
    local g = 0
    local b = 0

    local i = math.floor(hue * 6)
    local f = hue * 6 - i
    local p = val * (1 - sat)
    local q = val * (1 - f * sat)
    local t = val * (1 - (1 - f) * sat)

    i = i % 6


    if i == 0 then
        r = val
        g = t
        b = p
    elseif i == 1 then
        r = q
        g = val
        b = p
    elseif i == 2 then
        r = p
        g = val
        b = t
    elseif i == 3 then
        r = p
        g = q
        b = val
    elseif i == 4 then
        r = t
        g = p
        b = val
    elseif i == 5 then
        r = val
        g = p
        b = q
    end

    return r, g, b

end

function aij_get_mcc_pixel(data, posb, args)
    args = args or {}
    posb = posb or {x=0, y=0}

    local bw, bh = data:getWidth(), data:getHeight()
    local bit = require("bit")

    local scale = G.SETTINGS.GRAPHICS.texture_scaling
    local bpx = (args.bpx and args.bpx * scale) or bw
    local bpy = (args.bpy and args.bpy * scale) or bh

    local bx0 = posb.x * bpx
    local by0 = posb.y * bpy

    local bx1 = math.min(bx0 + bpx, bw)
    local by1 = math.min(by0 + bpy, bh)

    local color_counts = {}
    local getPixel = data.getPixel 

    if args.check_invis then
        for x = bx0, bx1 - 1, scale do
            for y = by0, by1 - 1, scale do
                local _, _, _, a = getPixel(data, x, y)
                if a > 0 then
                    return false
                end
            end
        end
        return true
    end

    for x = bx0, bx1 - 1, scale do
        for y = by0, by1 - 1, scale do
            local r, g, b, a = getPixel(data, x, y)
            if a > 0 then
                local key = math.floor(r * 255) * 256 ^ 2  + math.floor(g * 255) * 256 + math.floor(b * 255)
                color_counts[key] = (color_counts[key] or 0) + 1
            end
        end
    end

    local best_key, best_count = nil, 0
    for key, count in pairs(color_counts) do
        if count > best_count then
            best_key = key
            best_count = count
        end
    end

    if not best_key then
        return nil
    end

    best_key = math.floor(best_key)

    local r = bit.band(bit.rshift(best_key, 16), 0xFF) / 255
    local g = bit.band(bit.rshift(best_key, 8), 0xFF) / 255
    local b = bit.band(best_key, 0xFF) / 255

    return {r, g, b}
end

function aij_get_saturation_range(data, posb, args)
    args = args or {}
    posb = posb or {x=0, y=0}

    local bw, bh = data:getWidth(), data:getHeight()
    local bit = require("bit")

    local scale = G.SETTINGS.GRAPHICS.texture_scaling
    local bpx = (args.bpx and args.bpx * scale) or bw
    local bpy = (args.bpy and args.bpy * scale) or bh

    local bx0 = posb.x * bpx
    local by0 = posb.y * bpy

    local bx1 = math.min(bx0 + bpx, bw)
    local by1 = math.min(by0 + bpy, bh)

    local color_counts = {}
    local getPixel = data.getPixel 

    local saturation_low = 1
    local saturation_high = 0

    for x = bx0, bx1 - 1, scale do
        for y = by0, by1 - 1, scale do
            local r, g, b, a = getPixel(data, x, y)
            if a > 0 then
                local _, s, v = rgb_to_hsv(r, g, b)
                if v < 0.999 then -- Don't count pure white
                    if s < saturation_low then saturation_low = s end
                    if s > saturation_high then saturation_high = s end
                end
            end
        end
    end

    return saturation_low, saturation_high
end

function aij_check_if_sprite_exists(atlas, x, y)
    return not aij_get_mcc_pixel(
        SMODS.get_atlas(atlas).image_data, 
        {x = x, y = y},
        {bpx = SMODS.get_atlas(atlas).px, bpy = SMODS.get_atlas(atlas).py, check_invis = true}
    )
end

function aij_blend_pixels(r, g, b, a, new_color, args)
    local r_new, g_new, b_new = new_color[1], new_color[2], new_color[3]
    local alpha = args.force_blend_alpha or a

    local out_r = r_new * alpha + r * (1 - alpha)
    local out_g = g_new * alpha + g * (1 - alpha)
    local out_b = b_new * alpha + b * (1 - alpha)

    return out_r, out_g, out_b, a
end
