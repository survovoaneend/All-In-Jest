local twisted_pair = {
    object_type = "Joker",
    order = 327,
    key = "twisted_pair",
    config = {
    },
    attributes = { 'modify_card', 'patches', 'hand_type' },
    rarity = 2,
    pos = { x = 16, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        if context.before and context.scoring_hand and not context.blueprint then
            local hand_info = G.FUNCS.get_poker_hand_info(G.play.cards)
            if hand_info == 'Pair' then
                
                local suits = {}

                for i = 1, #context.scoring_hand do
                    local suit = context.scoring_hand[i].base.suit
                    suits[suit] = true
                end

                local used = false

                for i = 1, #context.scoring_hand do
                    for suit, _ in pairs(suits) do
                        if context.scoring_hand[i].base.suit ~= suit and not All_in_Jest.has_patches(context.scoring_hand[i], suit) then
                            All_in_Jest.add_patch(context.scoring_hand[i], suit)
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                    card:juice_up()
                                    return true
                                end
                            }))
                        end
                    end
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {twisted_pair} }
