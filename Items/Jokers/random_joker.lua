SMODS.Atlas({
    key = 'random_joker',
    path = 'Parts/randomjoker.png',
    px = '71',
    py = '95',
})
function aij_outline_image(imagedata, outline_color)
    local scale = 1
    local w, h = imagedata:getWidth(), imagedata:getHeight()

    local src = imagedata:clone()
    local out = imagedata:clone()

    local r,g,b,a =
        outline_color[1],
        outline_color[2],
        outline_color[3],
        outline_color[4] or 1

    for y = 0, h-1 do
        for x = 0, w-1 do
            local _,_,_,alpha = src:getPixel(x,y)
            alpha = alpha > 0.5 and 1 or 0

            if alpha == 0 then
                local hit = false

                -- search radius = scale
                for dy = -scale, scale do
                    for dx = -scale, scale do
                        -- optional: Manhattan distance for sharper corners
                        if math.abs(dx) + math.abs(dy) <= scale then
                            local nx, ny = x + dx, y + dy
                            if nx >= 0 and nx < w and ny >= 0 and ny < h then
                                local _,_,_,na = src:getPixel(nx, ny)
                                if na >= 0.99 then
                                    hit = true
                                    break
                                end
                            end
                        end
                    end
                    if hit then break end
                end

                if hit then
                    out:setPixel(x,y,r,g,b,a)
                end
            end
        end
    end

    return out
end


function aij_recolour_atlas(card, old_colour, new_colour, atlas)
    local image_data = atlas.image_data:clone()

    image_data:mapPixel(function(x, y, r, g, b, a)
        return aij_recolour_pixel(x, y, r, g, b, a, old_colour, new_colour)
    end)

    card.children.center.atlas = {
        px = atlas.px,
        py = atlas.py,
        name = atlas.name,
        image_data = image_data,
        image = love.graphics.newImage(image_data, {
            mipmaps = true,
            dpiscale = G.SETTINGS.GRAPHICS.texture_scaling
        })
    }
end

function aij_recolour_pixel(x, y, r, g, b, a, old_colour, new_colour, tolerance)
    tolerance = tolerance or 0.01

    if math.abs(r - old_colour[1]) <= tolerance
    and math.abs(g - old_colour[2]) <= tolerance
    and math.abs(b - old_colour[3]) <= tolerance then
        return new_colour[1], new_colour[2], new_colour[3], a
    end

    return r, g, b, a
end

local function aij_downscale_imagedata(src, scale)
    if scale == 1 then return src:clone() end

    local w, h = src:getWidth(), src:getHeight()
    local nw, nh = w / scale, h / scale

    local dst = love.image.newImageData(nw, nh)

    for y = 0, nh - 1 do
        for x = 0, nw - 1 do
            -- sample top-left pixel of the block
            local r,g,b,a = src:getPixel(x * scale, y * scale)
            dst:setPixel(x, y, r, g, b, a)
        end
    end

    return dst
end

local function aij_upscale_imagedata(src, scale)
    if scale == 1 then return src:clone() end

    local w, h = src:getWidth(), src:getHeight()
    local nw, nh = w * scale, h * scale

    local dst = love.image.newImageData(nw, nh)

    for y = 0, h - 1 do
        for x = 0, w - 1 do
            local r,g,b,a = src:getPixel(x, y)

            for oy = 0, scale - 1 do
                for ox = 0, scale - 1 do
                    dst:setPixel(
                        x * scale + ox,
                        y * scale + oy,
                        r, g, b, a
                    )
                end
            end
        end
    end

    return dst
end


local function aij_pasteAlpha(base, layer, x, y)
    local w, h = layer:getWidth(), layer:getHeight()
    for i = 0, w-1 do
        for j = 0, h-1 do
            local r, g, b, a = layer:getPixel(i, j)
            if a > 0 then
                base:setPixel(x + i, y + j, r, g, b, a)
            end
        end
    end
end

