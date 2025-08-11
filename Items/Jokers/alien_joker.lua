local alien_joker = {
    object_type = "Joker",
    order = 338,
    key = "alien_joker",
    config = {
      extra = {
          xmult = 3,
      }
    },
    rarity = 2,
    pos = { x = 9, y = 13},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.hand_drawn then
            local temp_card = pseudorandom_element(G.hand.cards, pseudoseed('bad_sun'))
            temp_card.ability.alien_joker_highlight = true
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.alien_joker_highlight then
                SMODS.calculate_effect({xmult = card.ability.extra.xmult}, context.other_card)
                context.other_card.ability.alien_joker_highlight = nil
            end
        end
        if context.discard then
            if context.other_card.ability.alien_joker_highlight then
                context.other_card.ability.alien_joker_highlight = nil
            end
        end
    end,

    update = function(self, card, dt)
        if G.hand then
            for i = 1, #G.hand.cards do
                if G.hand.cards[i].ability.alien_joker_highlight and not G.hand.cards[i].highlighted then
                    G.hand:add_to_highlighted(G.hand.cards[i])
                end
            end
        end
    end,
  
}
return { name = {"Jokers"}, items = {alien_joker} }
