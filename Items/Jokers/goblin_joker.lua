local goblin_joker = {
    object_type = "Joker",
    order = 93,

    key = "goblin_joker",
    config = {
      extra = {
          draw_extra = 2,
          trigger = false
      }
    },
    rarity = 3,
    pos = { x = 13, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.draw_extra,
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.pre_discard and context.cardarea ~= G.play then
        card.ability.extra.trigger = true
      end
      if (context.hand_drawn or G.hand.config.card_limit < G.hand.config.card_count) and card.ability.extra.trigger then
        for i = 1, card.ability.extra.draw_extra do
            if #G.deck.cards > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                    draw_card(G.deck,G.hand, 90,'up', nil)
                    return true
                    end
                }))
            end
        end
        card.ability.extra.trigger = false
      end
    end
  
}
return { name = {"Jokers"}, items = {goblin_joker} }
