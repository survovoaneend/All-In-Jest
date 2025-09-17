local simply = {
  object_loader = Partner_API,
  object_type = "Partner",
  order = 0,

  key = "simply",
  config = {
    extra = {
      mult = 0,
      mult_mod = 1,
    }
  },
  pos = { x = 0, y = 0},
  atlas = 'partner_atlas',
  unlocked = false,
  discovered = true,
  link_config = {j_aij_simple_simon = 1},
  loc_vars = function(self, info_queue, card)
    local link_level = self:get_link_level()
    local benefits = 1
    if link_level == 1 then benefits = 3 end
    return {
      vars = {
        card.ability.extra.mult_mod * benefits,
        card.ability.extra.mult
      }
    }
  end,
  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_aij_simple_simon" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,

  calculate = function(self, card, context)
    if context.end_of_round and not context.individual and not context.repetition then
      local link_level = self:get_link_level()
      local benefits = 1
      if link_level == 1 then benefits = 3 end
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod*benefits
      card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("k_upgrade_ex"), colour = G.C.MULT})
    end
    if context.joker_main then
      return {
          mult = card.ability.extra.mult,
      }
    end
    if context.joker_main and card.ability.extra.mult >= 1 then
      return {
          message = localize{type = "variable", key = "a_mult", vars = {card.ability.extra.mult}},
          mult_mod = card.ability.extra.mult,
          colour = G.C.MULT
      }
    end
  end
}
if next(SMODS.find_mod("partner")) then
    return { name = {"Partners"}, items = {simply} }
end