local random_joker = {
    object_type = "Joker",
    order = 762,

    key = "random_joker",
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 0, y = 0 },
    atlas = 'aij_random_joker',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    set_sprites = function(self, card, front)
        if not card.config.center.discovered then return end
        if card.ability and card.ability.random_atlas then
            card.children.center.atlas = card.ability.random_atlas
            return
        end
        --First to Last {Head, Other Misc, Ruff, Body Decal, Mouth, Eyes, Nose, Face Misc, Hat, Overlay}
        local prefixes = {
            {key = 'eyes', order = 5}, 
            {key = 'facemisc', order = 7, chance = 40}, 
            {key = 'hat', order = 8},
            {key = 'mouth', order = 4}, 
            {key = 'nose', order = 6},
            {key = 'ruff', order = 2}, 
            {key = 'head', order = 0},
            {key = 'bodydecal', order = 3, chance = 40},
            {key = 'overlay', order = 9, chance = 20},
        }
        local random_joker_files = {}
        for k, v in pairs(G.ASSET_ATLAS) do
            local prefix = 'aij_randomjoker_'
            local outter_prefix = ''
            for k_, v_ in pairs(prefixes) do
                local key = v_.key
                if string.find(k, prefix..key) then
                    outter_prefix = key
                    break
                end
            end
            if outter_prefix ~= '' then
                local location = outter_prefix:gsub("^%l", string.upper)
                random_joker_files[location] = random_joker_files[location] or {}
                local index = #random_joker_files[location]+1
                local has_outline = true
                if string.find(k, prefix..outter_prefix..'_nooutline') then
                    has_outline = false
                end
                random_joker_files[location][index] = {data = v, outline = has_outline}
            end
        end
        local base = G.ASSET_ATLAS['aij_random_joker'].image_data:clone()

        local layers = {}
        for k_, v_ in pairs(prefixes) do
            local key = v_.key
            local location = key:gsub("^%l", string.upper)
            local table = pseudorandom_element(random_joker_files[location], pseudoseed('randomjoker'))
            local data = table.data.image_data:clone()
            layers[v_.order+1] = {key = key, data = data, order = v_.order, chance = v_.chance or nil, outline = table.outline}
        end

        local scale = G.SETTINGS.GRAPHICS.texture_scaling or 1
        
        local first_layer = layers[1].data
        local outline = layers[1].data:clone()
        for k, v in pairs(layers) do
            if v.data ~= first_layer then
                if v.chance then
                    local has_part = pseudoseed('randomjoker_'..v.key)
                    if has_part <= (v.chance*0.01) then
                        aij_pasteAlpha(first_layer, v.data, 0, 0)
                        if v.outline then
                            aij_pasteAlpha(outline, v.data, 0, 0)
                        end
                    end
                else
                    aij_pasteAlpha(first_layer, v.data, 0, 0)
                    if v.outline then
                        aij_pasteAlpha(outline, v.data, 0, 0)
                    end
                end
            end
        end

        outline = aij_downscale_imagedata(outline, scale) --Couldn't apply outline correctly so i just scaled it down and back up
        outline = aij_outline_image(outline, HEX('4f6367'))
        outline = aij_upscale_imagedata(outline, scale)
        aij_pasteAlpha(base, outline, 0, 0)
        aij_pasteAlpha(base, first_layer, 0, 0)
        


        card.children.center.atlas = {
            px = 71, py = 95, name = 'aij_random_joker',
            image_data = base,
            image = love.graphics.newImage(base, {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})
        }
        local replace_colours = {HEX('ff0000'), HEX('00fff8'), HEX('00ff05')}
        local new_colours = All_in_Jest.get_random_joker_colours('skintone')
        for k, v in pairs(replace_colours) do
            aij_recolour_atlas(card, v, new_colours[k], card.children.center.atlas)
        end

        local replace_colours1 = {HEX('a2ff00'), HEX('8600ff'), HEX('ff5300'), HEX('0082ff'), HEX('ff006f')}
        local replace_colours2 = {HEX('eeff00'), HEX('ff00e5'), HEX('0a00ff')}
        local new_clothes_colours, new_makeup_colours = All_in_Jest.get_random_joker_colours('clothes_and_makeup')
        for k, v in pairs(replace_colours1) do
            aij_recolour_atlas(card, v, new_clothes_colours[k], card.children.center.atlas)
        end
        for k, v in pairs(replace_colours2) do
            aij_recolour_atlas(card, v, new_makeup_colours[k], card.children.center.atlas)
        end

        local dark_replace_colours1 = {HEX('528100'), HEX('330061'), HEX('5c1e00'), HEX('00386d'), HEX('790035')}
        local dark_replace_colours2 = {HEX('ff9900'), HEX('8c007e'), HEX('05007e')}
        local dark_new_clothes_colours, dark_new_makeup_colours = {}, {}
        for k, v in pairs(new_clothes_colours) do
            dark_new_clothes_colours[#dark_new_clothes_colours+1] = darken(v,0.31)
        end
        for k, v in pairs(new_makeup_colours) do
            dark_new_makeup_colours[#dark_new_makeup_colours+1] = darken(v,0.31)
        end
        for k, v in pairs(dark_replace_colours1) do
            aij_recolour_atlas(card, v, dark_new_clothes_colours[k], card.children.center.atlas)
        end
        for k, v in pairs(dark_replace_colours2) do
            aij_recolour_atlas(card, v, dark_new_makeup_colours[k], card.children.center.atlas)
        end

        local light_replace_colours1 = {HEX('d2ff84'), HEX('c17dff'), HEX('ff9e6f'), HEX('82c2ff'), HEX('ff6fae')}
        local light_new_clothes_colours = {}
        for k, v in pairs(new_clothes_colours) do
            light_new_clothes_colours[#light_new_clothes_colours+1] = lighten(v,0.26)
        end
        for k, v in pairs(light_replace_colours1) do
            aij_recolour_atlas(card, v, light_new_clothes_colours[k], card.children.center.atlas)
        end

        --Base, Light, Dark
        local replace_colours3 = {HEX('8bffc0'), HEX('ccffe3'), HEX('59a37b')}
        local new_hair_colours = All_in_Jest.get_random_joker_colours('hair')
        if new_hair_colours[4] then
            local colours = {}
            colours[#colours+1] = new_hair_colours
            colours[#colours+1] = lighten(new_hair_colours,0.26)
            colours[#colours+1] = darken(new_hair_colours,0.31)
            new_hair_colours = colours
        end
        for k, v in pairs(replace_colours3) do
            aij_recolour_atlas(card, v, new_hair_colours[k], card.children.center.atlas)
        end

    end,

    calculate = function(self, card, context)
        
    end

}
return { name = { "Jokers" }, items = { random_joker } }