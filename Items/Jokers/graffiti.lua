local graffiti = {
    object_type = "Joker",
    order = 403,

    key = "graffiti",
    config = {
      extra = {
          base_cost = 5,
          cost = 5,
          cost_increase = 1.5,
      }
    },
    rarity = 2,
    pos = { x = 19, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    all_in_jest = {
        ability_cost = function(self, card)
            return card.ability.extra.cost
        end,

        can_use_ability = function(self, card, context)
            if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_dollars(-card.ability.extra.cost)
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "cost",
                scalar_value = "cost_increase",
                operation = 'X',
                no_message = true,
            })
            card.ability.extra.cost = math.ceil(card.ability.extra.cost)
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    jest_add_tag(jest_poll_tag("graffiti"))
                    return true
                end)
            }))
            card:juice_up(0.4, 0.4)
            play_sound('tarot1')
        end,
    },

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or 0
        end
    end,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cost,
                card.ability.extra.cost_increase,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss then
            if card.ability.extra.cost ~= card.ability.extra.base_cost then
                card.ability.extra.cost = card.ability.extra.base_cost
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reset')})
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {graffiti} }