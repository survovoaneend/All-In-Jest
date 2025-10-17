return {
    misc = {
        dictionary = {
            k_coder_badge = "Coder",
            k_artist_badge = "Artist",
            k_moon = "Moon",
            k_moon_q = "Moon?",
            k_star = "Star",
            k_tag = "Tag",
            k_star_q = "Star?",
            k_asteroid = "Asteroid",
            k_tarot_q = "Tarot?",
            k_active = "Active",
            k_inactive = "Inactive",
            aij_requires_restart = "Requires Restart",
            aij_doesnt_requires_restart = "Doesn't Require Restart",
            aij_upgraded_tags = "Gold Tags",
            aij_enable_moons = "Enable Moons",
            aij_enable_moons_tooltip = {
                'Enables {C:chips}Chips{} and {C:mult}Mult{} type',
                '{C:planet}Planet cards{} to show up in',
                'addition to normal {C:planet}Planet',
                '{C:planet}cards'
            },
            aij_alter_trypophobia = "Alter Trypophobia",
            aij_alter_trypophobia_tooltip = {
                '{C:attention}Changes{} the sprite of',
                '{C:attention}Trypophobia{} to be {C:attention}less',
                'disturbing'
            },
            aij_no_copy_neg = "No Negative Copies",
            aij_no_copy_neg_tooltip = {
                'Allows the {C:dark_edition}Negative{} edition',
                'on {C:attention}playing cards{} to be copied.',
                'While {C:attention}off{}, copied {C:dark_edition}Negative',
                'cards {C:red}lose{} their edition'
            },
            aij_blue_stake_rework = 'Blue Stake Rework',
            aij_blue_stake_rework_tooltip = {
                '{C:attention}Changes{} blue stake to use',
                'the new {C:attention}Pit Blinds{} instead',
                'of {C:red}-1{} Discard'
            },
            aij_random_deck_skins = 'Randomized Deck Skins',
            aij_random_deck_skins_tooltip = {
                '{C:attention}Playing cards{} added to the',
                'deck have random {C:attention}deck skins'
            },
            k_aij_guess_the_jest = "Guess the Jest",
            k_aij_memory_card = "Memorized!",
            aij_plus_tag = "+1 Tag",
            aij_refreshed = 'Refreshed',
            aij_paid_off = 'Paid Off',
            k_aij_polychrome_ex = 'Polychrome!',
            k_aij_foiled_again = 'Foiled Again!',
            k_aij_p_arcana = "+1 Arcana",
            k_aij_merry_christmas = "Merry Christmas!",
            k_aij_change_ex = 'Change!',
            k_aij_blood_spilt_ex = 'Blood Spilt!',
        },
        v_dictionary = {
            a_aij_percent_balance = "+%#1#",
            a_aij_percent_balance_minus = "-%#1#",
            
            a_aij_hands_minus = "-#1# Hands",

            a_aij_joker_slots = '+#1# Joker Slot',
            a_aij_joker_slots_minus = '-#1# Joker Slot',
        },
        challenge_names = {
            c_aij_bananarama = "Bananarama",
            c_aij_sharpest_tool = "Sharpest Tool",
        },
        v_text = {
            -- Challenges
            ch_c_aij_sharpest_tool_1 = {
                'Only {C:common}Common{} Jokers may appear',
            },
            ch_c_aij_sharpest_tool_2 = {
                'in the {C:attention}Shop{} or in {C:attention}Buffoon packs'
            },
        },
        extra_joker_dictionary = {
            -- You've got Mail
            k_aij_youve_got_mail = "You've Got Mail!",
            k_aij_youve_got_mail_none = "Does nothing...",
            k_aij_youve_got_mail_plus_prefix = "+",
            k_aij_youve_got_mail_dollar_prefix = "$",
            k_aij_youve_got_mail_xmult_prefix = "X",
            k_aij_youve_got_mail_mult_text = " Mult",
            k_aij_youve_got_mail_chip_text = " Chips",
            k_aij_youve_got_mail_dollars_text = " each hand played",
            -- Overdesigned
            k_aij_overdesigned_give_prefix = "give",
            k_aij_overdesigned_earn_prefix = "earn",
            k_aij_overdesigned_heart = "Heart",
            k_aij_overdesigned_club = "Club",
            k_aij_overdesigned_spade = "Spade",
            k_aij_overdesigned_diamond = "Diamond",
            -- Jerko
            k_aij_jerko_retrigger = "Retrigger",
            k_aij_jerko_times = "times",
            -- Blacklist
            k_aij_blacklist_empty = 'None',
            k_aij_blacklist_and = 'And',
            k_aij_blacklist_more = 'more',
        },
        labels = {
            -- Editions
            aij_glimmer = "Glimmer",
            aij_silver = "Silver",
            aij_stellar = "Stellar",
            aij_aureate = "Aureate",
            aij_torn = "Torn",
            -- Stickers
            aij_marked = "Marked",
            -- Seals
            aij_smiley_seal = "Smiley Seal",
            aij_melted_seal = "Melted Seal",
            -- Other
            k_aij_jest_chaotic_card = "Chaotic",
        },
        poker_hands = {
            ['aij_Royal Flush'] = "Royal Flush",
        },
        poker_hand_descriptions = {
            ['aij_Royal Flush'] = {
            ""
            },
        },
    },
    descriptions = {
        Back = {
            b_aij_fabled = {
                name = 'Fabled Deck',
                text = {
                    '{C:legendary,E:1}Legendary{} Jokers may',
                    'appear in the {C:attention}Shop',
                    '{C:attention}-1{} Joker Slot'
                },
                unlock = {
                    'Unlock a',
                    '{C:legendary,E:1}Legendary{} Joker',
                }
            },
            b_aij_fabled_hidden = {
                name = 'Fabled Deck',
                text = {},
                unlock = {
                    'Unlock a {C:legendary,E:1}Legendary{}',
                    'Joker',
                }
            },
            b_aij_branching = {
                name = 'Branching Deck',
                text = {
                    'Skips offer a choice',
                    'between {C:attention}3{} Tags',
                },
                unlock = {
                    'Skip at least {C:attention}5{}',
                    'blinds in a run',
                }
            },
            b_aij_branching_hidden = {
                name = 'Branching Deck',
                text = {},
                unlock = {
                    'Skip at least {C:attention}5{}',
                    'blinds in a run',
                }
            },
            b_aij_patchwork = {
                name = 'Patchwork Deck',
                text = {
                    'All playing cards {C:attention}appear',
                    'with a {C:attention}random{} suit patch'
                },
                unlock = {
                    'Have at least {C:attention}13',
                    'cards with a suit',
                    '{C:attention}patch{} at once'
                }
            },
            b_aij_patchwork_hidden = {
                name = 'Patchwork Deck',
                text = {},
                unlock = {
                    'Have at least {C:attention}13',
                    'cards with ?????',
                    'at once'
                }
            }
        },
        Stake = All_in_Jest.config.blue_stake_rework and {
            stake_blue = {
                name = "Blue Stake",
                text = {
                    'Boss Blind on Ante',
                    '{C:attention}4{} or {C:attention}5{} is a Pit Blind',
                    '{s:0.8}Applies all previous Stakes'
                }
            },
        } or {},
        Partner = {
            pnr_aij_simply = {
                name = "Simply",
                text = {
                    "Gains {C:mult}+#1#{} Mult at",
                    "end of round",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                },
                unlock={
                    "Win a run with",
                    "{C:attention}Simple Simon{} on",
                    "{C:attention}Gold Stake{} difficulty",
                },
            },
            pnr_aij_fourwarning = {
                name = "Fourwarning",
                text = {
                    "Gains {C:chips}+#1#{} Chips if",
                    "discard contains a {C:attention}4",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                },
                unlock={
                    "Win a run with",
                    "{C:attention}Tetraphobia{} on",
                    "{C:attention}Gold Stake{} difficulty",
                },
            },
            pnr_aij_nellie = {
                name = "Nellie",
                text = {
                    "{C:dark_edition}Negative{} Jokers are",
                    "{C:attention}#1#X{} more common",
                },
                unlock={
                    "Win a run with",
                    "{C:attention}Negative Nancy{} on",
                    "{C:attention}Gold Stake{} difficulty",
                },
            },
            pnr_aij_scratch = {
                name = "Scratch",
                text = {
                    '{C:attention}Retriggers{} leftmost',
                    '{C:attention}#1#{} rightmost Joker',
                    'on odd {C:attention}rounds'
                },
                unlock={
                    "Win a run with",
                    "{C:attention}Doodle{} on",
                    "{C:attention}Gold Stake{} difficulty",
                },
            },
            pnr_aij_banger = {
                name = "Banger",
                text = {
                    'Rerolls cost {C:money}$#1#{} less'
                },
                unlock={
                    "Win a run with",
                    "{C:attention}Silly Sausage{} on",
                    "{C:attention}Gold Stake{} difficulty",
                },
            },
            pnr_aij_flub = {
                name = "Flub",
                text = {
                    '{C:attention}Eternal{} Jokers are',
                    '{C:money}#1#{}'
                },
                unlock={
                    "Win a run with",
                    "{C:attention}Mistake{} on",
                    "{C:attention}Gold Stake{} difficulty",
                },
            },
        },
        Sleeve = {
            sleeve_aij_fabled = {
                name = "Fabled Sleeve",
                text = {
                    '{C:legendary,E:1}Legendary{} Jokers may',
                    'appear in the {C:attention}Shop',
                    '{C:attention}-1{} Joker Slot'
                }
            },
            sleeve_aij_fabled_alt = {
                name = "Fabled Sleeve",
                text = {
                    '{C:legendary,E:1}Legendary{} Jokers appear',
                    'more {C:attention}frequently'
                },
            },
            sleeve_aij_patchwork = {
                name = "Patchwork Sleeve",
                text = {
                    'All playing cards {C:attention}appear',
                    'with a {C:attention}random{} suit patch'
                }
            },
            sleeve_aij_patchwork_alt = {
                name = "Patchwork Sleeve",
                text = {
                    'All playing cards {C:attention}appear',
                    'with {C:attention}2 random{} suit patches'
                },
            },
        },
        Blind = {
            --Normal Blinds
            bl_aij_the_beith = {
                name = "The Beith",
                text = {
                    'All Diamonds',
                    'are drawn last'
                },
            },
            bl_aij_the_elm = {
                name = "The Elm",
                text = {
                    'All Clubs',
                    'are drawn last'
                },
            },
            bl_aij_the_alder = {
                name = "The Alder",
                text = {
                    'All Hearts',
                    'are drawn last'
                },
            },
            bl_aij_the_willow = {
                name = "The Willow",
                text = {
                    'All Spades',
                    'are drawn last'
                },
            },
            bl_aij_the_branch = {
                name = "The Branch",
                text = {
                    'All Face cards',
                    'are drawn last'
                },
            },
            bl_aij_the_horror = {
                name = "The Horror",
                text = {
                    'Apply Perishable to a',
                    "random Joker on",
                    "final hand of round",
                },
            },
            bl_aij_the_oak = {
                name = "The Oak",
                text = {
                    'Disable the',
                    'rightmost Joker',
                },
            },
            bl_aij_the_ingot = {
                name = "The Ingot",
                text = {
                    'Apply Eternal to all',
                    'Jokers on final',
                    'hand of round',
                },
            },
            bl_aij_the_hazel = {
                name = "The Hazel",
                text = {
                    "Apply Rental to a",
                    "random Joker when",
                    "Blind is defeated",
                },
            },
            bl_aij_the_apple = {
                name = "The Apple",
                text = {
                    'Destroy leftmost Joker',
                    "if Blind is won",
                    "in one hand",
                },
            },
            bl_aij_the_neck = {
                name = "The Neck",
                text = {
                    'Can only discard',
                    '1 card at a time'
                },
            },
            bl_aij_the_groan = {
                name = "The Groan",
                text = {
                    'Increase the score ',
                    'requirement by 50%',
                    'after each hand',
                },
            },
            bl_aij_the_ash = {
                name = "The Ash",
                text = {
                    '+0.25X Base requirement per',
                    'card below #1# in',
                    'full deck',
                },
            },
            bl_aij_the_clay = {
                name = "The Clay",
                text = {
                    'Randomly large blind',
                },
            },
            bl_aij_the_aspen = {
                name = "The Aspen",
                text = {
                    '+2X Base per Blind',
                    'defeated this Ante',
                },
            },
            bl_aij_the_evergreen = {
                name = "The Evergreen",
                text = {
                    '+0.2X Base requirement per',
                    'card above #1# in',
                    'full deck',
                },
            },
            bl_aij_the_enigma = {
                name = "The Enigma",
                text = {
                    'Enhanced cards',
                    'are drawn last',
                },
            },
            bl_aij_the_bullion = {
                name = "The Bullion",
                text = {
                    '-$5 per played',
                    'enhanced card',
                },
            },
            bl_aij_the_elbow = {
                name = "The Elbow",
                text = {
                    'Played enhancements',
                    'are randomized',
                },
            },
            bl_aij_the_thorn = {
                name = "The Thorn",
                text = {
                    'Debuffs all',
                    'enhanced cards',
                },
            },
            bl_aij_the_twin = {
                name = "The Twin",
                text = {
                    'Enhanced cards are',
                    'drawn face down',
                },
            },
            bl_aij_the_giant = {
                name = "The Giant",
                text = {
                    'Very large blind',
                    '+2 Hands'
                },
            },
            bl_aij_the_auroch = {
                name = "The Auroch",
                text = {
                    'All #1# and #2#s',
                    'are drawn face down'
                },
            },
            bl_aij_the_journey = {
                name = "The Journey",
                text = {
                    '+1 Win Ante if a',
                    '#1# suit card is',
                    'scored this round',
                },
            },
            bl_aij_the_gift = {
                name = "The Gift",
                text = {
                    "Sets money to $0",
                    "Earn $1 per card",
                    "played or discarded"
                },
            },
            bl_aij_the_ancestor = {
                name = "The Ancestor",
                text = {
                    'Poker hands that you',
                    'have discarded this',
                    'round cannot be played'  
                },
            },
            bl_aij_the_god = {
                name = "The God",
                text = {
                    'All cards',
                    'must score'
                },
            },
            bl_aij_the_beast = {
                name = "The Beast",
                text = {
                    'Destroy all Food Jokers',
                    'when this blind is',
                    'defeated'
                },
            },
            bl_aij_the_ulcer = {
                name = "The Ulcer",
                text = {
                    "-1 Hand",
                    "-1 Discard"
                },
            },
            bl_aij_the_need = {
                name = "The Need",
                text = {
                    "Must have at",
                    "least $20 for",
                    "hands to score"
                },
            },
            bl_aij_the_day = {
                name = "The Day",
                text = {
                    'Hand must contain',
                    'a Heart or Diamond'
                },
            },
            bl_aij_the_celebration = {
                name = "The Celebration",
                text = {
                    '+0.2X Base per unused',
                    'hand/discard this Ante'
                },
            },
            bl_aij_the_storm = {
                name = "The Storm",
                text = {
                    'Destroy all non-scoring',
                    'played cards'
                },
            },
            bl_aij_the_frost = {
                name = "The Frost",
                text = {
                    'Destroy one random card',
                    'in hand after hand is',
                    'played'
                },
            },
            bl_aij_the_yew = {
                name = "The Yew",
                text = {
                    'All odd ranks',
                    'are debuffed'
                },
            },
            bl_aij_the_hoard = {
                name = "The Hoard",
                text = {
                    'Excess score this Ante',
                    'is added to this blind',
                    'when selected'
                },
            },
            bl_aij_the_pear = {
                name = "The Pear",
                text = {
                    'Randomize the suit and',
                    'rank of cards held in',
                    'hand after scoring'
                },
            },
            bl_aij_the_elk = {
                name = "The Elk",
                text = {
                    'Cannot play poker hands',
                    'that were played',
                    'previously this ante'
                },
            },
            bl_aij_the_birch = {
                name = "The Birch",
                text = {
                    'All even ranks',
                    'are debuffed'
                },
            },
            bl_aij_the_sun = {
                name = "The Sun",
                text = {
                    'Spades and Clubs',
                    'are drawn face',
                    'down'
                },
            },
            bl_aij_the_spear = {
                name = "The Spear",
                text = {
                    'All played cards in the',
                    'winning hand are permanently',
                    'debuffed'
                },
            },
            bl_aij_the_steed = {
                name = "The Steed",
                text = {
                    'Debuff cards held',
                    'in hand when',
                    'hand is played'
                },
            },
            bl_aij_the_figure = {
                name = "The Figure",
                text = {
                    'Hand cannot contain',
                    '3 or more face cards',
                },
            },
            bl_aij_the_lake = {
                name = "The Lake",
                text = {
                    'Cards played this',
                    'Ante are drawn',
                    'last'
                },
            },
            bl_aij_the_field = {
                name = "The Field",
                text = {
                    'All cards are',
                    'debuffed until 10',
                    'cards discarded'
                },
            },
            bl_aij_the_wound = {
                name = "The Wound",
                text = {
                    'Hands do not',
                    'score until 0',
                    'discard remain'
                },
            },
            bl_aij_the_brimstone = {
                name = "The Brimstone",
                text = {
                    'Lose half of',
                    'your money',
                    'each discard'
                },
            },
            bl_aij_the_blush = {
                name = "The Blush",
                text = {
                    'Must discard 5',
                    'cards at a time'
                },
            },
            --Pit Blinds
            bl_aij_the_heart = {
                name = "The Heart",
                text = {
                    'Must play a hand',
                    'containing a #1#',
                    'before hands score'
                },
            },
            bl_aij_the_rains = {
                name = "The Rains",
                text = {
                    'Remove vanilla modifiers',
                    'from all scored cards in',
                    'the winning hand'
                },
            },
            bl_aij_the_child = {
                name = "The Child",
                text = {
                    'Reduce the rank of all',
                    'scoring cards by 1'
                },
            },
            bl_aij_the_moon = {
                name = "The Moon",
                text = {
                    'All cards on odd numbered',
                    'hands are debuffed'
                },
            },
            bl_aij_the_shell = {
                name = "The Shell",
                text = {
                    '#1# in #2# cards are debuffed',
                    '#3# in #4# cards are drawn',
                    'face down'
                },
            },
            bl_aij_the_earth = {
                name = "The Earth",
                text = {
                    'Turns all cards held in',
                    'hand into Stone Cards',
                    'after scoring'
                },
            },
            bl_aij_the_dragon = {
                name = "The Dragon",
                text = {
                    'Cannot draw any cards',
                    'until hand is empty',
                },
            },
            bl_aij_the_mountain = {
                name = "The Mountain",
                text = {
                    'Very large blind',
                    '+1 Hand size'
                },
            },
            bl_aij_the_conflagration = {
                name = "The Conflagration",
                text = {
                    'If played hand defeats the',
                    'Blind, destroy all cards',
                    'played and held in hand'
                },
            },
            bl_aij_the_umbilical = {
                name = "The Umbilical",
                text = {
                    'Mark one random card each',
                    'hand, These cards cannot',
                    'be played or discarded'
                },
            },
            bl_aij_the_divine = {
                name = "The Divine",
                text = {
                    'Hand must contain',
                    'an enhanced card'
                },
            },
            bl_aij_the_bird = {
                name = "The Bird",
                text = {
                    'Shuffle 1 random',
                    'Joker before scoring'
                },
            },
            bl_aij_the_arrow = {
                name = "The Arrow",
                text = {
                    'Played hand\'s score must',
                    'exceed the score of all',
                    'previous played hands'
                },
            },
            bl_aij_the_brilliance = {
                name = "The Brilliance",
                text = {
                    'Must meet the score',
                    'requirement twice',
                    '+2 Hands',
                },
            },
            -- Finisher Blinds
            bl_aij_obsidian_blade = {
                name = "Obsidian Blade",
                text = {
                    '-1 Hand Size, -1 Discard,',
                    '-1 Hand, Large Blind'
                },
            },
            bl_aij_aureate_coin = {
                name = "Aureate Coin",
                text = {
                    '+0.1X base for each $1',
                    'you have when entering',
                    'the ante'
                },
            },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "Fervent Card",
                text = {
                    "Gains {C:chips}+#2#{} chips",
                    "when scored"
                }
            },
            m_aij_dyscalcular = {
                name = "Dyscalcular Card",
                text = {
                    "Counts as every {C:attention}numbered{} rank",
                    "{C:inactive}(Except for making poker hands)"
                }
            },
            m_aij_charged = {
                name = "Charged Card",
                text = {
                    "{C:attention}Enhancements{} give {C:attention}+#1#%{} effect",
                    "if {C:attention}played with{} or",
                    "{C:attention}held in hand with{} this card",
                }
            },
            m_aij_ice = {
                name = "Ice Card",
                text = {
                    "{C:attention}Always{} scores",
                    "{C:red}Ignores{} the selection limit",
                    "Doesn't affect {C:attention}hand calculation",
                    "if this card causes hand to",
                    "exceed {C:attention}#1#{} cards"
                }
            },
            m_aij_wood = {
                name = "Wood Card",
                text = {
                    '{C:chips}+#1#{} chips when held in hand',
                    'Increases by {C:chips}+#2#{} for every',
                    'other {C:attention}Wood{} card held in hand'
                }
            },
            m_aij_simulated = {
                name = "Simulated Card",
                text = {
                    'This card {C:attention}returns{} to your',
                    'hand {C:attention}after{} the first time',
                    'it is {C:attention}played'
                }
            },
            m_aij_canvas = {
                name = "Canvas Card",
                text = {
                    '{C:attention}Copies{} the rank and suit',
                    'of card to the {C:attention}right'
                }
            },
        },
        Voucher = {
            v_aij_fairy_dust ={
                name = "Fairy Dust",
                text = {
                    "{C:dark_edition}Glimmer{}, {C:dark_edition}Silver{}, and",
                    "{C:dark_edition}Stellar{} cards",
                    "appear {C:attention}#1#X{} more often",
                },
            },
            v_aij_live_pixie ={
                name = "Live Pixie",
                text = {
                    "{C:dark_edition}Glimmer{}, {C:dark_edition}Silver{}, and",
                    "{C:dark_edition}Stellar{} cards",
                    "appear {C:attention}#1#X{} more often",
                },
            },
            v_aij_gold_medal ={
                name = "Gold Medal",
                text = {
                    "{C:money}Gold{} Tags appear",
                    "{C:attention}#1#X{} more often",
                },
            },
            v_aij_trophy ={
                name = "Trophy",
                text = {
                    "{C:attention}Large Blind{} skip",
                    "Tag has a {C:green}#1# in #2#",
                    "chance to be {C:money}Gold"
                },
            },
            v_aij_sticker_sheet ={
                name = "Sticker Sheet",
                text = {
                    '{C:attention}Lessens{} the effect',
                    'of {C:red}detrimental',
                    '{C:attention}stickers'
                },
            },
            v_aij_polkadot ={
                name = "Polkadot",
                text = {
                    '{C:attention}Lessens{} the effect',
                    'of {C:red}detrimental',
                    '{C:attention}stickers'
                },
            },
        },
        Edition = {
            e_aij_negative_playing_card = {
                name = "Negative",
                text = {
                    "{C:dark_edition}+#1#{} hand size",
                    "{C:inactive}(Removed from copies)"
                },
            },
            e_aij_glimmer = {
                name = "Glimmer",
                text = {
                    "{C:aij_plasma}Balances{} {C:attention}#1#%{} of",
                    "{C:chips}Chips{} and {C:mult}Mult{}"
                }
            },
            e_aij_silver = {
                name = "Silver",
                text = {
                    "{C:attention}X#1#{} effects",
                }
            },
            e_aij_stellar = {
                name = "Stellar",
                text = {
                    "{C:chips}+#1#{} Chips and",
                    "{C:mult}+#2#{} Mult per {C:attention}level{}",
                    "of played hand"
                }
            },
            e_aij_aureate = {
                name = "Aureate",
                text = {
                    "{C:money}X$#1#",
                    "{C:inactive}(Max of {C:money}$#2#{}{C:inactive})"
                }
            },
            e_aij_torn = {
                name = "Torn",
                text = {
                    
                }
            },
        },
        Joker = {
            -- Credit stuff
            j_aij_nevernamed_credits_joker = {
                name = "Nevernamed",
                text = {
                    '{C:inactive}"Some quote or something"',
                },
            },
            j_aij_survivalaren_credits_joker = {
                name = "Survivalaren",
                text = {
                    '{C:inactive}"I started this because I wanted',
                    '{C:inactive}to get better at programming and',
                    '{C:inactive}I still suck at programming"'
                },
            },
            j_aij_rattling_snow_credits_joker = {
                name = "RattlingSnow353",
                text = {
                    '{C:inactive}"Some quote or something"',
                },
            },
            -- Jokers
            j_aij_flying_ace = {
                name = "Flying Ace",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "per {C:attention}Ace{} of unique {C:attention}suit{}",
                    "scored this round",
                    "{C:inactive}(Currently{} {C:money}$#2#{}{C:inactive}){}"
                },
            },
            j_aij_lucky_seven = {
                name = "Lucky Seven",
                text = {
                    "Turn all scored",
                    "unenhanced {C:attention}7s{} into",
                    "{C:attention}Lucky Cards{}"
                },
            },
            j_aij_you_broke_it = {
                name = "You Broke It!",
                text = {
                    "Turn every scored unenhanced {C:attention}#1#{}",
                    "into a {C:attention}#2#{}",
                    "{s:0.8}Rank and Enhancement",
                    "{s:0.8}change at end of round"
                },
            },
            j_aij_birthday_clown = {
                name = "Birthday Clown",
                text = {
                    "{X:mult,C:white}X#1#{} Mult for",
                    "{C:attention}1{} round each {C:attention}Ante{}",
                    "{C:inactive}#2#"
                },
            },
            j_aij_memory_card = { 
                name = "Memory Card", 
                text = { 
                    "If first hand of round",
                    "contains {C:attention}exactly one{} card,",
                    "that card is always {C:attention}drawn",
                    "{C:attention}first{} in future Blinds",
                    "{C:inactive}(Can only store one card)",
                    "{C:inactive}(Only triggers in leftmost position)" 
                } 
            },
            j_aij_sleepy_joker = { 
                name = "Sleepy Joker", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult if played hand", 
                    "contains only {C:spades}Spades{} and {C:clubs}Clubs"
            } 
            },
            j_aij_invisible_man = { 
                name = "Invisible Man", 
                text = { 
                    "All {C:attention}face cards{} count as",
                    "{C:attention}Kings{}, {C:attention}Queens{}, and {C:attention}Jacks",
                    "{C:inactive}(Except for making poker hands)"
                } 
            },
            j_aij_handsome_joker = { 
                name = "Handsome Joker", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult for each",
                    "{C:attention}#2#{}",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{} {C:inactive}Mult)",
                    "{C:inactive}(Minimum {X:mult,C:white}X1{} {C:inactive}Mult)"
                } 
            },
            j_aij_whiteface_grotesque = { 
                name = "Whiteface Grotesque", 
                text = { 
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "for each {C:attention}Face{} card {C:attention}held in",
                    "{C:attention}hand{} after hand is played",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                } 
            },
            j_aij_the_clown_show = { 
                name = "The Clown Show", 
                text = { 
                    "{C:chips}+#1#{} Chips per {C:attention}Joker",
                    "purchased this run",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                } 
            },
            j_aij_little_devil = {
                name = "Little Devil",
                text = {
                    "When {C:attention}skipping{} a {C:attention}Blind{},",
                    "create a {C:attention}Standard{}, {C:tarot}Charm{},",
                    "{C:planet}Meteor{}, {C:spectral}Ethereal{}, or",
                    "{C:red}Buffoon {C:attention}Tag{}"
                },
            },
            j_aij_pierrot = { 
                name = "Pierrot", 
                text = { 
                    "{C:attention}Numbered{} Cards held in",
                    "hand give their {C:chips}Chip{} value" 
                } 
            },
            j_aij_hat_trick = { 
                name = "Hat Trick", 
                text = { 
                    "Played {C:attention}3s{} give {C:mult}+#1#{} Mult",
                    "per level of",
                    "{C:attention}Three of a Kind{}",
                    "when scored"
                } 
            },
            j_aij_squeezy_pete = {
                name = "Squeezy Pete",
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult per",
                    "{C:attention}consecutive{} played hand",
                    "containing a {C:attention}Full House{}",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{}{C:inactive} Mult){}",
                },
            },
            j_aij_infinite_jest = { 
                name = "Infinite Jest", 
                text = { 
                    "Levels up {C:attention}all poker",
                    "{C:attention}hands{} when {C:attention}Boss Blind",
                    "is defeated"
                } 
            },
            j_aij_bloody_mary = { name = "Bloody Mary", text = { "" } },
            j_aij_trypophobia = {
                name = "Trypophobia",
                text = {
                    "{C:mult}+#1#{} Mult if scored hand",
                    "contains only {C:attention}8s{}",
                },
            },
            j_aij_rummikub = { name = "Rummikub", text = { "" } },
            j_aij_imperial_bower = { 
                name = "Imperial Bower", 
                text = { 
                    "{C:attention}First card{} drawn",
                    "each round counts as",
                    "{C:attention}any{} rank and suit",
                    "{C:inactive}(Ranks can't make poker hands)"
                } 
            },
            j_aij_ultrasound = {
                name = "Ultrasound",
                text = {
                    "Selecting a {C:attention}Booster Pack{} shows",
                    "one of its contents"
                }
            },
            j_aij_negative_nancy = {
                name = "Negative Nancy",
                text = {
                    "{C:dark_edition}Negative{} Jokers appear {C:attention}#1#X{}",
                    "more often in the {C:attention}Shop{}"
                },
            },
            j_aij_old_joker = { 
                name = "Old Joker", 
                text = { 
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "and {C:mult}+#4#{} Mult when {C:attention}Boss",
                    "{C:attention}Blind{} is defeated",
                    "{C:inactive,s:0.8}(Currently {C:chips,s:0.8}+#1#{}{C:inactive,s:0.8} Chips and {C:mult,s:0.8}+#3#{}{C:inactive,s:0.8} Mult)",
                } 
            },
            j_aij_imageboard = { 
                name = "Imageboard", 
                text = { 
                    "{C:attention}Scoring{} cards give {C:mult}Mult{}",
                    "equal to the amount of",
                    "times their {C:attention}rank{} has been",
                    "{C:attention}scored{} this hand" 
                } 
            },
            j_aij_carousel = { 
                name = "Carousel", 
                text = { 
                    "{C:attention}Rotates{} the suit of",
                    "{C:attention}scored{} cards after scoring",
                    "{C:inactive,s:0.8}(Spades -> Hearts -> Clubs -> Diamonds)"
                } 
            },
            j_aij_slippery_when_wet = { name = "Slippery When wet", text = { "" } },
            j_aij_founding_father = { 
                name = "Founding Father", 
                text = { 
                    "{C:attention}Charged Cards{} are",
                    "{C:attention}twice{} as effective"
                } 
            },
            j_aij_scary_story = {
                name = "Scary Story",
                text = {
                    "Base edition playing cards",
                    "in {C:attention}Standard Packs{}",
                    "have a {C:green}#1# in #2#{} chance",
                    "to become {C:dark_edition}Negative{}"
                },
            },
            j_aij_doodle = {
                name = "Doodle",
                text = {
                    "{C:attention}Copies{} the {C:attention}abilities{} of",
                    "both adjacent {C:attention}Jokers{} on",
                    "{C:red}even{} rounds",
                    "{C:inactive}#1#"
                },
            },
            j_aij_joqr = { name = "Joqr", text = { "" } },
            j_aij_greasepaint = { 
                name = "Greasepaint", 
                text = {
                    {
                        "Disables Adjacent {C:attention}Jokers{}"
                    },
                    {
                        "Disabled {C:attention}Jokers{} and",
                        "{C:attention}Cards{} give {X:mult,C:white}X#1#{} Mult"
                    }  
                } 
            },
            j_aij_public_bathroom = {
                name = "Public Bathroom",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "per scored {C:attention}2{} in a {C:attention}Flush{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                },
            },
            j_aij_diogenes = { name = "Diogenes", text = { "" } },
            j_aij_blank_card = {
                name = "Blank Card",
                text = {
                    "Every time a {C:attention}playing card{} is",
                    "chosen from a {C:attention}Standard Pack{},",
                    "create an exact {C:attention}copy{}"
                },
            },
            j_aij_comedians_manifesto = { 
                name = "Comedian's Manifesto", 
                text = { 
                    "{C:attention}Kings{} and {C:attention}Queens{} in",
                    "{C:attention}Standard Packs{} become",
                    "{C:attention}Jacks" 
                } 
            },
            j_aij_circuit_board = { name = "Circuit Board", text = { "" } },
            j_aij_platinum_chip = { name = "Platinum Chip", text = { "" } },
            j_aij_cctv = { 
                name = "CCTV", 
                text = { 
                    "When a {C:attention}Glass Card{} is {C:attention}broken{},",
                    "earn {C:money}$#1#{} and enhance a",
                    "random card held in hand",
                    "with {C:attention}Glass{}"
                } 
            },
            j_aij_pell_mel = { 
                name = "Pell Mel", 
                text = { 
                    "{X:mult,C:white}X1{} Mult, gains {X:mult,C:white}X#1#{} Mult",
                    "per {C:attention}unique{} suit in",
                    "{C:attention}played hand",
                    "{C:inactive,s:0.8}(Resets after hand scored)"

                } 
            },
            j_aij_pput_together = { name = "Put Together", text = { "" } },
            j_aij_krampus = {
                name = "Krampus",
                text = {
                    "Scored {C:attention}Gold Cards{}",
                    "turn into {C:attention}Stone Cards{}.",
                    "{C:attention}Stone Cards{} earn",
                    "{C:money}$#1#{} when scored"
                },
            },
            j_aij_art_of_the_deal = { 
                name = "Art of the Deal", 
                text = { 
                    "Gains {C:mult}+#2#{} Mult when",
                    "{C:money}money{} is earned",
                    "Resets if you have",
                    "{C:money}$0{} or less",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                } 
            },
            j_aij_word_art = { 
                name = "Word Art", 
                text = { 
                    "{C:mult}+#1#{} Mult per {C:attention}Ace{},",
                    "{C:attention}King{}, {C:attention}Queen{}, or {C:attention}Jack{}",
                    "in played hand"
                } 
            },
            j_aij_atom = {
                name = "Atom",
                text = {
                    "Levels up {C:attention}High Card{}",
                    "if played hand is",
                    "only one {C:attention}Ace{}"
                },
            },
            j_aij_plain_jane = {
                name = "Plain Jane",
                text = {
                    "Scored {C:attention}unenhanced{}",
                    "cards give {C:mult}+#1#{} Mult"
                },
            },
            j_aij_paper_bag = { 
                name = "Paper Bag", 
                text = { 
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "per {C:attention}level{} of each {C:red}discarded",
                    "poker hand",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)" 
                } 
            },
            j_aij_fruity_joker = { 
                name = "Fruity Joker", 
                text = { 
                    "{C:attention}Polychrome{} cards and",
                    "Jokers give {C:mult}+#1#{} Mult",
                } 
            },
            j_aij_jokia = { name = "Jokia", text = { "" } },
            j_aij_the_mycologists = {
                name = "The Mycologists",
                text = {
                    "If played hand is exactly a {C:attention}#1#{},",
                    "{C:red}destroy{} the right card and give",
                    "its {C:chips}Chips{}, {C:dark_edition}Enhancement{}, and",
                    "{C:dark_edition}Edition{} to the left card"
                }
            },
            j_aij_cool_joker = { 
                name = "Cool Joker", 
                text = { 
                    "{B:1,C:white,s:0.8}Activated Ability",
                    "{V:1}Activate{} this {C:attention}Joker{} when it",
                    "would {C:attention}normally{} score for",
                    "{X:mult,C:white}X#1#{} Mult" 
                } 
            },
            j_aij_square_eyes = { 
                name = "Square Eyes", 
                text = {
                    "Scored {C:attention}4s{} give {C:mult}+#1#{} Mult",
                    "per {C:attention}4{} in played hand"
                } 
            },
            j_aij_punk_joker = {
                name = "Punk Joker",
                text = {
                    "If scored hand contains a",
                    "{C:attention}Wild Card{}, turn a random",
                    "unenhanced scored card",
                    "into a {C:attention}Wild Card{}"
                },
            },
            j_aij_slim_joker = { 
                name = "Slim Joker", 
                text = { 
                    "{C:mult}+#1#{} Mult",
                    "{C:mult}-#2#{} Mult per card",
                    "in played hand",
                } 
            },
            j_aij_wireframe = { 
                name = "Wireframe", 
                text = { 
                    "{C:attention}First{} played hand each",
                    "round {C:attention}returns{} to your {C:attention}hand",
                    "after being {C:attention}played" 
                } 
            },
            j_aij_soviet = { 
                name = "Soviet", 
                text = { 
                    "{C:mult}+#1#{} Mult if {C:attention}played hand{}",
                    "contains no {C:attention}Kings{} or {C:attention}Queens{}"
                } 
            },
            j_aij_mustachio = { name = "Mustachio", text = { "" } },
            j_aij_penny = {
                name = "Penny",
                text = {
                    "Cards with {C:money}Gold Seal{} have a",
                    "{C:green}#1# in #2#{} chance to {C:attention}retrigger"
                },
            },
            j_aij_doctors_note = { 
                name = "Doctor's Note", 
                text = { 
                    "All {C:attention}numbered{} {C:hearts}Hearts{} are",
                    "considered the {C:attention}same rank",
                    "{C:inactive}(Except for making poker hands)"
                } 
            },
            j_aij_silly_sausage = { 
                name = "Silly Sausage", 
                text = { 
                    "{C:green}Rerolls{} cost {C:money}$#1#{} less",
                    "{C:attention}Decreases{} by {C:money}$#2#{}",
                    "at end of round"
                } 
            },
            j_aij_joker_baby = { name = "Joker Baby", text = { "" } },
            j_aij_anchor = { 
                name = "Anchor", 
                text = { 
                    "This Joker and",
                    "Adjacent Jokers {C:attention}cannot{}",
                    "{C:attention}be {C:red}destroyed" 
                } 
            },
            j_aij_hei_tiki = { 
                name = "Hei-tiki", 
                text = { 
                    "This {C:attention}Joker{} gains {C:mult}+#2#{} Mult",
                    "if played hand's final",
                    "{C:chips}Chips{} exceeds {C:mult}Mult{}",
                    "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult)"
                } 
            },
            j_aij_polybius = { 
                name = "Polybius", 
                text = { 
                    "Adds {C:mult}Mult{} and {C:chips}Chips{} equal to",
                    "the {C:attention}combined{} base stats of",
                    "all hand types contained",
                    "within {C:attention}played hand" 
                } 
            },
            j_aij_joker_sighting = { name = "Joker Sighting", text = { "" } },
            j_aij_pencil_drawing = { 
                name = {
                    "Pencil Drawing",
                },
                text = { 
                    "{B:1,C:white,s:0.8}Activated Ability",
                    "Pay {C:money}$#1#{} to add a {C:attention}random",
                    "{C:attention}playing card{} to your hand"
                } 
            },
            j_aij_holy_bible = { name = "Holy Bible", text = { "" } },
            j_aij_great_white_north = { name = "Great white North", text = { "" } },
            j_aij_right_angle = { 
                name = "Right Angle", 
                text = { 
                    "Trigger all {C:attention}10s{} held in hand",
                    "when a {C:attention}9{} is scored" 
                } 
            },
            j_aij_adoring_joker = {
                name = "Adoring Joker",
                text = {
                    "{C:attention}After{} {C:attention}Jokers{} have triggered,",
                    "set {C:mult}Mult{} to the {C:attention}highest",
                    "{C:mult}Mult{} reached this {C:attention}Ante",
                    "{C:inactive}(Currently {C:mult}#1# {C:inactive}Mult)"
                } 
            },
            j_aij_lucignolo = {
                name = "Lucignolo",
                text = {
                    "Earn {C:money}$#1#{} when any",
                    "playing card is {C:attention}destroyed{}"
                },
            },
            j_aij_scorecard = { 
                name = "Scorecard", 
                text = { 
                    "When {C:attention}Blind{} is selected,",
                    "level up a {C:attention}random",
                    "{C:attention}poker hand{} by {C:attention}#1#"
                } 
            },
            j_aij_punch_and_judy = { 
                name = "Punch and Judy", 
                text = { 
                    {
                        "If {C:attention}played hand{} contains",
                        "exactly {C:attention}#1# King{} and {C:attention}#1#",
                        "{C:attention}Queen{}, retrigger all scoring",
                        "cards"
                    },
                    {
                        "{C:attention}Kings{} and {C:attention}Queens{} always",
                        "score"
                    }
                } 
            },
            j_aij_nature_tapes = { 
                name = "Nature Tapes", 
                text = { 
                    "When a {C:mult}Mult{} type {C:planet}planet",
                    "card is used, this joker",
                    "gains {C:mult}+#1#{} Mult",
                    "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult)",
                } 
            },
            j_aij_low_priest = { 
                name = "Low Priest", 
                text = { 
                    "{C:mult}+#1#{} Mult,",
                    "{C:mult}-#2#{} Mult per {C:attention}level{}",
                    "of played hand"
                } 
            },
            j_aij_oil_and_water = { name = "Oil and Water", text = { "" } },
            j_aij_big_ears = { name = "Big-Ears", text = { "" } },
            j_aij_causal_absent_paranoia = { name = "Causal Absent Paranoia", text = { "" } },
            j_aij_hand_drawn = { 
                name = "Hand Drawn", 
                text = { 
                    "On the {C:attention}first hand{} of the",
                    "{C:attention}round{}, keep drawing cards",
                    "until your hand {C:attention}contains",
                    "your most played {C:attention}poker",
                    "{C:attention}hand{}" 
                }
            },
            j_aij_haruspex = { 
                name = "Haruspex", 
                text = { 
                    "{B:1,C:white,s:0.8}Activated Ability",
                    "Spend {C:attention}#1#{} {C:red}Discard{} to choose {C:attention}#2#{}",
                    "cards from your {C:attention}deck{} to",
                    "{C:attention}draw{} to your hand"
                } 
            },
            j_aij_bobblehead = { name = "Bobblehead", text = { "" } },
            j_aij_topsy_the_clown = { 
                name = "Topsy the Clown", 
                text = { 
                    "Rounds {C:chips}Chips{} and {C:mult}Mult",
                    "upwards to closest",
                    "{C:attention}palindrome" 
                } 
            },
            j_aij_cloudwatching = { name = "Cloudwatching", text = { "" } },
            j_aij_line_in_the_sand = {
                name = "Line in the Sand",
                text = {
                    "{C:attention}Discarded{} cards do not return",
                    "to {C:attention}deck{} until end of Ante"
                }
            },
            j_aij_hairy_joker = { name = "Hairy Joker", text = { "" } },
            j_aij_realty_sign = {
                name = "Realty Sign",
                text = {
                    "Playing a {C:attention}Full House{}",
                    "increases the {C:money}sell value{}",
                    "of this Joker by {C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = { 
                name = "Bad Apple", 
                text = { 
                    "This Joker gains {X:mult,C:white}X#2#{} Mult",
                    "if {C:attention}scored hand{} contains ",
                    "{C:attention}#4#{} {C:spades}Dark{} suits and {C:attention}#3#{} {C:hearts}Light{} suits",
                    "{C:inactive,s:0.8}(Proportion changes at end of round)",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)"
                } 
            },
            j_aij_dim_bulb = {
                name = "Dim Bulb",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if no {C:uncommon}Uncommon",
                    "or {C:red}Rare{} {C:attention}Jokers{}",
                    "are owned"
                },
            },
            j_aij_blood_artist = { 
                name = "Blood Artist", 
                text = { 
                    "When any Joker or card is",
                    "{C:money}sold{} or {C:attention}destroyed{},",
                    "decrease the score",
                    "requirement of the current",
                    "{C:attention}Blind{} by {C:attention}#1#%" 
                } 
            },
            j_aij_null_joker = {
                name = "Null Joker",
                text = {
                    "Sets all {C:green}probabilities{}",
                    "to {C:attention}zero{}"
                },
            },
            j_aij_magick_joker = {
                name = "Magick Joker",
                text = {
                    "Played {V:1}#1#{} cards give their",
                    "{C:chips}+Chips{} as {C:mult}+Mult{} instead",
                    "{C:inactive,s:0.8}(Suit changes at end of round){}"
                }
            },
            j_aij_jeff_the_joker = {
                name = "Jeff the Joker",
                text = {
                    'When {C:attention}Small Blind{} is selected,',
                    '{C:red}destroy{} all other Jokers and',
                    'this Joker gains {X:mult,C:white}X#2#{} Mult for each',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive})'
                },
            },
            j_aij_zanni = { 
                name = "Zanni", 
                text = { 
                    "{C:attention}Numbered{} cards have a {C:green}#1# in #2#{}",
                    "chance to create a {C:tarot}Tarot{} card",
                    "when {C:attention}scored"
                } 
            },
            j_aij_furbo_e_stupido = { 
                name = "Furbo e Stupido", 
                text = { 
                    "{C:attention}Dyscalcular{} cards also",
                    "count as {C:attention}Aces and {C:attention}Jacks" 
                } 
            },
            j_aij_read_em_and_weep = {
                name = "Read 'em and Weep", 
                text = { 
                    "If hand contains a {C:attention}Straight{},",
                    "convert all {C:attention}played{} cards to",
                    "the same random {C:attention}suit",
                    "before scoring" 
                } 
            },
            j_aij_goblin_joker = { 
                name = "Goblin Joker", 
                text = { 
                    "After {C:red}discard{}, draw {C:attention}#1#",
                    "additional cards" 
                } 
            },
            j_aij_string_theory = { 
                name = "String Theory", 
                text = { 
                    "Hand always counts as",
                    "containing a {C:attention}Straight" 
                } 
            },
            j_aij_jesters_privelege = {
                name = "Jester's Privilege",
                text = {
                    "{C:legendary}Legendary{} Jokers may",
                    "appear in the {C:attention}Shop{}",
                },
            },
            j_aij_privelege_fabled = {
                name = "Jester's Privilege",
                text = {
                    "{C:legendary}Legendary{} Jokers are",
                    "{C:attention}more common{}",
                },
            },
            j_aij_quark = {
                name = "Quark",
                text = {
                    'Level up {C:attention}Three of a Kind{} if',
                    'scored hand is exactly {C:attention}three{}',
                    'cards of the {C:attention}same rank',
                    'but {C:attention}different suits{}'
                },
            },
            j_aij_lucky_carder = { name = "Lucky Carder", text = { "" } },
            j_aij_silver_screen = { 
                name = "Silver Screen", 
                text = { 
                    "When a {C:attention}face{} card is",
                    "{C:red}destroyed{}, add {C:aij_silver}Silver{} to a",
                    "random card in {C:attention}hand" 
                } 
            },
            j_aij_pedrolino = { 
                name = "Pedrolino", 
                text = { 
                    "{C:money}Sell{} this card to reduce",
                    "the {C:attention}score requirement{} of",
                    "the current {C:attention}Blind{} by {C:attention}#1#%"
                } 
            },
            j_aij_pierrette = { 
                name = "Pierrette", 
                text = { 
                    "Retrigger all {C:attention}card",
                    "{C:attention}discarded{} effects" 
                } 
            },
            j_aij_scaramouche = { 
                name = "Scaramouche", 
                text = { 
                    "{C:attention}Retrigger{} all scored",
                    "cards if {C:attention}played hand{} is",
                    "{C:attention}#1#{}",
                    "{C:inactive}(Hand changes at",
                    "{C:inactive}end of round){}"
                } 
            },
            j_aij_clay_joker = { 
                name = "Clay Joker", 
                text = { 
                    "Copies the effect of the",
                    "last {C:red}destroyed{} Joker" 
                } 
            },
            j_aij_sunny_joker = { 
                name = "Sunny Joker", 
                text = { 
                    "If played hand {C:attention}contains{} a",
                    "{C:attention}Royal Flush{}, all scoring",
                    "cards gain {X:mult,C:white}X#1#{} Mult" 
                } 
            },
            j_aij_red_wine = { name = "Red Wine", text = { "" } },
            j_aij_mute_joker = { 
                name = "Mute Joker", 
                text = { 
                    "If {C:attention}played hand{} is {C:attention}#1#{},",
                    "{C:red}destroy{} all played cards",
                    "{C:inactive}(Once per round)" 
                } 
            },
            j_aij_scapino = { 
                name = "Scapino", 
                text = { 
                    "{C:green}Rerolling{} in the {C:money}Shop{} costs",
                    "{C:money}+$#1#{}, but also restocks",
                    "{C:attention}Booster Packs" 
                } 
            },
            j_aij_pinhead = {
                name = "Pinhead",
                text = {
                    "Earn {C:money}$#1#{} if {C:attention}Blind{} is",
                    "beaten in a {C:attention}single hand{}"
                },
            },
            j_aij_saltimbanco = { 
                name = "Saltimbanco", 
                text = { 
                    "When any {C:green}probability",
                    "effect {C:green}succeeds{} multiply",
                    "{C:mult}Mult{} by its chance of {C:attention}not",
                    "{C:attention}occurring" 
                } 
            },
            j_aij_pulcinella = { name = "Pulcinella", text = { "" } },
            j_aij_petrushka = {
                name = "Petrushka",
                text = {
                    "Gives {C:mult}+Mult{} equal to",
                    "the total {C:attention}rank{} of",
                    "all {C:attention}scored cards{}",
                    "{C:inactive,s:0.8}(A=14, K=13, Q=12, J=11)"
                },
            },
            j_aij_void = { 
                name = "Void", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult if no {C:planet}Planet{} Cards",
                    "have been used this {C:attention}Ante",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_kasperle = { 
                name = "Kasperle", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult if you have",
                    "purchased a {C:attention}Voucher{}",
                    "this {C:attention}Ante",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_tumbler = { name = "Tumbler", text = { "" } },
            j_aij_plain_packaging = { name = "Plain Packaging", text = { "" } },
            j_aij_mixel_perfect = {
                name = "Mixel Perfect",
                text = {
                    "{C:mult}+#1#{} Mult if {C:attention}played hand{}",
                    "contains an {C:attention}odd{}",
                    "number of cards"
                },
            },
            j_aij_columbina = { 
                name = "Columbina",
                text = {
                    "{C:aij_plasma}Balance{} {C:attention}#1#%{} of {C:chips}Chips{} and",
                    "{C:mult}Mult{}, increases by {C:attention}#2#%{}",
                    "when a {C:spectral}Spectral{} card is",
                    "used"
                }
            },
            j_aij_j_file = { 
                name = "J-File", 
                text = { 
                    "At the start of the {C:attention}round,",
                    "search {C:attention}#1#{} card from your",
                    "{C:attention}deck{} to your hand" 
                } 
            },
            j_aij_bumper_sticker = { 
                name = "Bumper Sticker", 
                text = { 
                    "Played {C:attention}cards{}",
                    "permanently gain",
                    "{C:mult}+#1#{} Mult when scored"
                } 
            },
            j_aij_vesti_la_guibba = { name = "Vesti la Guibba", text = { "" } },
            j_aij_dead_president = {
                name = "Dead President",
                text = {
                    "Sell this {C:attention}Joker{} to",
                    "{C:attention}double{} the {C:money}sell value{}",
                    "of adjacent {C:attention}Jokers",
                    "{C:inactive}(Max of {C:money}$#1#{}{C:inactive})"
                },
            },
            j_aij_second_tier_meme = { name = "Second tier Meme", text = { "" } },
            j_aij_teeny_joker = {
                name = "Teeny Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played hand",
                    "contains only {C:attention}2s{}",
                },
            },
            j_aij_clowns_on_parade = {
                name = "Clowns on Parade",
                text = {
                    "This {C:attention}Joker{} gains {C:chips}+#2#{} Chips",
                    "if played hand contains",
                    "at least three {C:attention}2s{}",
                    "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}"
                },
            },
            j_aij_rising_sun = { 
                name = "Rising Sun", 
                text = { 
                    "Retrigger {C:attention}first{} and {C:attention}last{}",
                    "scored cards on {C:attention}first{} and",
                    "{C:attention}last hand{} of round",
                }
             },
            j_aij_red_sky = {
                name = "Red Sky",
                text = {
                    "Scored cards in {C:attention}first{} and",
                    "{C:attention}last hand{} of round give",
                    "their {C:chips}+Chips{} as {C:mult}+Mult{}",
                    "instead"
                }
            },
            j_aij_blind_drawn = {
                name = "Blind-Drawn",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "Cannot see {C:attention}Boss Blind{} or",
                    "its effects until selected",
                }
            },
            j_aij_heidelberg_tun = {
                name = "Heidelberg Tun",
                text = {
                    "{C:green}#1# in #2#{} chance for",
                    "purchased {C:attention}consumables{}",
                    "to become {C:dark_edition}Negative"
                },
            },
            j_aij_open_mind = {
                name = "Open Mind",
                text = {
                    "{C:attention}+#1#{} additional",
                    "{C:attention}Booster Packs{} available",
                    "for purchase in {C:attention}Shop{}"
                },
            },
            j_aij_little_boy_blue = { 
                name = "Little Boy Blue", 
                text = { 
                    "{C:chips}+#1#{} Chips",
                    "Only {C:chips}Chip{} Jokers may",
                    "appear"
                } 
            },
            j_aij_big_red = { 
                name = "Big Red", 
                text = { 
                    "{C:mult}+#1#{} Mult",
                    "Only {C:mult}Mult{} Jokers may",
                    "appear" 
                } 
            },
            j_aij_party_streamers = {
                name = "Party Streamers",
                text = {
                    "If {C:attention}first hand{} of round",
                    "has only {C:attention}1{} card with no",
                    "{C:attention}Seal{}, it gains a {C:red}Red{}, {C:blue}Blue{},",
                    "or {C:money}Gold{} {C:attention}Seal{}"
                },
            },
            j_aij_kilroy = { 
                name = "Kilroy", 
                text = { 
                    "This Joker {C:attention}permanently",
                    "gains {C:chips}+#1#{} Chips whenever",
                    "it is {C:money}sold",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                } 
            },
            j_aij_janus = { 
                name = "Janus", 
                text = { 
                    "Effects of {C:attention}editions{},",
                    "{C:attention}enhancements{}, and {C:attention}seals",
                    "on {C:attention}face cards{} are {C:green}doubled" 
                } 
            },
            j_aij_honker = { 
                name = "Honker", 
                text = { 
                    "This Joker gains {C:red}+#1#{} Mult",
                    "when a {C:attention}Mult Card{} is",
                    "scored",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                } 
            },
            j_aij_mummy = { name = "Mummy", text = { "" } },
            j_aij_sitcom = { name = "Sitcom", text = { "" } },
            j_aij_in_vino_veritas = { name = "In vino Veritas", text = { "" } },
            j_aij_beefeater = { name = "Beefeater", text = { "" } },
            j_aij_tetraphobia = {
                name = "Tetraphobia",
                text = {
                    "This Joker gains {C:mult}+#2#{} Mult",
                    "per {C:attention}4{} discarded, resets",
                    "when a {C:attention}4{} is scored",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                },
                -- scored->played should be discussed
            },
            j_aij_jack_of_all_trades = {
                name = "Jack of All Trades",
                text = {
                    "{C:attention}Jacks{} count as any {C:attention}suit",
                },
            },
            j_aij_jumbo_joker = { 
                name = "Jumbo Joker", 
                text = { 
                    "Only {C:attention}Jumbo{} and {C:attention}Mega",
                    "{C:attention}Booster Packs{} can appear" 
                } 
            },
            j_aij_pellucid_joker = { 
                name = "Pellucid Joker", 
                text = { 
                    "When a {C:attention}Joker{} with an {C:dark_edition}edition{} is",
                    "{C:money}sold{} or {C:red}destroyed{}, create a",
                    "random playing card with the",
                    "same {C:dark_edition}edition{} and add it",
                    "to deck" 
                } 
            },
            j_aij_cosmological_constant = {
                name = "Cosmological Constant",
                text = {
                    "{C:aij_plasma}Balance{} {C:attention}base{} {C:chips}Chips{} and {C:mult}Mult{}",
                    "of played {C:attention}poker hand"
                },
            },
            j_aij_monster = { name = "Monster", text = { "" } },
            j_aij_mistigri = {
                name = "Mistigri",
                text = {
                    "{C:attention}+1{} hand size per {C:attention}2",
                    "{C:attention}Jacks{} held in hand"
                },
            },
            j_aij_simple_simon = {
                name = "Simple Simon",
                text = {
                    "{C:chips}+#1#{} Chips",
                },
            },
            j_aij_giocoliere = {
                name = "Giocoliere",
                text = {
                    "{C:attention}+#1#{} hand size{} during",
                    "each {C:attention}Boss Blind"
                },
            },
            j_aij_spectre = { 
                name = "Spectre", 
                text = { 
                    "When {C:attention}Boss Blind{} is",
                    "{C:red}defeated{}, replace all held",
                    "{C:attention}consumables{} with random",
                    "{C:spectral}Spectral{} cards" 
                } 
            },
            j_aij_dapper_dan = { 
                name = "Dapper Dan", 
                text = { 
                    "Joker {C:dark_edition}Editions{} are",
                    "{C:attention}2X{} as effective",
                    "{C:inactive}(Except Negative)"
                } 
            },
            j_aij_average_joe = {
                 name = "Average Joe", 
                 text = { 
                    "{C:aij_plasma}Balance{} {C:attention}20%{} of",
                    "{C:chips}Chips{} and {C:mult}Mult{}"
                } 
            },
            j_aij_silent_sam = { 
                name = "Silent Sam", 
                text = { 
                    "Each {C:attention}card{} held in",
                    "hand gives {X:mult,C:white}X#1#{} Mult"
                } 
            },
            j_aij_pantomimus = { 
                name = "Pantomimus", 
                text = { 
                    "This Joker gains {C:chips}+#2#{}",
                    "Chips per card {C:attention}held in",
                    "{C:attention}hand{} at end of {C:attention}round",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                } 
            },
            j_aij_sneaky_pete = {
                name = "Sneaky Pete",
                text = {
                    'Earn {C:money}$#2#{} at end of round',
                    'for every {C:money}Gold Seal{}',
                    'in your {C:attention}full deck',
                    '{C:inactive}(Currently {C:money}$#1#{C:inactive})'
                },
            },
            j_aij_peeping_tom = { name = "Peeping tom", text = { "" } },
            j_aij_la_commedia_e_finita = {
                name = "La Commedia è Finita",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "when a {C:attention}face{} card is {C:attention}destroyed",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                },
            },
            j_aij_straight_to_hell = {
                name = "Straight to Hell",
                text = {
                    "This {C:attention}Joker{} gains {X:mult,C:white}X#1#{}",
                    "Mult when a {C:attention}Straight{}",
                    "is {C:attention}discarded{}",
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
                },
                -- TODO should probably be implemented and changed to
                -- "contains a Straight" for consistency
            },
            j_aij_guiser = {
                name = "Guiser",
                text = {
                    "Gains {C:money}$#1#{} of {C:attention}sell value{}",
                    "when a {C:tarot}Tarot{} card is used"
                },
            },
            j_aij_mummer = { 
                name = "Mummer", 
                text = { 
                    "Trigger all {C:aij_silver}Steel{} cards",
                    "{C:attention}held in hand{} when a {C:aij_silver}Steel",
                    "card is {C:attention}scored",
                } 
            },
            j_aij_tipteerer = {
                name = "Tipteerer",
                text = {
                    "Earn {C:attention}20%{} of the {C:money}sell value{}",
                    "of other {C:attention}Jokers{}, rounded up,",
                    "at end of {C:attention}round{}",
                    "{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}"
                },
            },
            j_aij_honest_john = { name = "Honest John", text = { "" } },
            j_aij_dizzard = { 
                name = "Dizzard", 
                text = { 
                    "After {C:attention}Blind{} is skipped,",
                    "visit the {C:money}Shop" 
                } 
            },
            j_aij_arlecchino = { 
                name = "Arlecchino", 
                text = { 
                    "Can take unlimited options",
                    "in {C:attention}Buffoon Packs{} and",
                    "{C:attention}Standard Packs" 
                } 
            },
            j_aij_arlecchina = { name = "Arlecchina", text = { "" } },
            j_aij_taikomochi = { 
                name = "Taikomochi", 
                text = 
                { 
                    "{C:attention}Jacks{} held in hand",
                    "give {C:chips}+#1#{} Chips"
                } 
                },
            j_aij_sudoku = { 
                name = "Sudoku", 
                text = { 
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "per consecutive played hand",
                    "containing a {C:attention}Straight{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
            } 
            },
            j_aij_gnasher = { 
                name = "Gnasher", 
                text = { 
                    "{B:1,C:white,s:0.8}Activated Ability",
                    "Once per Ante, {C:attention}copy{} and",
                    "{C:attention}immediately{} use a random",
                    "held {C:attention}consumable",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_executioner = {
                name = "Executioner",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "when a {C:attention}face{} card is {C:attention}destroyed",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                },
            },
            j_aij_jongleur = {
                name = "Jongleur",
                text = {
                    "{C:attention}-$#1#{} {C:green}reroll{} cost",
                },
            },
            j_aij_event_horizon = { 
                name = "Event Horizon", 
                text = { 
                    "{C:dark_edition}Black Hole{} has the same",
                    "rarity as other {C:planet}Planet{} cards",
                } 
            },
            j_aij_the_jester = {
                name = "The Jester",
                text = {
                    "The first {C:attention}Joker{}",
                    "sold each round",
                    "creates {C:tarot}The Fool{}",
                    "{C:inactive}#1#{}"
                },
                -- TODO use juice until
            },
            j_aij_joka_lisa = { 
                name = "Joka Lisa", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult per {C:attention}hand", 
                    "{C:attention}size{} above {C:attention}7{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult){}",
                    "{C:inactive}(Minimum {X:mult,C:white}X1{C:inactive} Mult){}"
                } 
            },
            j_aij_tonpraten = { name = "Tonpraten", text = { "" } },
            j_aij_rodeo_clown = { 
                name = "Rodeo Clown", 
                text = { 
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "if {C:attention}Blind{} is defeated on",
                    "the {C:attention}final hand{} of round",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                } 
            },
            j_aij_joculator = { 
                name = "Joculator", 
                text = { 
                    "Draw up to {C:attention}twice{} your hand",
                    "size if you have {C:attention}0{} {C:red}discards",
                    "and {C:attention}#1#{} {C:blue}hand{} remaining" 
                } 
            },
            j_aij_scurra = {
                name = "Scurra",
                text = {
                    'Retrigger all played cards',
                    'with a {C:red}Red Seal',
                    '{C:attention}#1#{} additional time'
                },
            },
            j_aij_pigpen = { name = "Pigpen", text = { "" } },
            j_aij_cyclops = { name = "Cyclops", text = { "" } },
            j_aij_blarney_stone = { 
                name = "Blarney Stone", 
                text = { 
                    "Adds {C:mult}Mult{} equal to",
                    "{C:attention}triple{} the {C:attention}first digit{}",
                    "of current {C:attention}score{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}"
                } 
            },
            j_aij_sticker = { 
                name = "Sticker", 
                text = { 
                    "{C:mult}+#1#{} Mult for each non-stake",
                    "{C:attention}sticker{} present on owned",
                    "{C:attention}Jokers{}",
                    "{C:inactive}(Currently{} {C:mult}+#2#{C:inactive} Mult){}",
                } 
            },
            j_aij_feedback_form = { 
                name = "Feedback Form", 
                text = { 
                    "Each {C:attention}scoring{} card gives {C:mult}+#1#",
                    "Mult if all {C:attention}scoring{} cards in",
                    "{C:attention}played{} hand have different",
                    "{C:attention}enhancements" 
                } 
            },
            j_aij_stultor = { 
                name = "Stultor", 
                text = { 
                    "Reroll {C:attention}Boss Blind {C:attention}#1#{} time",
                    "per ante, at no cost" 
                } 
            },
            j_aij_david = {
                name = "David",
                text = {
                    "This Joker gains {C:chips}+#1#{}",
                    "Chips if {C:attention}played hand{}",
                    "is only {C:spades}Spade{} {C:attention}Kings{}",
                    "{C:inactive}(Currently{} {C:chips}+#2#{C:inactive} Chips){}",
                },
            },
            j_aij_charles = {
                name = "Charles",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{}",
                    "Mult if {C:attention}played hand{}",
                    "is only {C:hearts}Heart{} {C:attention}Kings{}",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{C:inactive} Mult){}",
                },
            },
            j_aij_cesar = {
                name = "Cesar",
                text = {
                    'Earn {C:money}$#1#{} at end of',
                    'round. Increases by {C:money}$#2#{}',
                    'if {C:attention}played hand{} is only',
                    '{C:diamonds}Diamond {C:attention}Kings'
                },
            },
            j_aij_alexandre = {
                name = "Alexandre",
                text = {
                    "This Joker gains {C:mult}+#1#{}",
                    "Mult if {C:attention}played hand{}",
                    "is only {C:clubs}Club{} {C:attention}Kings{}",
                    "{C:inactive}(Currently{} {C:mult}+#2#{C:inactive} Mult){}",
                },
            },
            j_aij_sannio = { name = "Sannio", text = { "" } },
            j_aij_stock_photo = { name = "Stock Photo", text = { "" } },
            j_aij_fou_du_roi = {
                name = "Fou du Roi",
                text = {
                    '{C:green}#1# in #2#{} chance to create a',
                    '{C:tarot}Tarot{} card if played hand',
                    'contains a {C:attention}King{} or {C:attention}Queen',
                    '{C:inactive}(Must have room)'
                },
                -- possible error: scored/played
            },
            j_aij_fatuus = {
                name = "Fatuus",
                text = {
                    'If first played hand of',
                    'round contains only {C:attention}Kings{}',
                    'and {C:attention}Queens{}, apply a {C:blue}Blue',
                    '{C:blue}Seal{} to a random played',
                    'card',
                },
            },
            j_aij_enraging_photo = { name = "Enraging Photo", text = { "" } },
            j_aij_infuriating_note = { 
                name = "Infuriating Note", 
                text = {{ 
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:dark_edition}Negative{} duplicates of this",
                    "Joker may appear in the",
                    "{C:attention}Shop{} and {C:attention}Buffoon Packs{}", 
                },
                {
                    "{C:inactive}\"I've taken your stuff, but",
                    "{C:inactive}you keep pushing through;",
                    "{C:inactive}I'll have to try harder, so",
                    "{C:inactive}rats off to you!\" -R. R.",
                }
            }
            },
            j_aij_magic_hat = { name = "Magic hat", text = { "" } },
            j_aij_anagraph = { 
                name = "Anagraph", 
                text = { 
                    "When any {C:attention}Joker{} or {C:attention}Playing ",
                    "{C:attention}card{} is {C:money}sold{} or {C:red}destroyed{}",
                    "create an exact {C:attention}copy{} and",
                    "immediately {C:red}destroy{} it",
                    "again" 
                    -- NOTE doesn't actually work with Jeff the Joker from
                    -- the wording?
                } 
            },
            j_aij_beanstalk = { 
                name = "Beanstalk", 
                text = { 
                    "{C:attention}Jacks{} {C:attention}cannot{} be {C:red}debuffed",
                    "and {C:attention}always{} score" 
                } 
            },
            j_aij_phoney_baloney = { name = "Phoney Baloney", text = { "" } },
            j_aij_jerko = { 
                name = "Jerko", 
                text = { 
                    '{C:mult}+#1#{} Mult'
                } 
            },
            j_aij_design_document = { 
                name = "Design Document", 
                text = { 
                    "Earn {C:money}$#1#{} when any",
                    "{C:green}probability{} effect fails"
                } 
            },
            j_aij_animatronic = { 
                name = "Animatronic", 
                text = {
                    "{C:attention}+#1#{} hand size per consecutive",
                    "hand containing a {C:attention}Straight",
                    "{C:inactive}(Currently {C:attention}+#2#{C:inactive} hand size){}",
                    "{C:inactive}(Max of {C:attention}+#3#{C:inactive}){}"
                } 
            },
            j_aij_arecibo_message = { name = "Arecibo Message", text = { "" } },
            j_aij_napkin = { 
                name = "Napkin", 
                text = { 
                    "This Joker gains {X:mult,C:white}X#1#{}",
                    "Mult when {C:attention}2{} Blinds are",
                    "skipped {C:attention}in a row",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult){}",
                }
            },
            j_aij_lost_carcosa = { 
                name = "Lost Carcosa", 
                text = { 
                    "Randomize the {C:chips}Chips{} and {C:mult}Mult",
                    "of used {C:planet}Planet Cards",
                    "from {C:attention}50%{} to {C:attention}200%{}",
                    "their original values"
                } 
            },
            j_aij_magic_mirror = { 
                name = "Magic Mirror", 
                text = { 
                    "Apply {C:dark_edition}Negative{} to the first",
                    "scored Face Card this {C:attention}Ante",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_postcard_from_perdition_trail = { name = "Postcard from Perdition Trail", text = { "" } },
            j_aij_mr_lonely = {
                name = "Mr. Lonely",
                text = {
                    "This Joker gains {C:chips}+#1# Chips",
                    "per empty {C:attention}Joker slot{}",
                    "at end of {C:attention}round{}",
                    "{C:inactive}(Currently{} {C:chips}+#2#{C:inactive} Chips)"
                },
            },
            j_aij_spiders_georg = { 
                name = "Spiders Georg", 
                text = { 
                    "Multiply {C:mult}Mult{} by {C:attention}1{} plus the",
                    "{C:attention}average{} number of {C:attention}8s{}",
                    "{C:attention}scored{} per hand this run",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)",
                } 
            },
            j_aij_gille = { name = "Gille", text = { "" } },
            j_aij_fulehung = { 
                name = "Fulehung", 
                text = { 
                    "When {C:attention}Blind{} is selected,",
                    "{C:green}#1# in #2#{} chance to gain",
                    "it's {C:attention}Skip Tag" 
                } 
            },
            j_aij_bearded_joker = { 
                name = "Bearded Joker", 
                text = { 
                    "{C:mult}+#1#{} Mult for each {C:attention}Enhanced{}",
                    "card in your {C:attention}full deck",
                    "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult)"
                } 
            },
            j_aij_skomorokh = { 
                name = "Skomorokh", 
                text = { 
                    "This Joker gains {X:mult,C:white}X#1#{} Mult", 
                    "for each {C:attention}editioned{} card in your",
                    "{C:attention}full deck",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)"
                } 
            },
            j_aij_silly_billy = { name = "Silly Billy", text = { "" } },
            j_aij_ijoker_co = { 
                name = "iJoker.co", 
                text = { 
                    "{C:attention}#1#{} random {C:attention}Tags{} available",
                    "for purchase each {C:money}shop" 
                } 
            },
            j_aij_corpse_paint = { 
                name = "Corpse Paint", 
                text = { 
                    "Removes {C:dark_edition}Negative{} from",
                    "played cards. For each,",
                    "{C:green}#1# in #2#{} chance this Joker",
                    "gains {C:attention}+#3# hand size",
                    "{C:inactive}(Currently {C:attention}+#4#{C:inactive} hand size)"
                } 
            },
            j_aij_toothy_joker = { 
                name = "Toothy Joker", 
                text = { 
                    "{C:chips}+#1#{} Chips for each {C:tarot}Tarot",
                    "card used this {C:attention}Ante",
                    "{C:inactive}(Currently{} {C:chips}+#2#{C:inactive} Chips)"
                } 
            },
            j_aij_mondrian_joker = {
                name = "Mondrian Joker",
                text = {
                    "{C:mult}+#1#{} Mult per {C:attention}4",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently{} {C:mult}+#2#{}{C:inactive} Mult)"
                },
            },
            j_aij_orphic_joker = {
                name = "Orphic Joker",
                text = {
                    "Create {C:attention}1{} random",
                    "{C:uncommon}Uncommon{} {C:attention}Joker{} when",
                    "{C:attention}Blind{} is skipped",
                    "{C:inactive}(Must have room){}"
                },
            },
            j_aij_the_artist = { 
                name = "The Artist", 
                text = { 
                    "{C:attention}+#1#{} Selection limit for",
                    "{C:tarot}Tarot{} Cards" 
                } 
            },
            j_aij_toynbee_joker = { name = "Toynbee Joker", text = { "" } },
            j_aij_aluzinnu = {
                name = "Aluzinnu",
                text = {
                    "The {C:attention}Hieroglyph{} and {C:attention}Petroglyph",
                    "vouchers have {C:attention}no{} {C:red}downsides{} and",
                    "can appear {C:attention}multiple{} times"
                }
            },
            j_aij_great_kraken = { 
                name = "Great Kraken", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult for each",
                    "{C:blue}hand{} remaining",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
                    "{C:inactive}(Minimum {X:mult,C:white}X1{C:inactive} Mult)"
                } 
            },
            j_aij_truhan = { 
                name = "Truhan", 
                text = { 
                    "When any Joker is {C:money}sold{} or",
                    "{C:red}destroyed{}, gain {X:mult,C:white}X#2#{}",
                    "Mult per {C:attention}round{} that Joker",
                    "has been held",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)"
                } 
            },
            j_aij_chippy = { 
                name = "Chippy", 
                text = { 
                    "This Joker gains {C:chips}Chips{}",
                    "equal to {C:money}money{} spent",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                } 
            },
            j_aij_hofnarr_the_barbarian = {
                name = "Hofnarr the Barbarian",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "On {C:attention}Showdown Boss Blinds{}, {C:attention}disables{}",
                    "them and gives {X:mult,C:white}X#2#{} Mult"
                },
            },
            j_aij_histrio = { 
                name = "Histrio", 
                text = { 
                    "Earn an additional {C:money}$#1#{}",
                    "for each {C:attention}unused hand",
                    "at end of round"
                } 
            },
            j_aij_loregg = { name = "Loregg", text = { "" } },
            j_aij_egg_cc = {
                name = "\"egg\"",
                text = {
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "and {C:money}$#3#{} of {C:attention}sell value{}",
                    "at end of round",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                    "{C:inactive}hey it's \"egg\""
                },
            },
            j_aij_sot = { 
                name = "Sot", 
                text = { 
                    "{C:mult}+#1#{} Mult for each {C:attention}Tag",
                    "held",
                    "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult)"
                } 
            },
            j_aij_fat_ed = { name = "Fat 'Ed", text = { "" } },
            j_aij_stained_glass_joker = {
                name = "Stained Glass Joker",
                text = {
                    "{C:attention}Glass Cards{} count",
                    "as any {C:attention}suit{}",
                },
            },
            j_aij_mushroom_cloud = { name = "Mushroom Cloud", text = { "" } },
            j_aij_overdesigned_joker = {
                name = "Overdesigned Joker",
                text = {
                    {
                        "Played cards with {V:1}#1#{} suit",
                        "#3# {B:3,V:2}#4##2#{}#5#when scored,",
                    },
                    {
                        "suit and effect {C:attention}rotate{}",
                        "when a card is {C:attention}scored",
                        "{C:inactive}(Hearts->Clubs->Diamonds->Spades)"
                    }
                }
            },
            j_aij_morio = {
                name = "Morio",
                text = {
                    "When {C:attention}Boss Blind{} is",
                    "defeated, choose {C:attention}any{}",
                    "{C:tarot}Tarot{} card to create",
                    "{C:inactive}(Must have room)"
                }
            },
            j_aij_visage = { 
                name = "Visage", 
                text = { 
                    "Copies the effect of the",
                    "last {C:money}sold{} joker" 
                } 
            },
            j_aij_goofball = { 
                name = "Goofball", 
                text = { 
                    "Scored {C:attention}face{} cards {C:aij_plasma}balance{}",
                    "{C:attention}#1#%{} of {C:chips}Chips{} and {C:mult}Mult{}"
                } 
            },
            j_aij_heyokha = { name = "Heyókȟa", text = { "" } },
            j_aij_casual_absent_paranoia = { name = "Casual-Absent Paranoia", text = { "" } },
            j_aij_mandrake = { 
                name = "Mandrake", 
                text = { 
                    "After {C:attention}#2#{} rounds, {C:money}sell",
                    "this Joker to {C:red}destroy{}",
                    "all cards {C:attention}held in hand",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_jester_zombie = { 
                name = "Jester Zombie", 
                text = { 
                    "Retriggers all {C:attention}scored{} cards",
                    "if a {C:attention}playing card{} has been",
                    "{C:red}destroyed{} this round",
                    "{C:inactive}#1#{}"
                } 
            },
            j_aij_richie_rich = { name = "Richie Rich", text = { "" } },
            j_aij_devil_deal = { 
                name = "Devil Deal", 
                text = { 
                    "This Joker gains {X:mult,C:white}X#1#{}",
                    "Mult when a {C:hearts}Heart{}",
                    "card is {C:attention}destroyed",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
                } 
            },
            j_aij_totally_nuts = { 
                name = "Totally Nuts", 
                text = { 
                    "{C:attention}+#1#{} Consumable Slots,",
                    "{C:attention}consumed{} when a",
                    "{C:attention}consumable{} is {C:money}sold" 
                } 
            },
            j_aij_warhol = { name = "Warhol", text = { "" } },
            j_aij_mistake = {
                name = "Mistake",
                text = {
                    "{C:attention}Eternal{} Jokers can",
                    "be {C:attention}sold",
                }
            },
            j_aij_depth_of_delusion = { name = "Depth of Delusion", text = { "" } },
            j_aij_curse_of_scotland = { name = "Curse of Scotland", text = { "" } },
            j_aij_banana_man = { 
                name = "Banana Man", 
                text = { 
                    "{C:attention}Retrigger{} all Jokers. Each",
                    "Joker has a {C:green}#1# in #2#{}",
                    "chance to be {C:red}destroyed",
                    "each hand" 
                } 
            },
            j_aij_corny_joker = { name = "Corny Joker", text = { "" } },
            j_aij_entropy = { 
                name = "Entropy", 
                text = { 
                    "Create a {C:attention}Chaos Tag",
                    "when Blind is {C:attention}skipped"
                } 
            },
            j_aij_urchin = { 
                name = "Urchin", 
                text = { 
                    "Earn {C:money}$#2#{} at end of",
                    "round for each {C:attention}Blind{}",
                    "skipped this run",
                    "{C:inactive}(Currently {C:money}$#1#{}{C:inactive}){}"
                } 
            },
            j_aij_machine_intelligence = { name = "Machine Intelligence", text = { "" } },
            j_aij_grandma = { name = "Grandma", text = { "" } },
            j_aij_funny_money = { 
                name = "Funny Money", 
                text = { 
                    "Earn {C:money}$#1#{} when",
                    "{C:attention}skipping{} a Blind"
                } },
            j_aij_witchfinder = { 
                name = "Witchfinder", 
                text = { 
                    "{C:attention}1{} additional {C:tarot}Arcana{}",
                    "{C:tarot}Pack{} available in {C:money}Shop"
                } 
            },
            j_aij_trophy_kill = { name = "Trophy Kill", text = { "" } },
            j_aij_tract = { 
                name = "Tract", 
                text = { 
                    "{C:chips}+#1#{} Chips per",
                    "{C:attention}Voucher{} owned",
                    "{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips){}"
                } 
            },
            j_aij_stock_broker = { 
                name = "Stock Broker", 
                text = { 
                    "Multiplies {C:money}interest{} by a",
                    "random amount between",
                    "{C:attention}X#1#{} and {C:attention}X#2#" 
                } 
            },
            j_aij_omlette = { 
                name = "Omlette", 
                text = { 
                    "Gains {C:money}$#1#{} of sell value",
                    "when a {C:blue}hand{} or {C:red}discard{} is",
                    "used" 
                } 
            },
            j_aij_stave = { name = "Stave", text = { "" } },
            j_aij_sunny_side = { name = "Sunny Side", text = { "" } },
            j_aij_omelette = { name = "Omelette", text = { "" } },
            j_aij_theyre_looking_at_you = { name = "They're Looking at You...", text = { "" } },
            j_aij_comedy_of_errors = { 
                name = "Comedy of Errors", 
                text = { 
                    "Earn {C:money}$#1#{} whenever a",
                    "{C:hearts}Heart{} suit card is",
                    "{C:red}discarded"
                } 
            },
            j_aij_fuzzy_joker = { 
                name = "Fuzzy Joker",
                text = { 
                    "Rounds {C:mult}Mult{} upward to the",
                    "next power of {C:attention}2" 
                } 
            },
            j_aij_saucy_jacky = { name = "Saucy Jacky", text = { "" } },
            j_aij_funny_phone = { name = "Funny Phone", text = { "" } },
            j_aij_taggart = { 
                name = "Taggart", 
                text = { 
                    "Create {C:attention}#1# copy{} of",
                    "each {C:attention}Tag{} acquired",
                    "{C:inactive}(Except Double Tag)"
                } 
            },
            j_aij_chitty = { 
                name = "Chitty", 
                text = { 
                    "{C:attention}+#1#{} {C:attention}Voucher{} available",
                    "for purchase in {C:attention}Shop" 
                } 
            },
            j_aij_whatsisname = { 
                name = "Whatsisname", 
                text = { 
                    "{C:attention}Guess the Jest{} packs",
                    "are more common"
                } 
            },
            j_aij_downing_street = { 
                name = "Downing Street", 
                text = { 
                    "Scoring {C:attention}10s{} have a {C:green}#1# in #2#{}",
                    "chance to create a random",
                    "{C:attention}Tag"
                } 
            },
            j_aij_one_little_duck = { name = "One Little Duck", text = { "" } },
            j_aij_four_leaf_clover = { name = "Four-leaf Clover", text = { "" } },
            j_aij_aphantasia = { 
                name = "Aphantasia", 
                text = { 
                    "All played {C:attention}enhanced{} cards",
                    "become {C:red}Chaotic" 
                } 
            },
            j_aij_tabula_rasa = { 
                name = "Tabula Rasa", 
                text = { 
                    "When {C:attention}Blind{} is selected,",
                    "this Joker's {C:dark_edition}Edition{} is removed",
                    "and its effects become {C:jest_inherent}inherent" 
                } 
            },
            j_aij_vitruvian_joker = {
                name = "Vitruvian Clown",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if exactly {C:attention}5{}",
                    "Jokers are owned"
                }
            },
            j_aij_american_comic = { name = "American Comic", text = { "" } },
            j_aij_from_the_top_rope = { name = "From the Top Rope", text = { "" } },
            j_aij_fortune_cookie = { 
                name = "Fortune Cookie", 
                text = { 
                    "Create a random {C:tarot}Tarot",
                    "card when any {C:attention}Booster{}",
                    "{C:attention}Pack{} is opened, consumed",
                    "after {C:attention}#2#{} packs",
                    "{C:inactive}(Must have room){}",
                    "{C:inactive}({C:attention}#1#{C:inactive}/{C:attention}#2#{C:inactive}){}"
                } 
            },
            j_aij_tilty_joker = { 
                name = "Tilty Joker", 
                text = { 
                    "{C:attention}Scoring{} cards give {C:attention}X#1#",
                    "their base {C:chips}Chips" 
                } 
            },
            j_aij_opening_move = { 
                name = "Opening Move", 
                text = { 
                    {
                        "This Joker gains {X:mult,C:white}X#1#{} Mult",
                        "for each card {C:attention}scored{} in the",
                        "{C:attention}first hand{} of the round",
                        "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                        "{C:inactive}(Resets when Blind is defeated)",
                    },
                    {
                        "The {C:attention}first hand{} of each",
                        "round does not score",
                    },
                } 
            },
            j_aij_bartender = { 
                name = "Bartender", 
                text = { 
                    "{C:attention}Consumable{} cards may be",
                    "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
                    "{C:dark_edition}Polychrome" 
                } 
            },
            j_aij_mahoney = { 
                name = "Mahoney", 
                text = { 
                    "{C:green}#1# in #2#{} chance to",
                    "create a {C:attention}Voucher Tag{}",
                    "when blind is {C:attention}skipped",
                } 
            },
            j_aij_le_fils_de_banane = { 
                name = "Le fils de Banane", 
                text = { 
                    "Scored {C:attention}face{} cards give {C:mult}+#3#",
                    "Mult but have a {C:green}#1# in #2#{}",
                    "chance to {C:red}destroy",
                    "themselves" 
                } 
            },
            j_aij_pygmalion = { 
                name = "Pygmalion", 
                text = { 
                    "All {C:attention}Stone{} cards are",
                    "considered {C:attention}Queens",
                } 
            },
            j_aij_grue = { name = "Grue", text = { "" } },
            j_aij_heavy_sixer = { name = "Heavy Sixer", text = { "" } },
            j_aij_tetrominoker = { 
                name = "Tetrominoker", 
                text = { 
                    "Scoring {C:attention}4s{} have a {C:green}#1# in #2#{}",
                    "chance to create a {C:attention}copy{} of",
                    "themselves" 
                } 
            },
            j_aij_mr_catfish = { 
                name = "Mr. Catfish", 
                text = { 
                    "Earn {C:money}$#1#{} every {C:attention}#2#{C:inactive} [#3#]{}",
                    "cards discarded"
                } 
            },
            j_aij_angel_number = { 
                name = "Angel Number", 
                text = { 
                    "{C:attention}+#1#{} to all {C:green}listed",
                    "{C:green}probabilities{} for each {C:attention}7",
                    "scored this hand. {C:attention}Resets",
                    "each hand" 
                } 
            },
            j_aij_doctors_orders = { 
                name = "Doctor's Orders", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult per {C:attention}9{} in the played",
                    "hand, {C:red}self-destructs{} if no",
                    "{C:attention}9s{} were played"
                } 
            },
            j_aij_blue_eyes_white_joker = { 
                name = "Blue-Eyes White Joker", 
                text = { 
                    "If {C:attention}last hand{} of round",
                    "contains exactly {C:attention}1{} card,",
                    "it permanently gains {C:attention}#1#",
                    "additional {C:attention}retrigger" 
                } 
            },
            j_aij_lucina = { 
                name = "Reveling Jester", 
                text = { 
                    "When Blind is {C:attention}selected",
                    "{C:red}destroy{} Joker to the {C:attention}left",
                    "and apply a random {C:dark_edition}Edition",
                    "to the Joker to the {C:attention}right",
                    "{C:inactive}(Must destroy a Joker)" 
                } 
            },
            j_aij_circuit_diagram = { 
                name = "Circuit Diagram", 
                text = { 
                    "{C:attention}Charged{} cards are always",
                    "shuffled to the top of your",
                    "deck" 
                } 
            },
            j_aij_paracosm = { 
                name = "Paracosm", 
                text = { 
                    "Increase the level of",
                    "most played {C:attention}poker hand",
                    "when {C:attention}blind{} is skipped",
                    "{C:inactive}(Currently #1#)"
                } 
            },
            j_aij_mocap = { 
                name = "Mocap", 
                text = { 
                    {
                        "When any {C:legendary}Legendary{}, {C:rare}Rare{},",
                        "or {C:uncommon}Uncommon{} Joker is {C:money}sold{},",
                        "create a {C:attention}random{} Joker with",
                        "a lower rarity"
                    }, 
                    {
                        "{C:legendary}Legendary{} -> {C:rare}Rare{}",
                        "{C:rare}Rare{} -> {C:uncommon}Uncommon{}",
                        "{C:uncommon}Uncommon{} -> {C:common}Common{}"
                    }
                } 
            },
            j_aij_stagehand = { 
                name = "Stagehand", 
                text = { 
                    "All {C:attention}Jokers{} give",
                    "{X:mult,C:white}X#1#{} Mult"
                } 
            },
            j_aij_the_mermaid = { name = "The Mermaid", text = { "" } },
            j_aij_colour_test = { 
                name = "Colour Test", 
                text = { 
                    "If {C:attention}last hand{} of round",
                    "has only {C:attention}1{} card, give",
                    "it {C:attention}Polychrome{}"
                } 
            },
            j_aij_test_card = { 
                name = "Test Card", 
                text = { 
                    "{C:attention}Editions{} held in hand",
                    "trigger their effects"
                } 
            },
            j_aij_interstate = { 
                name = "Interstate", 
                text = { 
                    "{C:blue}+#1#{} Hands this round if",
                    "{C:attention}first{} hand of round",
                    "contains a {C:attention}Straight{}"
                } 
            },
            j_aij_bowls_of_joy = { name = "Bowls of Joy", text = { "" } },
            j_aij_chips_n_dip = {
                name = "Chips 'n Dip",
                text = {
                    "{X:chips,C:white}X#1#{} Chips, loses {X:chips,C:white}X#2#{} Chips",
                    "at end of {C:attention}round"
                }
            },
            j_aij_homemade_comic = { 
                name = "Homemade Comic", 
                text = { 
                    "Scored {C:attention}Charged Cards{}",
                    "give {X:mult,C:white}X#1#{} Mult",
                } 
            },
            j_aij_gematria = { name = "Gematria", text = { "" } },
            j_aij_bingo_card = { 
                name = "Bingo Card", 
                text = { 
                    "Scoring {C:attention}Lucky Cards{} have a",
                    "{C:green}#1# in #2#{} chance for {X:mult,C:white}X#5#{} Mult",
                    "and a {C:green}#3# in #4#{} chance to",
                    "retrigger" 
                } 
            },
            j_aij_fish_fingers = { 
                name = "Fish Fingers", 
                text = { 
                    "{C:blue}+#1#{} Hands per round,",
                    "{C:blue}-#2#{} Hand when Blind is",
                    "{C:attention}defeated"
                } 
            },
            j_aij_joker_png = { 
                name = "Joker.png", 
                text = { 
                    '{B:1,C:white,s:0.8}Activated Ability',
                    'This Joker {C:attention}copies{} the',
                    '{C:attention}effect{} of a random {C:attention}Joker',
                    'Pay {C:money}$#1#{} to reroll'
                } 
            },
            j_aij_kuruko = { name = "Kuruko", text = { "" } },
            j_aij_candy_floss = { 
                name = "Candy Floss", 
                text = { 
                    "{C:aij_plasma}Balance{} {C:attention}#1#%{} of {C:chips}Chips{}",
                    "and {C:mult}Mult{}, decreases",
                    "by {C:attention}#2#%{} at end of round"
                } 
            },
            j_aij_stargazy_pie = { 
                name = "Stargazy Pie", 
                text = { 
                    "Retrigger the next {C:attention}#1#{}",
                    "{C:planet}Planet{} cards used" 
                } 
            },
            j_aij_electric_snow = { 
                name = "Electric Snow", 
                text = { 
                    "Round only ends {C:attention}after{} the",
                    "{C:attention}final hand{} of round" 
                } 
            },
            j_aij_gameshow = { 
                name = "Gameshow", 
                text = { 
                    {
                        "{C:green}#1# in #2#{} chance to add",
                        "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
                        "{C:dark_edition}Polychrome{} edition",
                        "to a random {C:attention}Joker",
                        "when {C:attention}blind{} is selected",
                    },
                    { 
                        "{C:money}-$#3#{} when triggered",
                        "regardless of outcome"
                    } ,
                },
            },
            j_aij_bonus_pay = { 
                name = "Bonus Pay", 
                text = { 
                    "Earn {C:money}$#1#{} when a",
                    "{C:attention}Bonus Card{} is scored"
                } 
            },
            j_aij_illuminated_joker = { 
                name = "Illuminated Joker", 
                text = { 
                    "{C:money}Gold{} Tags are {C:attention}more{} likely",
                    "to appear" 
                } 
            },
            j_aij_magazine_ad = { name = "Magazine Ad", text = { "" } },
            j_aij_bonus_bob = { 
                name = "Bonus Bob", 
                text = { 
                    "{C:attention}Bonus Cards{} give",
                    "{X:chips,C:white}X#1#{} Chips when scored"
                } 
            },
            j_aij_bonus_round = { 
                name = "Bonus Round", 
                text = { 
                    "{C:attention}Retrigger{} all",
                    "scored {C:attention}Bonus Cards{}",
            } 
            },
            j_aij_jack_o_lantern = { name = "Jack o' Lantern", text = { "" } },
            j_aij_astrologer = { 
                name = "Astrologer", 
                text = { 
                    {
                        "{C:attention}+#1#{} pick in {C:planet}Celestial Packs" 
                    },
                    {
                        "{C:planet}Planet{} cards are replaced",
                        "by their {C:mult}Mult{} variant in {C:attention}odd",
                        "antes and their {C:chips}Chips",
                        "variant in {C:attention}even{} antes"
                    },
                } 
            },
            j_aij_planetarium = { 
                name = "Planetarium", 
                text = { 
                    {
                        "{C:chips}Chip{} type {C:planet}planet{} cards in",
                        "your {C:attention}consumable{} area give",
                        "{C:chips}+#1#{} Chips for their specified",
                        "{C:attention}poker hand" 
                    },
                    {
                        "{C:mult}Mult{} type {C:planet}planet{} cards in",
                        "your {C:attention}consumable{} area give",
                        "{C:mult}+#2#{} Mult for their specified",
                        "{C:attention}poker hand" 
                    },
                } 
            },
            j_aij_negative_space = { 
                name = "Negative Space", 
                text = { 
                    "{C:attention}+#1#{} Hand Size for every",
                    "{C:dark_edition}Negative{} Joker held",
                    "{C:inactive}(Currently {C:attention}+#2#{} {C:inactive}Hand Size){}",
                    "{C:inactive}(Max of {C:attention}+#3#{}{C:inactive})"
                } 
            },
            j_aij_stargazer = { name = "Stargazer", text = { "" } },
            j_aij_skald = { name = "Skald", text = { "" } },
            j_aij_sky_trees = { 
                name = "Sky Trees", 
                text = { 
                    "{C:attention}Blue Seals{} give both {C:mult}Mult",
                    "and {C:chips}Chips{} type {C:planet}Planet",
                    "cards instead of {C:attention}base",
                    "type {C:planet}Planet{} cards" 
                } 
            },
            j_aij_the_freezer = { name = "The Freezer", text = { "" } },
            j_aij_twisted_pair = { 
                name = "Twisted Pair", 
                text = { 
                    "If hand is a {C:attention}Pair{}, each card",
                    "gains a suit {C:attention}patch{} corresponding",
                    "to the suit of the {C:attention}other card" 
                } 
            },
            j_aij_the_grim_joker = { 
                name = "The Grim Joker", 
                text = { 
                    "{C:attention}Consumables{} created by",
                    "{C:planet}Blue{} or {C:tarot}Purple{} Seals have",
                    "a {C:green}#1# in #2# chance{} to be",
                    "{C:dark_edition}Negative"
                } 
            },
            j_aij_lexicon = { 
                name = "Lexicon", 
                text = { 
                    "Adds {C:mult}Mult{} equal to the",
                    "{C:attention}combined total{} of all",
                    "numerical values of",
                    "owned {C:attention}Jokers" ,
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                } 
            },
            j_aij_dendroglpyh = { name = "Dendroglyph", text = { "" } },
            j_aij_prank_caller = { name = "Prank Caller", text = { "" } },
            j_aij_arngren = { 
                name = "Arngren", 
                text = { 
                    "{C:attention}+#1#{} Card Slot, {C:attention}+#1#{} Booster",
                    "Slot, and {C:attention}+#1#{} Voucher Slot",
                    "in the {C:money}shop"
                } 
            },
            j_aij_blacklist = { 
                name = "Blacklist", 
                text = { 
                    "{C:money}Sold{} jokers can no longer",
                    "reappear",
                    "Currently Blacklisted Jokers:",
                } 
            },
            j_aij_croupier = { 
                name = "Croupier", 
                text = { 
                    "Earn {C:money}$#1#{} if played hand",
                    "scores over {C:attention}twice{} the blind",
                    "requirement" 
                } 
            },
            j_aij_the_lucovico_technique = { name = "The Ludovico Technique", text = { "" } },
            j_aij_headstone = { 
                name = "Headstone", 
                text = { 
                    "All {C:attention}Face Cards{} are shuffled",
                    "to the {C:red}bottom{} of your deck" 
                } 
            },
            j_aij_full_monty = { name = "Full Monty", text = { "" } },
            j_aij_chef = { 
                name = "Chef", 
                text = { 
                    "Base-edition {C:enhanced}perishable{}",
                    "jokers become {C:dark_edition}Negative",
                    "{C:attention}Editions{} on {C:enhanced}perishable",
                    "jokers no longer come with",
                    "a mark-up in the {C:money}shop " 
                } 
            },
            j_aij_screamer = { name = "Screamer", text = { "" } },
            j_aij_evil_twin = { name = "Evil Twin", text = { "" } },
            j_aij_cubic_joker = { name = "Cubic Joker", text = { "" } },
            j_aij_remina = { 
                name = "Remina", 
                text = { 
                        "When {C:attention}Small Blind{} or {C:attention}Big",
                        "Blind{C:attention} selected, this Joker",
                        "{C:red}destroys{} all {C:planet}Planet Cards",
                        "in your{C:attention}consumable{} area",
                        "and gains their {C:chips}Chips{} and {C:mult}Mult{}",
                        "{C:inactive,s:0.8}(Currently {C:chips,s:0.8}+#2#{} {C:inactive,s:0.8}Chips and {C:mult,s:0.8}+#1#{C:inactive,s:0.8} Mult)"
            
                } 
            },
            j_aij_jpeg = { name = ".jpeg", text = { "" } },
            j_aij_sherrif = { 
                name = "Sherrif",
                text = { 
                    "First scored {C:attention}Wild Card{}",
                    "each hand earns {C:money}$#1#{}"
                } 
            },
            j_aij_alien_joker = { 
                name = "Alien Joker", 
                text = { 
                    "{C:attention}Forces 1{} card to be",
                    "selected each hand",
                    "{C:attention}Force-selected{} card gives",
                    "{X:mult,C:white}X#1#{} Mult when scored" 
                } 
            },
            j_aij_nobody = { 
                name = "Nobody", 
                text = { 
                    "{C:inactive}Does nothing...?" 
                } 
            },
            j_aij_broken_dreams = { name = "Broken Dreams", text = { "" } },
            j_aij_elf = { 
                name = "Elf", 
                text = { 
                    "After skipping {C:attention}#2#{} Blinds,",
                    "{C:money}sell{} this Joker to create",
                    "{C:attention}#3# Investment Tags",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_fall_of_count_chaligny = { 
                name = "Fall of Count Chaligny", 
                text = { 
                    "{C:attention}Required{} score of all",
                    "{C:attention}Blinds{} is equal to that of",
                    "the {C:attention}Small Blind" 
                } 
            },
            j_aij_coulrorachne = { 
                name = "Coulrorachne", 
                text = { 
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "every {C:attention}#4#{} scored {C:attention}8s",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult, {C:attention}#3#{C:inactive}/{C:attention}#4#{C:inactive})" 
                } 
            },
            j_aij_bad_sun = { 
                name = "Bad Sun", 
                text = { 
                    "If {C:attention}played{} hand contains {C:attention}#1#",
                    "or more {C:hearts}Hearts{}, destroy a",
                    "{C:attention}random{} played card" 
                } 
            },
            j_aij_lemarchand_cube = { name = "LeMarchand Cube", text = { "" } },
            j_aij_duende = { name = "Duende", text = { "" } },
            j_aij_evil_joker = { 
                name = "Evil Joker", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult, destroys a",
                    "{C:attention}random{} Joker when",
                    "{C:attention}obtained" 
                } 
            },
            j_aij_sanguine_joker = { 
                name = "Sanguine Joker", 
                text = { 
                    "Played cards with {C:hearts}Heart",
                    "suit have a {C:green}#1# in #2#{} chance",
                    "to create a random {C:attention}Tag{}",
                    "when scored"
                } 
            },
            j_aij_choleric_joker = { 
                name = "Choleric Joker", 
                text = { 
                    "Played cards with {C:diamonds}Diamond",
                    "suit have a {C:green}#1# in #2#{} chance",
                    "to create a random {C:tarot}Tarot{}",
                    "card when scored",
                    "{C:inactive}(Must have room){}"
                } 
            },
            j_aij_phlegmatic_joker = { 
                name = "Phlegmatic Joker", 
                text = { 
                    "Played cards with {C:clubs}Club",
                    "suit have a {C:green}#1# in #2#{} chance",
                    "to create the {C:planet}Planet{} card",
                    "for the {C:attention}played hand{}",
                    "when scored",
                    "{C:inactive}(Must have room){}"
                } 
            },
            j_aij_melancholic_joker = { 
                name = "Melancholic Joker", 
                text = { 
                    "Played cards with {C:spades}Spade",
                    "suit have a {C:green}#1# in #2#{} chance",
                    "to create a random",
                    "{C:spectral}Spectral{} card when",
                    "scored",
                    "{C:inactive}(Must have room){}"
                } 
            },
            j_aij_majordomo = { 
                name = "Majordomo", 
                text = { 
                    "All {C:attention}Jokers{} in the {C:money}shop",
                    "which cost more than {C:money}$#1#",
                    "gain the {C:money}Rental{} sticker" 
                }
            },
            j_aij_skinsuit = { 
                name = "Skinsuit", 
                text = { 
                    "When a card is {C:red}destroyed{},",
                    "patch its {C:attention}suit{} onto a {C:attention}random",
                    "{C:attention}card{} held in hand" 
                } 
            },
            j_aij_shock_humor = { name = "Shock Humor", text = { "" } },
            j_aij_the_house_that_jack_built = { name = "The House that Jack Built", text = { "" } },
            j_aij_clownbug = { name = "Clownbug", text = { "" } },
            j_aij_infamous_machine = { 
                name = "Infamous Machine", 
                text = {
                
                } 
            },
            j_aij_weatherman = { 
                name = "Weatherman", 
                text = {
                
                } 
            },
            j_aij_headfooter = { 
                name = "Headfooter", 
                text = {
                
                } 
            },
            j_aij_rudolph = { 
                name = "Rudolph", 
                text = {
                
                } 
            },
            j_aij_cut_here = { 
                name = "Cut Here", 
                text = {
                    "When this Joker is",
                    "{C:red}destroyed{}, create a",
                    "random {C:red}Rare{} Joker"
                } 
            },
            j_aij_a_young_hamlet = { 
                name = "A Young Hamlet", 
                text = {
                    "This Joker gains {C:mult}+#2#{} Mult",
                    "every {C:attention}#3#{C:inactive} [#4#]{} cards {C:red}discarded{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                } 
            },
            j_aij_mike_check = { 
                name = "A Young Hamlet", 
                text = {
                
                } 
            },
            j_aij_pure_baseball_card = { 
                name = "Pure Baseball Card", 
                text = {
                
                } 
            },
            j_aij_rock_n_roll_clown = { 
                name = "Rock n' Roll Clown", 
                text = {
                
                } 
            },
            j_aij_vecchio_dolore = { 
                name = "Vecchio Dolore", 
                text = {
                
                } 
            },
            j_aij_firework = { 
                name = "Firework", 
                text = {
                    "First played {C:attention}Mult",
                    "card gives {X:mult,C:white} X#1# {} Mult",
                    "when scored",
                } 
            },
             j_aij_bad_guy = { 
                name = "Bad Guy", 
                text = {
                    "Apply {C:attention}Foil{} to a random",
                    "card {C:attention}held in hand{} when",
                    "{C:attention}Boss Blind{} is defeated"
                } 
            },
            
            j_aij_tool = { 
                name = "Tool", 
                text = {
                    "When {C:attention}any{} card changes",
                    "suit, it gains a {C:attention}suit patch",
                    "{C:attention}corresponding{} to its old",
                    "suit"
                } 
            },
            j_aij_youve_got_mail = { 
                name = "You've Got Mail", 
                text = {
                    {
                        "If not {C:dark_edition}Negative{} on",
                        "selecting {C:attention}blind{}, create a",
                        "{C:dark_edition}Negative {C:attention}copy{} of this",
                        "Joker"
                    },
                    {
                        "{V:1}{B:3,V:2}#1##2#{}{V:1}#3#",
                    }
                } 
            },
            j_aij_fleshgait = { 
                name = "Fleshgait", 
                text = {
                    "{C:attention}Scoring{} cards without a",
                    "suit {C:attention}patch{} gain a {C:attention}random",
                    "suit {C:attention}patch"
                } 
            },
            j_aij_czar = { 
                name = "Czar", 
                text = {
                    "Copies the {C:attention}effect{} of a",
                    "{C:attention}random{} discovered joker",
                    "from your {C:attention}collection",
                    "{C:inactive}(Changes when the Shop",
                    "{C:inactive}is rerolled)"
                } 
            },
            j_aij_stage_production = { 
                name = "Stage Production", 
                text = {
                    "{B:1,C:white,s:0.8}Activated Ability",
                    "Once per round, {C:attention}temporarily",
                    "{C:attention}reroll{} Joker to the right",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_pink_slip = { 
                name = "Pink Slip", 
                text = {
                    "{C:attention}+#1# Selection Limit{} for",
                    "{C:red}Discards"
                } 
            },
            j_aij_chromatist = { 
                name = "Chromatist", 
                text = {
                    "{X:mult,C:white}X#1#{} Mult when a",
                    "{C:attention}Polychrome{} edition",
                    "triggers"
                } 
            },
            j_aij_death_of_a_salesman = { 
                name = "Death of a Salesman", 
                text = {
                    "{C:attention}#1#{} {C:red}Chaos{} or {C:red}Anarchy {C:attention}Tag",
                    "available for purchase in",
                    "every {C:money}Shop"
                } 
            },
            j_aij_graffiti = { 
                name = "Graffiti", 
                text = {
                    {
                        '{B:1,C:white,s:0.8}Activated Ability',
                        'Pay {C:money}$#1#{} to recieve a',
                        'random {C:attention}Tag'
                    },
                    {
                        '{C:money}Cost{} increases by {C:red}X#2#',
                        'after use. Resets after',
                        '{C:attention}Boss Blind{} is defeated'
                    }
                } 
            },
            j_aij_baddata = {
                name = "BAD_DATA", 
                text = {
                } 
            },
            j_aij_office_assistant = {
                name = "Office Assistant", 
                text = {
                    "{B:1,C:white,s:0.8}Activated Ability",
                    'Repairs {C:attention}Perishable{} or',
                    '{C:attention}Rental{} Joker to the',
                    '{C:attention}right'
                } 
            },


            j_aij_prototype = { name = "Prototype", text = {
                "{C:inactive}\"Lol I don't know if I",
            "{C:inactive}have any quotes in me\""} },
            j_aij_spoofy = { name = "Spoofy", text = {
                "{C:inactive}\"You should play Braptro\""} },
            j_aij_toyrapple = { name = "Toyrapple", text = {""} },
            j_aij_grass = { name = "Grass", text = {
                "\"the game\""} },
            j_aij_mythie = { name = "Mythie", text = {
                "{C:inactive}\"Eating toast in bed is",
            "{C:inactive}my ability\""} },
            j_aij_zan = { name = "Zan", text = {""} },
            j_aij_metrollen = { name = "Metrollen", text = {""} },
            j_aij_clay = { name = "Clay", text = {""} },
            j_aij_generic = { name = "Gen-Eric", text = {
                "{C:inactive}\"The rest was blanked out",
                "{C:inactive}for the sake of game balance\""
            } },
            j_aij_cheddar = { name = "Cheddar", text = {""} },
            



            j_aij_nybbas = { name = "Nybbas", text = { "" }, unlock = { "?????" } },
            j_aij_doink = { name = "Doink", text = { "" }, unlock = { "?????" } },
            j_aij_monarcho = { name = "Monarcho", text = { "" }, unlock = { "?????" } },
            j_aij_pompey = {
                name = "Pompey",
                text = {
                    "{X:mult,C:white}X#1#{} Mult per {C:attention}Joker{}",
                    "to the {C:attention}right{},",
                    "Pompey included",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{}{C:inactive} Mult){}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_touchstone = {
                name = "Touchstone",
                text = {
                    "{C:attention}+#1#{} hand size,",
                    "reveals the next {C:attention}#2#{}",
                    "cards in your deck",
                },
                unlock = { 
                    "?????" 
                }
            },
            j_aij_fortunato = {
                name = "Fortunato",
                text = {
                    "Turn all {C:attention}played{} but {C:attention}not scored{}",
                    "cards into {C:attention}Stone Cards{}.",
                    "This {C:attention}Joker{} gains {X:mult,C:white}X#2#{} Mult",
                    "when a {C:attention}Stone Card{} is scored",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pellesini = { 
                name = "Pellesini", 
                text = { 
                    "When this Joker is",
                    "{C:red}Destroyed{} create an",
                    "{C:attention}exact{} copy" 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_nedda = {
                name = "Nedda",
                text = {
                    "{C:attention}Queens{} held in hand",
                    "give {X:mult,C:white}X#1#{} Mult"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_silvio = {
                name = "Silvio",
                text = {
                    "Retrigger all {C:attention}Kings{}",
                    "once for each {C:attention}Queen{}",
                    "held in hand",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_biancolelli = { 
                name = "Biancolelli", 
                text = { 
                    "{C:aij_plasma}Balance{} {C:chips}Chips{} and {C:mult}Mult{}", 
                    "after Jokers trigger"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_toto = { 
                name = "Toto", 
                text = { 
                    "Create {C:attention}#1#{} copies of",
                    "each {C:attention}Tag{} acquired",
                    "{C:inactive}(Except Double Tag)" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_grock = { name = "Grock", text = { "" }, unlock = { "?????" } },
            j_aij_eulenspiegel = { 
                name = "Eulenspiegel", 
                text = { 
                    "When {C:attention}Boss Blind{} is defeated,",
                    "{C:attention}-#1#{} Ante and this Joker",
                    "loses {X:mult,C:white}X#2#{} Mult",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_deburau = { name = "Deburau", text = { "" }, unlock = { "?????" } },
            j_aij_dacosta = { name = "D'acosta", text = { "" }, unlock = { "?????" } },
            j_aij_durie = { name = "Durie", text = { "" }, unlock = { "?????" } },
            j_aij_nichola = {
                name = "Nichola",
                text = {
                    'When round begins, add',
                    'one random {C:attention}Queen',
                    'to your hand with a',
                    'random {C:attention}Enhancement{},',
                    '{C:dark_edition}Edition{} and {C:attention}Seal{}'
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fleeman = { name = "Fleeman", text = { "" }, unlock = { "?????" } },
            j_aij_colquhoun = { 
                name = "Colquhoun", 
                text = { 
                    "All cards earn {C:money}$#1#{}",
                    "when {C:attention}scored{}, increases",
                    "by {C:money}$#2#{} when {C:attention}Boss Blind{}",
                    "is defeated"
                }, 
                unlock = { 
                    "?????"
                } 
            },
            j_aij_dor = { 
                name = "D'or", 
                text = { 
                    "{X:dark_edition,C:white}#1#{} Mult on {C:attention}final{}",
                    "hand of {C:attention}round" 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_archy = { 
                name = "Archy", 
                text = { 
                    "All initial {C:attention}cards{} and",
                    "{C:attention}Booster Packs{} in the",
                    "{C:money}Shop{} are free" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_sommers = { 
                name = "Sommers", 
                text = { 
                    "{C:attention}Levels up{} all",
                    "played hands" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_pace = {
                name = "Pace",
                text = {
                    "All {C:uncommon}Uncommon{} and",
                    "{C:rare}Rare{} Jokers are",
                    "considered {C:common}Common"
                },
                unlock = { "?????" }
                -- TODO discuss: are these rarities inclusive,
                -- so e.g. an Uncommon would count as Common and still be Uncommon
                -- for a Baseball Card
            },
            j_aij_thomazina = {
                 name = "Thomazina",
                 text = {
                    "Scored {C:attention}numbered{} cards",
                    "give {C:chips}+#1#{} Chips. Increases by",
                    "{C:chips}+#2#{} Chips when a {C:attention}numbered{}",
                    "card is scored"
                },
                unlock = { "?????" } },
            j_aij_mathurine = { name = "Mathurine", text = { "" }, unlock = { "?????" } },
            j_aij_guillaume = { 
                name = "Guillaume", 
                text = { 
                    "If {C:attention}Boss Blind{} is",
                    "defeated with less than",
                    "{C:attention}5{} Jokers, this Joker",
                    "gains {C:dark_edition}+#2#{} Joker Slot",
                    "{C:inactive}(Currently {C:dark_edition}+#1#{C:inactive} Joker Slots){}",
                },
                unlock = { "?????" } 
            },
            j_aij_tarlton = { 
                name = "Tarlton", 
                text = { 
                    "Gives {C:chips}+Chips{} equal to",
                    "{C:attention}total{} {C:chips}Chips{} of {C:attention}previous{}",
                    "played {C:attention}hand{} this round",
                    "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}",
                }, 
                unlock = { "?????" }
            },
            j_aij_roland = { name = "Roland", text = { "" }, unlock = { "?????" } },
            j_aij_borra = { name = "Borra", text = { "" }, unlock = { "?????" } },
            j_aij_taillefer = { 
                name = "Taillefer", 
                text = { 
                    "This Joker gains {X:mult,C:white}X#2#{} Mult",
                    "per hand played,",
                    "{C:red}self-destructs{} after",
                    "defeating {C:attention}#3#{} {C:attention}Boss Blinds{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult, {C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive}){}",
                }, 
                unlock = { "?????" } 
            },
            j_aij_killigrew = {
                name = "Killigrew",
                text = {
                    "{X:mult,C:white}X#1#{} Mult for every",
                    "{C:attention}Voucher{} owned",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
                },
                unlock = { "?????" }
            },
            j_aij_dongfang = { name = "Dongfang", text = { "" }, unlock = { "?????" } },
            j_aij_zerco = {
                name = "Zerco",
                text = {
                    "Applies {C:dark_edition}Negative{} to {C:attention}first{}",
                    "scored {C:attention}card{} each {C:attention}round{}",
                    "{C:inactive}(if it has no existing Edition)"
                },
                unlock = { "?????" } },
            j_aij_yu_sze = { 
                name = "Yu Sze", 
                text = { 
                    "Jokers without {C:dark_edition}Editions{}",
                    "give {X:mult,C:white}X#1#{} Mult" 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_brusquet = { name = "Brusquet", text = { "" }, unlock = { "?????" } },
            j_aij_rahere = { name = "Rahere", text = { "" }, unlock = { "?????" } },
            j_aij_gonnella = { name = "Gonnella", text = { "" }, unlock = { "?????" } },
            j_aij_gong_gil = { name = "Gong-Gil", text = { "" }, unlock = { "?????" } },
            j_aij_angoulevent = { 
                name = "Angoulevent", 
                text = { 
                    "Retrigger all played cards",
                    "{C:attention}#1#{} additional times" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_coryat = { name = "Coryat", text = { "" }, unlock = { "?????" } },
            j_aij_bluet = { 
                name = "Bluet", 
                text = { 
                    "When {C:attention}Blind{} is selected,",
                    "create a {C:dark_edition}Negative{}",
                    "{C:spectral}Spectral{} card"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_bebe = {
                 name = "Bébé",
                 text = {
                    "{C:blue}+#1#{} Hands per round",
                },
                 unlock = { "?????" } },
            j_aij_pipine = { 
                name = "Pipine", 
                text = { 
                    "{C:red}+#1#{} discards per round" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_golitsyn = { name = "Golitsyn", text = { "" }, unlock = { "?????" } },
            j_aij_buzheninova = { name = "Buzheninova", text = { "" }, unlock = { "?????" } },
            j_aij_yakov = { name = "Yakov", text = { "" }, unlock = { "?????" } },
            j_aij_komar = { 
                name = "Komar", 
                text = { 
                    "All {C:attention}scored{} cards gain {C:chips}Chips",
                    "equal to the {C:chips}Chip value{} of",
                    "all {C:attention}other{} played cards" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_lavatch = {
                 name = "Lavatch",
                 text = {
                    "Scored {C:clubs}Clubs{} give {X:mult,C:white}X#1#{} Mult,",
                    "increases by {X:mult,C:white}X#2#{} Mult",
                    "when a {C:clubs}Club{} is scored",
                },
                 unlock = { "?????" } },
            j_aij_Ffwllier = { name = "Ffwllier", text = { "" }, unlock = { "?????" } },
            j_aij_martellino = {
                name = "Martellino",
                text = {
                    "After {C:attention}#2#{} rounds, {C:money}sell{} this",
                    "Joker to create {C:attention}any Joker{}",
                    "from your {C:attention}collection",
                    "{C:inactive}(Currently {C:attention}#1#{}{C:inactive}/#2#){}"
                },
                unlock = { "?????" }
            },
            j_aij_shir_ei = { name = "Shir'ei", text = { "" }, unlock = { "?????" } },
            j_aij_xinmo = { name = "Xinmo", text = { "" }, unlock = { "?????" } },
            j_aij_chunyu = { name = "Chunyu", text = { "" }, unlock = { "?????" } },
            j_aij_fantasio = { 
                name = "Fantasio", 
                text = { 
                    "All cards are considered",
                    "to be {C:attention}every suit",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_sexton = { name = "Sexton", text = { "" }, unlock = { "?????" } },
            j_aij_dongtong = {
                name = "Dongtong",
                text = {
                    "{C:green}Doubles{} most {C:attention}Joker{}",
                    "values",
                },
                unlock = { "?????" }
            },
            j_aij_naiteh = {
                name = "Nai-Teh",
                text = {
                    "Gains {C:attention}+#2#{} hand size when",
                    "{C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:attention}+#1#{C:inactive} hand size)"
                },
                unlock = { "?????" }
            },
            j_aij_talhak = {
                name = "Talhak",
                text = {
                    "When {C:attention}Boss Blind{} is",
                    "defeated, choose {C:attention}any{}",
                    "{C:spectral}Spectral{} card to create",
                    "{C:inactive}(Must have room)"
                },
                unlock = { "?????" }
            },
            j_aij_bozo = {
                name = "Bozo",
                text = {
                    "When {C:attention}Boss Blind{} is",
                    "defeated, create {C:attention}#1#{}",
                    "random {C:dark_edition}Negative{} Jokers",
                },
                unlock = { "?????" }
            },
            j_aij_thalia = {
                name = "Thalia",
                text = {
                    "If {C:attention}first discard{} of round",
                    "contains exactly {C:attention}1{} card, it",
                    "permanently gains {C:attention}1{}",
                    "additional {C:attention}retrigger"

                },
                unlock = { "?????" }
            },
        },
        Planet = {
            c_aij_vulcanoid = {
                name = "Vulcanoid",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_zoozve = {
                name = "Zoozve",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_luna = {
                name = "Luna",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_phobos = {
                name = "Phobos",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_europa = {
                name = "Europa",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_titan = {
                name = "Titan",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_umbriel = {
                name = "Umbriel",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_triton = {
                name = "Triton",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_nix = {
                name = "Nix",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_planet_nine = {
                name = "Planet Nine",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_pallas = {
                name = "Pallas",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_dysnomia = {
                name = "Dysnomia",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_phaethon = {
                name = "Phaethon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_kamooalewa = {
                name = "Kamooalewa",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_deimos = {
                name = "Deimos",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_callisto = {
                name = "Callisto",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_iapetus = {
                name = "Iapetus",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_oberon = {
                name = "Oberon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_proteus = {
                name = "Proteus",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_charon = {
                name = "Charon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_nibiru = {
                name = "Nibiru",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_kuiper = {
                name = "Kuiper",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_rogue = {
                name = "Rogue Planet",
                text = {
                    'Levels up {C:attention}all',
                    '{C:attention}Hands{} mentioned',
                    'by your {C:attention}Jokers'
                }
            },
            c_aij_dark_star = {
                name = "Dark Star",
                text = {
                    'Levels up {C:attention}all',
                    "{C:attention}Hands{} that haven't",
                    "been {C:attention}played{} yet"
                }
            },
            c_aij_sol = {
                name = "Sol",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#4#{} Mult and",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_paper_weywot = {
                name = "Weywot",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_paper_namaka = {
                name = "Namaka",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_paper_ilmare = {
                name = "Ilmare",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_paper_salacia = {
                name = "Salacia",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_paper_ixion = {
                name = "Ixion",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_paper_hiiaka = {
                name = "Hiiaka",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_paper_varda = {
                name = "Varda",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_paper_mk2 = {
                name = "Mk2",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            }
        },
        Spectral = {
            c_aij_gravastar = {
                name = 'Gravastar',
                text = {
                    '{C:attention}Levels up{} the',
                    '{C:chips}Chips{} of all',
                    '{C:legendary,E:1}poker hands'
                }
            },
            c_aij_pulsar = {
                name = 'Pulsar',
                text = {
                    '{C:attention}Levels up{} the',
                    '{C:mult}Mult{} of all',
                    '{C:legendary,E:1}poker hands'
                }
            },
            c_aij_shade = {
                name = 'Shade',
                text = {
                    'Add {C:dark_edition}Negative{} edition',
                    'to {C:attention}1{} random',
                    'card in hand'
                }
            },
            c_aij_trefle = {
                name = 'Trèfle',
                text = {
                    '{C:attention}Reroll{} one',
                    'selected {C:attention}Joker',
                    "{C:inactive}(Cannot be{}",
                    "{C:inactive}eternal){}"
                }
            },
            c_aij_scopophobia = {
                name = 'Scopophobia',
                text = {
                    '{C:red}Destroys{} a random {C:attention}Joker',
                    'and {C:attention}all cards{} held in',
                    'hand'
                }
            },
            c_aij_reshape = {
                name = 'Reshape',
                text = {
                    'Turn all {C:attention}Jokers{} into copies',
                    'of a random held {C:attention}Joker',
                    '{C:inactive}(Jokers keep their original',
                    '{C:inactive}stickers and editions)'
                }
            },
            c_aij_palmistry = {
                name = 'Palmistry',
                text = {
                    'Gives all cards',
                    'in hand a random',
                    '{C:attention}enhancement,',
                    '{C:red}-#1#{} hand size'
                }
            },
            c_aij_gegenschein = {
                name = "Gegenschein",
                text = {
                    'Sets the level of all',
                    '{C:attention}played{} {C:dark_edition}secret hands{}',
                    'to the {C:attention}number{} of',
                    'times they have',
                    'been {C:attention}played'
                }
            },
            c_aij_mirth = {
                name = 'Mirth',
                text = {
                    'Add a {V:1}#2#',
                    'to {C:attention}#1#{} selected',
                    'card in your hand'
                }
            },
        },
        Tag = {
            tag_aij_glimmer = {
                name = 'Glimmer Tag',
                text = {
                    'Next base edition shop',
                    'Joker is free and',
                    'becomes {C:aij_plasma}Glimmer'
                }
            },
            tag_aij_silver = {
                name = 'Silver Tag',
                text = {
                    'Next base edition shop',
                    'Joker is free and',
                    'becomes {C:aij_silver}Silver'
                }
            },
            tag_aij_stellar = {
                name = 'Stellar Tag',
                text = {
                    'Next base edition shop',
                    'Joker is free and',
                    'becomes {C:aij_stellar}Stellar'
                }
            },
            tag_aij_aureate = {
                name = 'Aureate Tag',
                text = {
                    'Next base edition shop',
                    'Joker is free and',
                    'becomes {C:money}Aureate'
                }
            },
            tag_aij_soulbound = {
                name = 'Soulbound Tag',
                text = {
                    'Creates a random {C:attention}Perishable{} ',
                    '{C:legendary}Legendary{} Joker',
                    '{C:inactive}(Must have room)'
                }
            },
            tag_aij_fortunate = {
                name = 'Fortunate Tag',
                text = {
                    'Choose {C:attention}any{} {C:tarot}Tarot{}',
                    'card to create',
                    '{C:inactive}(Must have room)'
                }
            },
            tag_aij_overstuffed = {
                name = 'Overstuffed Tag',
                text = {
                    "Next {C:attention}Booster Pack{} opened",
                    "contains twice the number of",
                    "options and avaliable picks"
                }
            },
            tag_aij_chaos = {
                name = 'Chaos Tag',
                text = {
                    "Has a {C:red}random{} effect"
                }
            },
            -- Gold Tags
            tag_aij_windfall = {
                name = 'Windfall Tag',
                text = {
                    "{C:money}Triples{} your money"
                }
            },
            tag_aij_unusual = {
                name = 'Unusual Tag',
                text = {
                    "Shop has a free",
                    "{C:uncommon}Uncommon Joker{} with",
                    "{C:attention}doubled{} values"
                }
            },
            tag_aij_recherche = {
                name = 'Recherché Tag',
                text = {
                    "Shop has a free",
                    "{C:rare}Rare Joker{} with",
                    "{C:attention}doubled{} values"
                }
            },
            tag_aij_hermetic = {
                name = 'Hermetic Tag',
                text = {
                    'Choose {C:attention}any{} {C:spectral}Spectral{}',
                    'card to create',
                    '{C:inactive}(Must have room)'
                }
            },
            tag_aij_dark_matter = {
                name = 'Dark Matter Tag',
                text = {
                    'Apply {C:dark_edition}Negative{} to',
                    'a {C:attention}random{} Joker',
                }
            },
            tag_aij_crystal = {
                name = 'Crystal Tag',
                text = {
                    'Apply {C:dark_edition}Foil{} to a',
                    '{C:attention}random{} Joker and',
                    '{C:attention}#1#{} cards in deck'
                }
            },
            tag_aij_iridescent = {
                name = 'Iridescent Tag',
                text = {
                    'Apply {C:dark_edition}Holographic{}',
                    'to a {C:attention}random{} Joker',
                    'and {C:attention}#1#{} cards in deck'
                }
            },
            tag_aij_omnichrome = {
                name = 'Omnichrome Tag',
                text = {
                    'Apply {C:dark_edition}Polychrome{} to',
                    'the {C:attention}rightmost{} base',
                    'edition Joker',
                }
            },
            tag_aij_circumplanetary = {
                name = 'Circumplanetary Tag',
                text = {
                    'Upgrade {C:attention}#2#',
                    'by {C:attention}#1# levels',
                }
            },
            tag_aij_velocity = {
                name = 'Velocity Tag',
                text = {
                    'Gives {C:money}$#1#{}, minus {C:money}$#2#',
                    'per {C:attention}round',
                    '{C:inactive}(Will give {C:money}$#3#{C:inactive})'
                }
            },
            tag_aij_capital = {
                name = 'Capital Tag',
                text = {
                    'After defeating',
                    'the Boss Blind',
                    'gain {C:money}$#1#'
                }
            },
            tag_aij_bierstiefel = {
                name = 'Bierstiefel Tag',
                text = {
                    'Fill all {C:attention}empty',
                    'joker {C:attention}slots{} with',
                    'random {C:common}common{} or',
                    '{C:uncommon}uncommon{} jokers'
                }
            },
            tag_aij_ticket = {
                name = 'Ticket Tag',
                text = {
                    'Redeem a random',
                    'Voucher and its',
                    'upgraded version'
                }
            },
            tag_aij_galloping_domino = {
                name = 'Galloping Domino Tag',
                text = {
                    'All rerolls cost',
                    '{C:money}$#1#{} next shop'
                }
            },
            tag_aij_gioco = {
                name = 'Gioco Tag',
                text = {
                    '{C:attention}Double{} hand size',
                    'next round',
                }
            },
            tag_aij_stereoscopic = {
                name = 'Stereoscopic Tag',
                text = {
                    'Gives a {C:money}gold{} copy of',
                    'the next selected {C:attention}Tag',
                    '{s:0.8,C:attention}Double Tag{s:0.8} excluded',
                }
            },
            tag_aij_frugal = {
                name = 'Frugal Tag',
                text = {
                    'All cards and',
                    'booster packs in next',
                    'shop are free',
                }
            },
            tag_aij_dominus = {
                name = 'Dominus Tag',
                text = {
                    'Disables the {C:attention}Boss blind{}',
                    'score requirement equals',
                    'that of {C:attention}Small blinds'
                }
            },
            tag_aij_nonstandard = {
                name = 'Nonstandard Tag',
                text = {
                    'Create any playing card',
                    'Gain {C:attention}2 copies{} of it'
                }
            },
            tag_aij_ignoramus = {
                name = 'Ignoramus Tag',
                text = {
                    'Choose {C:attention}any{} {C:common}Common',
                    'or {C:uncommon}Uncommon{} Joker',
                    'to create',
                    '{C:inactive}(Must have room)'
                }
            },
            tag_aij_occult = {
                name = 'Occult Tag',
                text = {
                    'Create {C:attention}3 {C:tarot}Tarot{} cards',
                    'and {C:attention}2 {C:spectral}Spectral{} cards', 
                    '{s:0.8}They are {s:0.8,C:dark_edition}Negative',
                }
            },
            tag_aij_asteroid = {
                name = 'Asteroid Tag',
                text = {
                    'Gives a free',
                    '{C:planet}Celestial Pack', 
                    '{s:0.6,C:inactive}(Contains {s:0.6,C:dark_edition}Black Hole{s:0.6}',
                    '{s:0.6,C:dark_edition}Pulsar{s:0.6,C:inactive}, and {s:0.6,C:dark_edition}Gravastar{s:0.6,C:inactive})',
                }
            },
            tag_aij_polydactyly = {
                name = 'Polydactyly Tag',
                text = {
                    'Gives {C:blue}+1 hand{} per',
                    'unused {C:blue}hand{} this run', 
                    '{C:inactive}(Will give {C:blue}+#1# hands{C:inactive})',
                }
            },
            tag_aij_landfill = {
                name = 'Landfill Tag',
                text = {
                    'Gives {C:money}$1{} per card',
                    '{C:red}discarded{} this run', 
                    '{C:inactive}(Will give {C:money}$#1#{C:inactive})',
                }
            },
            tag_aij_cinema = {
                name = 'Cinema Tag',
                text = {
                    'Apply {C:aij_silver}Silver{} to',
                    'the {C:attention}leftmost{} base',
                    'edition Joker',
                }
            },
            tag_aij_ventripotent = {
                name = 'Ventripotent Tag',
                text = {
                    "Next {C:attention}Booster Pack{} opened",
                    "contains twice the number of",
                    "options and unlimited picks"
                }
            },
            tag_aij_timelost = {
                name = 'Timelost Tag',
                text = {
                    'Gives a free {C:purple}Guess',
                    '{C:purple}the Jest Pack{} with',
                    '{C:attention}5{} perishable options',
                }
            },
            tag_aij_auspicious = {
                name = 'Auspicious Tag',
                text = {
                    'Choose {C:attention}any{} {C:tarot}Tarot{}',
                    'card, create {C:attention}3{} copies',
                    '{s:0.8}They are {s:0.8,C:dark_edition}Negative',
                }
            },
            tag_aij_glamour = {
                name = 'Glamour Tag',
                text = {
                    'Apply {C:aij_plasma}Glimmer{} to',
                    '{C:attention}2 random{} Jokers',
                }
            },
            tag_aij_superlunary = {
                name = 'Superlunary Tag',
                text = {
                    'Apply {C:aij_stellar}Stellar{}',
                    'to a {C:attention}random{} Joker',
                    'and {C:attention}#1#{} cards in deck'
                }
            },
            tag_aij_gold_dust = {
                name = 'Gold Dust Tag',
                text = {
                    'Apply {C:money}Aureate{} to',
                    '{C:attention}#1#{} cards in deck'
                }
            },
            tag_aij_anarchy = {
                name = 'Anarchy Tag',
                text = {
                    'Has a {C:red}RANDOM{} effect{C:red}!!!'
                }
            },
        },
        Tarot = {
            c_aij_magus = {
                name = 'The Magus',
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sanctuary_gate = {
                name = 'The Sanctuary Gate',
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_isis_urania = {
                name = 'Isis-Urania',
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_cubic_stone = {
                name = 'The Cubic Stone',
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_master_arcanes = { 
                name = 'Master of the Arcanes',
                text = {
                    "{C:green}#1# in #2#{} chance",
                    "to create a random",
                    "{C:spectral}Spectral{} card",
                    '{C:inactive}(Must have room)'
                }
            },
            c_aij_two_ways = {
                name = 'The Two Ways',
                text = {
                    "Splits {C:attention}#1#{} selected card",
                    "into {C:attention}2{} copies with",
                    "{C:attention}half{} the original {C:attention}rank{}",
                    "{C:inactive}(Odd cards split as evenly as possible){}",
                    "{C:inactive}(A=14, K=13, Q=12, J=11)"
                }
            },
            c_aij_osiris = {
                name = 'Osiris',
                text = {
                    "{C:red}Destroy{} {C:attention}1{} selected",
                    "Joker and earn triple",
                    "its {C:money}sell value",
                    "{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_balance_and_blade = {
                name = 'The Balance and The Blade',
                text = {
                    "{C:attention}Patch{} a random suit",
                    "to {C:attention}#1#{} selected cards"
                }
            },
            c_aij_veiled_lamp = {
                name = 'The Veiled Lamp',
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sphinx = {
                name = 'Sphinx',
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_tamed_lion = {
                name = 'The Tamed Lion',
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_broken_fate = {
                name = 'Broken Fate',
                text = {
                    "Randomises the values",
                    "of {C:attention}leftmost consumable",
                    "between {C:attention}X0.75{} and {C:attention}X2.5"
                }
            },
        },
        Other = {
            -- Other
            aij_patches_suit = {
                name = "Patches",
                text = {
                    "{C:attention}Patched{} with {V:1}#1#"
                }
            },
            aij_jest_mark_of_the_spear = {
                name = "Mark of the Spear",
                text = {
                    'This {C:attention}card{} has been',
                    'permanently {C:red}debuffed',
                    'by {C:attention}The Spear'
                }
            },
            card_extra_retriggers = {
                text={
                    "Retrigger this card {C:attention}#1#{} additional times",
                },
            },
            showdown_blind = {
                name = "Showdown Blind",
                text = {
                    "The {C:attention}Boss Blind{}",
                    "that appears every",
                    "{C:attention}8th{} Ante",
                }
            },
            reroll_joker = {
                name = "Reroll",
                text = {
                    'Replaces Joker with',
                    'a random Joker of',
                    'the same rarity'
                }
            },
            office_assistant_perishable = {
                name = "Perishable",
                text = {
                    '{C:attention}Resets{} the counter',
                    'on {C:attention}Perishable{} Jokers',
                    'for {C:money}$3'
                }
            },
            office_assistant_rental = {
                name = "Rental",
                text = {
                    'Removes {C:attention}Rental',
                    '{C:attention}sticker{} for the',
                    'Jokers {C:money}base price'
                }
            },
            overdesigned_club = {
                name = "Clubs",
                text = {
                    "Scored cards with", 
                    "{C:clubs}Club{} suit give",
                    "{C:mult}+14{} Mult when scored",
                }
            },
            overdesigned_spade = {
                name = "Spades",
                text = {
                    "Scored cards with",
                    "{C:spades}Spade{} suit give",
                    "{C:chips}+100{} Chips when scored",
                }
            },
            overdesigned_diamond = {
                name = "Diamonds",
                text = {
                    "Scored cards with",
                    "{C:diamonds}Diamond{} suit earn",
                    "{C:money}$2{} when scored",
                }
            },
            overdesigned_heart = {
                name = "Hearts",
                text = {
                    "Scored cards with",
                    "{C:hearts}Heart{} suit give",
                    "{X:mult,C:white}X1.5{} Mult when scored",
                }
            },
            p_aij_guess_the_jest = {
                name = "Guess the Jest Pack",
                text = {
                    'Choose {C:attention}#1#{} of {C:attention}#2#{} hidden',
                    '{C:legendary,E:2}Legendary{} Jokers'
                }
            },
            m_aij_dyscalcular_numbered_rank = {
                name = "Numbered Ranks",
                text = {
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, {C:attention}5{}, {C:attention}6{},",
                    "{C:attention}7{}, {C:attention}8{}, {C:attention}9{}, and {C:attention}10{}",
                }
            },
            aij_jest_chaotic_card = {
                name = "Chaotic Card",
                text = {
                    
                    "{C:attention}Randomizes{} their {C:edition}enhancement{}",
                    "after being played",
                }
            },
            palindrome = {
                name = "Palindrome",
                text = {
                    "Multi-digit number that is",
                    "{C:attention}unchanged{} when reversed",
                    "{C:inactive}e.g 33, 151, 3003{}"
                }
            },
            -- Stickers
            aij_marked = {
                name = "Marked",
		        text = {
                    'Cannot be {C:blue}played',
                    'or {C:red}discarded'
		        }
            },
            -- Seals
            aij_smiley_seal = {
                name = "Smiley Seal",
		        text = {
                    'When this {C:attention}card{} is',
                    '{C:red}destroyed{} apply an',
                    'edition to {C:attention}#1#{} random',
                    '{C:attention}Joker'
		        }
            },
            aij_melted_seal = {
                name = "Melted Seal",
		        text = {
                    'When held in {C:attention}hand{},',
                    'will {C:attention}transform{} itself',
                    'into the first non',
                    '{V:1}melted{} seal {C:attention}scored'
		        }
            },
        }
    }
}
