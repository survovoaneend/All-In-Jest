local the_mycologists = {
  object_type = "Joker",
  order = 47,

  key = "the_mycologists",
  config = {
    poker_hand = "Pair",
    -- added = false
  },
  rarity = 3,
  pos = { x = 18, y = 1 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return { vars = { localize(card.ability.poker_hand, 'poker_hands') } }
  end,

  calculate = function(self, card, context)
    if context.all_in_jest and context.all_in_jest.before_after and not context.blueprint then
      if context.scoring_name == card.ability.poker_hand and #context.full_hand == 2 then
        local cards = G.play.cards
        -- if card.ability.added == false then
          -- card.ability.added = true
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
              cards[1].ability.perma_bonus = cards[1].ability.perma_bonus + (cards[2].base.nominal + cards[2].ability.perma_bonus)
              if cards[2].config.center ~= G.P_CENTERS.c_base then
                  cards[1]:set_ability(cards[2].config.center)
              end
              if cards[2].edition ~= nil then
                cards[1]:set_edition(cards[2].edition, true, true)
              end
              SMODS.destroy_cards(cards[2], nil, true)
              return true
            end
          }))
          return {
            message = localize("k_aij_two_into_one_ex"),
            sound = 'slice1'
          }
        -- end
      end
    end
    -- if not context.blueprint and context.destroying_card and #context.full_hand == 2 then
    --   local cards = G.play.cards
    --   if context.destroying_card == cards[2] and card.ability.added == true then
    --     return { remove = true }
    --   end
    -- end
    -- if context.hand_drawn then
    --   card.ability.added = false
    -- end
  end
}
return { name = { "Jokers" }, items = { the_mycologists } }
