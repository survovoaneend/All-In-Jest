local skinsuit = {
    object_type = "Joker",
    order = 353,
    key = "skinsuit",
    config = {
    },
    rarity = 1,
    pos = { x = 24, y = 13},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            local being_removed = {}
            for j = 1, #context.removed do
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i] == context.removed[j] then
                        being_removed[#being_removed+1] = G.hand.cards[i]
                    end
                end
            end
            for j = 1, #context.removed do
                if not SMODS.has_no_suit(context.removed[j]) then
                    local vaild_cards = {}
                    for i = 1, #G.hand.cards do
                        if not All_in_Jest.has_patches(G.hand.cards[i], context.removed[j].base.suit) then
                            local remove = false
                            for l = 1, #being_removed do
                                if G.hand.cards[i] == being_removed[l] then
                                    remove = true
                                end
                            end
                            if not remove and G.hand.cards[i].base.suit ~= context.removed[j].base.suit then
                                vaild_cards[#vaild_cards+1] = G.hand.cards[i]
                            end
                        end    
                    end
                    if #vaild_cards > 0 then
                        delay(0.75 * 1.25 / 3)
                        local cur_card = pseudorandom_element(vaild_cards, pseudoseed('skinsuit'))
                        All_in_Jest.add_patch(cur_card, context.removed[j].base.suit)
                        local juice_card = context.blueprint_card or card
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                juice_card:juice_up()
                                return true
                            end)
                        }))
                        delay(0.75 * 1.25 / 3)
                    end
                end
            end
            return nil, true
        end
    end
  
}
return { name = {"Jokers"}, items = {skinsuit} }
