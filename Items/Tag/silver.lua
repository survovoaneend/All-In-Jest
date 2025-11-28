local silver = {
    object_type = "Tag",
    key = 'silver', 
    pos = { x = 1, y = 1},
    atlas = 'tag_atlas',
    order = 3, -- Works because of alphabetical sorting of those with same order
    min_ante = 2,
    config = {type = 'store_joker_modify', edition = 'aij_silver'},
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = G.P_CENTERS.e_aij_silver
        return {}
    end,

    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local card
            card = create_card('Joker', context.area, nil, nil, nil, nil, nil, 'silverta')
            local function contains_number(table)
                for k, v in pairs(table) do
                    if type(v) == "number" and v ~= 0 then
                        return true
                    elseif type(v) == "table" then
                        if contains_number(v) then
                            return true
                        end
                    end
                end
                return false
            end
            local modifyable = false
            if contains_number(card.config.center.config) then
                modifyable = true
            end
            local ivalue = 1
            while not modifyable do
                card:remove()
                card = create_card('Joker', context.area, nil, nil, nil, nil, nil, 'silverta'..ivalue)
                if contains_number(card.config.center.config) then
                    modifyable = true
                end
                ivalue = ivalue + 1
            end
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            card:start_materialize()
            return card
        end
        if context.type == 'store_joker_modify' then
            local applied = nil
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true

                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION,function()
                    context.card:set_edition({aij_silver = true}, true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    context.card.temp_edition = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                applied = true

                tag.triggered = true
            end
            return applied
        end
    end,
}
return {name = "Tags", items = {silver}}