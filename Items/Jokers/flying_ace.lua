local flying_ace = {
    object_type = "Joker",
    order = 0,

    key = "flying_ace",
    config = {
      extra = {
        dollar_gain = 2,
        dollars = 0,
        aces = {}
      }
    },
    rarity = 1,
    pos = { x = 0, y = 0 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollar_gain,
                card.ability.extra.dollars
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and not context.blueprint and not context.repetition then
            if context.cardarea == G.play and not context.other_card.debuff then
                if context.other_card:get_id() == 14 then
                    local current_suit = context.other_card.base.suit
                    if current_suit and not card.ability.extra.aces[current_suit] then
                        card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollar_gain
                        card.ability.extra.aces[current_suit] = true
                    end
                end
            end
        end
        if context.cashing_out and not context.blueprint then
            card.ability.extra.aces = {}
            card.ability.extra.dollars = 0
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.dollars > 0 then
            local dollar_bonus = card.ability.extra.dollars
            return dollar_bonus
        end
    end
}
return { name = {"Jokers"}, items = {flying_ace} }
