return {
    misc = {
        dictionary = {
            k_moon = "Moon",
            k_moon_q = "Moon?",
            k_star = "Star",
            k_star_q = "Star?",
            k_asteroid = "Asteroid",
            aij_requires_restart = "Requires Restart",
            aij_enable_moons = "Enable Moons",
            k_aij_guess_the_jest = "Guess the Jest",
        }
    },
    descriptions = {
        Back = {
            b_aij_fabled = {
                name = 'Fabled Deck',
                text = {
                    'Unlocked {C:legendary,E:1}Legendary{} Jokers',
                    'may appear in the {C:attention}Shop',
                    '{C:attention}-1{} Joker Slot'
                },
                unlock = {
                    'Unlock a',
                    '{C:legendary,E:1}Legendary{} Joker',
                }
            },
            b_aij_fabled_hidden = {
                name = 'Fabled Deck',
                text = {
                    'Unlocked {C:legendary,E:1}Legendary{} Jokers',
                    'may appear in the {C:attention}Shop',
                    '{C:attention}-1{} Joker Slot'
                },
                unlock = {
                    '?????',
                }
            }
        },
        Enhanced = {
            m_aij_fervent = {
                name = "Fervent Card",
                text = {
                    "Gains {C:blue}+#2#{}",
                    "chips when scored"
                }
            },
        },
        Joker = {
            j_aij_flying_ace = {
                name = "Flying Ace",
                text = {
                    "Earn {C:money}$#1#{} at end of round per",
                    "{C:attention}Ace{} of unique {C:attention}suit{} scored",
                    "this round.",
                    "{C:inactive}(Currently{} {C:money}$#2#{} {C:inactive}){}"
                },
            },
            j_aij_lucky_seven = {
                name = "Lucky Seven",
                text = {
                    "Turn all scored {C:attention}7s{} into",
                    "{C:attention}Lucky Cards{}."
                },
            },
            j_aij_you_broke_it = {
                name = "You Broke It!",
                text = {
                    "Turns every scored {C:attention}#1#{} into a",
                    "{C:attention}#2#{}. Rank and",
                    "Enhancement change when",
                    "selecting {C:attention}blind{}"
                },
            },
            j_aij_birthday_clown = {
                name = "Birthday Clown",
                text = {
                    "{X:red,C:white}X#1#{} Mult on the {C:attention}first{}",
                    "{C:attention}round{} of the {C:attention}Ante{} faced",
                    "with this {C:attention}Joker{} "
                },
            },
            j_aij_memory_card = { name = "Memory Card", text = { "" } },
            j_aij_sleepy_joker = { name = "Sleepy Joker", text = { "" } },
            j_aij_invisible_man = { name = "Invisible man", text = { "" } },
            j_aij_handsome_joker = { name = "Handsome Joker", text = { "" } },
            j_aij_whiteface_grotesque = { name = "Whiteface Grotesque", text = { "" } },
            j_aij_the_clown_show = { name = "The clown Show", text = { "" } },
            j_aij_little_devil = {
                name = "Little Devil",
                text = {
                    "When {C:attention}skipping{} a {C:attention}Blind{}, gain a",
                    "random {C:attention}Standard{}, {C:tarot}Charm{},",
                    "{C:planet}Meteor{}, or {C:red}Buffoon {C:attention}Tag{}"
                },
            },
            j_aij_pierrot = { name = "Pierrot", text = { "" } },
            j_aij_hat_trick = { name = "Hat Trick", text = { "" } },
            j_aij_squeezy_pete = {
                name = "Squeezy Pete",
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult when a",
                    "{C:attention}Full House{} is played.",
                    "Resets if played hand",
                    "is not a {C:attention}Full House{}.",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{}{C:inactive} Mult){}",
                },
            },
            j_aij_infinite_jest = { name = "Infinite Jest", text = { "" } },
            j_aij_bloody_mary = { name = "Bloody Mary", text = { "" } },
            j_aij_trypophobia = {
                name = "Trypophobia",
                text = {
                    "{C:red}+#1#{} Mult if played hand",
                    "contains only {C:attention}8s{}",
                },
            },
            j_aij_rummikub = { name = "Rummikub", text = { "" } },
            j_aij_imperial_bower = { name = "Imperial Bower", text = { "" } },
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
                    "{C:dark_edition}Negative{} Jokers appear {C:attention}3X{}",
                    "more often in the {C:attention}Shop{}."
                },
            },
            j_aij_old_joker = { name = "Old Joker", text = { "" } },
            j_aij_imageboard = { name = "Imageboard", text = { "" } },
            j_aij_carousel = { name = "Carousel", text = { "" } },
            j_aij_slippery_when_wet = { name = "Slippery When wet", text = { "" } },
            j_aij_founding_father = { name = "Founding Father", text = { "" } },
            j_aij_scary_story = {
                name = "Scary Story",
                text = {
                    "Base edition playing cards in {C:attention}Standard{}",
                    "{C:attention}Packs{} have a {C:green}#1# in #2#{} chance to become",
                    "{C:dark_edition}Negative{}"
                },
            },
            j_aij_doodle = {
                name = "Doodle",
                text = {
                    "{C:green}#1# in #2#{} chance that this",
                    "{C:attention}Joker{} copies an adjacent",
                    "Joker's {C:attention}ability{}"
                },
            },
            j_aij_joqr = { name = "Joqr", text = { "" } },
            j_aij_greasepaint = { name = "Greasepaint", text = { "" } },
            j_aij_public_bathroom = {
                name = "Public Bathroom",
                text = {
                    "This Joker gains {C:red}+#1#{}",
                    "Mult per played {C:attention}2{}",
                    "in a {C:attention}Flush{}",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)"
                },
            },
            j_aij_diogenes = { name = "Diogenes", text = { "" } },
            j_aij_blank_card = {
                name = "Blank Card",
                text = {
                    "Every time a {C:attention}playing card{} is",
                    "chosen from a {C:attention}standard{}",
                    "{C:attention}pack{}, create an exact {C:attention}copy{}"
                },
            },
            j_aij_comedians_manifesto = { name = "Comedian's Manifesto", text = { "" } },
            j_aij_circuit_board = { name = "Circuit Board", text = { "" } },
            j_aij_platinum_chip = { name = "Platinum Chip", text = { "" } },
            j_aij_cctv = { name = "Cctv", text = { "" } },
            j_aij_pell_mel = { name = "Pell mel", text = { "" } },
            j_aij_pput_together = { name = "Put Together", text = { "" } },
            j_aij_krampus = {
                name = "Krampus",
                text = {
                    "Played {C:attention}Gold cards{} are",
                    "turned into {C:attention}Stone Cards{}.",
                    "{C:attention}Stone Cards{} earn {C:money}$#1#{}",
                    "when scored."
                },
            },
            j_aij_art_of_the_deal = { name = "Art of the Deal", text = { "" } },
            j_aij_word_art = { name = "Word art", text = { "" } },
            j_aij_atom = {
                name = "Atom",
                text = {
                    "Levels up {C:attention}High Card{} if",
                    "played hand is only one",
                    "{C:attention}Ace{}."
                },
            },
            j_aij_plain_jane = {
                name = "Plain Jane",
                text = {
                    "Scored {C:attention}non-enhanced{} cards",
                    "give {C:red}+#1#{} Mult"
                },
            },
            j_aij_paper_bag = { name = "Paper bag", text = { "" } },
            j_aij_fruity_joker = { name = "Fruity Joker", text = { "" } },
            j_aij_jokia = { name = "Jokia", text = { "" } },
            j_aij_the_mycologists = { 
                name = "The Mycologists", 
                text = { 
                    "If played hand is a {C:attention}#1#{} the",
                    "left card inherets the",
                    "{C:chips}chips{}, {C:dark_edition}enhancement{}, and",
                    "{C:dark_edition}edition{} of the right card" 
                } 
            },
            j_aij_cool_joker = { name = "Cool Joker", text = { "" } },
            j_aij_square_eyes = { name = "Square Eyes", text = { "" } },
            j_aij_punk_joker = {
                name = "Punk Joker",
                text = {
                    "If scored hand contains ",
                    "a {C:attention}Wild Card{}, turn another",
                    "random card into a",
                    "{C:attention}Wild Card{}"
                },
            },
            j_aij_slim_joker = { name = "Slim Joker", text = { "" } },
            j_aij_wireframe = { name = "Wireframe", text = { "" } },
            j_aij_soviet = { name = "Soviet", text = { "" } },
            j_aij_mustachio = { name = "Mustachio", text = { "" } },
            j_aij_penny = {
                name = "Penny",
                text = {
                    "Cards with {C:money}Gold Seal{}",
                    "have a {C:green}#1# in #2#{} chance to",
                    "{C:attention}retrigger"
                },
            },
            j_aij_doctors_note = { name = "Doctor's Note", text = { "" } },
            j_aij_silly_sausage = { name = "Silly Sausage", text = { "" } },
            j_aij_joker_baby = { name = "Joker Baby", text = { "" } },
            j_aij_anchor = { name = "Anchor", text = { "" } },
            j_aij_hei_tiki = { name = "Hei-tiki", text = { "" } },
            j_aij_polybius = { name = "Polybius", text = { "" } },
            j_aij_joker_sighting = { name = "Joker Sighting", text = { "" } },
            j_aij_pencil_drawing = { name = "Pencil Drawing", text = { "" } },
            j_aij_holy_bible = { name = "Holy Bible", text = { "" } },
            j_aij_great_white_north = { name = "Great white North", text = { "" } },
            j_aij_right_angle = { name = "Right Angle", text = { "" } },
            j_aij_adoring_joker = { 
                name = "Adoring Joker", 
                text = { 
                    "After Jokers have {C:attention}triggered",
                    "set Mult to the {C:attention}highest",
                    "scoring Mult this round" ,
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
                } 
            },
            j_aij_lucignolo = {
                name = "Lucignolo",
                text = {
                    "Earn {C:money}$#1#{} when any",
                    "playing card is {C:attention}destroyed{}"
                },
            },
            j_aij_scorecard = { name = "Scorecard", text = { "" } },
            j_aij_punch_and_judy = { name = "Punch and Judy", text = { "" } },
            j_aij_nature_tapes = { name = "Nature Tapes", text = { "" } },
            j_aij_low_priest = { name = "Low Priest", text = { "" } },
            j_aij_oil_and_water = { name = "Oil and Water", text = { "" } },
            j_aij_big_ears = { name = "Big-Ears", text = { "" } },
            j_aij_causal_absent_paranoia = { name = "Causal absent Paranoia", text = { "" } },
            j_aij_hand_drawn = { name = "Hand Drawn", text = { "" } },
            j_aij_haruspex = { name = "Haruspex", text = { "" } },
            j_aij_bobblehead = { name = "Bobblehead", text = { "" } },
            j_aij_topsy_the_clown = { name = "Topsy the Clown", text = { "" } },
            j_aij_cloudwatching = { name = "Cloudwatching", text = { "" } },
            j_aij_line_in_the_sand = { 
                name = "Line in the Sand", 
                text = { 
                    "{C:attention}Discarded Cards{} do not return to",
                    "{C:attention}Deck{} until the end of the ante" 
                } 
            },
            j_aij_hairy_joker = { name = "Hairy Joker", text = { "" } },
            j_aij_realty_sign = {
                name = "Realty Sign",
                text = {
                    "Playing a {C:attention}Full House{}",
                    "increases the {C:money}Sell Value{}",
                    "of this Joker by {C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = { name = "Bad Apple", text = { "" } },
            j_aij_dim_bulb = {
                name = "Dim Bulb",
                text = {
                    "{X:red,C:white}X#1#{} Mult if only {C:common}Common",
                    "{C:attention}Jokers{} are owned"
                },
            },
            j_aij_blood_artist = { name = "Blood Artist", text = { "" } },
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
                    "{C:chips}Chip{} value as {C:mult}Mult{} instead",
                    "{C:inactive,s:0.8}(Suit changes at the end of every round){}" 
                } 
            },
            j_aij_jeff_the_joker = {
                name = "Jeff the Joker",
                text = {
                    'When {C:attention}Small Blind{} is selected,',
                    '{C:red}destroy{} all other Jokers.',
                    'Gain {X:mult,C:white}X0.5{} Mult per Joker destroyed.',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive})'
                },
            },
            j_aij_zanni = { name = "Zanni", text = { "" } },
            j_aij_furbo_e_stupedo = { name = "Furbo e Stupedo", text = { "" } },
            j_aij_read_em_and_weep = { name = "Read 'em and Weep", text = { "" } },
            j_aij_goblin_joker = { name = "Goblin Joker", text = { "" } },
            j_aij_string_theory = { name = "String Theory", text = { "" } },
            j_aij_jesters_privelege = {
                name = "Jester's Privelege",
                text = {
                    "{C:legendary}Legendary{} Jokers may",
                    "appear in the {C:attention}Shop{}",
                },
            },
            j_aij_quark = {
                name = "Quark",
                text = {
                    'Levels up {C:attention}Three of a Kind{} if the',
                    'played hand is exactly {C:attention}three{}',
                    'cards of the {C:attention}same rank',
                    'but {C:attention}different suits{}.'
                },
            },
            j_aij_lucky_carder = { name = "Lucky Carder", text = { "" } },
            j_aij_silver_screen = { name = "Silver Screen", text = { "" } },
            j_aij_pedrolino = { name = "Pedrolino", text = { "" } },
            j_aij_pierrette = { name = "Pierrette", text = { "" } },
            j_aij_scaramouche = { name = "Scaramouche", text = { "" } },
            j_aij_clay_joker = { name = "Clay Joker", text = { "" } },
            j_aij_sunny_joker = { name = "Sunny Joker", text = { "" } },
            j_aij_red_wine = { name = "Red Wine", text = { "" } },
            j_aij_mute_joker = { name = "Mute Joker", text = { "" } },
            j_aij_scapino = { name = "Scapino", text = { "" } },
            j_aij_pinhead = {
                name = "Pinhead",
                text = {
                    "Earn {C:money}$#1#{} if blind is beaten ",
                    "in a {C:attention}single hand{}"
                },
            },
            j_aij_saltimbanco = { name = "Saltimbanco", text = { "" } },
            j_aij_pulcinella = { name = "Pulcinella", text = { "" } },
            j_aij_petrushka = {
                name = "Petrushka",
                text = {
                    "Gives {C:red}Mult{} equal to",
                    "the total {C:attention}rank{} of",
                    "all {C:attention}scored cards{}",
                    "{C:inactive}(A=14, K=13, Q=12, J=11)"
                },
            },
            j_aij_void = { name = "Void", text = { "" } },
            j_aij_kasperle = { name = "Kasperle", text = { "" } },
            j_aij_tumbler = { name = "Tumbler", text = { "" } },
            j_aij_plain_packaging = { name = "Plain Packaging", text = { "" } },
            j_aij_mixel_perfect = {
                name = "Mixel Perfect",
                text = {
                    "{C:red}+#1#{} Mult if {C:attention}played hand{}",
                    "contains an {C:attention}odd{} number",
                    "of cards"
                },
            },
            j_aij_columbina = { name = "Columbina", text = { "" } },
            j_aij_j_file = { name = "J-File", text = { "" } },
            j_aij_bumper_sticker = { name = "Bumper Sticker", text = { "" } },
            j_aij_vesti_la_guibba = { name = "Vesti la Guibba", text = { "" } },
            j_aij_dead_president = {
                name = "Dead President",
                text = {
                    "Sell this {C:attention}Joker{} to",
                    "{C:attention}double{} the {C:money}Sell Values{}",
                    "of adjacent {C:attention}Jokers"
                },
            },
            j_aij_second_tier_meme = { name = "Second tier Meme", text = { "" } },
            j_aij_teeny_joker = {
                name = "Teeny Joker",
                text = {
                    "{C:blue}+#1#{} Chips if played hand",
                    "contains only {C:attention}2s{}",
                },
            },
            j_aij_clowns_on_parade = {
                name = "Clowns on Parade",
                text = {
                    "This {C:attention}Joker{} gains {C:blue}+#2#{} Chips if",
                    "played {C:attention}hand{} contains at least",
                    "three {C:attention}2s{}",
                    "{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}"
                },
            },
            j_aij_rising_sun = { name = "Rising sun", text = { "" } },
            j_aij_red_sky = { 
                name = "Red sky", 
                text = { 
                    "Scoring cards in the {C:attention}first",
                    "and {C:attention}last{} hands of the",
                    "round give {C:mult}+Mult{} instead",
                    "of {C:chips}+Chips" 
                } 
            },
            j_aij_blind_drawn = { 
                name = "Blind-Drawn", 
                text = { 
                    "Cannot see {C:attention}Boss Blind{} or",
                    "its effects until entering it",
                    "{C:mult}X#1#{} Mult",
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
                    "{C:attention}#1#{} additional random",
                    "{C:attention}Booster Packs{} available",
                    "for purchase in every",
                    "{C:attention}shop{}"
                },
            },
            j_aij_little_boy_blue = { name = "Little boy Blue", text = { "" } },
            j_aij_big_red = { name = "Big red", text = { "" } },
            j_aij_party_streamers = {
                name = "Party Streamers",
                text = {
                    "If {C:attention}first hand{} of round",
                    "has only {C:attention}1{} card with no",
                    "{C:attention}Seal{}, it gains a {C:red}Red{}, {C:blue}Blue{},",
                    "or {C:money}Gold{} {C:attention}Seal{}"
                },
            },
            j_aij_kilroy = { name = "Kilroy", text = { "" } },
            j_aij_janus = { name = "Janus", text = { "" } },
            j_aij_honker = { name = "Honker", text = { "" } },
            j_aij_mummy = { name = "Mummy", text = { "" } },
            j_aij_sitcom = { name = "Sitcom", text = { "" } },
            j_aij_in_vino_veritas = { name = "In vino Veritas", text = { "" } },
            j_aij_beefeater = { name = "Beefeater", text = { "" } },
            j_aij_tetraphobia = {
                name = "Tetraphobia",
                text = {
                    "This Joker gains {C:mult}+1{} Mult",
                    "per {C:attention}4{} discarded",
                    "{C:attention}Resets{} when a {C:attention}4{} is played",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                },
            },
            j_aij_jack_of_all_trades = {
                name = "Jack of All Trades",
                text = {
                    "{C:attention}Jacks{} count as any {C:attention}suit",
                },
            },
            j_aij_jumbo_joker = { name = "Jumbo Joker", text = { "" } },
            j_aij_pellucid_joker = { name = "Pellucid Joker", text = { "" } },
            j_aij_cosmological_constant = {
                name = "Cosmological Constant",
                text = {
                    "{C:attention}Balance{} base {C:blue}Chips{} and {C:red}Mult{} of",
                    "{C:attention}played hand"
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
                    "{C:blue}+#1#{} Chips",
                },
            },
            j_aij_giocoliere = {
                name = "Giocoliere",
                text = {
                    "{C:attention}+2{} hand size{} during",
                    "the {C:attention}Boss Blind"
                },
            },
            j_aij_spectre = { name = "Spectre", text = { "" } },
            j_aij_dapper_dan = { name = "Dapper dan", text = { "" } },
            j_aij_average_joe = { name = "Average joe", text = { "" } },
            j_aij_silent_sam = { name = "Silent sam", text = { "" } },
            j_aij_pantomimus = { name = "Pantomimus", text = { "" } },
            j_aij_sneaky_pete = {
                name = "Sneaky Pete",
                text = {
                    'Earn {C:money}$2{} at end of round',
                    'for every {C:money}Gold Seal{}',
                    'in your {C:attention}full deck',
                    '{C:inactive}(Currently {C:money}$#1#{C:inactive})'
                },
            },
            j_aij_peeping_tom = { name = "Peeping tom", text = { "" } },
            j_aij_la_commedia_e_finita = {
                name = "La Commedia è Finita",
                text = {
                    "This Joker gains {C:red}+#1#{}",
                    "Mult when a {C:attention}face{} card",
                    "is {C:attention}destroyed",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)"
                },
            },
            j_aij_straight_to_hell = {
                name = "Straight to Hell",
                text = {
                    "This {C:attention}Joker{} gains {X:red,C:white}X#1#{}",
                    "Mult when a {C:attention}Straight{}",
                    "is {C:attention}discarded{}",
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
                },
            },
            j_aij_guiser = {
                name = "Guiser",
                text = {
                    "Gains {C:money}$#1#{} of {C:attention}sell value{}",
                    "when a {C:tarot}Tarot{} card is used"
                },
            },
            j_aij_mummer = { name = "Mummer", text = { "" } },
            j_aij_tipteerer = {
                name = "Tipteerer",
                text = {
                    "Earn {C:attention}20%{} of the {C:money}Sell Value{}",
                    "of other {C:attention}Jokers{}, rounded up",
                    "at the end of {C:attention}round{}",
                    "{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}"
                },
            },
            j_aij_honest_john = { name = "Honest John", text = { "" } },
            j_aij_dizzard = { name = "Dizzard", text = { "" } },
            j_aij_arlecchino = { name = "Arlecchino", text = { "" } },
            j_aij_arlecchina = { name = "Arlecchina", text = { "" } },
            j_aij_taikomochi = { name = "Taikomochi", text = { "" } },
            j_aij_sudoku = { name = "Sudoku", text = { "" } },
            j_aij_gnasher = { name = "Gnasher", text = { "" } },
            j_aij_executioner = {
                name = "Executioner",
                text = {
                    "This Joker gains {C:blue}+#1#{}",
                    "Chips when a {C:attention}face{} card",
                    "is {C:attention}destroyed",
                    "{C:inactive}(Currently {C:blue}+#2#{C:inactive} Chips)"
                },
            },
            j_aij_jongleur = {
                name = "Jongleur",
                text = {
                    "{C:attention}-#1#{} {C:green}reroll{} cost",
                },
            },
            j_aij_event_horizon = { name = "Event Horizon", text = { "" } },
            j_aij_the_jester = {
                name = "The Jester",
                text = {
                    "Selling a {C:attention}Joker{} grants a",
                    "{C:tarot}The Fool{} Tarot card",
                    "{C:inactive}(Works once per round){C:inactive}",
                    "{C:inactive}#1#{}"
                },
            },
            j_aij_joka_lisa = { name = "Joka Lisa", text = { "" } },
            j_aij_tonpraten = { name = "Tonpraten", text = { "" } },
            j_aij_rodeo_clown = { name = "Rodeo Clown", text = { "" } },
            j_aij_joculator = { name = "Joculator", text = { "" } },
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
            j_aij_blarney_stone = { name = "Blarney Stone", text = { "" } },
            j_aij_sticker = { name = "Sticker", text = { "" } },
            j_aij_feedback_form = { name = "Feedback Form", text = { "" } },
            j_aij_stultor = { name = "Stultor", text = { "" } },
            j_aij_david = {
                name = "David",
                text = {
                    "This Joker gains {C:blue}+#1#{}",
                    "Chips if {C:attention}played hand{}",
                    "is only {C:spades}Spade{} {C:attention}Kings{}",
                    "{C:inactive}(Currently{} {C:blue}+#2#{}{C:inactive} Chips){}",
                },
            },
            j_aij_charles = {
                name = "Charles",
                text = {
                    "This Joker gains {X:red,C:white}X#1#{}",
                    "Mult if {C:attention}played hand{}",
                    "is only {C:hearts}Heart{} {C:attention}Kings{}",
                    "{C:inactive}(Currently{} {X:red,C:white}X#2#{}{C:inactive} Mult){}",
        
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
                    "This Joker gains {C:red}+#1#{}",
                    "Mult if {C:attention}played hand{}",
                    "is only {C:clubs}Club{} {C:attention}Kings{}",
                    "{C:inactive}(Currently{} {C:red}+#2#{}{C:inactive} Mult){}",
                },
            },
            j_aij_sannio = { name = "Sannio", text = { "" } },
            j_aij_stock_photo = { name = "Stock Photo", text = { "" } },
            j_aij_fou_du_roi = {
                name = "Fou du Roi",
                text = {
                    '{C:green}#2# in #1#{} chance to create a',
                    '{C:tarot}Tarot card{} if played hand',
                    'contains a {C:attention}King{} or {C:attention}Queen',
                    '{C:inactive}(Must have room)'
                },
            },
            j_aij_fatuus = {
                name = "Fatuus",
                text = {
                    'If played hand contains only',
                    '{C:attention}Kings{} and {C:attention}Queens{}, apply a',
                    '{C:blue}Blue Seal{} to a random',
                    'card in hand.',
                },
            },
            j_aij_enraging_photo = { name = "Enraging Photo", text = { "" } },
            j_aij_infuriating_note = { name = "Infuriating Note", text = { "" } },
            j_aij_magic_hat = { name = "Magic hat", text = { "" } },
            j_aij_anagraph = { name = "Anagraph", text = { "" } },
            j_aij_beanstalk = { name = "Beanstalk", text = { "" } },
            j_aij_phoney_baloney = { name = "Phoney Baloney", text = { "" } },
            j_aij_jerko = { name = "Jerko", text = { "" } },
            j_aij_design_document = { name = "Design Document", text = { "" } },
            j_aij_animatronic = { name = "Animatronic", text = { "" } },
            j_aij_arecibo_message = { name = "Arecibo Message", text = { "" } },
            j_aij_napkin = { name = "Napkin", text = { "" } },
            j_aij_lost_carcosa = { name = "Lost Carcosa", text = { "" } },
            j_aij_magic_mirror = { name = "Magic Mirror", text = { "" } },
            j_aij_postcard_from_perdition_trail = { name = "Postcard from Perdition Trail", text = { "" } },
            j_aij_mr_lonely = {
                name = "Mr. Lonely",
                text = {
                    "This Joker gains {C:blue}+#1#",
                    "Chips per empty {C:attention}Joker",
                    "{C:attention}slot{} at end of {C:attention}round{}",
                    "{C:inactive}(Currently{} {C:blue}+#2#{}{C:inactive{} Chips)"
                },
            },
            j_aij_spiders_georg = { name = "Spiders Georg", text = { "" } },
            j_aij_gille = { name = "Gille", text = { "" } },
            j_aij_fulehung = { name = "Fulehung", text = { "" } },
            j_aij_bearded_joker = { name = "Bearded Joker", text = { "" } },
            j_aij_skomorokh = { name = "Skomorokh", text = { "" } },
            j_aij_silly_billy = { name = "Silly Billy", text = { "" } },
            j_aij_ijoker_co = { name = "iJoker.co", text = { "" } },
            j_aij_corpse_paint = { name = "Corpse Paint", text = { "" } },
            j_aij_toothy_joker = { name = "Toothy Joker", text = { "" } },
            j_aij_mondrian_joker = {
                name = "Mondrian Joker",
                text = {
                    "{C:red}+#1#{} Mult per {C:attention}4",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently{} {C:red}+#2#{}{C:inactive} Mult)"
                },
            },
            j_aij_orphic_joker = {
                name = "Orphic Joker",
                text = {
                    "Create {C:attention}1{} random ",
                    "{C:uncommon}Uncommon{} {C:attention}Joker{} when",
                    "{C:attention}Blind{} is skipped",
                    "{C:inactive}(Must have room){}"
                },
            },
            j_aij_the_artist = { name = "The Artist", text = { "" } },
            j_aij_toynbee_joker = { name = "Toynbee Joker", text = { "" } },
            j_aij_aluzinnu = { 
                name = "Aluzinnu", 
                text = { 
                    "The {C:attention}Hieroglyph{} and {C:attention}Petroglyph",
                    "vouchers have no {C:red}downsides{} and",
                    "can appear {C:attention}multiple{} times" 
                } 
            },
            j_aij_great_kraken = { name = "Great Kraken", text = { "" } },
            j_aij_truhan = { name = "Truhan", text = { "" } },
            j_aij_chippy = { name = "Chippy", text = { "" } },
            j_aij_hofnarr_the_barbarian = {
                name = "Hofnarr the Barbarian",
                text = {
                    "{C:red}+#1#{} Mult",
                    "On {C:attention}Finisher{} Blinds, instead {C:attention}disables{}",
                    "them and gives {X:red,C:white}X#2#{} Mult"
                },
            },
            j_aij_histrio = { name = "Histrio", text = { "" } },
            j_aij_loregg = { name = "Loregg", text = { "" } },
            j_aij_egg_cc = {
                name = "\"egg\"",
                text = {
                    "{C:blue}+#1#{} Chips. Gains {C:blue}+#2#{} Chips",
                    "and {C:money}$#3#{} of {C:attention}sell value{} at",
                    "end of round",
                    "",
                    "{C:inactive}hey it's \"egg\""
                },
            },
            j_aij_sot = { name = "Sot", text = { "" } },
            j_aij_fat_ed = { name = "Fat 'Ed", text = { "" } },
            j_aij_stained_glass_joker = {
                name = "Stained Glass Joker",
                text = {
                    "{C:attention}Glass Cards{} count as any {C:attention}suit{}",
                },
            },
            j_aij_mushroom_cloud = { name = "Mushroom Cloud", text = { "" } },
            j_aij_overdesigned_joker = { 
                name = "Overdesigned Joker", 
                text = { 
                    "Scored cards with {V:1}#1#{} suit",
                    "#3# {B:3,V:2}#4##2#{}#5#when scored",
                    "{C:inactive}(Hearts->Clubs->Diamonds->Spades)"
                } 
            },
            j_aij_morio = { 
                name = "Morio", 
                text = { 
                    "When {C:attention}boss blind{} is defeated",
                    "choose {C:attention}1{} {C:tarot}tarot{} card to acquire",
                    "{C:inactive}(Must have room)" 
                } 
            },
            j_aij_visage = { name = "Visage", text = { "" } },
            j_aij_goofball = { name = "Goofball", text = { "" } },
            j_aij_heyokha = { name = "Heyókȟa", text = { "" } },
            j_aij_casual_absent_paranoia = { name = "Casual-Absent Paranoia", text = { "" } },


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
                    "{X:red,C:white}X#1#{} Mult per {C:attention}Joker{} to",
                    "the {C:attention}right{} of this one.",
                    "Pompey included",
                    "{C:inactive}(Currently{} {X:red,C:white}X#2#{}{C:inactive} Mult){}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_touchstone = { 
                name = "Touchstone", 
                text = { 
                    "Reveals the next {C:attention}#2#{} cards in your deck",
                    "{C:attention}+#1#{} hand size",
                }, 
                unlock = { "?????" } 
            },
            j_aij_fortunato = {
                name = "Fortunato",
                text = {
                    "Turns all {C:attention}played{} but not scored",
                    "{C:attention}cards{} into {C:attention}Stone Cards{}.",
                    "This {C:attention}Joker{} gains {X:red,C:white}X#2#{} Mult",
                    "when a {C:attention}Stone Card{} is scored.",
                    "{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pellesini = { name = "Pellesini", text = { "" }, unlock = { "?????" } },
            j_aij_nedda = {
                name = "Nedda",
                text = {
                    "{C:attention}Queens{} held in hand",
                    "give {X:red,C:white}X#1#{} Mult."
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_silvio = {
                name = "Silvio",
                text = {
                    "Retriggers all {C:attention}Kings{}",
                    "once for every {C:attention}Queen{}",
                    "held in hand.",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_biancolelli = { name = "Biancolelli", text = { "" }, unlock = { "?????" } },
            j_aij_toto = { name = "Toto", text = { "" }, unlock = { "?????" } },
            j_aij_grock = { name = "Grock", text = { "" }, unlock = { "?????" } },
            j_aij_eulenspiegel = { name = "Eulenspiegel", text = { "" }, unlock = { "?????" } },
            j_aij_deburau = { name = "Deburau", text = { "" }, unlock = { "?????" } },
            j_aij_dacosta = { name = "D'acosta", text = { "" }, unlock = { "?????" } },
            j_aij_durie = { name = "Durie", text = { "" }, unlock = { "?????" } },
            j_aij_nichola = {
                name = "Nichola",
                text = {
                    'When round begins, add',
                    'one random {C:attention}Queen',
                    'to your hand with a',
                    'random {C:attention}Enhancement{}, {C:attention}Seal{},',
                    'and {C:dark_edition}Edition{}'
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fleeman = { name = "Fleeman", text = { "" }, unlock = { "?????" } },
            j_aij_calquhoun = { name = "Calquhoun", text = { "" }, unlock = { "?????" } },
            j_aij_dor = { name = "D'or", text = { "" }, unlock = { "?????" } },
            j_aij_archy = { name = "Archy", text = { "" }, unlock = { "?????" } },
            j_aij_sommers = { name = "Sommers", text = { "" }, unlock = { "?????" } },
            j_aij_pace = { 
                name = "Pace", 
                text = { 
                    "All {C:uncommon}Uncommon{} and {C:rare}Rare{} Jokers",
                    "are considered {C:common}Common" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_thomazina = {
                 name = "Thomazina", 
                 text = { 
                    "Scored {C:attention}numbered{} cards",
                    "give {C:blue}+#1#{} Chips. Gains {C:blue}+#2#{}",
                    "Chips when a {C:attention}numbered{}",
                    "card is scored"
                }, 
                unlock = { "?????" } },
            j_aij_mathurine = { name = "Mathurine", text = { "" }, unlock = { "?????" } },
            j_aij_guillaume = { name = "Guillaume", text = { "" }, unlock = { "?????" } },
            j_aij_tarlton = { name = "Tarlton", text = { "" }, unlock = { "?????" } },
            j_aij_roland = { name = "Roland", text = { "" }, unlock = { "?????" } },
            j_aij_borra = { name = "Borra", text = { "" }, unlock = { "?????" } },
            j_aij_taillefer = { name = "Taillefer", text = { "" }, unlock = { "?????" } },
            j_aij_killigrew = { 
                name = "Killigrew", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult for every {C:attention}Voucher{} owned",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
                }, 
                unlock = { "?????" } 
            },
            j_aij_dongfang = { name = "Dongfang", text = { "" }, unlock = { "?????" } },
            j_aij_zerco = {
                 name = "Zerco", 
                 text = {
                     "Applies {C:dark_edition}Negative{} to", 
                     "the first scored {C:attention}card{}",
                     "each {C:attention}round{}",
                    }, 
                    unlock = { "?????" } },
            j_aij_yu_sze = { name = "Yu_sze", text = { "" }, unlock = { "?????" } },
            j_aij_brusquet = { name = "Brusquet", text = { "" }, unlock = { "?????" } },
            j_aij_rahere = { name = "Rahere", text = { "" }, unlock = { "?????" } },
            j_aij_gonnella = { name = "Gonnella", text = { "" }, unlock = { "?????" } },
            j_aij_gong_gil = { name = "Gong-Gil", text = { "" }, unlock = { "?????" } },
            j_aij_angoulevent = { name = "Angoulevent", text = { "" }, unlock = { "?????" } },
            j_aij_coryat = { name = "Coryat", text = { "" }, unlock = { "?????" } },
            j_aij_bluet = { name = "Bluet", text = { "" }, unlock = { "?????" } },
            j_aij_bebe = {
                 name = "Bébé", 
                 text = { 
                    "{C:blue}+#1#{} Hands per",
                    "round"
                }, 
                 unlock = { "?????" } },
            j_aij_pipine = { name = "Pipine", text = { "" }, unlock = { "?????" } },
            j_aij_golitsyn = { name = "Golitsyn", text = { "" }, unlock = { "?????" } },
            j_aij_buzheninova = { name = "Buzheninova", text = { "" }, unlock = { "?????" } },
            j_aij_yakov = { name = "Yakov", text = { "" }, unlock = { "?????" } },
            j_aij_komar = { name = "Komar", text = { "" }, unlock = { "?????" } },
            j_aij_lavatch = {
                 name = "Lavatch", 
                 text = { 
                    "Scored {C:clubs}Clubs{} give {X:red,C:white}X#1#{} Mult",
                    "Increases by {X:red,C:white}X#2#{} Mult", 
                    "when a {C:clubs}Club{} is scored",
                }, 
                 unlock = { "?????" } },
            j_aij_Ffwllier = { name = "Ffwllier", text = { "" }, unlock = { "?????" } },
            j_aij_martellino = { 
                name = "Martellino", 
                text = { 
                    "After {C:attention}#2#{} rounds, {C:money}sell{} this card to",
                    "select a joker from your {C:attention}collection",
                    "{C:inactive}(Currently {C:attention}#1#{}{C:inactive}/#2#){}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_shir_ei = { name = "Shir'ei", text = { "" }, unlock = { "?????" } },
            j_aij_xinmo = { name = "Xinmo", text = { "" }, unlock = { "?????" } },
            j_aij_chunyu = { name = "Chunyu", text = { "" }, unlock = { "?????" } },
            j_aij_fantasio = { name = "Fantasio", text = { "" }, unlock = { "?????" } },
            j_aij_sexton = { name = "Sexton", text = { "" }, unlock = { "?????" } },
            j_aij_dongtong = { 
                name = "Dongtong",
                text = { 
                    "{C:green}Doubles{} most {C:attention}Joker{}",
                    "{C:attention}Effects" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_naiteh = { 
                name = "Nai-Teh",
                text = { 
                    "{C:attention}+#1#{} hand size",
                    "Increases by {C:attention}#2#{} when",
                    "{C:attention}Boss Blind{} is defeated"
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
                    '{C:blue}Chips{} of all',
                    '{C:legendary,E:1}poker hands'
                }
            },
            c_aij_pulsar = {
                name = 'Pulsar',
                text = {
                    '{C:attention}Levels up{} the',
                    '{C:red}Mult{} of all',
                    '{C:legendary,E:1}poker hands'
                }
            },
            c_aij_shade = {
                name = 'Shade',
                text = {
                    'Add {C:dark_edition}Negative{} edtion',
                    'to {C:attention}1{} random',
                    'card in hand'
                }
            },
            c_aij_trefle = {
                name = 'Trèfle',
                text = {
                    '{C:attention}Reroll{} one of your',
                    'highest rarity {C:attention}Jokers',
                    "{C:inactive}(Cannot be eternal){}"
                }
            },
        },
        Tag = {
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
                    'Choose {C:attention}1{} {C:tarot}Tarot{}',
                    'Card to acquire',
                    '{C:inactive}(Must have room)'
                }
            }
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
        },
        Other = {
            finisher_blind = {
                name = "Finisher Blind",
                text = {
                    "The {C:attention}Boss Blind{}",
                    "that appears every",
                    "{C:attention}8th{} Ante ",
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
            p_aij_guess_the_jest = {
                name = "Guess the Jest Pack",
                text = {
                    'Choose {C:attention}#1#{} of {C:attention}#2#{} hidden',
                    '{C:legendary,E:2}Legendary{} Jokers'
                }
            }
        }
    }
}
