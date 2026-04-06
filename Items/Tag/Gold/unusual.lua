local unusual_tag = {
    object_type = "Tag",
    key = 'unusual',

    pos = { x = 9, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'uncommon',
        },
        extra = {
            rarity = 'Uncommon',
            sticker = 'aij_unusual_doubled'
        }
    },

    discovered = false,
    order = 1,
    min_ante = 3,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == "store_joker_create" then
            local ivalue = 1
            local _pool, _pool_key = get_current_pool("Joker", tag.config.extra.rarity, nil, tag.config.key)
            local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
            while center == "UNAVAILABLE" or not SMODS.Stickers[tag.config.extra.sticker]:should_apply(nil, G.P_CENTERS[center], context.area, true) do
                ivalue = ivalue + 1
                center = pseudorandom_element(_pool, pseudoseed(_pool_key .. "_resample" .. ivalue))
            end
            local card = create_card("Joker", context.area, nil, nil, nil, nil, center)
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            tag:yep('+', G.C.GREEN,function() 
                card:start_materialize()
                card.ability.couponed = true
                card:add_sticker(tag.config.extra.sticker, true)
                card:set_cost()
                return true
            end)
            tag.triggered = true
			      return card
        end
    end,
}
return {name = "Tags", items = {unusual_tag}}
