
local poll_obj_ref = SMODS.poll_object
function SMODS.poll_object(args)
    -- spawn mostly mult jokers until you pick one up
    local rate = ({0, 0.3, 0.6})[All_in_Jest.config.mult_appearance]
    if rate > 0 and args.type == 'Joker' and (args.append == 'sho' or args.append == 'buf') and not G.GAME.aij_found_mult and not args.attributes and not (#SMODS.find_card("j_aij_little_boy_blue") > 0) then
        if pseudorandom('aij_mult_poll') <= rate then
            args.attributes = {'mult'}
        end
    end

    return poll_obj_ref(args)
end

local card_add_ref = Card.add_to_deck
function Card:add_to_deck(...)
    if self:has_attribute('mult') then
        G.GAME.aij_found_mult = true
    end
    return card_add_ref(self, ...)
end

local get_new_boss_ref = get_new_boss
function get_new_boss()
    local boss_key = get_new_boss_ref()
    if not All_in_Jest.config.suit_boss_blocking then return boss_key end
    -- would block 2 suits, probably too impactful
    if boss_key == 'bl_aij_the_day' or boss_key == 'bl_aij_the_dagger' or boss_key == 'bl_aij_the_sun' then
        return boss_key
    end
    local added = {}
    for _, suit in ipairs({'spades', 'hearts', 'clubs', 'diamonds'}) do
        local has_suit = SMODS.has_attribute(G.P_BLINDS[boss_key], suit)
        if has_suit then
            for other, other_obj in pairs(G.P_BLINDS) do
                if not added[other] and other ~= boss_key then
                    local other_has_suit = SMODS.has_attribute(other_obj, suit)
                    if other == 'bl_aij_the_day' or other == 'bl_aij_the_dagger' then
                        other_has_suit = not other_has_suit
                    end
                    if other_has_suit then
                        added[other] = true
                        G.GAME.bosses_used[other] = G.GAME.bosses_used[other] + 1
                    end
                end
            end
        end
    end
    return boss_key
end

local add_bosses_used_ref = SMODS.add_boss_to_used_table
function SMODS.add_boss_to_used_table(boss_key, type)
    add_bosses_used_ref(boss_key, type)
    if not All_in_Jest.config.suit_boss_blocking then return end
    if boss_key == 'bl_aij_the_day' or boss_key == 'bl_aij_the_dagger' or boss_key == 'bl_aij_the_sun' then
        return
    end
    local added = {}
    for _, suit in ipairs({'spades', 'hearts', 'clubs', 'diamonds'}) do
        local has_suit = SMODS.has_attribute(G.P_BLINDS[boss_key], suit)
        if has_suit then
            for other, other_obj in pairs(G.P_BLINDS) do
                if not added[other] and other ~= boss_key then
                    local other_has_suit = SMODS.has_attribute(other_obj, suit)
                    if other == 'bl_aij_the_day' or other == 'bl_aij_the_dagger' then
                        other_has_suit = not other_has_suit
                    end
                    if other_has_suit then
                        added[other] = true
                        add_bosses_used_ref(other, type)
                    end
                end
            end
        end
    end
end
