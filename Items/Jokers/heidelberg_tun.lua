local heidelberg_tun = {
  object_type = "Joker",
  order = 127,

  key = "heidelberg_tun",
  config = {
    extra = {
      odds = 2,
      active = true
    }
  },
  rarity = 2,
  pos = { x = 21, y = 4 },
  atlas = 'joker_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
    local active_text = "("..localize('k_active')..")"
        if not card.ability.extra.active then 
            active_text = "("..localize('k_inactive')..")"
        else
            active_text = "("..localize('k_active')..")"
        end
        return { vars = {active_text}}
  end,

  calculate = function(self, card, context)
    if context.buying_card and context.card and context.card.ability.consumeable and not context.blueprint and card.ability.extra.active then
      local bought_card = context.card
      if not bought_card.edition then
        G.E_MANAGER:add_event(Event({
          func = function()
            if bought_card and not bought_card.removed then
              card:juice_up()
              bought_card:set_edition({ negative = true }, true)
              card.ability.extra.active = false
            end
            return true
          end
        }))
        return true
      end
    end
    if context.starting_shop and not context.blueprint then
      card.ability.extra.active = true
    end
    return nil
  end
}
return { name = { "Jokers" }, items = { heidelberg_tun } }
