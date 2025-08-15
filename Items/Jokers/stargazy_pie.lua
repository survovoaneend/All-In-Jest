local stargazy_pie = {
    object_type = "Joker",
    order = 305,
    key = "stargazy_pie",
    config = {
        extra = { triggers = 5 }
    },
    rarity = 1,
    pos = { x = 2, y = 12},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.triggers}}
    end,
  
    calculate = function(self, card, context)
        if context.using_consumeable then
            if context.consumeable.ability.set == 'Planet' and card.ability.extra.triggers >= 1 then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.6, func = function()
                    card_eval_status_text(context.consumeable, 'extra', nil, nil, nil, {message = localize('k_again_ex'),colour = G.C.FILTER})
                    local tempcard = copy_card(context.consumeable)
                    tempcard:use_consumeable(context.area)
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        tempcard:start_dissolve()
                    return true end }))
                return true end }))
                if not context.blueprint then
                    card.ability.extra.triggers = card.ability.extra.triggers - 1
                    if card.ability.extra.triggers == 0 then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_eaten_ex'),colour = G.C.FILTER})
                        card.ability.extra.triggers = 1
                        card:start_dissolve()
                    end
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {stargazy_pie} }
