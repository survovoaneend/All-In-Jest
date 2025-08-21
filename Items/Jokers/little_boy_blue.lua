local little_boy_blue = {
    object_type = "Joker",
    order = 129,

    key = "little_boy_blue",
    config = {
      extra = {
          chips = 200,
          banned_cards = {}
      }
    },
    rarity = 3,
    pos = { x = 23, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_aij_little_boy_blue") <= 0 then
            for k, joker in pairs(G.P_CENTER_POOLS['Joker']) do
                local joker_temp = G.P_CENTER_POOLS['Joker'][k]
                local key = joker_temp.key
                local text = retrieve_joker_text(joker_temp, true)
                if (text:find('Mult') or text:find('mult')) or not (text:find('Chip') or text:find('chip')) then
                    G.GAME.banned_keys[key] = true
                    table.insert(card.ability.extra.banned_cards, key)
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_aij_little_boy_blue") <= 0 then
		    for _, key in ipairs(card.ability.extra.banned_cards) do
                G.GAME.banned_keys[key] = nil
            end
        end
	end,
}
return { name = {"Jokers"}, items = {little_boy_blue} }