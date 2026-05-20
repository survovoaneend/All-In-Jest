local gematria = {
    object_type = "Joker",
    order = 299,
    key = "gematria",
    config = {
      extra = {
          mult_mod = 10,
          mult = 0,
          should_trigger = false
      }
    },
    rarity = 1,
    pos = { x = 21, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local mult = card.ability.extra.should_trigger and card.ability.extra.mult or 0
        return {
            vars = {
                card.ability.extra.mult_mod,
                mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        local available_hands = {}
        local joker_hands = {}
        for _, k in ipairs(G.handlist) do
            local hand = G.GAME.hands[k]
            if hand.visible or k == "aij_Royal Flush" then
                available_hands[#available_hands + 1] = k
            end
        end
        for _, k in ipairs(available_hands) do
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    local text = retrieve_joker_text(G.jokers.cards[i])
                    local like_hands = {}
                    local should_add = true
                    for _, v in ipairs(available_hands) do
                        if (v:find(k) or v:find(localize(k, 'poker_hands'))) and v ~= k then
                            like_hands[#like_hands + 1] = v
                        end
                    end
                    for _, v in ipairs(like_hands) do
                        if text:find(v) or text:find(localize(v, 'poker_hands')) then
                            should_add = false
                        end
                    end
                    if (text:find(k) or text:find(localize(k, 'poker_hands'))) and should_add then
                        for j = 1, #joker_hands do
                            if k == joker_hands[j] then
                                should_add = false
                            end
                        end
                        if should_add then
                            table.insert(joker_hands, k)
                        end
                    end
                end
            end
        end
        local trigger = false
        for j = 1, #joker_hands do
            if context.scoring_name == joker_hands[j] then
                trigger = true
            end
        end
        if trigger then
            card.ability.extra.should_trigger = true
            card.ability.extra.mult = card.ability.extra.mult_mod
        else
            card.ability.extra.should_trigger = false
        end
        if context.joker_main and card.ability.extra.should_trigger then
            local mult_val = card.ability.extra.mult
            card.ability.extra.mult = 0
            return {
                mult = mult_val
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {gematria} }
