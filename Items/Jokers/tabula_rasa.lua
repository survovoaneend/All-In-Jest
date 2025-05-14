local tabula_rasa = {
    object_type = "Joker",
    order = 269,
    ignore = true,

    key = "tabula_rasa",
    config = {
       extra = { 
           editions = {},
           negatives = {
               applied = "0",
               total = "0"
           }
       }
    },
    rarity = 1,
    pos = { x = 16, y = 10},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,

    add_to_deck = function(self, card, from_debuff)
        if card.edition == nil then
            local edition = poll_edition('aura', nil, true, true)
            card:set_edition(edition)
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - tonumber(card.ability.extra.negatives.total)
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then
            G.jokers.config.card_limit = G.jokers.config.card_limit - tonumber(card.ability.extra.negatives.applied)
            if card.edition ~= nil then
                table.insert(card.ability.extra.editions, card.edition)
                if card.edition.negative then
                    card.ability.extra.negatives.total = tostring(tonumber(card.ability.extra.negatives.total) + 1)
                end
            end
            G.jokers.config.card_limit = G.jokers.config.card_limit + tonumber(card.ability.extra.negatives.total)
            card.ability.extra.negatives.applied = card.ability.extra.negatives.total
            card:set_edition(nil)
        end
        if context.joker_main then
            local editions = card.ability.extra.editions
            for i = #editions, 1, -1 do
                delay(0.2)
                SMODS.calculate_effect(editions[i],card)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {tabula_rasa} }
