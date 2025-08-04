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
    blueprint_compat = false,
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
      if context.removed and not context.blueprint then
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
    end
}
return { name = {"Jokers"}, items = {cctv} }
