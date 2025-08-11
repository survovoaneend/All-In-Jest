local illuminated_joker = {
    object_type = "Joker",
    order = 308,
    key = "illuminated_joker",
    config = {

    },
    rarity = 2,
    pos = { x = 5, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.all_in_jest.gold_tag_rate = G.GAME.all_in_jest.gold_tag_rate + 4
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.all_in_jest.gold_tag_rate = G.GAME.all_in_jest.gold_tag_rate - 4
	end,

    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.round_resets then
                if G.GAME.round_resets.ante >= 3 then
                    return true
                end
            end
        end
        return false
    end,
}
return { name = {"Jokers"}, items = {illuminated_joker} }
