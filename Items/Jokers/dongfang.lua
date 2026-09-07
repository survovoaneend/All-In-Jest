local dongfang = {
    object_type = "Joker",
    order = 1032,

    key = "dongfang",
    config = {
      extra = { 
          triggers = 2,
          total_triggers = 2
      }
    },
    attributes = { 'retrigger', 'planet', 'consumable', },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 1, y = 6},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    soul_pos = { x = 1, y = 7},
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.total_triggers}}
    end,
  
    calculate = function(self, card, context)
        if context.using_consumeable and (not context.aij_stargazy_pie or context.aij_dongfang_again) then
            if context.consumeable.ability.set == 'Planet' then
                -- Doing calculate "early" to maintain intuitive order of animations
                card.ability.extra.triggers = card.ability.extra.triggers - 1
                SMODS.calculate_context({using_consumeable = true, consumeable = context.consumeable, area = context.from_area, aij_stargazy_pie = true, aij_dongfang_again = card.ability.extra.triggers > 0 and true or false})
                if card.ability.extra.triggers == 0 then card.ability.extra.triggers = card.ability.extra.total_triggers end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_again_ex'), colour = G.C.FILTER})
                context.consumeable:use_consumeable(context.area)
                return nil, true
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {dongfang} }
