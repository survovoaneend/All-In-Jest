local big_red = {
    object_type = "Joker",
    order = 133,

    key = "big_red",
    config = {
      extra = {
          mult = 40,
      }
    },
    attributes = { 'mult' },
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
}

local has_attribute = function(center, attribute)
    if not SMODS.Attributes[attribute] or not center.attributes then return false end
    if center.attributes[attribute] then return true end
    for _, att in ipairs(SMODS.Attributes[attribute].alias or {}) do
        if center.attributes[att] then return true end
    end
    return false
end

local is_mult_joker = function(center)
    if has_attribute(center, "mult") or has_attribute(center, "xmult") then
        return true
    end
end
local is_chips_joker = function(center)
    if has_attribute(center, "chips") or has_attribute(center, "xchips") then
        return true
    end
end

local smods_add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, ...)
    if prototype_obj.set == "Joker" then
        if #SMODS.find_card("j_aij_big_red") > 0 and #SMODS.find_card("j_aij_little_boy_blue") > 0 and not (is_mult_joker(prototype_obj) or is_chips_joker(prototype_obj)) then
            return false
        elseif #SMODS.find_card("j_aij_big_red") > 0 and not (is_mult_joker(prototype_obj) and not is_chips_joker(prototype_obj)) then
            return false
        elseif #SMODS.find_card("j_aij_little_boy_blue") > 0 and not (is_chips_joker(prototype_obj) and not is_mult_joker(prototype_obj)) then
            return false
        end
    end
    return smods_add_to_pool_ref(prototype_obj, ...)
end

return { name = {"Jokers"}, items = {big_red} }


