local recherche_tag = {
    object_type = "Tag",
    key = 'recherche',

    pos = { x = 7, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'rare',
        }
    },

    discovered = false,
    order = 2,
    min_ante = 3,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == "store_joker_create" then
			local rares_in_posession = {0}
            for k, v in ipairs(G.jokers.cards) do
                if v.config.center.rarity == 3 and not rares_in_posession[v.config.center.key] then
                    rares_in_posession[1] = rares_in_posession[1] + 1 
                    rares_in_posession[v.config.center.key] = true
                end
            end
            local card
            if #G.P_JOKER_RARITY_POOLS[3] > rares_in_posession[1] then 
                card = create_card('Joker', context.area, nil, 1, nil, nil, nil, 'rta')
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
                    card = create_card('Joker', context.area, nil, 1, nil, nil, nil, 'rta'..ivalue)
                    if contains_number(card.config.center.config) then
                        modifyable = true
                    end
                    ivalue = ivalue + 1
                end
                create_shop_card_ui(card, 'Joker', context.area)
                card.states.visible = false
                tag:yep('+', G.C.RED,function() 
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
return {name = "Tags", items = {recherche_tag}}
