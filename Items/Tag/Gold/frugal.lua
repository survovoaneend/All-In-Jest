local frugal_tag = {
    object_type = "Tag",
    key = 'frugal',

    pos = { x = 5, y = 0 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'coupon',
        },
    },

    discovered = false,
    order = 17,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        if context.type == 'shop_final_pass' then
            if (G.shop and not G.GAME.shop_free and not G.GAME.jest_shop_perma_free) then
                G.GAME.jest_shop_perma_free = true
                tag:yep('+', G.C.GREEN,function() 
                    if G.shop_jokers and G.shop_booster then 
                        for k, v in pairs(G.shop_jokers.cards) do
                            v.ability.couponed = true
                            v:set_cost()
                        end
                        for k, v in pairs(G.shop_booster.cards) do
                            v.ability.couponed = true
                            v:set_cost()
                        end
                    end
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
}
return {name = "Tags", items = {frugal_tag}}
