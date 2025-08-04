SMODS.Booster:take_ownership_by_kind('Celestial', {
    group_key = "k_celestial_pack",
    update_pack = SMODS.Booster.update_pack,
    ease_background_colour = function(self) ease_background_colour_blind(G.STATES.PLANET_PACK) end,
    create_UIBox = SMODS.Booster.create_UIBox,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0,0, {
            timer = 0.07,
            scale = 0.1,
            initialize = true,
            lifespan = 15,
            speed = 0.1,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE, HEX('a7d6e0'), HEX('fddca0')},
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0,0, {
            timer = 2,
            scale = 0.05,
            lifespan = 1.5,
            speed = 4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE},
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _hand, _tally = nil, 0
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            if _hand then
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == _hand and not v.config.moon then
                        _planet = v.key
                    end
                end
            end
            _card = {set = "Planet", area = G.pack_cards, skip_materialize = true, soulable = true, key = _planet, key_append = "pl1"}
        else
            _card = {set = "Planet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "pl1"}
        end
        return _card
    end,
    loc_vars = pack_loc_vars,
},true)

SMODS.Stake:take_ownership('stake_blue', { 
    modifiers = function()
        return
    end,
},true)

local has_any_suit_ref = SMODS.has_any_suit
function SMODS.has_any_suit(card)
    return has_any_suit_ref(card) or All_in_Jest.counts_as_all_suits(card)
end

SMODS.jest_Badge = {
    key = "jest_chaotic_card",
    badge_colour = HEX '8F00FF',
}

SMODS.PokerHand {
    key = "Royal Flush",
    mult = 8,
    chips = 100,
    l_mult = 6,
    l_chips = 60,
    example = {
        { 'S_A', true },
        { 'S_K', true },
        { 'S_Q', true },
        { 'S_J', true },
        { 'S_10', true },
    },
    above_hand = 'Straight Flush',
    evaluate = function(parts, hand)
        if not next(parts._flush) or not next(parts._straight) then return {} end
        local min = 10
        for j = 1, #hand do
            if hand[j]:get_id() < min then min =hand[j]:get_id() end
        end
        if min >= 10 then 
            return { SMODS.merge_lists(parts._flush, parts._straight) }
        else
            return {}
        end
    end,
    visible = function(self)
        return false
    end,
}