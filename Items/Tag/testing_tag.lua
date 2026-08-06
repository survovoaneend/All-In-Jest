local testing_tag = {
    object_type = "Tag",
    key = 'testing_tag', 
    pos = { x = 0, y = 0},
    atlas = 'tag_atlas',
    order = 343, -- Works because of alphabetical sorting of those with same order
    min_ante = 2,
    config = {type = 'store_joker_create'},
    ignore = true,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = G.P_CENTERS.e_aij_silver
        return {}
    end,

    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local joker_key = 'j_aij_'..'czar'
            local card
            card = create_card('Joker', context.area, nil, nil, nil, nil, joker_key, 'testing_tagta')
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            card:start_materialize()
            return card
        end
    end,
}
return {name = "Tags", items = {testing_tag}}