local twisted_pair = {
    object_type = "Joker",
    order = 320,
    key = "twisted_pair",
    config = {
    },
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
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local hand_info = G.FUNCS.get_poker_hand_info(G.play.cards)
            if hand_info == 'Pair' then
                if G.play.cards[1] == context.other_card then
                    if not All_in_Jest.has_patches(context.other_card, G.play.cards[2].base.suit) then
                        All_in_Jest.add_patch(context.other_card, G.play.cards[2].base.suit)
                    end
                elseif G.play.cards[2] == context.other_card then
                    if not All_in_Jest.has_patches(context.other_card, G.play.cards[1].base.suit) then
                        All_in_Jest.add_patch(context.other_card, G.play.cards[1].base.suit)
                    end
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {twisted_pair} }
