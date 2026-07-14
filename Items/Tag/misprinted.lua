SMODS.DynaTextEffect {
    key = "misprinted_red",
    draw_override = function(dynatext)
        local colour = G.C.RED
        local table_val = type(dynatext.config.string) == 'string' and {string = dynatext.config.string, colour = colour} or dynatext.config.string
        dynatext.config.strings = dynatext.config.strings or {dynatext.config.string}
        local loc_mult = dynatext.config.strings[1][1]
        local strings = {
		    	{string = '_rand()_', colour = G.C.JOKER_GREY},{string = "*$#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'), colour = colour},
		    	loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult}
        dynatext.config.pop_in_rate = 9999999
        dynatext.config.silent = true
        dynatext.config.random_element = true
        dynatext.config.scale = 0.32
        dynatext.config.min_cycle_time = 0
        G.aij_mis_wait_till = G.aij_mis_wait_till or G.TIMERS.REAL

        dynatext.start_pop_in = dynatext.config.pop_in
        local new = pseudorandom_element(strings, pseudoseed('misprinted'))
        local table = new
        if type(new) == 'string' then table = {string = new, colour = colour} end
        dynatext.config.string = {[1] = G.cur_ran_mis_text} or {[1] = table}
        if G.TIMERS.REAL >= G.aij_mis_wait_till then
            G.cur_ran_mis_text = table
            G.aij_mis_wait_till = G.TIMERS.REAL + 0.2011
        end
        dynatext:update_text(true)
        if dynatext.config.maxw and dynatext.config.W > dynatext.config.maxw and not dynatext.config.marquee then
            dynatext.start_pop_in = dynatext.config.pop_in
            dynatext.scale = dynatext.scale*(dynatext.config.maxw/dynatext.config.W)
            dynatext:update_text(true)
        end
        dynatext.pop_delay = dynatext.config.pop_delay or 1.5
        dynatext:pop_out(4)
        dynatext_aij_draw(dynatext)
    end
}
local misprinted = {
    object_type = "Tag",
    key = 'misprinted', 
    pos = { x = 3, y = 1},
    ignore = true,
    atlas = 'tag_atlas',
    order = 7,
    min_ante = 2,
    config = {type = 'store_joker_modify', edition = 'aij_misprint'},
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = G.P_CENTERS.e_aij_misprint
        return {}
    end,

    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            local applied = nil
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true

                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION,function()
                    context.card:set_edition({aij_misprint = true}, true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    context.card.temp_edition = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                applied = true

                tag.triggered = true
            end
            return applied
        end
    end,
}
return {name = "Tags", items = {misprinted}}