local read_em_and_weep = {
    object_type = "Joker",
    order = 92,

    key = "read_em_and_weep",
    config = {
      
    },
    rarity = 3,
    pos = { x = 12, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.aij_before_before and context.scoring_name then
            if context.poker_hands and next(context.poker_hands['Straight']) then
                local temp_suit = pseudorandom_element(SMODS.Suits, pseudoseed('jest_read_em_and_weep'..G.GAME.round_resets.ante)).key
                if G.play then
                    for i = 1, #G.play.cards do
                        SMODS.change_base(G.play.cards[i], temp_suit)
                    end
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {read_em_and_weep} }
