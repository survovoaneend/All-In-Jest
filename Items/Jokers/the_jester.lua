local the_jester = {
    object_type = "Joker",
    order = 170,

    key = "the_jester",
    config = {
        extra = {
            active = true,
        }
    },
    rarity = 2,
    pos = { x = 17, y = 9 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_fool']
        if card.ability.extra.active then
          return {
            vars = {
              "("..localize('k_active')..")"
            }
          }
        else
          return {
            vars = {
              "("..localize('k_inactive')..")"
            }
          }
        end
    end,
  
    add_to_deck = function(self, card, from_debuff)
        if card.ability.extra.active then
            local eval = function() return card.ability.extra.active end
            juice_card_until(card, eval, true)
        end
    end,

    calculate = function(self, card, context)
        if context.selling_card then
            if context.card ~= card then
                if context.card.ability.set == "Joker" and card.ability.extra.active then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card.ability.extra.active = false
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards then
                                play_sound('timpani')
                                local _card = create_card(nil, G.consumeables, nil, nil, nil, nil, 'c_fool', nil)
                                _card:add_to_deck()
                                G.consumeables:emplace(_card)
                            end
                            return true
                        end
                    }))
                    return {
                        message = localize{type = 'name_text', set = 'Tarot', key = "c_fool"}
                    }
                end
            end
        end
        if context.end_of_round and not card.ability.extra.active and not context.blueprint then
            card.ability.extra.active = true
            local eval = function() return card.ability.extra.active end
            juice_card_until(card, eval, true)
        end
    end

}
return { name = { "Jokers" }, items = { the_jester } }