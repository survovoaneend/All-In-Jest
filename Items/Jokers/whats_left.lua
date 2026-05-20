local whats_left = {
    object_type = "multi_copier",
    object_loader = All_in_Jest,
    order = 480,
    key = "whats_left",
    config = {
        j_aij_whats_left_compat = true,
        aij_blueprint_compat = true,
        j_aij_whats_left = { -- Store all data needed for this joker in a table with a matching key, this will be preserved on ability changes
            copy_limit = 2,
            copied_joker_abilities = {},
            silver_multiplier_buff = 100
        }
    },
    rarity = 3,
    pos = { x = 21, y = 23 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true, -- uses ability.aij_blueprint_compat

    loc_vars = function(self, info_queue, card)
        if card.config.center.key == "j_aij_whats_left" then
            _ = All_in_Jest.multi_copier.loc_vars(self, info_queue, card)
        end
        return { vars = { card.ability[card.config.center.key].copy_limit } }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        for index = 1, #G.GAME.all_in_jest.previously_sold_jokers do
            local copied_center = G.P_CENTERS[G.GAME.all_in_jest.previously_sold_jokers[index].save_fields.center]
            All_in_Jest.add_copied_joker(card, copied_center, G.GAME.all_in_jest.previously_sold_jokers[index].ability, true)
        end
    end,
}

local aij_whats_left_sell_card_ref = Card.sell_card
function Card:sell_card()
    local ref = aij_whats_left_sell_card_ref(self)
    if G.jokers and self.ability.set == 'Joker' then
        local save_data = copy_table(self:save())
        save_data.ability.jest_sold_self = nil
        table.insert(G.GAME.all_in_jest.previously_sold_jokers, save_data) -- Store the joker saved so it does not get erased on game reload
        
        -- Update What's Left while its in a booster pack or the shop
        local whats_left_jokers = SMODS.find_card("j_aij_whats_left", true)
        for _, area in ipairs({G.shop_jokers, G.pack_cards}) do
            if area ~= nil and area.cards then
                for _, v in pairs(area.cards) do
                    if v and type(v) == 'table' and v.config.center.key == "j_aij_whats_left" then
                        table.insert(whats_left_jokers, v)
                    end
                end
            end
        end

        for _, whats_left_card in ipairs(whats_left_jokers) do
            if whats_left_card ~= self then
                local sold_joker = G.GAME.all_in_jest.previously_sold_jokers[#G.GAME.all_in_jest.previously_sold_jokers]
                local sold_joker_key = sold_joker.save_fields.center -- key is stored differently in a save table
                local copied_center = G.P_CENTERS[sold_joker_key]
                G.E_MANAGER:add_event(Event({
                    func = function()
                        All_in_Jest.add_copied_joker(whats_left_card, copied_center, sold_joker.ability, not whats_left_card.added_to_deck)
                        return true
                    end
                }))
            end
        end
    end
    return ref
end

return { name = { "Jokers" }, items = { whats_left } }
