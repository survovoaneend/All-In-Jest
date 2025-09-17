local bananarama = {
    object_type = "Challenge",
    key = 'bananarama',
    jokers = {
        { id = 'j_aij_banana_man', eternal = true, edition = 'negative' },
        { id = 'j_oops', eternal = true, edition = 'negative' },
    },
    vouchers = {
        { id = 'v_magic_trick' },
        { id = 'v_illusion' },
    },
    restrictions = {
        banned_cards = {
            { id = 'j_aij_null_joker' },
            { id = 'j_aij_mistake' },
            { id = 'j_aij_anchor' },
            { id = 'p_arcana_normal_1', ids = {
                'p_arcana_normal_1', 'p_arcana_normal_2',
                'p_arcana_normal_3', 'p_arcana_normal_4',
                'p_arcana_jumbo_1', 'p_arcana_jumbo_2',
                'p_arcana_mega_1', 'p_arcana_mega_2' }
            },
            { id = 'p_celestial_normal_1', ids = {
                'p_celestial_normal_1', 'p_celestial_normal_2',
                'p_celestial_normal_3', 'p_celestial_normal_4',
                'p_celestial_jumbo_1', 'p_celestial_jumbo_2',
                'p_celestial_mega_1', 'p_celestial_mega_2' }
            },
            { id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1',
            }
            },
            { id = 'p_spectral_normal_1', ids = {
                'p_spectral_normal_1', 'p_spectral_normal_2', 'p_spectral_jumbo_1', 'p_spectral_mega_1',
            }
            },
            { id = 'p_aij_guess_the_jest' },
        }
    }
}
return { name = {"Challenges"}, items = {bananarama} }