
function All_in_Jest.get_inherent_effects(card, type, amt_only, keys)
    if card and card.aij_inherent_effects and card.aij_inherent_effects[type..'s'] and #card.aij_inherent_effects[type..'s'] > 0 then
        local effects = {}
        local amt = 0
        for k, v in pairs(card.aij_inherent_effects[type..'s']) do
            if keys then
                effects[v.center_key] = true
            else
                effects[#effects + 1] = v
            end
            amt = amt + 1
        end
        return amt_only and amt or effects
    else
        return amt_only and 0 or {}
    end
end

function All_in_Jest.apply_inherent_effect(card, effect, effect_type)
    card.aij_inherent_effects = card.aij_inherent_effects or {}
    if not effect then return end
    if effect_type == 'edition' then
        card.aij_inherent_effects[effect_type..'s'] = card.aij_inherent_effects[effect_type..'s'] or {}
        local index = #card.aij_inherent_effects[effect_type..'s'] + 1
        card.aij_inherent_effects[effect_type..'s'][index] = copy_table(effect)

        if effect.card_limit then
            card.ability.card_limit = card.ability.card_limit + (effect.card_limit or 0)
        end
        if effect.extra_slots_used then
            card.ability.extra_slots_used = card.ability.extra_slots_used + (effect.edition.extra_slots_used or 0)
        end
    elseif effect_type == 'enhancement' then
        -- There's a potential bug here surrounding enhancements that modify card limit akin to negative
        card.aij_inherent_effects[effect_type..'s'] = card.aij_inherent_effects[effect_type..'s'] or {}
        local index = #card.aij_inherent_effects[effect_type..'s'] + 1
        card.aij_inherent_effects[effect_type..'s'][index] = {}
        card.aij_inherent_effects[effect_type..'s'][index]['center_key'] = effect.key
        card.aij_inherent_effects[effect_type..'s'][index]['ability'] = copy_table(card.ability)
        card.aij_inherent_effects[effect_type..'s'][index]['ability'].extra_enhancement = effect.key
    elseif effect_type == 'other_enhancement' then
        card.aij_inherent_effects['enhancements'] = card.aij_inherent_effects['enhancements'] or {}
        local index = #card.aij_inherent_effects['enhancements'] + 1
        card.aij_inherent_effects['enhancements'][index] = {}
        card.aij_inherent_effects['enhancements'][index]['center_key'] = effect.key
        card.aij_inherent_effects['enhancements'][index]['ability'] = copy_table(card.config.aij_other_center.ability)
        card.aij_inherent_effects['enhancements'][index]['ability'].extra_enhancement = effect.key
    end
end

function All_in_Jest.set_other_enhancement(card, enhancement)
    if not G.P_CENTERS[enhancement] then return end -- enhancement must exist
    if enhancement == card.config.center.key then return end -- enhancement must not be duplicate of main enhancement
    if enhancement == "c_base" then
        card.config.aij_other_center = nil
        return
    end
    SMODS.aij_applying_thing = true
    local old_center_key = card.config.aij_other_center and card.config.aij_other_center['center'].key or 'c_base'
    card.config.aij_other_center = {}
    card.config.aij_other_center['center'] = G.P_CENTERS[enhancement]
    local old_center = card.config.center
    card.aij_setting_other_enhancement = old_center_key
    card:set_ability(G.P_CENTERS[enhancement])
    card.config.aij_other_center['ability'] = copy_table(card.ability)
    card.config.aij_other_center['ability'].extra_enhancement = enhancement
    card.aij_setting_other_enhancement_back = true
    card:set_ability(old_center)
    -- if not card.ability.aij_other_center or not card.ability.aij_other_center['ability'] then
    --     card.ability.aij_other_center = card.ability.aij_other_center or {}
    --     card.ability.aij_other_center['ability'] = card.config.aij_other_center and card.config.aij_other_center['ability']
    -- end
    SMODS.aij_applying_thing = false
end

function All_in_Jest.find_multi_enhancement_pos(enhancement, get_index)
    local pos = 0
    local atlas = nil
    if enhancement == 'm_bonus' then
        pos = 3
    elseif enhancement == 'm_mult' then
        pos = 4
    elseif enhancement == 'm_wild' then
        pos = 5
    elseif enhancement == 'm_glass' then
        pos = 7
    elseif enhancement == 'm_steel' then
        pos = 8
    elseif enhancement == 'm_stone' then
        pos = 1
    elseif enhancement == 'm_gold' then
        pos = 2
    elseif enhancement == 'm_lucky' then
        pos = 6
    elseif enhancement == 'm_aij_fervent' then
        pos = 10
    elseif enhancement == 'm_aij_charged' then
        pos = 11
    elseif enhancement == 'm_aij_ice' then
        pos = 12
    elseif enhancement == 'm_aij_canvas' then
        pos = 13
    elseif enhancement == 'm_aij_simulated' then
        if get_index then
            pos = 14
        else
            pos = {x = 0, y = nil}
            atlas = 'aij_multi_simulated_atlas'
        end
    elseif enhancement == 'm_aij_wood' then
        pos = 15
    elseif enhancement == 'm_paperback_soaked' then
        pos = 16
    elseif enhancement == 'm_paperback_ceramic' then
        pos = 17
    elseif enhancement == 'm_paperback_wrapped' then
        pos = 18
    elseif enhancement == 'm_paperback_bandaged' then
        pos = 19
    elseif enhancement == 'm_paperback_domino' then
        pos = 20
    elseif enhancement == 'm_paperback_stained' then
        pos = 21
    elseif enhancement == 'm_aij_scorched' then
        pos = 22
    end
    return pos, atlas
end

function All_in_Jest.multi_enhancement_get_vanilla_z_order(key)

    z_order_table = {
        m_bonus = 1,
        m_mult = 1,
        m_wild = 1,
        m_glass = -1,
        m_steel = 0.9,
        m_stone = -1,
        m_gold = 0.1,
        m_lucky = -1,

        -- Not vanilla but lol

        m_paperback_soaked = -1,
        m_paperback_ceramic = -1,
        m_paperback_wrapped = 1.4,
        m_paperback_bandaged = 1.6,
        m_paperback_domino = 1,
        m_paperback_stained = 1,
        m_paperback_sleeved = 3,
        m_paperback_antique = -1,
    }

    z_order = z_order_table[key]

    return z_order
end

function All_in_Jest.get_enhancement_z_order(center)
    local z_order = nil
    if center.all_in_jest and center.all_in_jest.multi_enhancement_z_order and type(center.all_in_jest.multi_enhancement_z_order) == "number" then
        z_order = center.all_in_jest.multi_enhancement_z_order
    else
        z_order = All_in_Jest.multi_enhancement_get_vanilla_z_order(center.key)
    end

    if z_order ~= nil then
        return z_order + center.order / 10000 -- Use center order to make every enhancement have a set "stacking order"
    end
end

function process_texture_stack_enhancement_foreground(image, stacked_enhancement, foreground_atlas_name)
    local foregrounds_atlas = SMODS.get_atlas(foreground_atlas_name or "aij_multi_enhancements_foregrounds_atlas")

    local foreground_pos, _ = {x = All_in_Jest.find_multi_enhancement_pos(stacked_enhancement, true), y = 0}

    if foreground_pos.x == 0 then
        foregrounds_atlas = SMODS.get_atlas(foreground_atlas_name or G.P_CENTERS[stacked_enhancement].atlas)
        foreground_pos = G.P_CENTERS[stacked_enhancement].pos
    end

    local w, h = 71, 95
    local texW, texH = foregrounds_atlas.image:getDimensions()

    local width, height = image:getDimensions()
    local canvas = love.graphics.newCanvas(width, height, {type = '2d', readable = true, dpiscale = image:getDPIScale()})

    love.graphics.push("all")

    love.graphics.setCanvas( canvas )
    love.graphics.clear({1, 1, 1, 0})
    
    love.graphics.setColor(1, 1, 1, 1)

    G.SHADERS['aij_fusion_spritesheet']:send("enhancement_image_dims", {texW, texH})
    G.SHADERS['aij_fusion_spritesheet']:send("old_image_dims", {image:getDimensions()})
    G.SHADERS['aij_fusion_spritesheet']:send('maskTex', foregrounds_atlas.image)
    G.SHADERS['aij_fusion_spritesheet']:send('maskUV', { foreground_pos.x * foregrounds_atlas.px / texW, foreground_pos.y * foregrounds_atlas.py / texH, w / texW, h / texH })
    love.graphics.setShader( G.SHADERS['aij_fusion_spritesheet'] )
    
    -- Draw image with foreground shader on new canvas
    love.graphics.draw( image )

    love.graphics.pop()

    local image_data = canvas:newImageData()

    return love.graphics.newImage(image_data, {mipmaps = true, dpiscale = image:getDPIScale()}), image_data
end

function All_in_Jest.get_multi_enhancement_atlas(center, other_center)
    local enhancement_1_key = center.key
    local enhancement_2_key = other_center.key

    local enhancements_1_fusion_pos, temp_atlas_1 = All_in_Jest.find_multi_enhancement_pos(enhancement_1_key)
    local enhancements_2_fusion_pos, temp_atlas_2 = All_in_Jest.find_multi_enhancement_pos(enhancement_2_key)
    
    local new_pos = {
        x = 0, 
        y = 0
    }

    local new_atlas = 'aij_multi_enhancements_atlas'

    if temp_atlas_1 == nil and temp_atlas_2 == nil then
        if enhancements_1_fusion_pos > enhancements_2_fusion_pos then
            new_pos.x, new_pos.y = enhancements_1_fusion_pos, enhancements_2_fusion_pos
        else
            new_pos.x, new_pos.y = enhancements_2_fusion_pos, enhancements_1_fusion_pos
        end
    elseif type(temp_atlas_1) == "string" then
        new_atlas = temp_atlas_1
        if type(enhancements_1_fusion_pos) == "table" then
            new_pos.x, new_pos.y = enhancements_1_fusion_pos.x, enhancements_1_fusion_pos.y
        end
        if new_pos.x == nil and type(enhancements_2_fusion_pos) == "number" then
            new_pos.x = enhancements_2_fusion_pos
        end
        if new_pos.y == nil and type(enhancements_2_fusion_pos) == "number" then
            new_pos.y = enhancements_2_fusion_pos
        end
    elseif type(temp_atlas_2) == "string" then
        new_atlas = temp_atlas_2
        if type(enhancements_2_fusion_pos) == "table" then
            new_pos.x, new_pos.y = enhancements_2_fusion_pos.x, enhancements_2_fusion_pos.y
        end
        if new_pos.x == nil and type(enhancements_1_fusion_pos) == "number" then
            new_pos.x = enhancements_1_fusion_pos
        end
        if new_pos.y == nil and type(enhancements_1_fusion_pos) == "number" then
            new_pos.y = enhancements_1_fusion_pos
        end
    end

    local has_sprite = aij_check_if_sprite_exists(
        new_atlas,
        new_pos.x or 0,
        new_pos.y or 0
    )
    if has_sprite and new_pos.y and new_pos.y > 0 then
        -- If sprite has a unique sprite, use it
        return SMODS.get_atlas(new_atlas), new_pos
    else
        -- Else, create a new sprite
        local enhancement_1_z_order = All_in_Jest.get_enhancement_z_order(center)
        local enhancement_2_z_order = All_in_Jest.get_enhancement_z_order(other_center)
        
        if 
            (enhancement_1_z_order == nil and enhancement_2_z_order == nil) or 
            (enhancement_1_z_order == nil and enhancement_2_z_order ~= nil and enhancement_2_z_order < 0) or 
            (enhancement_2_z_order == nil and enhancement_1_z_order ~= nil and enhancement_1_z_order < 0) 
        then
            -- AiJ hasn't defined anything, so do it dynamically

            local enhancement_1_atlas = SMODS.get_atlas(center.atlas) or SMODS.get_atlas('centers')
            local enhancement_2_atlas = SMODS.get_atlas(other_center.atlas) or SMODS.get_atlas('centers')

            local enhancement_1_colour = aij_get_mcc_pixel(enhancement_1_atlas.image_data, center.pos, {bpx = enhancement_1_atlas.px, bpy = enhancement_1_atlas.py, check_invis = false})
            local enhancement_2_colour = aij_get_mcc_pixel(enhancement_2_atlas.image_data, other_center.pos, {bpx = enhancement_2_atlas.px, bpy = enhancement_2_atlas.py, check_invis = false})

            local h1, s1, v1 = rgb_to_hsv(enhancement_1_colour[1], enhancement_1_colour[2], enhancement_1_colour[3])
            local h2, s2, v2 = rgb_to_hsv(enhancement_2_colour[1], enhancement_2_colour[2], enhancement_2_colour[3])

            if (v1 > 0.95 and s1 < 0.05) or (v2 > 0.95 and s2 < 0.05) then
                -- If it looks like one of the enhancements could be a foreground, create a foreground sprite

                local remove_white = function(r, g, b, a, old_colour, new_colour, args)
                    local h_old, s_old, v_old = rgb_to_hsv(r, g, b)
                    local new_a = a
                    if v_old > 0.9 then
                        new_a = math.min(1 - v_old, a)
                    end

                    return r, g, b, new_a
                end

                local foreground_enhancement, background_enhancement, foreground_atlas, background_atlas

                if (v1 > 0.95 and s1 < 0.05) then
                    foreground_enhancement = center
                    background_enhancement = other_center
                    foreground_atlas = enhancement_1_atlas
                    background_atlas = enhancement_2_atlas
                    background_atlas = enhancement_2_atlas
                else
                    foreground_enhancement = other_center
                    background_enhancement = center
                    foreground_atlas = enhancement_2_atlas
                    background_atlas = enhancement_1_atlas
                end

                local foreground_atlas = aij_recolour_atlas({1, 1, 1, 1}, {1, 1, 1, 1}, foreground_atlas, nil, {return_pixel = remove_white, skip_check = true}), foreground_enhancement.pos
                
                local new_atlas_name = background_atlas.name .. "_aij_foreground_" .. foreground_enhancement.key
                if not SMODS.get_atlas(new_atlas_name) then
                    local atlas_type = background_atlas.atlas_table or "ASSET_ATLAS"
                    
                    G[atlas_type][new_atlas_name] = {}
                    SMODS.get_atlas(new_atlas_name).name = new_atlas_name
                    SMODS.get_atlas(new_atlas_name).type = background_atlas.type
                    SMODS.get_atlas(new_atlas_name).atlas_table = atlas_type
                    SMODS.get_atlas(new_atlas_name).px = background_atlas.px
                    SMODS.get_atlas(new_atlas_name).py = background_atlas.py
                    SMODS.get_atlas(new_atlas_name).frames = background_atlas.frames
                    local image, image_data = process_texture_stack_enhancement_foreground(background_atlas.image, foreground_enhancement.key, foreground_atlas.name)
                    SMODS.get_atlas(new_atlas_name).image = image
                    SMODS.get_atlas(new_atlas_name).image_data = image_data
                end

                return SMODS.get_atlas(new_atlas_name), background_enhancement.pos
            else
                -- Recolour atlas
                local enhancement_to_recolour, other_enhancement, old_colour, new_color

                enhancement_1_z_order = enhancement_1_z_order or (0 + center.order / 10000) -- Makes picking the base atlas easier
                enhancement_2_z_order = enhancement_2_z_order or (0 + center.order / 10000) -- Makes picking the base atlas easier
                if enhancement_1_z_order < enhancement_2_z_order then
                    enhancement_to_recolour = center
                    other_enhancement = other_center
                    old_colour = enhancement_1_colour
                    new_colour = enhancement_2_colour
                else
                    enhancement_to_recolour = other_center
                    other_enhancement = center
                    old_colour = enhancement_2_colour
                    new_colour = enhancement_1_colour
                end

                local base_atlas = SMODS.get_atlas(enhancement_to_recolour.atlas) or SMODS.get_atlas('centers')
                local other_atlas = SMODS.get_atlas(other_enhancement.atlas) or SMODS.get_atlas('centers')
                local s_base_low, s_base_high = aij_get_saturation_range(base_atlas.image_data, enhancement_to_recolour.pos, {bpx = base_atlas.px, bpy = base_atlas.py})
                local s_other_low, s_other_high = aij_get_saturation_range(other_atlas.image_data, other_enhancement.pos, {bpx = other_atlas.px, bpy = other_atlas.py})

                local set_hue = function(r, g, b, a, old_colour, new_colour, args)
                    local h_old, s_old, v_old = rgb_to_hsv(r, g, b)
                    local h_new, s_new, _ = rgb_to_hsv(new_colour[1], new_colour[2], new_colour[3])

                    local s_merged = ((s_old - s_base_low) / (s_base_high - s_base_low)) * (s_other_high - s_other_low) + s_other_low
                    s_merged = math.min(s_merged, 1)

                    local r_new, g_new, b_new = hsv_to_rgb(h_new, s_merged, v_old)

                    return r_new, g_new, b_new, args.replace_alpha and new_colour[4] or a
                end

                return aij_recolour_atlas(old_colour, new_colour, base_atlas, nil, {return_pixel = set_hue, skip_check = true}), enhancement_to_recolour.pos
            end

        else
            enhancement_1_z_order = enhancement_1_z_order or 0
            enhancement_2_z_order = enhancement_2_z_order or 0

            -- Foreground shader
            local foreground_enhancement = enhancement_1_z_order > enhancement_2_z_order and center or other_center
            local background_enhancement = enhancement_1_z_order > enhancement_2_z_order and other_center or center

            local atlas_key = background_enhancement.atlas or 'centers' -- Fallback to vanilla atlas
            local base_atlas = SMODS.get_atlas(atlas_key)
            local new_atlas_name = atlas_key .. "_aij_foreground_" .. foreground_enhancement.key

            if not SMODS.get_atlas(new_atlas_name) then
                local atlas_type = base_atlas.atlas_table or "ASSET_ATLAS"
                
                G[atlas_type][new_atlas_name] = {}
                SMODS.get_atlas(new_atlas_name).name = base_atlas.name .. "_aij_foreground_" .. foreground_enhancement.key
                SMODS.get_atlas(new_atlas_name).type = base_atlas.type
                SMODS.get_atlas(new_atlas_name).atlas_table = atlas_type
                SMODS.get_atlas(new_atlas_name).px = base_atlas.px
                SMODS.get_atlas(new_atlas_name).py = base_atlas.py
                SMODS.get_atlas(new_atlas_name).frames = base_atlas.frames
                local image, image_data = process_texture_stack_enhancement_foreground(base_atlas.image, foreground_enhancement.key)
                SMODS.get_atlas(new_atlas_name).image = image
                SMODS.get_atlas(new_atlas_name).image_data = image_data
            end

            return SMODS.get_atlas(new_atlas_name), background_enhancement.pos
        end
    end
end