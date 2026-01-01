local clay_joker = {
    object_type = "multi_copier",
    object_loader = All_in_Jest,
    order = 102,
    key = "clay_joker",
    config = {
        j_aij_clay_joker_compat = true,
        aij_blueprint_compat = true,
        j_aij_clay_joker = { -- Store all data needed for this joker in a table with a matching key, this will be preserved on ability changes
            copy_limit = 2,
            copied_joker_abilities = {},
            silver_multiplier_buff = 100
        }
    },
    rarity = 3,
    pos = { x = 22, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        _ = All_in_Jest.multi_copier.loc_vars(self, info_queue, card)
        return { vars = { card.ability[card.config.center.key].copy_limit } }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        for index = 1, #G.GAME.all_in_jest.previously_destroyed_jokers do
            local copied_center = G.P_CENTERS[G.GAME.all_in_jest.previously_destroyed_jokers[index].save_fields.center]
            All_in_Jest.add_copied_joker(card, copied_center, G.GAME.all_in_jest.previously_destroyed_jokers[index].ability, true)
        end
    end,
}

local add_to_previously_destroyed_jokers = function(card)
    if G.jokers and card.ability.set == 'Joker' then
        local save_data = copy_table(card:save())
        table.insert(G.GAME.all_in_jest.previously_destroyed_jokers, save_data) -- Store the joker saved so it does not get erased on game reload
        
        -- Update What's Left while its in a booster pack or the shop
        local clay_joker_cards = SMODS.find_card("j_aij_clay_joker", true)
        for _, area in ipairs({G.shop_jokers, G.pack_cards}) do
            if area ~= nil and area.cards then
                for _, v in pairs(area.cards) do
                    if v and type(v) == 'table' and v.config.center.key == "j_aij_clay_joker" then
                        table.insert(clay_joker_cards, v)
                    end
                end
            end
        end

        for _, clay_joker_card in ipairs(clay_joker_cards) do
            if clay_joker_card ~= card then
                local destroyed_joker = G.GAME.all_in_jest.previously_destroyed_jokers[#G.GAME.all_in_jest.previously_destroyed_jokers]
                local destroyed_joker_key = destroyed_joker.save_fields.center -- key is stored differently in a save table
                local copied_center = G.P_CENTERS[destroyed_joker_key]
                G.E_MANAGER:add_event(Event({
                    func = function()
                        All_in_Jest.add_copied_joker(clay_joker_card, copied_center, destroyed_joker.ability, not clay_joker_card.added_to_deck)
                        return true
                    end
                }))
            end
        end
    end
end

local aij_clay_joker_shatter_ref = Card.shatter
function Card:shatter()
    local ref = aij_clay_joker_shatter_ref(self)
    if self.getting_sliced and self.ability.set == 'Joker' then
        add_to_previously_destroyed_jokers(self)
    end
    return ref
end

local aij_clay_joker_start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    local ref = aij_clay_joker_start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
    if self.getting_sliced and self.ability.set == 'Joker' then
        add_to_previously_destroyed_jokers(self)
    end
    return ref
end

return { name = { "Jokers" }, items = { clay_joker } }
