local little_boy_blue = {
    object_type = "Joker",
    order = 129,

    key = "little_boy_blue",
    config = {
      extra = {
          chips = 100,
          -- banned_cards = {}
      }
    },
    rarity = 1,
    pos = { x = 23, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
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
                if text == "" then
                    -- Add exception for BAD_DATA
                    if next(SMODS.find_card("j_aij_big_red")) and key == "j_aij_baddata" and G.GAME.banned_keys[key] == "j_aij_big_red" then
                        G.GAME.banned_keys[key] = nil
                    else
                        G.GAME.banned_keys[key] = "j_aij_little_boy_blue"
                    end
                else
                    local text_has_mult = text:find('Mult') or text:find('mult')
                    local text_has_chips = text:find('Chip') or text:find('chip')
                    if not G.GAME.banned_keys[key] and (text_has_mult and not next(SMODS.find_card("j_aij_big_red"))) or not text_has_chips then
                        G.GAME.banned_keys[key] = "j_aij_little_boy_blue"
                        -- table.insert(card.ability.extra.banned_cards, key)
                    -- If both Big Red and Little Boy Blue are owned, only show chip and mult jokers
                    elseif next(SMODS.find_card("j_aij_big_red")) and G.GAME.banned_keys[key] == "j_aij_big_red" and text_has_chips and text_has_mult then
                        G.GAME.banned_keys[key] = nil
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_aij_little_boy_blue") <= 0 then
            for key, value in pairs(G.GAME.banned_keys) do
                -- BUG: by the time this unbans cards, the list of cards to unban
                -- can be inaccurate. (applies to the mult joker too)
                -- plan: probably just patch instead of utilizing the existing banned_keys
                -- table
                if value == "j_aij_little_boy_blue" then
                    G.GAME.banned_keys[key] = nil
                end
            end
            if next(SMODS.find_card("j_aij_big_red")) then
                SMODS.find_card("j_aij_big_red")[1]:add_to_deck(SMODS.find_card("j_aij_big_red")[1])
            end
        end
	  end,
}
return { name = {"Jokers"}, items = {little_boy_blue} }