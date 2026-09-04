
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- Functions used for jokers that show some number of cards in the deck
-- E.g: Touchstone
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

AllInJest.touchstone_deck_preview = function()
    local max_future_sense = 0
    if G.jokers and G.jokers.cards then
        for _, area in ipairs(SMODS.get_card_areas('jokers')) do
            if area.cards then
                for _, v in pairs(area.cards) do
                    if v and type(v) == 'table' and not v.debuff then
                        if v.ability.future_sense and not v.debuff then
                            max_future_sense = math.max(max_future_sense, v.ability.future_sense)
                        end
                        if v.ability[v.config.center.key] and v.ability[v.config.center.key].copied_joker_abilities then
                            for index = #v.ability[v.config.center.key].copied_joker_abilities, math.max(1, #v.ability[v.config.center.key].copied_joker_abilities - v.ability[v.config.center.key].copy_limit + 1), -1 do
                                max_future_sense = math.max(max_future_sense, v.ability[v.config.center.key].copied_joker_abilities[index].future_sense)
                            end
                        end
                    end
                end
            end
        end
    end
    local cards = {}
    for i = #G.deck.cards, #G.deck.cards - max_future_sense + 1, -1 do
        if i > 0 then
            local card = copy_card(G.deck.cards[i], nil, nil, G.playing_card)

            -- Re-adds negative to preview if it was stripped by the mod
            if G.deck.cards[i].edition and G.deck.cards[i].edition.negative and not All_in_Jest.config.no_copy_neg then
                card:set_edition({negative = true}, nil, true)
            end

            card.facing = 'front' -- Using .flip() here plays the flipping animation

            table.insert(cards, card)
        end
    end
    return AllInJest.card_area_preview(nil, nil, {
        override = true,
        cards = cards,
        w = 5,
        h = 0.4,
        ml = 0,
        scale = 0.4,
        padding = 0,
    })
end

AllInJest.card_area_preview = function(cardArea, desc_nodes, config)
    if not config then config = {} end
    local height = config.h or 1.25
    local width = math.max(config.w or 1, 1)
    local card_limit = config.card_limit or #config.cards or 1
    local override = config.override or false
    local cards = config.cards or {}
    local padding = config.padding or 0.07
    local margin_left = config.ml or 0
    local margin_top = config.mt or 0
    local alignment = config.alignment or "cm"
    local scale = config.scale or 1
    local type = config.type or "title_2"
    local box_height = config.box_height or 0
    local highlight_limit = config.highlight_limit or 0
    local x_offset = config.x_offset or 0
    if override or not cardArea then
        cardArea = CardArea(
            G.ROOM.T.x + margin_left * G.ROOM.T.w - x_offset, 
            G.ROOM.T.h + margin_top,
            width * G.CARD_W,
            height * G.CARD_H,
            {card_limit = card_limit, type = type, highlight_limit = highlight_limit, collection = true, temporary = true}
        )
        for _, card in ipairs(cards) do
            card.T.w = card.T.w * scale
            card.T.h = card.T.h * scale
            card.VT.h = card.T.h
            card.VT.h = card.T.h
            local area = cardArea
            if(card.config.center) then
                card:set_sprites(card.config.center, card.config.card)
            end
            area:emplace(card)
        end
    end
    local uiEX = {
        n = G.UIT.R,
        config = { align = alignment, padding = padding, no_fill = true, minh = box_height },
        nodes = {
            {n=G.UIT.R, config={padding = padding, r = 0.12, colour = lighten(G.C.JOKER_GREY, 0.5), emboss = 0.07}, nodes={
                {n = G.UIT.O, config = { object = cardArea }}
            }}
        }
    }
    if cardArea then
        if desc_nodes then
            desc_nodes[#desc_nodes+1] = {
                uiEX
            }
        end
    end
    return uiEX
end