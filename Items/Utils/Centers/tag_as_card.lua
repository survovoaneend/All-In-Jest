SMODS.Center {
    key = 'tag_as_card',
    atlas = 'tags',
    prefix_config = { atlas = false },
    pos = {x=3,y=4},
    omit = true,
    discovered = true,
    config = {},
    -- doesn't do anything right now, we use the Tag's uibox which does not
    -- take this into account
    -- set_card_type_badge = function(self, card, badges)
	-- 	badges[#badges+1] = create_badge(localize('k_tag'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
	-- end,
    set_sprites = function(self, card, _front)
        -- Overwrites the sprite set by the Card class. That's why
        -- we need atlas='tags' and prefix_config, otherwise there's a crash before
        -- this function runs due to invalid atlas
        if card.tag_as_card_aij then
            if card.children.center then card.children.center:remove() end
            local tag_obj = G.P_TAGS[card.tag_as_card_aij.key]
            card.children.center = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[tag_obj.atlas or 'tags'], tag_obj.pos)
            card.children.center.states.hover = card.states.hover
            card.children.center.states.click = card.states.click
            card.children.center.states.drag = card.states.drag
            card.children.center.states.collide.can = false
            card.children.center:set_role({major = card, role_type = 'Glued', draw_major = card})
        end
    end
}