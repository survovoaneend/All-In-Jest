local gnasher = {
  object_type = "Joker",
  order = 166,

  key = "gnasher",
  config = {
    extra = {
        trigger = true,
    }
  },
  rarity = 2,
  pos = { x = 10, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  all_in_jest = {
    can_use_ability = function(self, card, context)
        local viable_options = {}
        for k, v in pairs(G.consumeables.cards) do
            if G.consumeables.cards[k]:can_use_consumeable() then
                viable_options[#viable_options+1] = k
            end
        end
        if card.ability.extra.trigger and #viable_options > 0 then
            return true
        end
    end,

    use_ability = function(self, card)
        local viable_options = {}
        for k, v in pairs(G.consumeables.cards) do
            if G.consumeables.cards[k]:can_use_consumeable() then
                viable_options[k] = k
            end
        end
        local used_consumeable = copy_card(G.consumeables.cards[pseudorandom_element(viable_options, pseudoseed('gnasher_consumeable'))])
        used_consumeable:use_consumeable(used_consumeable.area)
        used_consumeable:start_dissolve()
        card.ability.extra.trigger = false
    end,
  },
  
  loc_vars = function(self, info_queue, card) 
    local active_text = ""
    if not card.ability.extra.trigger then 
        active_text = localize('k_inactive')
    else
        active_text = localize('k_active')
    end
    return {
        vars = {
            active_text,
            colours = { 
                G.C.SECONDARY_SET.Enhanced
            }
        }
    }
  end,

  calculate = function(self, card, context)
    if context.ante_end then
        card.ability.extra.trigger = true
    end
  end
}
return { name = {"Jokers"}, items = {gnasher} }
