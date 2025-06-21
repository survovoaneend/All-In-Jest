local carousel = {
    object_type = "Joker",
    order = 23,

    key = "carousel",
    config = {
      
    },
    rarity = 2,
    pos = { x = 21, y = 0 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.after and context.scoring_hand then
            for i = 1, #context.scoring_hand do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if context.scoring_hand[i]:is_suit("Hearts") then
                            assert(SMODS.change_base(context.scoring_hand[i], "Clubs"))
                        elseif context.scoring_hand[i]:is_suit("Clubs") then
                            assert(SMODS.change_base(context.scoring_hand[i], "Diamonds"))
                        elseif context.scoring_hand[i]:is_suit("Diamonds") then
                            assert(SMODS.change_base(context.scoring_hand[i], "Spades"))
                        elseif context.scoring_hand[i]:is_suit("Spades") then
                            assert(SMODS.change_base(context.scoring_hand[i], "Hearts"))
                        end
                    return true
                    end
                }))
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {carousel} }
