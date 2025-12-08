local spectre = {
    object_type = "Joker",
    order = 148,

    key = "spectre",
    config = {
      
    },
    rarity = 3,
    pos = { x = 17, y = 5 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss and not context.individual and not context.repetition and not context.blueprint then
            for i = 1, #G.consumeables.cards do
                G.consumeables.cards[i]:start_dissolve()
                create_consumable('Spectral', nil, nil, nil)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral')})
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {spectre} }
