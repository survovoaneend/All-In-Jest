local handsome_joker = {
    object_type = "Joker",
    order = 7,

    key = "handsome_joker",
    config = {
      extra = {
          xmult_mod = 1,
          card = {
              suit = "",
              rank = "",
              enhancement = ""
          }
      }
    },
    rarity = 3,
    pos = { x = 5, y = 0 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local card_text = "card"
        if card.ability.extra.card.suit ~= "" then
            local mult = 1
            local trigger = false
            local enhancement = (G.P_CENTER_POOLS.Enhanced[tonumber(card.ability.extra.card.enhancement)].original_key or G.P_CENTER_POOLS.Enhanced[tonumber(card.ability.extra.card.enhancement)].name):gsub("^(%a)", string.upper)
            local rank = SMODS.Ranks[card.ability.extra.card.rank].original_key
            local suit = SMODS.Suits[card.ability.extra.card.suit].original_key:gsub("^(%a)", string.upper)
            card_text = enhancement:gsub(" [Cc][Aa][Rr][Dd]", "").." "..rank.." of "..suit
            mult = 1
            for k, v in ipairs(G.playing_cards) do
                if v:is_suit(card.ability.extra.card.suit) and v:get_id() == SMODS.Ranks[card.ability.extra.card.rank].id then
                    trigger = false
                    for ke, va in pairs(SMODS.get_enhancements(v)) do
                        if ke == G.P_CENTER_POOLS.Enhanced[tonumber(card.ability.extra.card.enhancement)].key then
                            trigger = true
                        end
                    end
                    if trigger then
                        mult = mult + card.ability.extra.xmult_mod
                    end
                end
            end
        end
        if card_text == 'card' then
            mult = 1
        end
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card_text,
                mult or 1,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.card.suit = tostring(pseudorandom_element(SMODS.Suits, pseudoseed('jest_handsome_joker'..G.GAME.round_resets.ante)).key)
        card.ability.extra.card.rank = tostring(pseudorandom_element(SMODS.Ranks, pseudoseed('jest_handsome_joker'..G.GAME.round_resets.ante)).key)
        card.ability.extra.card.enhancement = tostring(pseudorandom_element(G.P_CENTER_POOLS.Enhanced, pseudoseed('jest_handsome_joker'..G.GAME.round_resets.ante)).order - 1)
        local var = 0
        while G.P_CENTER_POOLS.Enhanced[tonumber(card.ability.extra.card.enhancement)].key == 'm_stone' do
            var = var + 1
            card.ability.extra.card.enhancement = tostring(pseudorandom_element(G.P_CENTER_POOLS.Enhanced, pseudoseed('jest_handsome_joker_resample'..G.GAME.round_resets.ante..var)).order - 1)
        end
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            local mult = 1
            for k, v in ipairs(G.playing_cards) do
                if v:is_suit(card.ability.extra.card.suit) and v:get_id() == SMODS.Ranks[card.ability.extra.card.rank].id then
                    local trigger = false
                    for ke, va in pairs(SMODS.get_enhancements(v)) do
                        if ke == G.P_CENTER_POOLS.Enhanced[tonumber(card.ability.extra.card.enhancement)].key then
                            trigger = true
                        end
                    end
                    if trigger then
                        mult = mult + card.ability.extra.xmult_mod
                    end
                end
            end
            return {
                xmult = mult
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {handsome_joker} }