local the_business = {
    object_type = "Blind",
    key = 'the_business',
    boss = {
      min = 4,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("3e4b4d"),
    atlas = 'blinds_pit',
    pos = {y = 21},
    order = 522,
    dollars = 6,
    config = {},

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local exclude_contexts = context.individual or context.repetition or context.blueprint
        if context.end_of_round and not temp and not exclude_contexts then
            local destroyable_jokers = {}
            for i = 1, #G.jokers.cards do
                if not SMODS.is_eternal(G.jokers.cards[i]) then
                    table.insert(destroyable_jokers, G.jokers.cards[i])
                end
            end
            if #destroyable_jokers > 0 then
                local card_index = pseudorandom('jest_the_business', 1, 2)
                if card_index == 2 then
                    SMODS.destroy_cards(destroyable_jokers[#destroyable_jokers])
                else
                    SMODS.destroy_cards(destroyable_jokers[1])
                end
                local card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, 'jest_chaos_tag')
                card:add_sticker('eternal', true)
                card:add_to_deck()
                G.jokers:emplace(card)
                card:start_materialize()
                blind.triggered = true
                blind:wiggle()
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_business} }
