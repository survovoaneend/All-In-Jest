local totally_nuts = {
    object_type = "Joker",
    order = 239,
    key = "totally_nuts",
    config = {
      extra = { consumable_slots = "3" }
    },
    rarity = 1,
    pos = { x = 7, y = 9},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
        return { vars = {tonumber(card.ability.extra.consumable_slots)}}
    end,
  
    calculate = function(self, card, context)
      if context.selling_card then
        for _, card_type in ipairs(SMODS.ConsumableType.ctype_buffer) do
            if context.card.ability.set == card_type then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_eaten_ex'),colour = G.C.FILTER})
                card:start_dissolve()
            end
        end
      end
    end,
    add_to_deck = function(self, card, from_debuff)
      G.consumeables.config.card_limit = G.consumeables.config.card_limit + tonumber(card.ability.extra.consumable_slots)
    end,
    remove_from_deck = function(self, card, from_debuff)
      G.consumeables.config.card_limit = G.consumeables.config.card_limit - tonumber(card.ability.extra.consumable_slots)
    end
}
return { name = {"Jokers"}, items = {totally_nuts} }
