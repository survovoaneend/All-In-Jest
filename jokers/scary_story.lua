SMODS.Joker {
    key = "scary_story",
    config = {
      extra = {
        chance = 3
      }
    },
    rarity = 3,
    pos = { x = 0, y = 1 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
      return { vars = { 
        ''..(G.GAME and G.GAME.probabilities.normal or 1),
        card.ability.extra.chance 
      } }
    end,
  
    calculate = function(self, card, context)
      if context.open_booster and context.card.ability.name then
        if (context.open_booster and context.card.ability.name == 'Standard Pack' or
        context.open_booster and context.card.ability.name == 'Jumbo Standard Pack' or
        context.open_booster and context.card.ability.name == 'Mega Standard Pack') then
          G.E_MANAGER:add_event(Event({
            func = function()
                if G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.VT.y < G.ROOM.T.h then
                    for _, v in ipairs(G.pack_cards.cards) do
                        if pseudorandom('scary_story') < G.GAME.probabilities.normal/card.ability.extra.chance and not v.edition then
                            G.E_MANAGER:add_event(Event({
                              trigger = 'after',
                              delay = 1,
                              func = function()
                                v:set_edition({negative = true}, true, true)
                                play_sound('negative', 1.5, 0.4)
                                v:juice_up(0.3, 0.2)
                                return true
                              end
                            }))
                        end
                    end
                    return true
                  end
            end
        }))
        end
    end
    end
  }