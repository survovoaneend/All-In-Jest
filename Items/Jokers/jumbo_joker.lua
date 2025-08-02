local jumbo_joker = {
    object_type = "Joker",
    order = 141,

    key = "jumbo_joker",
    config = {
      extra = {
          banned_cards = {}
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
  
    add_to_deck = function(self, card, from_debuff)
        for k, joker in pairs(G.P_CENTER_POOLS['Booster']) do
            if joker.set == 'Booster' and not (joker.name:find('Mega') or joker.name:find('Jumbo') or joker.key:find('mega') or joker.key:find('jumbo')) then 
                G.GAME.banned_keys[joker.key] = true
                table.insert(card.ability.extra.banned_cards, joker.key)
            end
        end
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
    remove_from_deck = function(self, card, from_debuff)
		for _, key in ipairs(card.ability.extra.banned_cards) do
            G.GAME.banned_keys[key] = nil
        end
	end,
  
}
local hoverref = Card.hover
function Card:hover()
    hoverref(self)
    if self.config.center.key == "j_aij_jumbo_joker" and self.config.center.discovered then
        local _atlas, _pos = get_front_spriteinfo(self.config.card)
        _pos = { x = 1, y = 0 }
        _atlas = G.ASSET_ATLAS['aij_jumbo_joker']
        if self.children.front then
            self.children.front.atlas = _atlas
            self.children.front:set_sprite_pos(_pos)
        else
            self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, _atlas, _pos)
            self.children.front.states.hover = self.states.hover
            self.children.front.states.click = self.states.click
            self.children.front.states.drag = self.states.drag
            self.children.front.states.collide.can = false
            self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})
        end

        self.config.center.soul_pos = { x = 2, y = 0 }
        self.children.floating_sprite = Sprite(self.T.x, self.T.y, G.CARD_W, G.CARD_H, G.ASSET_ATLAS['aij_jumbo_joker'], { x = 2, y = 0 })
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
        local _atlas, _pos = get_front_spriteinfo(self.config.card)
        _pos = { x = 0, y = 0 }
        _atlas = G.ASSET_ATLAS['aij_jumbo_joker']
        if self.children.front then
            self.children.front.atlas = _atlas
            self.children.front:set_sprite_pos(_pos)
        else
            self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, _atlas, _pos)
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
