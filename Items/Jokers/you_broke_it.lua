local you_broke_it = {
  object_type = "Joker",
  order = 2,

  key = "you_broke_it",
  config = {
    extra = {

    }
  },
  rarity = 2,
  pos = { x = 24, y = 8 },
  atlas = 'joker_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS[G.GAME.current_round.jest_you_broke_it_card.enhancement]
    return {
      vars = {
        localize(G.GAME.current_round.jest_you_broke_it_card and G.GAME.current_round.jest_you_broke_it_card.rank or 'Ace', 'ranks'),
        localize{type = 'name_text', set = 'Enhanced', key = G.GAME.current_round.jest_you_broke_it_card and G.GAME.current_round.jest_you_broke_it_card.enhancement or 'm_bonus'},
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local enhanced_a_card = false
      local message_text = localize { type = 'name_text', set = 'Enhanced', key = G.GAME.current_round.jest_you_broke_it_card and G.GAME.current_round.jest_you_broke_it_card.enhancement or 'm_bonus' }
      if context.scoring_hand and #context.scoring_hand > 0 then
        for k, v in ipairs(context.scoring_hand) do
          if v:get_id() == G.GAME.current_round.jest_you_broke_it_card.id and v.debuff then
            v:set_ability(G.P_CENTERS[G.GAME.current_round.jest_you_broke_it_card.enhancement], nil, true)
            enhanced_a_card = true
            G.E_MANAGER:add_event(Event({
              func = function()
                if v and not v.removed then
                  v:juice_up()
                end
                return true
              end
            }))
          end
        end
      end

      if enhanced_a_card then
        return {
          message = message_text,
          card = card
        }
      end
    end
    if context.end_of_round then
      reset_jest_you_broke_it_card()
    end
  end,


}
return { name = { "Jokers" }, items = { you_broke_it } }
