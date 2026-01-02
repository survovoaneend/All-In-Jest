local the_treachery_of_jokers = {
    object_type = "Joker",
    order = 390,
    key = "the_treachery_of_jokers",
    config = {
        extra = {
            xmult = 2
        }
    },
    rarity = 2,
    pos = { x = 7, y = 16 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
         if context.joker_main then
              return {
                  xmult = card.ability.extra.xmult
              }
         end
    end
}

local aij_check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)

    local is_treachery = false
    if card.config.center.key == "j_aij_the_treachery_of_jokers" then
        is_treachery = true
    elseif card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_key == 'j_aij_the_treachery_of_jokers' then
        is_treachery = true
    elseif card.ability[card.config.center.key] and card.ability[card.config.center.key].copied_joker_abilities then
        local copier_ability = card.ability[card.config.center.key]
        for index = #copier_ability.copied_joker_abilities, math.max(1, #copier_ability.copied_joker_abilities - copier_ability.copy_limit + 1), -1 do
            local copied_ability = copier_ability.copied_joker_abilities[index]
            if copied_ability.key == "j_aij_the_treachery_of_jokers" then
                is_treachery = true
                break
            end
        end
    end

    if is_treachery then
        card.ability.set = ""
        card.ability.consumeable = true
    end
    local ret = aij_check_for_buy_space_ref(card)
    if is_treachery then
        card.ability.set = "Joker"
        card.ability.consumeable = nil
    end
    return ret
end

-- Make advanced copier jokers that gain/lose treachery of jokers be moved to the correct card area
-- Lovely patch handles this when card is bought
-- Implementing these as hooks for the sake of code organisation - Clearer if it's with the joker file

-- For joker.png/czar
local aij_set_copied_joker_ref = All_in_Jest.set_copied_joker
All_in_Jest.set_copied_joker = function(copier_card, copied_center)
    local previously_copied_joker = copier_card.ability[copier_card.config.center.key].copied_joker_key

    local ret = aij_set_copied_joker_ref(copier_card, copied_center)

    local currently_copied_joker = copier_card.ability[copier_card.config.center.key].copied_joker_key

    if previously_copied_joker ~= currently_copied_joker then
        if previously_copied_joker == "j_aij_the_treachery_of_jokers" and copier_card.area == G.consumeables then
            local removed_card = copier_card.area:remove_card(copier_card)
            G.jokers:emplace(removed_card)
        elseif currently_copied_joker == "j_aij_the_treachery_of_jokers" and copier_card.area == G.jokers then
            local removed_card = copier_card.area:remove_card(copier_card)
            G.consumeables:emplace(removed_card)
        end
    end

    return ret
end



local contains = function (tbl, item)
    for k, v in pairs(tbl) do
        if v == item then
            return true
        end
    end
    return false
end

-- For what's left/clay joker
local aij_add_copied_joker_ref = All_in_Jest.add_copied_joker
All_in_Jest.add_copied_joker = function(copier_card, copied_center, copied_base_stats, skip_funcs)
    local previously_copied_jokers = {}
    if copier_card.ability[copier_card.config.center.key].copied_joker_abilities ~= nil then
        local copier_ability = copier_card.ability[copier_card.config.center.key]

        for index = #copier_ability.copied_joker_abilities, math.max(1, #copier_ability.copied_joker_abilities - copier_ability.copy_limit + 1), -1 do
            local copied_ability = copier_ability.copied_joker_abilities[index]
            table.insert(previously_copied_jokers, copied_ability.key)
        end
    end

    local ret = aij_add_copied_joker_ref(copier_card, copied_center, copied_base_stats, skip_funcs)

    if copier_card.ability[copier_card.config.center.key].copied_joker_abilities ~= nil then
        copier_ability = copier_card.ability[copier_card.config.center.key]

        local currently_copied_jokers = {}
        for index = #copier_ability.copied_joker_abilities, math.max(1, #copier_ability.copied_joker_abilities - copier_ability.copy_limit + 1), -1 do
            local copied_ability = copier_ability.copied_joker_abilities[index]
            table.insert(currently_copied_jokers, copied_ability.key)
        end

        G.E_MANAGER:add_event(Event({
            func = function()
                if contains(previously_copied_jokers, "j_aij_the_treachery_of_jokers") ~= contains(currently_copied_jokers, "j_aij_the_treachery_of_jokers") then
                    if contains(previously_copied_jokers, "j_aij_the_treachery_of_jokers") then
                        if copier_card.area and copier_card.area == G.consumeables then
                            local removed_card = copier_card.area:remove_card(copier_card)
                            G.jokers:emplace(removed_card)
                        end
                    elseif contains(currently_copied_jokers, "j_aij_the_treachery_of_jokers") then
                        if copier_card.area and copier_card.area == G.jokers then
                            local removed_card = copier_card.area:remove_card(copier_card)
                            G.consumeables:emplace(removed_card)
                        end
                    end
                end
                return true
            end
        }))
      end

    return ret
end

return { name = { "Jokers" }, items = { the_treachery_of_jokers } }
