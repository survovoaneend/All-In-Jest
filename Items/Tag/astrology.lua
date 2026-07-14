local astrology_tag = {
    object_type = "Tag",
    key = 'astrology',
    pos = { x = 0, y = 4 },
    ignore = true,
    atlas = 'tag_atlas',
    discovered = false,
    order = 7,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == 'using_consumeable' and not context.aij_astrology_tag then
            local remaining_triggers = context.atrt or pseudorandom('jest_astrology_tag', 2, 4)
            if context.consumeable.ability.set == 'Planet' then
                SMODS.calculate_context({using_consumeable = true, consumeable = context.consumeable, area = context.from_area, aij_stargazy_pie = true})
                remaining_triggers = remaining_triggers - 1
                card_eval_status_text(context.consumeable, 'extra', nil, nil, nil, {message = localize('k_again_ex'), colour = G.C.FILTER})
                context.consumeable:use_consumeable(context.area)
                tag:juice_up()

                for i = #G.GAME.tags, 1, -1 do
                    if remaining_triggers > 0 then
                        if G.GAME.tags[i]:apply_to_run({type = 'using_consumeable', consumeable = context.consumeable, area = context.area, atrt = remaining_triggers}) then break end
                    else
                        if G.GAME.tags[i]:apply_to_run({type = 'using_consumeable', consumeable = context.consumeable, area = context.area, atrt = remaining_triggers, aij_astrology_tag = true}) then break end
                    end
                end
            end
            tag:jest_apply("+", G.C.ATTENTION, function()
                
                return true
			end,
            function() 
                return remaining_triggers <= 0
            end)
            if remaining_triggers <= 0 then
                tag.triggered = true
                return true
            end
            return
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}
return {name = "Tags", items = {astrology_tag}}
