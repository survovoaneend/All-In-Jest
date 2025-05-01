local the_mycologists = {
    object_type = "Joker",
    order = 47,
    ignore = true,
    key = "the_mycologists",
    config = {
      poker_hand = "Pair",
      added = false
    },
    rarity = 3,
    pos = { x = 18, y = 1 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return { vars = {localize(card.ability.poker_hand, 'poker_hands')}}
    end,
  
    calculate = function(self, card, context)
        if context.final_scoring_step then
            if context.scoring_name == card.ability.poker_hand then
                local cards = G.play.cards
                if card.ability.added == false then
                    card.ability.added = true
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function() 
                        cards[1].ability.perma_bonus = cards[1].ability.perma_bonus + (cards[2].base.nominal + cards[2].ability.perma_bonus)
                        cards[1]:set_ability(cards[2].config.center)
                        if cards[2].edition ~= nil then
                            cards[1]:set_edition(cards[2].edition)
                        end
                        cards[2]:start_dissolve()
                        return true end }))
                end
            end
        end
        if not context.blueprint and context.destroying_card and #context.full_hand == 2 then
            local cards = G.play.cards
            if context.destroying_card == cards[2] and card.ability.added == true then
                return {remove = true}
            end
        end
        if context.hand_drawn then
            card.ability.added = false
        end
    end
}
return { name = {"Jokers"}, items = {the_mycologists} }
