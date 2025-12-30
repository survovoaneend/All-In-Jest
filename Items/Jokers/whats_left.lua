G.FUNCS.whats_left_compat = function(e)
  -- if e.config.ref_table.ability.j_aij_whats_left_compat == nil then
  --     e.config.ref_table.ability.j_aij_whats_left_compat = "compatible"
  -- end
  local compatible = e.config.ref_table.ability.j_aij_whats_left_compat
  if compatible == 'compatible' then 
      e.config.colour = mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
  elseif compatible == 'incompatible' then
      e.config.colour = mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8)
  end
  e.config.ref_table.ability.j_aij_whats_left_compat_ui = ' '..localize('k_'..e.config.ref_table.ability.j_aij_whats_left_compat)..' '
  e.config.ref_table.ability.j_aij_whats_left_compat_check = e.config.ref_table.ability.j_aij_whats_left_compat
end

local whats_left = {
    object_type = "Joker",
    order = 480,
    key = "whats_left",
    config = {
        j_aij_whats_left_compat = true,
        aij_blueprint_compat = true,
        aij_dongtong_compat = true,
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
    blueprint_compat = false, -- uses ability.aij_blueprint_compat
    j_aij_whats_left_compat = false, -- Stops it from copying itself
    eternal_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        for index = 1, #G.GAME.all_in_jest.previously_sold_jokers do
            sendDebugMessage("is anything happening", "AIJ")
            local copied_center = G.P_CENTERS[G.GAME.all_in_jest.previously_sold_jokers[index].save_fields.center]
            All_in_Jest.add_copied_joker(card, copied_center, G.GAME.all_in_jest.previously_sold_jokers[index].ability, true)
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if card.ability.j_aij_whats_left and #card.ability.j_aij_whats_left.copied_joker_abilities > 0 then
            for index = #card.ability.j_aij_whats_left.copied_joker_abilities, math.max(1, #card.ability.j_aij_whats_left.copied_joker_abilities - card.ability.j_aij_whats_left.copy_limit + 1), -1 do
                card.added_to_deck = false
                All_in_Jest.use_copied_joker_function(card, "add_to_deck", "add_to_deck", {card, true}, {true}, index)
                card.added_to_deck = true
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.j_aij_whats_left and #card.ability.j_aij_whats_left.copied_joker_abilities > 0 then
            for index = #card.ability.j_aij_whats_left.copied_joker_abilities, math.max(1, #card.ability.j_aij_whats_left.copied_joker_abilities - card.ability.j_aij_whats_left.copy_limit + 1), -1 do
                card.added_to_deck = false
                All_in_Jest.use_copied_joker_function(card, "remove_from_deck", "remove_from_deck", {card, true}, {true}, index)
                card.added_to_deck = true
            end
        end
    end,

    update = function(self, card, dt)
        if card.ability.j_aij_whats_left and #card.ability.j_aij_whats_left.copied_joker_abilities > 0 then
            for index = #card.ability.j_aij_whats_left.copied_joker_abilities, math.max(1, #card.ability.j_aij_whats_left.copied_joker_abilities - card.ability.j_aij_whats_left.copy_limit + 1), -1 do
                card.added_to_deck = false
                All_in_Jest.use_copied_joker_function(card, "update", "update", {card, dt}, {dt}, index, true)
                card.added_to_deck = true
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        if card.ability.j_aij_whats_left and #card.ability.j_aij_whats_left.copied_joker_abilities > 0 then
            for i = #card.ability.j_aij_whats_left.copied_joker_abilities, math.max(1, #card.ability.j_aij_whats_left.copied_joker_abilities - card.ability.j_aij_whats_left.copy_limit + 1), -1 do
                local copied_center = G.P_CENTERS[card.ability.j_aij_whats_left.copied_joker_abilities[i].key]
                local info_queue_center = { -- Create a simplified "fake" center that can be used without referencing/modifying the actual center object
                    key = copied_center.key,
                    name = copied_center.name,
                    config = copied_center.config,
                    blueprint_compat = copied_center.blueprint_compat,
                    discovered = true,
                    set = "Joker",
                    create_fake_card = copied_center.create_fake_card,
                    generate_ui = copied_center.generate_ui,
                    loc_vars = copied_center.loc_vars
                }

                local other_vars = {}
                All_in_Jest.hotswap_copied_ability(card, i)
                if copied_center.loc_vars then
                    local ret = copied_center:loc_vars({}, card) -- Make info_queue an empty table 
                    if ret then
                        other_vars = ret.vars
                    end
                else
                    card.ability.name = copied_center.name
                    other_vars, _, _ = card:generate_UIBox_ability_table(true)
                    card.ability.name = card.config.center.name
                end
                if other_vars then
                    info_queue_center.specific_vars = other_vars
                    info_queue_center.specific_vars.aij_whats_left = card
                    info_queue_center.specific_vars.aij_whats_left_index = i
                end
                info_queue[#info_queue + 1] = info_queue_center
                All_in_Jest.set_copied_ability(card, {config = {}})
            end
        end
        return { vars = { card.ability.j_aij_whats_left.copy_limit } }
    end,

    calculate = function(self, card, context)        
        if card.ability.j_aij_whats_left and #card.ability.j_aij_whats_left.copied_joker_abilities > 0 then            
            local return_table = nil
            for index = #card.ability.j_aij_whats_left.copied_joker_abilities, math.max(1, #card.ability.j_aij_whats_left.copied_joker_abilities - card.ability.j_aij_whats_left.copy_limit + 1), -1 do
                local new_ability = card.ability[card.config.center.key].copied_joker_abilities[index]
                if card.config.center.key ~= new_ability.key then
                    local ret = table.unpack(All_in_Jest.use_copied_joker_function(card, "calculate", "calculate_joker", {card, context}, {context}, index))

                    -- Check if table is empty or not
                    if ret ~= nil and next(ret) then
                        if return_table == nil then
                            return_table = ret
                        else
                            local table_pointer = return_table
                            while table_pointer.extra ~= nil do
                                table_pointer = table_pointer.extra
                            end
                            table_pointer.extra = ret
                        end
                    end
                end
            end
            return return_table
        end
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.j_aij_whats_left and #card.ability.j_aij_whats_left.copied_joker_abilities > 0 then
            local dollar_bonus = 0
            for index = #card.ability.j_aij_whats_left.copied_joker_abilities, math.max(1, #card.ability.j_aij_whats_left.copied_joker_abilities - card.ability.j_aij_whats_left.copy_limit + 1), -1 do
                if card.ability.j_aij_whats_left and #card.ability.j_aij_whats_left.copied_joker_abilities > 0 then
                    local ret = table.unpack(All_in_Jest.use_copied_joker_function(card, "calc_dollar_bonus", "calculate_dollar_bonus", {card}, {}, index))
                    if ret ~= nil then
                        dollar_bonus = dollar_bonus + ret
                    end
                end
            end
            if dollar_bonus ~= 0 then
                return dollar_bonus
            end
        end
    end
}
local sell_card_ref = Card.sell_card
function Card:sell_card()
    local ref = sell_card_ref(self)
    if G.jokers and self.ability.set == 'Joker' then
        local save_data = copy_table(self:save())
        save_data.ability.jest_sold_self = nil
        table.insert(G.GAME.all_in_jest.previously_sold_jokers, save_data) -- Store the joker saved so it does not get erased on game reload
        for _, whats_left in ipairs(SMODS.find_card("j_aij_whats_left", true)) do
            if whats_left ~= self then
                local sold_joker = G.GAME.all_in_jest.previously_sold_jokers[#G.GAME.all_in_jest.previously_sold_jokers]
                local sold_joker_key = sold_joker.save_fields.center -- key is stored differently in a save table
                local copied_center = G.P_CENTERS[sold_joker_key]
                G.E_MANAGER:add_event(Event({
                    func = function()
                        All_in_Jest.add_copied_joker(whats_left, copied_center, sold_joker.ability)
                        return true
                    end
                }))
            end
        end
    end
    return ref
end

local aij_smods_find_card_ref = SMODS.find_card
function SMODS.find_card(key, count_debuffed)
    local results = aij_smods_find_card_ref(key, count_debuffed)
    if not G.jokers or not G.jokers.cards then return {} end
    for _, area in ipairs(SMODS.get_card_areas('jokers')) do
        if area.cards then
            for _, v in pairs(area.cards) do
                if v and type(v) == 'table' and v.ability.j_aij_whats_left and (count_debuffed or not v.debuff) then
                    for i = #v.ability.j_aij_whats_left.copied_joker_abilities, math.max(1, #v.ability.j_aij_whats_left.copied_joker_abilities - v.ability.j_aij_whats_left.copy_limit + 1), -1 do
                        if v.ability.j_aij_whats_left.copied_joker_abilities[i] and v.ability.j_aij_whats_left.copied_joker_abilities[i].key == key then
                            table.insert(results, v)
                        end
                    end
                end
            end
        end
    end
    return results
end

return { name = { "Jokers" }, items = { whats_left } }
