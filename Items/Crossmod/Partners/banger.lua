local banger = {
  object_loader = Partner_API,
  object_type = "Partner",
  order = 4,

  key = "banger",
  config = {
    extra = {
      reroll_cost = 1,
      prev_discount = "0"
    }
  },
  pos = { x = 0, y = 1},
  atlas = 'partner_atlas',
  unlocked = false,
  discovered = true,
  link_config = {j_aij_silly_sausage = 1},
  loc_vars = function(self, info_queue, card)
    local link_level = self:get_link_level()
    local benefits = 1
    if link_level == 1 then benefits = 5 end
    return {
      vars = {
        card.ability.extra.reroll_cost * benefits,
      }
    }
  end,
  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_aij_silly_sausage" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,
  calculate_begin = function(self, card)
      G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.reroll_cost
      G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.reroll_cost)
      card.ability.extra.prev_discount = tostring(card.ability.extra.reroll_cost)
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint and context.main_eval then
        local link_level = self:get_link_level()
        local benefits = 1
        if link_level == 1 then benefits = 5 end
        local discount_this_round = card.ability.extra.reroll_cost * benefits
        if card.ability.extra.reroll_cost > 0 then
            if tonumber(card.ability.extra.prev_discount) ~= card.ability.extra.reroll_cost then
                local removeamt = card.ability.extra.reroll_cost - tonumber(card.ability.extra.prev_discount) 
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - removeamt
                G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - removeamt)
            end
            G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + discount_this_round
            G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + discount_this_round)
            card.ability.extra.reroll_cost = card.ability.extra.reroll_cost

            G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.reroll_cost
            G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.reroll_cost)
            card.ability.extra.prev_discount = tostring(card.ability.extra.reroll_cost)
            calculate_reroll_cost(true)
        end
    end
  end
}
if next(SMODS.find_mod("partner")) then
    return { name = {"Partners"}, items = {banger} }
end