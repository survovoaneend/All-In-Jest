local jerko = {
    object_type = "Joker",
    order = 196,
    key = "jerko",
    config = {
      extra = {
        mult = 4,
        min = 0,
        max = 20
      }
    },
    rarity = 3,
    pos = { x = 10, y = 7},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local r_retriggers = {} 
        for i = card.ability.extra.min, card.ability.extra.max do
            r_retriggers[#r_retriggers + 1] = string.format("%d", i)
        end
        local text = {
            [1] = "+",
            [2] = " Mult",
            [3] = "Retrigger ",
            [4] = " times",
        }
        return {main_start =
        {{n = G.UIT.R, config = {align = "cm"}, nodes = {
            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                {n = G.UIT.T, config = {text = text[1]..card.ability.extra.mult, colour = G.C.MULT, scale = 0.32}},
                {n = G.UIT.T, config = {text = text[2], colour = G.C.L_BLACK, scale = 0.32}},
            }},
            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                {n = G.UIT.T, config = {text = text[3], colour = G.C.L_BLACK, scale = 0.32}},
                {n = G.UIT.O, config = {object = DynaText({string = r_retriggers, colours = {G.C.FILTER}, random_element = true, pop_in_rate = 9999999, silent = true, pop_delay = 0.2, scale = 0.32, min_cycle_time = 0})}},
                {n = G.UIT.T, config = {text = text[4], colour = G.C.L_BLACK, scale = 0.32}}
            }}
        }}}
        }
    end,
    calculate = function(self, card, context)
      if context.repetition_only or (context.retrigger_joker_check) then
        local retriggers = pseudorandom('jerko', card.ability.extra.min, card.ability.extra.max)
        if context.other_card == card then
            return {
                repetitions = retriggers,
                card = card,
                message = localize('k_again_ex')
            }  
        end
      end
      if context.joker_main then
        return {
            mult = card.ability.extra.mult
        }
      end
    end
    
  
}
return { name = {"Jokers"}, items = {jerko} }
