local negative_nancy = {
  object_type = "Joker",
  order = 20,

  key = "negative_nancy",

  rarity = 2,
  pos = { x = 18, y = 0 },
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    if not card.edition or (card.edition and not card.edition.negative) then
      info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end
    return {}
  end,

  calculate = function(self, card, context)
    return nil
  end
}

SMODS.Edition:take_ownership('e_negative', {
  get_weight = function(self)
      local weight = self.weight
      local nancy_jokers = SMODS.find_card('j_aij_negative_nancy', false) -- false = don't count debuffed
      local nellie_amt = 0
      local link_level = 0
      if G.GAME.selected_partner_card then
          nellie_amt = G.GAME.selected_partner_card.config.center.key == 'pnr_aij_nellie' and G.GAME.selected_partner_card.ability.extra.edition_rate or 0
          link_level = G.GAME.selected_partner_card.config.center:get_link_level()
      end
      local benefits = 1
      if link_level == 1 then benefits = 2.5 end

      if #nancy_jokers > 0 or nellie_amt > 0 then
          weight = weight * ((5 * #nancy_jokers) + (nellie_amt * benefits))
      end
      
      return weight
  end
}, true)
return { name = {"Jokers"}, items = {negative_nancy} }
