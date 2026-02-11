local pablillos = {
    object_type = "Joker",
    order = 1064,

    key = "pablillos",
    config = {
       
    },
    rarity = 4,
    pos = { x = 2, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 2, y = 13 },

    loc_vars = function(self, info_queue, card)
        
    end,

    calculate = function(self, card, context)
        
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.all_in_jest.gold_tag_rate = G.GAME.all_in_jest.gold_tag_rate + 9999999999 -- dumb lol
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.all_in_jest.gold_tag_rate = G.GAME.all_in_jest.gold_tag_rate - 9999999999
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
return { name = { "Jokers" }, items = { pablillos } }