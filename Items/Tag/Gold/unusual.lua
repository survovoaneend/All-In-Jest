local unusual_tag = {
    object_type = "Tag",
    key = 'unusual',

    pos = { x = 9, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'uncommon',
        }
    },

    discovered = false,
    order = 1,
    min_ante = 3,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == "store_joker_create" then
			local rares_in_posession = {0}
            for k, v in ipairs(G.jokers.cards) do
                if v.config.center.rarity == 2 and not rares_in_posession[v.config.center.key] then
                    rares_in_posession[1] = rares_in_posession[1] + 1 
                    rares_in_posession[v.config.center.key] = true
                end
            end
            local card
            if #G.P_JOKER_RARITY_POOLS[2] > rares_in_posession[1] then 
                card = create_card('Joker', context.area, nil, 0.9, nil, nil, nil, 'rta')
                create_shop_card_ui(card, 'Joker', context.area)
                card.states.visible = false
                tag:yep('+', G.C.GREEN,function() 
                    card:start_materialize()
                    card.ability.couponed = true
                    jest_ability_calculate(
                        card,
                        "*", 2,
                        { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                        nil, true, "ability.extra"
                    )
                    card:set_cost()
                    return true
                end)
            else
                tag:nope()
            end
            tag.triggered = true
			return card
		end
    end,
}
return {name = "Tags", items = {unusual_tag}}
