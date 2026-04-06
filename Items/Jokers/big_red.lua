local big_red = {
    object_type = "Joker",
    order = 130,

    key = "big_red",
    config = {
      extra = {
          mult = 40,
          -- banned_cards = {}
      }
    },
    rarity = 3,
    pos = { x = 24, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_aij_big_red") <= 0 then
            for k, joker in pairs(G.P_CENTER_POOLS['Joker']) do
                local joker_temp = G.P_CENTER_POOLS['Joker'][k]
                local key = joker_temp.key
                local text = retrieve_joker_text(joker_temp, true)
                if text == "" then
                    -- Add exceptions for BAD_DATA and misprint
                    if next(SMODS.find_card("j_aij_little_boy_blue")) and key == "j_aij_baddata" and G.GAME.banned_keys[key] == "j_aij_little_boy_blue" then
                        G.GAME.banned_keys[key] = nil
                    elseif key ~= "j_misprint" or next(SMODS.find_card("j_aij_little_boy_blue")) then
                        G.GAME.banned_keys[key] = "j_aij_big_red"
                    end
                else
                    local text_has_mult = text:find('Mult') or text:find('mult')
                    local text_has_chips = text:find('Chip') or text:find('chip')
                    if not G.GAME.banned_keys[key] and not text_has_mult or (text_has_chips and not next(SMODS.find_card("j_aij_little_boy_blue"))) then
                        G.GAME.banned_keys[key] = "j_aij_big_red"
                        -- table.insert(card.ability.extra.banned_cards, key)
                    -- If both Big Red and Little Boy Blue are owned, only show chip and mult jokers
                    elseif next(SMODS.find_card("j_aij_little_boy_blue")) and G.GAME.banned_keys[key] == "j_aij_little_boy_blue" and text_has_chips and text_has_mult then
                        G.GAME.banned_keys[key] = nil
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_aij_big_red") <= 0 then
            for key, value in pairs(G.GAME.banned_keys) do
                -- BUG: by the time this unbans cards, the list of cards to unban
                -- can be inaccurate. (applies to the mult joker too)
                -- plan: probably just patch instead of utilizing the existing banned_keys
                -- table
                if value == "j_aij_big_red" then
                    G.GAME.banned_keys[key] = nil
                end
            end
            if next(SMODS.find_card("j_aij_little_boy_blue")) then
                SMODS.find_card("j_aij_little_boy_blue")[1]:add_to_deck(SMODS.find_card("j_aij_little_boy_blue")[1])
            end
        end
    end,
  
}
return { name = {"Jokers"}, items = {big_red} }


