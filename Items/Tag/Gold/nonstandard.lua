local nonstandard_tag = {
    object_type = "Tag",
    key = 'nonstandard',

    pos = { x = 6, y = 2 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'standard',
        },
    },

    discovered = false,
    order = 10,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:yep('+', G.C.DARK_EDITION, function()
                local function deep_copy(orig)
                    local orig_type = type(orig)
                    local copy
                    if orig_type == 'table' then
                        copy = {}
                        for k, v in pairs(orig) do
                            copy[deep_copy(k)] = deep_copy(v)
                        end
                        setmetatable(copy, deep_copy(getmetatable(orig)))
                    else
                        copy = orig
                    end
                    return copy
                end
                local cards = {Suits = {}, Ranks = {}, Seals = {}}
                local temp_card = create_card("Base", G.play, nil, nil, true, nil, nil, 'nonsta')
                local index = 0
                for k, v in pairs(SMODS.Suits) do
                    index = index + 1
                    local new_code = SMODS.Suits[v.key].card_key
                    local new_val = SMODS.Ranks['Ace'].card_key
                    local new_card = G.P_CARDS[new_code..'_'..new_val]

                    local cur_card = copy_card(temp_card)

                    cur_card:set_base(new_card)
                    cur_card.config.center.order = v.key
                    cards.Suits[v.key] = deep_copy(cur_card.config.center)
                    cur_card:remove()
                end
                index = 0
                for k, v in pairs(SMODS.Ranks) do
                    index = index + 1
                    local new_code = SMODS.Suits['Spades'].card_key
                    local new_val = SMODS.Ranks[v.key].card_key
                    local new_card = G.P_CARDS[new_code..'_'..new_val]

                    local cur_card = copy_card(temp_card)

                    cur_card:set_base(new_card)
                    cur_card.config.center.order = v.key
                    cards.Ranks[v.key] = deep_copy(cur_card.config.center)
                    cur_card:remove()
                end
                temp_card:remove()
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.SETTINGS.paused = true
                        G.FUNCS.overlay_menu{
                            config = {}, 
                            definition = SMODS.jest_no_back_card_collection_UIBox(
                                cards.Suits, 
                                {4}, 
                                {
                                    no_materialize = true, 
                                    hide_single_page = true,
                                    collapse_single_page = true,
                                    modify_card = function(card, center) 
                                        if card.config.center.discovered then
                                            for k, v in pairs(SMODS.Suits) do
                                                if v.key == center.order then
                                                    local new_code = SMODS.Suits[v.key].card_key
                                                    local new_val = SMODS.Ranks['Ace'].card_key
                                                    local new_card = G.P_CARDS[new_code..'_'..new_val]

                                                    card:set_base(new_card)
                                                end
                                            end
                                            jest_create_select_playing_card_ui(card, G.deck, {
                                                following = 4,
                                                pools = {
                                                    cards.Ranks,
                                                    G.P_CENTER_POOLS.Enhanced,
                                                    G.P_CENTER_POOLS.Seal,
                                                    G.P_CENTER_POOLS.Edition,
                                                },
                                                size = {
                                                    x = {6,4,5,5}, 
                                                    y = {6,4,5,5}
                                                },
                                                copies = 2,
                                                playing_card = true,
                                                extra_function = function(extra_card, extra_center, prev_card, extra_data)
                                                    if extra_data.times == 1 then
                                                        for k, v in pairs(SMODS.Ranks) do
                                                            if v.key == extra_center.order then
                                                                local new_code = SMODS.Suits[prev_card.base.suit].card_key
                                                                local new_val = SMODS.Ranks[v.key].card_key
                                                                local new_card = G.P_CARDS[new_code..'_'..new_val]

                                                                extra_card:set_base(new_card)
                                                            end
                                                        end
                                                    end
                                                    if extra_data.times >= 2 then
                                                        for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
                                                            local new_code = SMODS.Suits[prev_card.base.suit].card_key
                                                            local new_val = SMODS.Ranks[prev_card.base.value].card_key
                                                            local new_card = G.P_CARDS[new_code..'_'..new_val]

                                                            extra_card:set_base(new_card)
                                                        end
                                                        extra_data.center = 'c_base'
                                                    end
                                                    if extra_data.times == 3 then
                                                        extra_card:set_ability(G.P_CENTERS[prev_card.config.center.key])
                                                        extra_card:set_seal(extra_center.key, true)
                                                    end
                                                    if extra_data.times == 4 then
                                                        extra_card:set_ability(G.P_CENTERS[prev_card.config.center.key])
                                                        extra_card:set_seal(prev_card.seal, true)
                                                        if extra_center.discovered then extra_card:set_edition(extra_center.key, true, true) end
                                                        extra_card.ability.jest_copy_edition = true
                                                    end
                                                end,
                                            })
                                        end
                                    end, 
                                    h_mod = 1.05,
                                }
                            ),
                        }
                        return true 
                    end 
                }))
                return true
            end)

            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {nonstandard_tag}}