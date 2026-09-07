local the_multitude = {
    object_type = "Blind",
    key = 'the_multitude',
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
    attributes = {'destroy_card', 'debuff', 'full_deck'},
    boss_colour = HEX("8d759f"),
    atlas = 'blinds_pit',
    pos = {y = 22},
    order = 523,
    dollars = 6,
    config = {},

    loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 3)
        return {
            vars = {numerator, denominator}
        }
    end,

    collection_loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 3)
        return {
            vars = {numerator, denominator}
        }
    end,

    set_blind = function(self)
        for k, v in pairs(G.playing_cards) do
            if SMODS.pseudorandom_probability(self, 'the_shell', 1, 3) then
                SMODS.debuff_card(v, true, 'the_multitude')
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_multitude')
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_multitude')
        end
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local exclude_contexts = context.individual or context.repetition or context.blueprint
        if context.end_of_round and not temp and not exclude_contexts then
            local destroy_cards = {}
            for k, v in pairs(G.deck.cards) do
                if v.debuff then
                    destroy_cards[#destroy_cards+1] = v
                end
            end
            SMODS.destroy_cards(destroy_cards)
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_multitude} }
