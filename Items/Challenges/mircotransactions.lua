local mircotransactions = {
    object_type = "Challenge",
    key = 'mircotransactions',
    unlocked = function(self) -- Unlocks if player has discovered at least one pit blind
        if G and G.P_CENTERS and G.P_CENTERS['j_aij_gopnik'].discovered == true and G.P_CENTERS['j_aij_farceur'].discovered == true then
            return true 
        end
    end,
    ignore = true,
    jokers = { 
        { id = 'j_aij_gopnik' },
        { id = 'j_aij_farceur' },
    },
    rules = {
        custom = {
            {id = 'aij_no_mult_in_pool'},
        },
    },
    restrictions = {
        banned_cards = {
            -- { id = 'j_aij_glass_delusion' },
            { id = 'j_aij_gameshow' },
            { id = 'j_aij_cctv' },
            { id = 'j_aij_stained_glass_joker' },
            { id = 'j_aij_mummer' },
            { id = 'j_aij_tin_man' },
            { id = 'j_aij_lucky_seven' },
            -- { id = 'j_aij_platinum_chip' },
            { id = 'j_aij_wizard' },
            { id = 'j_aij_bartender' },
            { id = 'j_aij_colour_test' },
            { id = 'c_empress' },
            { id = 'c_chariot' },
            { id = 'c_justice' },
            { id = 'c_wheel_of_fortune' },
            { id = 'c_aij_typhon' },
            { id = 'c_aura' },
            { id = 'c_hex' },
            { id = 'c_black_hole' },
            { id = 'c_aij_pulsar' },
            { id = 'c_aij_gegenschein' },
            { id = 'm_mult' },
            { id = 'm_glass' },
            { id = 'm_steel' },
            { id = 'm_lucky' },
            { id = 'm_aij_scorched' },
        },
    }
}
if not All_in_Jest.config.moons_enabled then
    mircotransactions.restrictions.banned_cards[#mircotransactions.restrictions.banned_cards + 1] = { id = 'c_high_priestess' }
    mircotransactions.restrictions.banned_cards[#mircotransactions.restrictions.banned_cards + 1] = { id = 'c_aij_gravastar' }
    mircotransactions.restrictions.banned_cards[#mircotransactions.restrictions.banned_cards + 1] = { id = 'v_planet_merchant' }
    mircotransactions.restrictions.banned_cards[#mircotransactions.restrictions.banned_cards + 1] = { id = 'v_planet_tycoon' }
    mircotransactions.restrictions.banned_cards[#mircotransactions.restrictions.banned_cards + 1] = { id = 'p_celestial_normal_1', ids = {
        'p_celestial_normal_1', 'p_celestial_normal_2',
        'p_celestial_normal_3', 'p_celestial_normal_4',
        'p_celestial_jumbo_1', 'p_celestial_jumbo_2',
        'p_celestial_mega_1', 'p_celestial_mega_2' }
    }
else
    mircotransactions.restrictions.banned_cards[#mircotransactions.restrictions.banned_cards + 1] = { id = 'j_aij_astrologer' }
    mircotransactions.restrictions.banned_cards[#mircotransactions.restrictions.banned_cards + 1] = { id = 'j_aij_sky_trees' }
end
return { name = {"Challenges"}, items = {mircotransactions} }