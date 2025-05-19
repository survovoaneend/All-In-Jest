local imperial_bower = {
    object_type = "Joker",
    order = 18,
    key = "imperial_bower",
    config = {
      
    },
    rarity = 2,
    pos = { x = 17, y = 0 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,

    remove_from_deck = function(self, card, from_debuff)
        if G.deck ~= nil and G.deck.cards then
            for i = 1, #G.deck.cards do
                G.deck.cards[i].ability.jest_all_rank = nil
                G.deck.cards[i].ability.jest_all_suit = nil
            end
        end
    end,
  
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            if G.hand ~= nil and G.hand.cards then
                G.hand.cards[#G.hand.cards].ability.jest_all_rank = true
                G.hand.cards[#G.hand.cards].ability.jest_all_suit = true
                card_eval_status_text(G.hand.cards[#G.hand.cards], 'extra', nil, nil, nil, {message = 'Enhanced!', colour = G.C.FILTER})
            end
        end
        if context.cashing_out then
            if G.deck ~= nil and G.deck.cards then
                for i = 1, #G.deck.cards do
                    G.deck.cards[i].ability.jest_all_rank = nil
                    G.deck.cards[i].ability.jest_all_suit = nil
                end
            end
        end
    end
}
SMODS.DrawStep {
    key = 'imperial_bower_card',
    order = 15,
    func = function(self, layer)
        if self.ability.jest_all_rank or self.ability.jest_all_suit then
            self.children.front:draw_shader('voucher', nil, self.ARGS.send_to_shader)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
return { name = {"Jokers"}, items = {imperial_bower} }
