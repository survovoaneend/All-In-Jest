local the_clown_show = {
    object_type = "Joker",
    order = 9,

    key = "the_clown_show",
    config = {
      extra = {
          chips = 6
      }
    },
    rarity = 2,
    pos = { x = 8, y = 0 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chips * G.GAME.jest_bought_jokers
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.buying_card then
        if context.card.ability.set == "Joker" and context.cardarea == G.jokers and not context.blueprint then
            return {
              message = localize('k_upgrade_ex')
            }
        end
      end
      if context.joker_main and (card.ability.extra.chips * G.GAME.jest_bought_jokers) > 0 then
        return {
          chips = card.ability.extra.chips * G.GAME.jest_bought_jokers,
        }
      end
    end,
    
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                card.joker_display_values.chips = card.ability.extra.chips * G.GAME.jest_bought_jokers
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {the_clown_show} }
