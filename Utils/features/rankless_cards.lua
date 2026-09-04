

function aij_remove_rank(card)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            card.ability.numbertaker_rankless = true
            card:set_sprites(nil, card.config.card)
            card:juice_up()
            return true
        end
    }))
end

local get_front_spriteinfo_ref = get_front_spriteinfo
function get_front_spriteinfo(_front)
    if _front.card and _front.card.ability and _front.card.ability.numbertaker_rankless and _front.suit then
        if G.SETTINGS.colour_palettes[_front.suit] == 'hc' and G.all_in_jest.numbertaker_rankless['hc_'.._front.suit] then 
            return G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['hc_'.._front.suit].atlas], G.all_in_jest.numbertaker_rankless['hc_'.._front.suit].pos 
        elseif G.all_in_jest.numbertaker_rankless[_front.suit] then 
            return G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless[_front.suit].atlas], G.all_in_jest.numbertaker_rankless[_front.suit].pos 
        else
            return SMODS.get_atlas(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and _front.hc_atlas or _front.lc_atlas or {}) or SMODS.get_atlas(_front.atlas) or SMODS.get_atlas("cards_"..(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and 2 or 1)), {x=12,y=_front.pos.y}
        end
    else
        return get_front_spriteinfo_ref(_front)
    end
end

local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
	  set_spritesref(self, _center, _front)

    -- For rankless cards
    if self.ability and self.ability.numbertaker_rankless and _front and _front.suit then
        if not G.all_in_jest.numbertaker_rankless[_front.suit] then 
            local name = self.children.front.atlas.name
            local base = G.ASSET_ATLAS[name].image_data:clone()
            local pos = {x=12,y=self.children.front.sprite_pos.y}
            local layer = G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['Other'].atlas].image_data:clone()
            local posl = G.all_in_jest.numbertaker_rankless['Other'].pos
            local bpx, bpy = G.ASSET_ATLAS[name].px, G.ASSET_ATLAS[name].py
            local lpx, lpy = G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['Other'].atlas].px, G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['Other'].atlas].py
            local new_color = aij_get_mcc_pixel(base, pos, {bpx = bpx, bpy = bpy})
            aij_pasteAlpha(base, layer, pos, {x=9, y=4}, {reverse = true, lpx = lpx, lpy = lpy, bpx = bpx, bpy = bpy})
            aij_pasteAlpha(base, layer, pos, posl, {lpx = lpx, lpy = lpy, bpx = bpx, bpy = bpy})
            local replace_color = HEX('f900ff')
            self.children.front.atlas = {
                px = bpx, py = bpy, name = name,
                image_data = base,
                image = love.graphics.newImage(base, {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})
            }
            if new_color then
                new_color[4] = 255
                self.children.front.atlas = aij_recolour_atlas(replace_color, new_color, self.children.front.atlas, true)
            end
            self.children.front:set_sprite_pos(pos)
        end
    end
end

