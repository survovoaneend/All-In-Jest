local jumbo_joker = {
    object_type = "Joker",
    order = 141,
    lite = true,
    key = "jumbo_joker",
    config = {
      extra = {
      }
    },
    rarity = 2,
    pos = { x = 0, y = 0 },
    atlas = 'jumbo_joker',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    pixel_size = { w = 81, h = 111 },
  
    loc_vars = function(self, info_queue, card)
  
    end,

    set_ability = function(self, card, initial, delay_sprites)
        if self.discovered or card.bypass_discovery_center then
            card.T.w = G.CARD_W * 1.14084507
            card.T.h = G.CARD_H * 1.168421053
        end
    end,
    set_sprites = function(self, card, front)
        if self.discovered or card.bypass_discovery_center then
            card.children.center.scale = {x = 81, y = 111}
            card.children.center:reset()
        end
    end,
  
}

local smods_add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, ...)
    if
        #SMODS.find_card("j_aij_jumbo_joker") > 0 and
        prototype_obj.set == 'Booster' and
        not (prototype_obj.name:find('Mega') or prototype_obj.name:find('Jumbo') or prototype_obj.key:find('mega') or prototype_obj.key:find('jumbo')) 
    then
        return false
    else
        return smods_add_to_pool_ref(prototype_obj, ...)
    end
end

-- First shop buffon pack becomes jumbo with Jumbo Joker
local smods_get_pack_ref = get_pack
function get_pack(...)
    if not G.GAME.first_shop_buffoon and #SMODS.find_card("j_aij_jumbo_joker") > 0 then
        G.GAME.first_shop_buffoon = true
        return G.P_CENTERS['p_buffoon_jumbo_1']
    else
        return smods_get_pack_ref(...)
    end
end

-- For the "pop out" animation
local hoverref = Card.hover
function Card:hover()
    hoverref(self)
    if self.config.center.key == "j_aij_jumbo_joker" and self.config.center.discovered then
        local _pos = { x = 1, y = 0 }
        local _atlas = G.ASSET_ATLAS['aij_jumbo_joker']
        if self.children.front then
            self.children.front.atlas = _atlas
            self.children.front:set_sprite_pos(_pos)
        else
            self.children.front = SMODS.create_sprite(self.T.x, self.T.y, self.T.w, self.T.h, 'aij_jumbo_joker', _pos)
            self.children.front.states.hover = self.states.hover
            self.children.front.states.click = self.states.click
            self.children.front.states.drag = self.states.drag
            self.children.front.states.collide.can = false
            self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})
        end

        self.config.center.soul_pos = { x = 2, y = 0 }
        self.children.floating_sprite = SMODS.create_sprite(self.T.x, self.T.y, G.CARD_W, G.CARD_H, 'aij_jumbo_joker', { x = 2, y = 0 })
        self.children.floating_sprite.role.draw_major = self
        self.children.floating_sprite.states.hover.can = false
        self.children.floating_sprite.states.click.can = false
        self.children.floating_sprite.T.y = self.T.y
        self.children.floating_sprite.T.x = self.T.x 
        
    end
end
local stop_hoverref = Card.stop_hover
function Card:stop_hover()
    stop_hoverref(self)
    if self.config.center.key == "j_aij_jumbo_joker" and self.config.center.discovered then
        local _pos = { x = 0, y = 0 }
        local _atlas = G.ASSET_ATLAS['aij_jumbo_joker']
        if self.children.front then
            self.children.front.atlas = _atlas
            self.children.front:set_sprite_pos(_pos)
        else
            self.children.front = SMODS.create_sprite(self.T.x, self.T.y, self.T.w, self.T.h, 'aij_jumbo_joker', _pos)
            self.children.front.states.hover = self.states.hover
            self.children.front.states.click = self.states.click
            self.children.front.states.drag = self.states.drag
            self.children.front.states.collide.can = false
            self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})
        end
        if self.children.center then
            self.children.floating_sprite = nil
            self.config.center.soul_pos = nil
        end
        
    end
end
return { name = {"Jokers"}, items = {jumbo_joker} }
