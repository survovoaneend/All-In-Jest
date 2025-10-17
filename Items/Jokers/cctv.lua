local cctv = {
    object_type = "Joker",
    order = 36,

    key = "cctv",
    config = {
      extra = {
        money = 5,
      }
    },
    rarity = 2,
    pos = { x = 9, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return {
            vars = {
                card.ability.extra.money,
            }
        }
    end,

    in_pool = function(self, args)
        local glasses = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center == G.P_CENTERS.m_glass then
                    glasses = glasses + 1
                end
            end
        end
        if glasses >= 3 then
            return true
        else
            return false
        end
    end,
  
    calculate = function(self, card, context)
      if context.removed then
        local glass_shattered = 0
        for d = 1, #context.removed do
            if context.removed[d].config.center == G.P_CENTERS.m_glass and context.removed[d].shattered then
                if G.hand and G.hand.cards then
                    local valid_cards = {}
                    for i, v in ipairs(G.hand.cards) do
                        if not (v.config.center == G.P_CENTERS.m_glass) then
                            table.insert(valid_cards, i)
                        end
                    end
                    local index = 0
                    if #valid_cards > 0 and #G.hand.cards > 0 then
                        index = valid_cards[math.random(#valid_cards)]
                        G.hand.cards[index]:set_ability(G.P_CENTERS.m_glass, nil, true) 
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                if G.hand.cards[index] and not G.hand.cards[index].removed then
                                    G.hand.cards[index]:juice_up()
                                end
                                return true
                            end
                        }))
                    end
                end
                glass_shattered = glass_shattered + 1
            end
        end
        if glass_shattered > 0 then
            return {
                card = card,
                dollars = card.ability.extra.money * glass_shattered,
            }
        end
      end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { ref_table = "card.joker_display_values", ref_value = "active" }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE, retrigger_type = "mult" },
                { text = ")" },
            },
            calc_function = function(card)
                local active = false
                local played_hand = JokerDisplay.current_hand
                for _, played_card in pairs(played_hand) do
                    if played_card.ability.name and played_card.ability.name == 'Glass Card' then
                        active = true
                        break
                    end
                end
                card.joker_display_values.active = active and localize("k_active_ex") or localize("jdis_inactive")
                card.joker_display_values.localized_text = localize { type = 'name_text', set = 'Enhanced', key = 'm_glass' }
            end
        }
    end,
}
return { name = {"Jokers"}, items = {cctv} }
