local fourwarning = {
  object_loader = Partner_API,
  object_type = "Partner",
  order = 1,

  key = "fourwarning",
  config = {
    extra = {
      chips = 0,
      chip_mod = 4,
    }
  },
  pos = { x = 1, y = 0},
  atlas = 'partner_atlas',
  unlocked = false,
  discovered = true,
  link_config = {j_aij_tetraphobia = 1},
  loc_vars = function(self, info_queue, card)
    local link_level = self:get_link_level()
    local benefits = 1
    if link_level == 1 then benefits = 4 end
    return {
      vars = {
        card.ability.extra.chip_mod * benefits,
        card.ability.extra.chips
      }
    }
  end,
  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_aij_tetraphobia" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,
  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.chips >= 1 then
        return {
            message = localize{type = "variable", key = "a_chips", vars = {card.ability.extra.chips}},
            chip_mod = card.ability.extra.chips,
            colour = G.C.CHIPS
        }
    end
    if context.pre_discard and context.full_hand then
        local trigger = false
        for k, v in pairs(context.full_hand) do
            if v:get_id() == 4 and not v.debuff then
                trigger = true
            end
        end
        if trigger then
            local link_level = self:get_link_level()
            local benefits = 1
            if link_level == 1 then benefits = 4 end
            card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chip_mod * benefits)
            card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("k_upgrade_ex"), colour = G.C.CHIPS})
        end
    end
  end
}
if next(SMODS.find_mod("partner")) then
    return { name = {"Partners"}, items = {fourwarning} }
end