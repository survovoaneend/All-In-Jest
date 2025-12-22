return {
    misc = {
        dictionary = {
            k_coder_badge = "Programador",
            k_artist_badge = "Artista",
            k_moon = "Luna",
            k_moon_q = "Luna?",
            k_star = "Estrella",
            k_tag = "Etiqueta",
            k_star_q = "Estrella?",
            k_asteroid = "Asteroid",
            k_tarot_q = "Tarot?",
            k_active = "Activo",
            k_inactive = "Inactivo",
            aij_requires_restart = "Requiere Reinicio",
            aij_doesnt_requires_restart = "No Requiere Reinicio",
            aij_upgraded_tags = "Etiquetas Doradas",
            aij_enable_moons = "Habilitar Lunas",
            aij_enable_moons_tooltip = {
                'Permite que las cartas de',
                '{C:planet}Planeta{} de {C:chips}Fichas{} y {C:mult}Multi{}',
                "aparezcan en la tienda",
            },
            aij_alter_trypophobia = "Alterar Tripofobia",
            aij_alter_trypophobia_tooltip = {
                '{C:attention}Cambia{} el sprite de',
                '{C:attention}Tripofobia{} para que',
                '{C:attention}sea menos perturbador',
            },
            aij_no_copy_neg = "Permitir Copiar Edición Negativa",
            aij_no_copy_neg_tooltip = {
                '{C:attention}Evita{} que la con edición',
                '{C:dark_edition}Negativa{} se pueda copiar.',
                'Mientras esté {C:attention}desactivado{} (Por defecto),',
                'Al copiar cartas {C:dark_edition}Negativas{} pierden{} su edición'
            },
            aij_blue_stake_rework = 'Alterar el Pozo Azul',
            aij_blue_stake_rework_tooltip = {
                '{C:attention}Cambia{} el Pozo Azul para',
                'tener una {C:attention}Ciega de Pozo{}',
                'en vez de quitar {C:red}-1{} Descarte'
            },
            aij_random_deck_skins = 'Cartas con diseños al azar',
            aij_random_deck_skins_tooltip = {
                'Las {C:attention}Cartas de juego{} de los',
                '{C:attetion}Paquetes Estándar{} y generadas por',
                '{C:attention}Comodines{} tienen {C:attention}diseños al azar{}'
            },
            k_aij_guess_the_jest = "Adivina el Comodín",
            k_aij_memory_card = "¡Memorizado!",
            aij_plus_tag = "+1 Etiqueta",
            aij_refreshed = 'Actualizado',
            aij_paid_off = 'Pagado',
            k_aij_polychrome_ex = '¡Policroma!',
            k_aij_foiled_again = '¡Tonto!',
            k_aij_p_arcana = "+1 Tarot",
            k_aij_merry_christmas = "¡Navidad!",
            k_aij_change_ex = '¡Cambio!',
            k_aij_blood_spilt_ex = '¡Sangra!',
            k_aij_double_ex = '¡Doble!',
            k_aij_triple_ex = '¡Triple!'

        },
        v_dictionary = {
            a_aij_exp_mult="^#1# Multi",

            a_aij_mult_equal="=#1# Multi",

            a_aij_ante_minus="-#1# Apuesta",

            a_aij_percent_balance = "+%#1#",
            a_aij_percent_balance_minus = "-%#1#",
            
            a_aij_hands_minus = "-#1# Manos",

            a_aij_joker_slots = '+#1# ranura de comodín',
            a_aij_joker_slots_minus = '-#1# ranura de comodín',
        },
        challenge_names = {
            c_aij_bananarama = "Bananarama",
            c_aij_sharpest_tool = "Herramientas Perfectas",
            c_aij_the_pit = "El Pozo",
        },
        v_text = {
            -- Challenges
            ch_c_aij_sharpest_tool_1 = {
                'Solo los {C:common}Comodines Comunes{} aparecen',
            },
            ch_c_aij_sharpest_tool_2 = {
                'en la {C:attention}Tienda{} o en {C:attention}Paquetes de Bufón'
            },
            ch_c_aij_all_pit_blinds = {
                'Todos las {C:attention}Ciegas{} después de la {C:attention}Apuesta 1{} son {C:attention}Ciegas de Pozo{}'
            },
        },
        extra_joker_dictionary = {
            -- You've got Mail (also reused in overdesigned)
            k_aij_youve_got_mail = "¡Tienes Correo!",
            k_aij_youve_got_mail_goodbye = "Adiós",
            k_aij_youve_got_mail_none = "No hace nada...",
            k_aij_youve_got_mail_plus_prefix = "+",
            k_aij_youve_got_mail_dollar_prefix = "$",
            k_aij_youve_got_mail_xmult_prefix = "X",
            k_aij_youve_got_mail_mult_text = " Multi",
            k_aij_youve_got_mail_chip_text = " Fichas",
            k_aij_youve_got_mail_dollars_text = " por cada mano jugada",
            -- Overdesigned
            k_aij_overdesigned_give_prefix = "otorgan",
            k_aij_overdesigned_earn_prefix = "otorgan",
            k_aij_overdesigned_heart = "Corazones",
            k_aij_overdesigned_club = "Tréboles",
            k_aij_overdesigned_spade = "Espadas",
            k_aij_overdesigned_diamond = "Diamantes",
            -- Jerko
            k_aij_jerko_retrigger = "Se reactiva",
            k_aij_jerko_times = "veces",
            -- Blacklist
            k_aij_blacklist_empty = 'Ninguno',
            k_aij_blacklist_and = 'y',
            k_aij_blacklist_more = 'más',
        },
        labels = {
            -- Editions
            aij_glimmer = "Reluciente",
            aij_silver = "Plata",
            aij_stellar = "Estelar",
            aij_aureate = "Áureo",
            aij_torn = "Rasgado",
            -- Stickers
            aij_marked = "Marcado",
            -- Seals
            aij_smiley_seal = "Sello Sonriente",
            aij_melted_seal = "Sello derretido",
            -- Other
            k_aij_jest_chaotic_card = "Cáos",
        },
        poker_hands = {
            ['aij_Royal Flush'] = "Escalera Real",
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
                name = 'Baraja de Fábula',
                text = {
                    'Los Comodines {C:legendary,E:1}Legendarios{}',
                    'pueden aparecer en la {C:attention}Tienda',
                    '{C:attention}-1{} Ranura de Comodín'
                },
                unlock = {
                    'Desbloquea un',
                    'Comodín {C:legendary,E:1}Legendario{}',
                }
            },
            b_aij_fabled_hidden = {
                name = 'Baraja de Fábula',
                text = {},
                unlock = {
                    'Desbloquea un',
                    'Comodín {C:legendary,E:1}Legendario{}',
                }
            },
            b_aij_branching = {
                name = 'Baraja Ramificada',
                text = {
                    'Al omitir, puedes escoger',
                    'entre {C:attention}3{} Etiquetas',
                },
                unlock = {
                    'Omite al menos {C:attention}5{}',
                    'ciegas en la misma partida',
                }
            },
            b_aij_branching_hidden = {
                name = 'Baraja Ramificada',
                text = {},
                unlock = {
                    'Omite al menos {C:attention}5{}',
                    'ciegas en la misma partida',
                }
            },
            b_aij_patchwork = {
                name = 'Baraja de Retal',
                text = {
                    'Todas las cartas {C:attention}tienen',
                    'un {C:attention}parche{} al azar'
                },
                unlock = {
                    'Ten almenos {C:attention}13',
                    'con un parche de {C:attention}palo',
                    'a la vez'
                }
            },
            b_aij_patchwork_hidden = {
                name = 'Baraja de Retal',
                text = {},
                unlock = {
                    'Ten almenos {C:attention}13{}',
                    'cartas con un {C:attention}parche{}',
                    "al mismo tiempo"
                }
            }
        },
        Stake = All_in_Jest.config.blue_stake_rework and {
            stake_blue = {
                name = "Pozo Azul",
                text = {
                    'La Ciega Jefe de la Apuesta',
                    '{C:attention}4{} o {C:attention}5{} es una Ciega de Pozo',
                    '{s:0.8}Aplica todas las apuestas anteriores'
                }
            },
        } or {},
        Partner = {
            pnr_aij_simply = {
                name = "Simplecito",
                text = {
                    "Gana {C:mult}+#1#{} Multi al",
                    "final de la ronda",
                    "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)",
                },
                unlock={
                    "Gana una partida con",
                    "{C:attention}Simón el Simple{} en",
                    "la dificultad {C:attention}Pozo Dorado{}",
                },
            },
            pnr_aij_fourwarning = {
                name = "Cuartadvertencia",
                text = {
                    "Gana {C:chips}+#1#{} Fichas si el",
                    "descarte contiene un {C:attention}4",
                    "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)",
                },
                unlock={
                    "Gana una partida con",
                    "{C:attention}Tetrafobia{} en",
                    "la dificultad {C:attention}Pozo Dorado{}",
                },
            },
            pnr_aij_nellie = {
                name = "Nellie",
                text = {
                    "Los Comodines {C:dark_edition}Negativos{} son",
                    "{C:attention}#1#X{} más comunes",
                },
                unlock={
                    "Gana una partida con",
                    "{C:attention}Nancy Negativa{} en",
                    "la dificultad {C:attention}Pozo Dorado{}",
                },
            },
            pnr_aij_banger = {
                name = "Salchichón",
                text = {
                    'Las Renovaciones cuestan {C:money}$#1#{} menos'
                },
                unlock={
                    "Gana una partida con",
                    "{C:attention}ComodínSalchicha{} en",
                    "la dificultad {C:attention}Pozo Dorado{}",
                },
            },
            pnr_aij_flub = {
                name = "Pifia",
                text = {
                    'Los Comodines {C:attention}Eternos{} están',
                    'a {C:money}#1#{}'
                },
                unlock={
                    "Gana una partida con",
                    "{C:attention}Despiste{} en",
                    "la dificultad {C:attention}Pozo Dorado{}",
                },
            },
        },
        Sleeve = {
            sleeve_aij_fabled = {
                name = "Funda de Fábula",
                text = {
                    'Los Comodines {C:legendary,E:1}Legendarios{} pueden',
                    'aparecer en la {C:attention}Tienda',
                    '{C:attention}-1{} Ranura de Comodín'
                }
            },
            sleeve_aij_fabled_alt = {
                name = "Funda de Fábula",
                text = {
                    'Los Comodines {C:legendary,E:1}Legendarios{} aparecen',
                    'con más {C:attention}frecuencia'
                },
            },
            sleeve_aij_patchwork = {
                name = "Funda de Retal",
                text = {
                    'Todas las cartas {C:attention}aparecen',
                    'con un {C:attention}parche{} de palo {C:attention}al azar{}'
                }
            },
            sleeve_aij_patchwork_alt = {
                name = "Funda de Retal",
                text = {
                    'Todas las cartas {C:attention}aparecen',
                    'con {C:attention}2 parches{} de palo {C:attention}al azar{}'
                },
            },
        },
        Blind = {
            --Normal Blinds
            bl_aij_the_beith = {
                name = "El Beith",
                text = {
                    'Los Diamantes',
                    'están al fondo',
                    "de la baraja"
                },
            },
            bl_aij_the_elm = {
                name = "El Olmo",
                text = {
                    'Los Tréboles',
                    'están al fondo',
                    "de la baraja"
                },
            },
            bl_aij_the_alder = {
                name = "El Aliso",
                text = {
                    'Los Corazones',
                    'están al fondo',
                    "de la baraja"
                },
            },
            bl_aij_the_willow = {
                name = "El Sauce",
                text = {
                    'Las Espadas',
                    'están al fondo',
                    "de la baraja"
                },
            },
            bl_aij_the_branch = {
                name = "La Rama",
                text = {
                    'Todas las cartas',
                    'de figura están',
                    "al fondo"
                },
            },
            bl_aij_the_horror = {
                name = "El Horror",
                text = {
                    'Aplica Perecedero a un',
                    'comodín al azar si',
                    'gastas todas tus manos',
                },
            },
            bl_aij_the_oak = {
                name = "El Roble",
                text = {
                    'Debilita el comodín',
                    'del extremo',
                    "derecho"
                },
            },
            bl_aij_the_ingot = {
                name = "El Lingote",
                text = {
                    'Aplica Eterno a todos',
                    'tus comodines si',
                    'gastas todas tus manos',
                },
            },
            bl_aij_the_hazel = {
                name = "El Ámbar",
                text = {
                    'Al final de la ronda,',
                    "otorga alquiler a un",
                    "comodín al azar",
                },
            },
            bl_aij_the_apple = {
                name = "La Manzana",
                text = {
                    'Destruye el comodín',
                    "del extremo izquierdo",
                    "si ganas en una mano",
                },
            },
            bl_aij_the_neck = {
                name = "El Cuello",
                text = {
                    'Sólo puedes descartar',
                    '1 carta a la vez'
                },
            },
            bl_aij_the_groan = {
                name = "El Aullido",
                text = {
                    'Aumenta la puntuación',
                    'requerida un 100% después',
                    'de jugar una mano',
                },
            },
            bl_aij_the_ash = {
                name = "Las Cenizas",
                text = {
                    '+0.2X a la puntuación requerida',
                    'por cada carta por debajo',
                    'de #1# en tu baraja',
                },
            },
            bl_aij_the_clay = {
                name = "La Arcilla",
                text = {
                    'La puntuación requerida',
                    "es aleatoria"
                },
            },
            bl_aij_the_aspen = {
                name = "El Álamo",
                text = {
                    '+2X a la puntuación requerida',
                    'por ciega derrotada',
                    "en esta apuesta"
                },
            },
            bl_aij_the_evergreen = {
                name = "El Florecer",
                text = {
                    '+0.2X a la puntuación requerida',
                    'por cada carta por arriba',
                    'de #1# en tu baraja',
                },
            },
            bl_aij_the_enigma = {
                name = "El Enigma",
                text = {
                    'Todas las cartas',
                    'mejoradas están',
                    "al fondo"
                },
            },
            bl_aij_the_bullion = {
                name = "El Doblón",
                text = {
                    '-$5 al jugar',
                    'cartas mejoradas',
                },
            },
            bl_aij_the_elbow = {
                name = "El Codo",
                text = {
                    'La Cartas mejoradas',
                    'cambian de mejora',
                    "después de anotar"
                },
            },
            bl_aij_the_thorn = {
                name = "La Espina",
                text = {
                    'Debilita las cartas',
                    'mejoradas',
                },
            },
            bl_aij_the_twin = {
                name = "El Gemelo",
                text = {
                    'Las Cartas Mejoradas',
                    'se sacan volteadas',
                },
            },
            bl_aij_the_giant = {
                name = "El Gigante",
                text = {
                    'Ciega Enorme',
                    '+2 Manos'
                },
            },
            bl_aij_the_auroch = {
                name = "El Auroch",
                text = {
                    'Los #1# y #2#s',
                    'salen volteados'
                },
            },
            bl_aij_the_journey = {
                name = "El Viaje",
                text = {
                    'Debes jugar 1 Apuesta más',
                    'si una carta del',
                    'palo #1#',
                    "anota"
                },
            },
            bl_aij_the_gift = {
                name = "La Ofrenda",
                text = {
                    "Te quita tu dinero",
                    "y ganas $1 por carta",
                    "jugada o descartada"
                },
            },
            bl_aij_the_ancestor = {
                name = "El Ancestro",
                text = {
                    'Las manos de póker que',
                    'hayas descartado esta',
                    'ronda son debilitadas'
                },
            },
            bl_aij_the_god = {
                name = "La Deidad",
                text = {
                    'Todas las cartas',
                    'deben anotar'
                },
            },
            bl_aij_the_beast = {
                name = "La Bestia",
                text = {
                    'Consume los comodines',
                    'de comida al ser',
                    'derrotada'
                },
            },
            bl_aij_the_ulcer = {
                name = "La Úlcera",
                text = {
                    "-1 Mano",
                    "-1 Descarte"
                },
            },
            bl_aij_the_need = {
                name = "La Necesidad",
                text = {
                    "Debes tener al menos",
                    "$20 para poder anotar",
                },
            },
            bl_aij_the_day = {
                name = "El Día",
                text = {
                    'La mano debe contener',
                    'Corazones o Diamantes'
                },
            },
            bl_aij_the_celebration = {
                name = "La Celebración",
                text = {
                    '+0.2X a la puntucación requerida',
                    'por cada mano y descarte',
                    "que no hayas usado",
                    "esta apuesta"
                },
            },
            bl_aij_the_storm = {
                name = "La Tormenta",
                text = {
                    'Destruye las cartas',
                    'que no anoten'
                },
            },
            bl_aij_the_frost = {
                name = "La Ventisca",
                text = {
                    'Destruye una carta al azar',
                    'después de jugar tu mano',
                },
            },
            bl_aij_the_yew = {
                name = "El Tejo",
                text = {
                    'Las cartas impares',
                    'son debilitadas'
                },
            },
            bl_aij_the_hoard = {
                name = "El Exceso",
                text = {
                    'El exceso de puntuación',
                    'anotado en esta apuesta',
                    'se agraga a esta ciega'
                },
            },
            bl_aij_the_pear = {
                name = "La Pera",
                text = {
                    'Después de anotar,',
                    'cambia el palo y',
                    'categoría de las',
                    "cartas en mano"
                },
            },
            bl_aij_the_elk = {
                name = "El Alce",
                text = {
                    'No puedes jugar manos',
                    'que hayas jugado en',
                    'esta apuesta'
                },
            },
            bl_aij_the_birch = {
                name = "El Abedúl",
                text = {
                    'Las cartas pares',
                    'son debilitadas'
                },
            },
            bl_aij_the_sun = {
                name = "El Sol",
                text = {
                    'Las Espadas y Tréboles',
                    'se sacan boca abajo',
                },
            },
            bl_aij_the_spear = {
                name = "La Falange",
                text = {
                    'Las cartas de la mano',
                    'ganadora son debilitadas',
                    'para siempre'
                },
            },
            bl_aij_the_steed = {
                name = "El Corcel",
                text = {
                    'Debilita las cartas',
                    'en mano después',
                    'de anotar'
                },
            },
            bl_aij_the_figure = {
                name = "La Figura",
                text = {
                    'La Mano no puede contener',
                    'más de 2 cartas de figura',
                },
            },
            bl_aij_the_lake = {
                name = "El Lago",
                text = {
                    'Las cartas que',
                    'hayas jugado esta',
                    'apuesta se sacan',
                    "de último"
                },
            },
            bl_aij_the_field = {
                name = "El Campo",
                text = {
                    'Las cartas se',
                    'debilitan hasta que',
                    'descartes 10 cartas'
                },
            },
            bl_aij_the_wound = {
                name = "La Herida",
                text = {
                    'Las Manos no anotan',
                    'hasta que no tengas',
                    'descartes'
                },
            },
            bl_aij_the_brimstone = {
                name = "El Azufre",
                text = {
                    'Pierdes la mitad',
                    'de tu dinero',
                    'al descartar'
                },
            },
            bl_aij_the_blush = {
                name = "El Rubor",
                text = {
                    'Debes descartar',
                    '5 cartas a la vez'
                },
            },
            --Pit Blinds
            bl_aij_the_heart = {
                name = "La Pasión",
                text = {
                    'La mano jugada debe',
                    'contener #1#',
                    'para poder anotar'
                },
            },
            bl_aij_the_rains = {
                name = "Los Diluvios",
                text = {
                    'Elimina las mejoras',
                    'sellos y ediciones',
                    'de todas las cartas',
                    'anotadas al ganar'
                },
            },
            bl_aij_the_child = {
                name = "El Hijo",
                text = {
                    'Reduce la categoría',
                    'de las cartas anotadas'
                },
            },
            bl_aij_the_moon = {
                name = "La Luna",
                text = {
                    'Las cartas en',
                    'manos impares',
                    "son inhabilitadas"
                },
            },
            bl_aij_the_shell = {
                name = "El Caparazón",
                text = {
                    "Las cartas tienen",
                    'una prob. de #1# en #2#',
                    "ser debilitadas y una prob.",
                    'de #3# en #4# de salir',
                    'boca abajo'
                },
            },
            bl_aij_the_earth = {
                name = "La Petrificación",
                text = {
                    'Convierte en Piedra',
                    'las cartas en mano',
                    'después de anotar'
                },
            },
            bl_aij_the_dragon = {
                name = "El Dragón",
                text = {
                    'No puedes sacar más',
                    'cartas hasta que tu',
                    "este vacía"
                },
            },
            bl_aij_the_mountain = {
                name = "La Montaña",
                text = {
                    'Ciega Gigantesca',
                    '+1 al tamaño de mano'
                },
            },
            bl_aij_the_conflagration = {
                name = "La Conflagración",
                text = {
                    'Destruye todas las',
                    'cartas jugadas y en',
                    'mano cuando ganas'
                },
            },
            bl_aij_the_umbilical = {
                name = "El Umbilical",
                text = {
                    'Una carta es marcada',
                    'en cada mano jugada,',
                    'las cartas marcadas',
                    "no pueden ser jugadas",
                    "ni descartadas"
                },
            },
            bl_aij_the_divine = {
                name = "Lo Divino",
                text = {
                    'La mano debe contener',
                    'una carta mejorada'
                },
            },
            bl_aij_the_bird = {
                name = "El Pájaro",
                text = {
                    'Un comodín es movido',
                    'antes de anotar'
                },
            },
            bl_aij_the_arrow = {
                name = "La Flecha",
                text = {
                    'La Mano jugada debe',
                    'superar la puntuación',
                    'de la mano anterior',
                    "para anotar"
                },
            },
            bl_aij_the_brilliance = {
                name = "La Brillantez",
                text = {
                    'Debes anotar la',
                    'puntucación requerida',
                    "2 veces para ganar",
                    '+2 Manos',
                },
            },
            -- Finisher Blinds
            bl_aij_obsidian_blade = {
                name = "Hoja de Obsidiana",
                text = {
                    '-1 al tamaño de mano',
                    "-1 descarte",
                    '-1 mano',
                    "Ciega Grande",
                },
            },
            bl_aij_aureate_coin = {
                name = "Moneda Áurea",
                text = {
                    '+0.1X a la puntuación',
                    'por cada $1 que tengas',
                },
            },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "Carta Ferviente",
                text = {
                    "Ganas {C:chips}+#2#{} Fichas",
                    "al anotar"
                }
            },
            m_aij_dyscalcular = {
                name = "Carta Discalcular",
                text = {
                    "Cuenta como todas las",
                    "categorías {C:attention}enumeradas{}",
                    "{C:inactive,s:0.8}(Excepto para hacer manos)"
                }
            },
            m_aij_charged = {
                name = "Carta Energizada",
                text = {
                    "Potencia otras {C:attention}Mejoras{} un {C:attention}+#1#%{}",
                    "de su valor si se {C:attention}juegan{} o {C:attention}están",
                    "{C:attention}en mano{} junto con esta carta",
                }
            },
            m_aij_ice = {
                name = "Carta Congelada",
                text = {
                    "Siempre {C:attention}Anota{} e {C:red}Ignora{} los",
                    "limites de selección si la",
                    "mano excede {C:attention}#1#{} cartas, no",
                    "afecta el tipo de mano jugada",
                }
            },
            m_aij_wood = {
                name = "Carta de Madera",
                text = {
                    'Otorga {C:chips}+#3#{} Fichas al estar en mano,',
                    '{C:chips}+#2#{} por cada carta de',
                    '{C:attention}Madera{} en mano',
                    '{C:inactive}(Actualmente {C:chips}+#1#{C:inactive} Fichas)'
                }
            },
            m_aij_simulated = {
                name = "Carta Simulada",
                text = {
                    '{C:attention}Vuelve{} a la mano al',
                    'jugarse por {C:attention}primera vez{}',
                    'esta ronda'
                }
            },
            m_aij_canvas = {
                name = "Carta de Lienzo",
                text = {
                    '{C:attention}Copia{} el palo y',
                    'categoría de la carta',
                    "de la {C:attention}derecha"
                }
            },
        },
        Voucher = {
            v_aij_fairy_dust ={
                name = "Polvo de Hadas",
                text = {
                    "Las ediciones {C:dark_edition}Relucientes{},",
                    "{C:dark_edition}Plateadas{} y {C:dark_edition}Estelar{} son {C:attention}#1#X{}",
                    "más comunes",
                },
            },
            v_aij_live_pixie ={
                name = "Magia Pixie",
                text = {
                    "Las ediciones {C:dark_edition}Relucientes{},",
                    "{C:dark_edition}Plateadas{} y {C:dark_edition}Estelar{} son {C:attention}#1#X{}",
                    "más comunes",
                },
            },
            v_aij_gold_medal ={
                name = "Medalla de Oro",
                text = {
                    "Las Etiquetas de {C:money}Oro{}",
                    "son {C:attention}#1#X{} más comunes",
                },
            },
            v_aij_trophy ={
                name = "Trofeo",
                text = {
                    "La {C:attention}Ciega Grande{} tiene",
                    "una prob. de {C:green}#1# en #2#{} de",
                    "tener una Etiqueta de {C:money}Oro{}"
                },
            },
            v_aij_sticker_sheet ={
                name = "Hoja de Stickers",
                text = {
                    '{C:attention}Reduce{} la severidad',
                    'de los {C:attention}stickers',
                },
            },
            v_aij_polkadot ={
                name = "Polkadots",
                text = {
                    '{C:attention}Reduce{} la severidad',
                    'de los {C:attention}stickers',
                },
            },
        },
        Edition = {
            e_aij_negative_playing_card = {
                name = "Negativa",
                text = {
                    "{C:dark_edition}+#1#{} al tamaño de mano",
                    "{C:inactive,s:0.8}(Las copias no heredan esta edición)"
                },
            },
            e_aij_glimmer = {
                name = "Reluciente",
                text = {
                    "{C:aij_plasma}Balancea{} un {C:attention}#1#%{} de",
                    "las {C:chips}Fichas{} y {C:mult}Multi{}"
                }
            },
            e_aij_silver = {
                name = "Plateado",
                text = {
                    "Sus efectos son un",
                    "{C:attention}150%{} más potentes"
                }
            },
            e_aij_stellar = {
                name = "Estelar",
                text = {
                    "{C:chips}+#1#{} Fichas y",
                    "{C:mult}+#2#{} Multi por {C:attention}nivel{}",
                    "de la mano jugada"
                }
            },
            e_aij_aureate = {
                name = "Áureo",
                text = {
                    "{X:money,C:white}X#1#{} {C:money}${}",
                    "{C:inactive}(Máximo {C:money}$#2#{}{C:inactive})"
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
                    '{C:inactive}"Pese a lo que indica',
                    '{C:inactive}su nombre, es mencionado',
                    '{C:inactive}con frecuencia"',
                },
            },
            j_aij_survivalaren_credits_joker = {
                name = "Survivalaren",
                text = {
                    '{C:inactive}"¿Así es como mira el monitor',
                    '{C:inactive}cuando está haciendo esto?"',
                },
            },
            j_aij_rattling_snow_credits_joker = {
                name = "RattlingSnow353",
                text = {
                    '{C:inactive}"Es bastante tranqui el amigo,',
                    '{C:inactive}la verdad no tengo',
                    '{C:inactive}mucho que mencionar"',
                },
            },
            j_aij_jumbocarrot_credits_joker = {
                name = "Jumbocarrot",
                text = {
                    '{C:inactive}"Gracias por arreglar',
                    '{C:inactive}Bunco durante el año 2024,',
                    '{C:inactive}uno de mis mods favoritos',
                    '{C:inactive}que grande eres Jumbo"',
                },
            },
            -- Page 1
            j_aij_flying_ace = {
                name = "As Volador",
                text = {
                    "Gana {C:money}$#1#{} al final de la ronda",
                    "por cada {C:attention}As{} de {C:attention}palo{} único",
                    "anotado esta ronda",
                    "{C:inactive}(Actualmente{} {C:money}$#2#{}{C:inactive}){}"
                },
            },
            j_aij_lucky_seven = {
                name = "Siete de la Suerte",
                text = {
                    "Convierte todos los {C:attention}7{}",
                    "sin mejoras anotados en",
                    "{C:attention}Cartas de la Suerte{}"
                },
            },
            j_aij_you_broke_it = {
                name = "¡Lo Rompiste!",
                text = {
                    "Convierte cada {C:attention}#1#{} sin mejoras",
                    "anotado en un {C:attention}#2#{}",
                    "{s:0.8}La Categoría y Mejora",
                    "{s:0.8}cambian al final de la ronda"
                },
            },
            j_aij_birthday_clown = {
                name = "Payaso de Cumpleaños",
                text = {
                    "{X:mult,C:white}X#1#{} Multi por {C:attention}1{}",
                    "ronda cada {C:attention}Apuesta{}",
                    "{C:inactive}#2#"
                },
            },
            j_aij_sleepy_joker = { 
                name = "Comodín Dormilón",
                text = { 
                    "{X:mult,C:white}X#1#{} Multi si la mano jugada", 
                    "contiene solo {C:spades}Espadas{} o {C:clubs}Tréboles"
                }
            },
            j_aij_handsome_joker = {
                name = "Comodín Guapo",
                text = {
                    "Gana {X:mult,C:white}X#1#{} Multi por",
                    "cada {C:attention}#2#{}",
                    "en tu {C:attention}baraja completa",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi)",
                }
            },
            j_aij_whiteface_grotesque = {
                name = "El Grotesco Carablanca",
                text = {
                    "Gana {C:chips}+#1#{} Fichas por cada",
                    "carta de {C:attention}figura{} en {C:attention}mano{}",
                    "al jugar una mano",
                    "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)"
                }
            },
            j_aij_the_clown_show = {
                name = "El Show de Jimbo",
                text = {
                    "{C:chips}+#1#{} Fichas por {C:attention}Comodín",
                    "comprado en esta partida",
                    "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)"
                }
            },
            j_aij_little_devil = {
                name = "Pequeño Diablillo",
                text = {
                    "Al {C:attention}omitir{} una {C:attention}Ciega{}, crea una",
                    "Etiqueta {C:attention}Estándar{}, {C:tarot}Encantada{},",
                    "de {C:planet}Meteoro{}, {C:spectral}Etérea{}, o de {C:red}Bufón{}",
                },
            },
            j_aij_pierrot = {
                name = "Pierrot",
                text = {
                    "Las cartas {C:attention}enumeradas{} en",
                    "mano otorgan sus {C:chips}Fichas{}"
                }
            },
            -- j_aij_hat_trick = {
            --     name = "Truco con Sombrero",
            --     text = { 
            --         "Los {C:attention}3s{} jugados otorgan",
            --         "{C:mult}+#1#{} Multi por cada nivel",
            --         "de {C:attention}Tercia{} al anotar"
            --     } 
            -- },
            j_aij_squeezy_pete = {
                name = "Pedro el Apretable",
                text = {
                    "Gana {X:mult,C:white}X#1#{} Multi por",
                    "cada {C:attention}Full House{}",
                    "{C:attention}consecutivo{}",
                    "{C:inactive}(Actualmente{} {X:mult,C:white}X#2#{}{C:inactive} Multi){}",
                },
            },
            j_aij_infinite_jest = { 
                name = "Infinite Jest",
                text = {
                    "Sube de nivel todas las {C:attention}manos",
                    "{C:attention}de póker{} cuando se derrota",
                    "la {C:attention}Ciega Jefe"
                }
            },
            j_aij_trypophobia = {
                name = "Tripofobia",
                text = {
                    "{C:mult}+#1#{} Multi si la mano anotada",
                    "solo contiene {C:attention}8s{}",
                },
            },
            j_aij_negative_nancy = {
                name = "Nancy Negativa",
                text = {
                    "Los Comodines {C:dark_edition}Negativos{}",
                    "aparecen con {C:attention}#1#X{} más",
                    "frecuencia en la {C:attention}Tienda{}",
                },
            },
            -- Page 2
            j_aij_old_joker = {
                name = "Comodín Viejo",
                text = { 
                    "Gana {C:chips}+#2#{} Fichas y {C:mult}+#4#{} Multi",
                    "al derrotar la {C:attention}Ciega Jefe{}",
                    "{C:inactive,s:0.8}(Actualmente {C:chips,s:0.8}+#1#{}{C:inactive,s:0.8} Fichas, {C:mult,s:0.8}+#3#{}{C:inactive,s:0.8} Multi)",
                }
            },
            j_aij_imageboard = {
                name = "Post satírico",
                text = {
                    "{C:attention}Anotar{} cartas otorgan {C:mult}+#1#{} Multi",
                    "cada {C:attention}vez{} que",
                    "su {C:attention}categoría{} anota",
                    "{C:inactive}(ej. {C:attention}2 2 2{C:inactive} -> {C:mult}+#1#{C:inactive}, {C:mult}+#2#{C:inactive}, {C:mult}+#3#{C:inactive})"
                }
            },
            j_aij_carousel = {
                name = "Carrusel",
                text = { 
                    "{C:attention}Rota{} el palo de las cartas",
                    "{C:attention}anotadas{} después de anotar",
                    "{C:inactive,s:0.8}(Espadas -> Corazones",
                    "{C:inactive,s:0.8}-> Tréboles -> Diamantes)",
                }
            },
            j_aij_founding_father = {
                name = "Experimento con Cometa",
                text = { 
                    "Las {C:attention}Cartas Energizadas{} son",
                    "el {C:attention}doble{} de efectivas"
                } 
            },
            j_aij_scary_story = {
                name = "Cuento Tenebroso",
                text = {
                    "Las cartas de juego",
                    "en {C:attention}Paquetes Estándar{}",
                    "tienen una prob. de {C:green}#1# en #2#{}",
                    "de volverse {C:dark_edition}Negativas{}",
                },
            },
            j_aij_doodle = {
                name = "Garabato",
                text = {
                    "Al inicio de cada {C:attention}ronda{}, hay una",
                    "prob. de {C:green}#1# en #2#{} de copiar los",
                    "Comodines {C:attention}adyacentes{} por el resto",
                    "de la {C:attention}ronda",
                    "{C:inactive}#3#",
                },
            },
            j_aij_greasepaint = {
                name = "Maquillaje",
                text = {
                    {
                        "Deshabilita los",
                        "{C:attention}Comodines{} adyacentes",
                    },
                    {
                        "Los {C:attention}Comodines{} y {C:attention}cartas{}",
                        "deblitadas otorgan {X:mult,C:white}X#1#{} Multi",
                    } 
                }
            },
            j_aij_public_bathroom = {
                name = "Baño Público",
                text = {
                    "Este Comodín gana {C:mult}+#1#{} Multi",
                    "por cada {C:attention}2{} anotado",
                    "en un {C:attention}Color{}",
                    "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)"
                },
            },
            j_aij_blank_card = {
                name = "Carta en Blanco",
                text = {
                    "Cada vez que se elige una {C:attention}carta{}",
                    "de los {C:attention}Paquetes Estándar{},",
                    "crea una {C:attention}copia{} exacta"
                },
            },
            j_aij_comedians_manifesto = {
                name = "Manifiesto del Comediante",
                text = {
                    "Los {C:attention}Reyes{} y {C:attention}Reinas{} en",
                    "{C:attention}Paquetes Estándar{}",
                    "se convierten en {C:attention}Jotas"
                }
            },
            j_aij_cctv = { 
                name = "CCTV",
                text = {
                    "Cuando una {C:attention}Carta de Vidrio{}",
                    "se {C:attention}rompe{}, gana {C:money}$#1#{} y",
                    "convierte una carta en",
                    "mano en {C:attention}Vidrio{}"
                }
            },
            j_aij_pell_mel = { 
                name = "Pell Mel",
                text = { 
                    "{X:mult,C:white}X1{} Multi.",
                    "Gana {X:mult,C:white}X#1#{} Multi",
                    "por {C:attention}palo único{} en",
                    "la {C:attention}mano jugada",
                } 
            },
            j_aij_krampus = {
                name = "Krampus",
                text = {
                    {
                        "Las {C:attention}Cartas de Oro{} anotadas",
                        "se vuelven {C:attention}Cartas de Piedra{}",
                    },
                    {
                        "Las {C:attention}Cartas de Piedra{}",
                        "otorgan{C:money}$#1#{} al anotar"
                    }
                },
            },
            j_aij_art_of_the_deal = {
                name = "El Arte de los Negocios",
                text = {
                    "Gana {C:mult}+#2#{} Multi cuando",
                    "se gana {C:money}dinero{}.",
                    "Se reinicia si tienes",
                    "{C:money}$#3#{} o menos",
                    "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
                }
            },
            j_aij_word_art = { 
                name = "Comodín de Letras",
                text = {
                    "{X:mult,C:white}X1{} Multi, gana {X:mult,C:white}X#1#{} Multi",
                    "por {C:attention}As{}, {C:attention}Rey{}, {C:attention}Reina{} o {C:attention}Jota{}",
                    "en la mano jugada"
                }
            },
            -- Page 3
            j_aij_atom = {
                name = "Átomo",
                text = {
                    "Sube de nivel {C:attention}Carta más Alta{}",
                    "si tu mano jugada contiene",
                    "un solo {C:attention}As{}",
                },
            },
            j_aij_plain_jane = {
                name = "Paolo Plano",
                text = {
                    "Las cartas {C:attention}sin mejoras{}",
                    "anotadas otorgan {C:mult}+#1#{} Multi",
                },
            },
            j_aij_paper_bag = {
                name = "Bolsa de Papel",
                text = {
                    "Gana {C:chips}+#1#{} Fichas por",
                    "cada {C:planet}nivel{} en la",
                    "mano {C:red}descartada{}",
                    "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)",
                }
            },
            j_aij_fruity_joker = {
                name = "Comodín Frutal",
                text = {
                    "Las Cartas y Comodines",
                    "conedición {C:attention}Policroma{}",
                    "otorgan {C:mult}+#1#{} Multi",
                } 
            },
            j_aij_the_mycologists = {
                name = "Los Micólogos",
                text = {
                    "Si la mano jugada es exactamente",
                    "un {C:attention}#1#{}, {C:red}destruye{} la carta",
                    "de la derecha y otorga",
                    "sus {C:chips}Fichas{}, {C:dark_edition}Mejora{}, y {C:dark_edition}Edición{}",
                    "a la carta de la izquierda",
                }
            },
            j_aij_square_eyes = { 
                name = "Ojos Cuadrados",
                text = {
                    "Los {C:attention}4s{} anotados otorgan",
                    "{C:mult}+#1#{} Multi por cada {C:attention}4{}",
                    "en la mano jugada",
                }
            },
            j_aij_punk_joker = {
                name = "Comodín Punk",
                text = {
                    "Anotar una {C:attention}Carta Versátil{}",
                    "convierte una carta anotada",
                    "sin mejoras en una",
                    "{C:attention}Carta Versátil{}",
                },
            },
            j_aij_slim_joker = {
                name = "Comodín Delgado",
                text = {
                    "{C:mult}+#1#{} Multi",
                    "{C:mult}-#2#{} Multi por",
                    "carta jugada",
                }
            },
            j_aij_wireframe = {
                name = "Comodín Holograma",
                text = {
                    "La {C:attention}primera{} mano jugada",
                    "{C:attention}regresa{} a tu {C:attention}mano",
                }
            },
            j_aij_soviet = {
                name = "Comodín Soviético",
                text = {
                    "{C:mult}+#1#{} Multi si la {C:attention}mano jugada{}",
                    "no contiene {C:attention}Reyes{} o {C:attention}Reinas{}",
                }
            },
            j_aij_penny = {
                name = "Centímo",
                text = {
                    "Las cartas con {C:money}Sello de Oro{}",
                    "tienen una prob. de {C:green}#1# en #2#{}",
                    "de {C:attention}reactivarse{}",
                },
            },
            j_aij_doctors_note = {
                name = "Nota del Doctor",
                text = {
                    "Todos los {C:hearts}Corazones{} {C:attention}enumerados{} son",
                    "considerados de la {C:attention}misma categoría",
                    "{C:inactive}(Excepto para hacer manos de póker)",
                }
            },
            j_aij_silly_sausage = {
                name = "Comodín Salchicha",
                text = { 
                    "Las {C:green}Renovaciones{} cuestan",
                    "{C:money}$#1#{} menos {C:attention}Disminuye{} en {C:money}$#2#{}",
                    "al final de la ronda",
                } 
            },
            j_aij_anchor = {
                name = "Ancla",
                text = {
                    "Este Comodín y los Comodines",
                    "adyacentes {C:attention}no pueden{}",
                    "ser {C:red}destruidos{}",
                }
            },
            j_aij_hei_tiki = {
                name = "Hei-tiki",
                text = {
                    "Este {C:attention}Comodín{} gana {X:mult,C:white}X#2#{} Multi",
                    "si las {C:chips}Fichas{} de la mano",
                    "jugada exceden el {C:mult}Multi{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi)",
                }
            },
            j_aij_polybius = {
                name = "Polybius",
                text = { 
                    "Otorga el {C:mult}Multi{} y las {C:chips}Fichas{} de",
                    "todos los tipos de manos {C:attention}contenidos{}",
                    "{C:attention}dentro{} de la mano jugada",
                }
            },
            -- Page 4
            j_aij_pencil_drawing = {
                name = "Lápiz de Dibujante",
                text = { 
                    "{B:1,C:white,s:0.8}Habilidad Activable",
                    "Paga {C:money}$#1#{} para añadir una {C:attention}carta",
                    "de juego{} {C:attention}al azar{} a tu mano",
                } 
            },
            j_aij_right_angle = {
                name = "Ángulo Correcto",
                text = {
                    "Activa todos los {C:attention}10s{} en mano",
                    "cuando se anota un {C:attention}9{}",
                }
            },
            j_aij_adoring_joker = {
                name = "Comodín Adorador",
                text = {
                    "{C:attention}Después{} de que los",
                    "{C:attention}Comodines{} se hayan activado,",
                    "establece el {C:mult}Multi{} al {C:attention}mayor",
                    "{C:mult}Multi{} alcanzado en esta {C:attention}Apuesta",
                    "{C:inactive}(Actualmente {C:mult}#1# {C:inactive}Multi)",
                }
            },
            j_aij_lucignolo = {
                name = "Lucignolo",
                text = {
                    "Gana {C:money}$#1#{} cuando cualquier",
                    "carta de juego es {C:red}destruida{}",
                },
            },
            j_aij_scorecard = {
                name = "Tabla de Puntuación",
                text = { 
                    "Al seleccionar una",
                    "{C:attention}Ciega{}, sube {C:attention}#1#{} {C:planet}niveles{}",
                    "una {C:attention}mano al azar{}",
                } 
            },
            j_aij_punch_and_judy = {
                name = "Punch y Judy",
                text = {
                    {
                        "Si la {C:attention}mano jugada{} contiene",
                        "exactamente {C:attention}#1# Rey{} y {C:attention}#1# Reina{},",
                        "reactiva todas las cartas anotadas",
                    },
                    {
                        "Los {C:attention}Reyes{} y {C:attention}Reinas{}",
                        "siempre anotan",
                    }
                }
            },
            j_aij_nature_tapes = {
                name = "Nature Tapes",
                text = {
                    "Al usar una carta de {C:planet}Planeta{}",
                    "de tipo {C:mult}Multi{}, este Comodín",
                    "gana {C:mult}+#1#{} Multi",
                    "{C:inactive}(Actualmente {C:mult}+#2# {C:inactive}Multi)",
                }
            },
            j_aij_low_priest = {
                name = "Sacerdote Bajo",
                text = {
                    "{X:mult,C:white}X#1#{} Multi,",
                    "{X:mult,C:white}-X#2#{} Multi por {C:attention}nivel{}",
                    "de la mano jugada",
                }
            },
            j_aij_hand_drawn = {
                name = "Dibujado a Mano",
                text = { 
                    "Al {C:attention}inicio{} de la ronda, sigue",
                    "sacando cartas hasta que",
                    "tu mano {C:attention}contenga{}",
                    "tu {C:attention}mano{} más jugada",
                }
            },
            j_aij_haruspex = {
                name = "Harúspice",
                text = { 
                    "{B:1,C:white,s:0.8}Habilidad Activable",
                    "Gasta {C:attention}#1#{} {C:red}Descarte{} para elegir {C:attention}#2#{}",
                    "carta de tu {C:attention}baraja{} para",
                    "{C:attention}sacar{} a la mano",
                }
            },
            j_aij_topsy_the_clown = {
                name = "Topsy el Payaso",
                text = {
                    "Redondea las {C:chips}Fichas{} y {C:mult}Multi{}",
                    "a la siguiente {C:attention}Capicúa{}",
                }
            },
            j_aij_line_in_the_sand = {
                name = "Línea en la Arena",
                text = {
                    "Las cartas {C:red}descartadas{} no",
                    "vuelven a la {C:attention}baraja{}",
                    "hasta terminar la {C:attention}Apuesta{}"
                }
            },
            j_aij_realty_sign = {
                name = "Comodín Inmobiliario",
                text = {
                    "Jugar un {C:attention}Full House{} aumenta",
                    "el {C:money}valor de venta{}",
                    "de este comodín en {C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = {
                name = "Bad Apple",
                text = {
                    "Gana {X:mult,C:white}X#2#{} Multi si la {C:blue}mano{}",
                    "contiene {C:attention}#4#{} de palo {C:spades}Oscuro{}",
                    "y {C:attention}#3#{} de palo {C:hearts}Claro{}",
                    "{C:inactive,s:0.8}(La pproporción cambia cada ronda)",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi){}",
                }
            },
            j_aij_dim_bulb = {
                name = "Luz Tenue",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si no tienes",
                    "Comodines {C:uncommon}Inusuales{} o {C:red}Raros{}",
                },
            },
            -- Page 5
            j_aij_blood_artist = { 
                name = "Artista de Sangre",
                text = {
                    "Cuando {C:money}vendes{} una carta",
                    "o es {C:attention}destruida{},",
                    "reduce la puntuación requerida",
                    "de la {C:attention}Ciega{} en un {C:attention}#1#%{}",
                }
            },
            j_aij_null_joker = {
                name = "Comodín Nulo",
                text = {
                    "Las {C:green}probabilidades{}",
                    "son iguales a {C:attention}cero{}"
                },
            },
            j_aij_magick_joker = {
                name = "Comodín Magick",
                text = {
                    "Al anotar {V:1}#1#{}, anota sus",
                    "{C:chips}+Fichas{} como {C:mult}+Multi{}",
                    "{C:inactive,s:0.8}(Cambia cada ronda){}",
                }
            },
            j_aij_jeff_the_joker = {
                name = "Jeff el Joker",
                text = {
                    'Al seleccionar la {C:attention}Ciega Pequeña{},',
                    '{C:red}destruye{} todos los comodines',
                    'y gana {X:mult,C:white}X#2#{} Mult1 por cada',
                    "comodín destruido",
                    '{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Multi)'
                },
            },
            j_aij_zanni = {
                name = "Zanni",
                text = {
                    "Las cartas {C:attention}enumeradas{} tienen",
                    "una prob. de {C:green}#1# en #2#{}",
                    "de crear una carta del {C:tarot}Tarot{}",
                    "al {C:attention}anotar{}",
                }
            },
            j_aij_read_em_and_weep = {
                name = "Léelas y Llora",
                text = {
                    "Si la mano contiene una {C:attention}Escalera{},",
                    "convierte las {C:attention}cartas{}",
                    "al mismo {C:attention}palo{}",
                    "antes de anotar",
                }
            },
            j_aij_goblin_joker = {
                name = "Comodín Goblin",
                text = {
                    "Al {C:red}descartar{}, sacas",
                    "{C:attention}#1#{} cartas adicionales",
                }
            },
            j_aij_string_theory = {
                name = "Teoría de Cuerdas",
                text = {
                    "Todas las manos",
                    "contienen una {C:attention}Escalera{}",
                }
            },
            j_aij_jesters_privelege = {
                name = "Privilegio de Bufón",
                text = {
                    "Los Comodines {C:legendary}Legendarios{}",
                    "pueden aparecer {C:money}Tienda{}",
                },
            },
            j_aij_privelege_fabled = {
                name = "Privilegio de Bufón",
                text = {
                    "Los Comodines {C:legendary}Legendarios{}",
                    "son {C:attention}más comunes{}",
                },
            },
            j_aij_quark = {
                name = "Quark",
                text = {
                    '{C:planet}Sube{} de nivel {C:attention}Tercia{}',
                    'si la mano es exactamente {C:attention}tres{}',
                    'cartas con diferente {C:attention}palo{}',
                },
            },
            j_aij_silver_screen = { 
                name = "Pantalla Plateada",
                text = {
                    "Al {C:red}destruir{} una carta de {C:attention}figura{}",
                    "otorga {C:aij_silver}Plateado{} a una",
                    "carta en {C:attention}hand{}",
                }
            },
            j_aij_pedrolino = {
                name = "Pedrolino",
                text = {
                    "{C:money}Vende{} esta carta para",
                    "reducir la {C:attention}puntuación requerida{}",
                    "un {C:attention}#1#%{}",
                }
            },
            j_aij_pierrette = {
                name = "Pierrette",
                text = {
                    "Reactiva los {C:attention}efectos{}",
                    "al {C:red}descartar{} cartas",
                }
            },
            j_aij_scaramouche = { 
                name = "Scaramouche",
                text = {
                    "{C:attention}Reactiva{} las cartas",
                    "anotadas si la {C:attention}mano jugada{}",
                    "es un(a) {C:attention}#1#{}",
                    "{C:inactive,s:0.8}(Cambia cada ronda{}",
                } 
            },
            j_aij_sunny_joker = {
                name = "Comodín Soleado",
                text = {
                    "Si tu {C:blue}mano{} es una",
                    "{C:attention}Escalera Real{}, las cartas",
                    "jugadas obtienen {X:mult,C:white}X#1#{} Multi",
                }
            },
            -- Page 6
            j_aij_mute_joker = {
                name = "Comodín Mudo",
                text = {
                    "Jugar un(a) {C:attention}#1#{}",
                    "{C:red}destruye{} todas las cartas",
                    "anotadas",
                    "{C:inactive}(Cambia cada ronda)",
                }
            },
            j_aij_scapino = { 
                name = "Scapino",
                text = {
                    "{C:green}Renovar{} la {C:money}Tienda{} cuesta",
                    "{C:money}+$#1#{}, pero renuva los",
                    "{C:attention}Paquetes Potenciadores{}",
                }
            },
            j_aij_pinhead = {
                name = "Cabeza de Pino",
                text = {
                    "Ganas {C:money}$#1#{} si la {C:attention}Ciega{} es",
                    "es derrotada con {C:attention}1{} {C:blue}mano{}",
                },
            },
            j_aij_saltimbanco = {
                name = "Saltimbanco",
                text = {
                    "Al jugar una {C:blue}mano{}, las",
                    "{C:green}probabilidades{} que se activan",
                    "otorgan {X:mult,C:white}XMult{} igual a {X:mult,C:white}X1{}",
                    "más sus probabilidades de {C:red}fallar{}",
                    "{C:inactive}(Ex: {C:green}1 in 4{} {C:inactive} -> {X:mult,C:white}X1.75{C:inactive})",
                }
            },
            j_aij_petrushka = {
                name = "Petrushka",
                text = {
                    "Otorga {C:mult}+Multi{} a las",
                    "{C:attention}categorías{} aotadas",
                    "{C:inactive,s:0.8}(A=14, K=13, Q=12, J=11)"
                },
            },
            j_aij_void = { 
                name = "Vacío",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si nos has",
                    "usado cartas de {C:planet}Planeta{}",
                    "en esta {C:attention}Apuesta{}",
                    "{C:inactive}#2#{}",
                }
            },
            j_aij_kasperle = {
                name = "Kasperle",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si has",
                    "comprado un {C:attention}Vale{} esta",
                    "{C:attention}Apuesta{}",
                    "{C:inactive}#2#{}",
                }
            },
            j_aij_mixel_perfect = {
                name = "Comodín Mixel",
                text = {
                    "{C:mult}+#1#{} Multi si la",
                    "{C:attention}mano anotada{} contiene un número",
                    "{C:attention}impar{} de cartas",
                },
            },
            j_aij_columbina = { 
                name = "Columbina",
                text = {
                    "{C:aij_plasma}Equilibra{} el {C:attention}#1#%{} de las",
                    "{C:chips}Fichas{} y {C:mult}Multi{},",
                    "aumenta un {C:attention}#2#%{} al usar",
                    "cartas {C:spectral}Espectrales{}",
                }
            },
            j_aij_bumper_sticker = {
                name = "Pegatina",
                text = {
                    "Las {C:attention}cartas{} jugadas",
                    "ganan permanentemente",
                    "{C:mult}+#1#{} Multi al anotar",
                }
            },
            j_aij_dead_president = {
                name = "Presidente Muerto",
                text = {
                    "Vende este {C:attention}Comodín{} para",
                    "{C:attention}duplicar{} el {C:money}valor de venta{}",
                    "de los {C:attention}Comodines{} adyacentes",
                    "{C:inactive}(Máximo de {C:money}$#1#{}{C:inactive})",
                },
            },
            j_aij_teeny_joker = {
                name = "Comodín Chiquitito",
                text = {
                    "{C:chips}+#1#{} Fichas si la mano jugada",
                    "contiene solo {C:attention}2s{}",
                },
            },
            j_aij_clowns_on_parade = {
                name = "Desfile de Payasos",
                text = {
                    "Este {C:attention}Comodín{} gana {C:chips}+#2#{} Fichas",
                    "si la mano jugada contiene",
                    "al menos tres {C:attention}2s{}",
                    "{C:inactive}(Actualmente{} {C:chips}+#1#{} {C:inactive}Fichas){}"
                },
            },
            j_aij_rising_sun = { 
                name = "Sol Naciente",
                text = { 
                    "Reactiva la {C:attention}primera{} y {C:attention}última{}",
                    "carta anotada en la {C:attention}primera{} y",
                    "{C:attention}última mano{} de la ronda",
                }
            },
            j_aij_red_sky = {
                name = "Horizonte Rojo",
                text = {
                    "Las cartas anotadas en la {C:attention}primera{} y",
                    "{C:attention}última mano{} de la ronda otorgan",
                    "sus {C:chips}+Fichas{} como {C:mult}+Multi{} en su lugar"
                }
            },
            -- Page 7   
            j_aij_blind_drawn = {
                name = "Dibujo a Ciegas",
                text = {
                    "{X:mult,C:white}X#1#{} Multi",
                    "No puedes ver la {C:attention}Ciega Jefe{}",
                    "ni sus efectos hasta que",
                    "sea seleccionada",
                }
            },
            j_aij_heidelberg_tun = {
                name = "Barril de Heidelberg",
                text = {
                    "Otorga {C:dark_edition}Negativo{} al",
                    "primer {C:attention}consumible{}",
                    "comprado en cada ronda",
                    "{C:inactive}#1#{}"
                },
            },
            j_aij_open_mind = {
                name = "Mente Abierta",
                text = {
                    "Hay {C:attention}#1#{} {C:attention}Paquetes Potenciadores{}",
                    "adicionales disponibles para",
                    "comprar en la {C:money}Tienda{}",
                },
            },
            j_aij_little_boy_blue = {
                name = "Pequeño Azul",
                text = {
                    "{C:chips}+#1#{} Fichas",
                    "Solo aparecen",
                    "Comodines de {C:chips}Fichas{}",
                }
            },
            j_aij_big_red = { 
                name = "Gran Rojo",
                text = { 
                    "{C:mult}+#1#{} Multi",
                    "Solo aparecen",
                    "Comodines de {C:mult}Multi{}",
                }
            },
            j_aij_party_streamers = {
                name = "Serpentinas",
                text = {
                    "Si la {C:attention}primera mano{} de la ronda",
                    "es exactamente {C:attention}1{} carta sin",
                    "{C:attention}Sello{}, obtiene un {C:attention}Sello{} {C:red}Rojo{},",
                    "{C:blue}Azul{}, o de {C:money}Oro{}",
                },
            },
            j_aij_kilroy = { 
                name = "Kilroy", 
                text = { 
                    "{C:attention}Duplica{} las {C:chips}Fichas{} de este",
                    "Comodín al {C:money}venderse",
                    "{C:inactive}(Actualmente {C:chips}+#1#{C:inactive} Fichas)",
                } 
            },
            j_aij_janus = { 
                name = "Jano",
                text = {
                    "Los efectos de {C:attention}ediciones{},",
                    "{C:attention}mejoras{}, y {C:attention}sellos",
                    "en cartas de {C:attention}figura{} se {C:green}duplican",
                }
            },
            j_aij_honker = { 
                name = "Comodín Bocina",
                text = {
                    "Gana {C:red}+#1#{} Multi por",
                    "cada {C:attention}Carta Multi{} anotado",
                    "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)",
                } 
            },
            j_aij_tetraphobia = {
                name = "Tetrafobia",
                text = {
                    "Gana {C:mult}+#2#{} Multi por cada",
                    "{C:attention}4{} descartado, se reinicia",
                    "cuando se anota un {C:attention}4{}",
                    "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)",
                }
            },
            j_aij_jack_of_all_trades = {
                name = "Jota Versatíl",
                text = {
                    "Las {C:attention}Jotas{} cuentan",
                    "como cualquier {C:attention}palo{}",
                },
            },
            j_aij_jumbo_joker = {
                name = "Comodín Jumbo",
                text = {
                    "Solo aparecen {C:attention}Paquetes{}",
                    "{C:attention}Jumbo{} y {C:attention}Mega{}",
                    "en la {C:money}Tienda{}",
                }
            },
            j_aij_pellucid_joker = {
                name = "Comodín Diáfano",
                text = { 
                    "Cuando un {C:attention}Comodín{} con una {C:dark_edition}Edición{} es",
                    "{C:money}vendido{} o {C:red}destruido{}, añade una",
                    "carta de juego al azar con la",
                    "misma {C:dark_edition}Edición{} a la baraja",
                } 
            },
            j_aij_cosmological_constant = {
                name = "Constante Cosmológica",
                text = {
                    "{C:aij_plasma}Equilibra{} las {C:chips}Fichas{}",
                    "y {C:mult}Multi{} {C:attention}base{} de",
                    "la {C:attention}mano{} jugada"
                },
            },
            j_aij_mistigri = {
                name = "Mistigri",
                text = {
                    "{C:attention}+1{} tamaño de mano",
                    "por cada {C:attention}2{} {C:attention}Jotas{} en mano"
                },
            },
            j_aij_simple_simon = {
                name = "Simón el Simple",
                text = {
                    "{C:chips}+#1#{} Fichas",
                },
            },
            -- Page 8
            j_aij_giocoliere = {
                name = "Malabarista",
                text = {
                    "{C:attention}+#1#{} tamaño de mano{}",
                    "durante la {C:attention}Ciega Jefe{}"
                },
            },
            j_aij_spectre = { 
                name = "Aparación",
                text = {
                    "Al derrotar la {C:attention}Ciega Jefe{},",
                    "reemplaza tus {C:attention}consumibles{}",
                    "con cartas {C:spectral}Espectrales{}",
                }
            },
            j_aij_dapper_dan = { 
                name = "Elías el Elegante",
                text = {
                    "Las {C:dark_edition}Ediciones{} de Comodines",
                    "son {C:attention}2X{} más efectivas",
                    "{C:inactive}(Excepto Negativo)"
                }
            },
            j_aij_average_joe = {
                name = "Pedro Promedio",
                text = {
                    "{C:aij_plasma}Equilibra{} el {C:attention}#1#%{} de",
                    "las {C:chips}Fichas{} y {C:mult}Multi{}",
                }
            },
            j_aij_silent_sam = { 
                name = "Sam el Silencioso",
                text = { 
                    "Cada {C:attention}carta{} en mano",
                    "otorga {X:mult,C:white}X#1#{} Multi",
                }
            },
            j_aij_pantomimus = { 
                name = "Pantomimus",
                text = {
                    "Gana {C:chips}+#2#{} Fichas por",
                    "carta {C:attention}en mano{} al final",
                    "de la {C:attention}ronda{}",
                    "{C:inactive}(Actualmente {C:chips}+#1#{C:inactive} Fichas)",
                }
            },
            j_aij_sneaky_pete = {
                name = "Pete el Sigiloso",
                text = {
                    'Gana {C:money}$#2#{} al final de la',
                    'ronda por cada {C:money}Sello de Oro{}',
                    'en tu {C:attention}baraja{}',
                    '{C:inactive}(Actualmente {C:money}$#1#{C:inactive})',
                },
            },
            j_aij_la_commedia_e_finita = {
                name = "La Commedia è Finita",
                text = {
                    "Gana {C:mult}+#1#{} Multi al {C:red}destruir{}",
                    "una carta de {C:attention}figura{}",
                    "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)",
                },
            },
            j_aij_straight_to_hell = {
                name = "Escalera al Infierno",
                text = {
                    "Gana {X:mult,C:white}X#1#{} Multi cuando",
                    "{C:red}descartas{} una {C:attention}Escalera{}",
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)',
                },
            },
            j_aij_guiser = {
                name = "Cuentista", -- It was a hard to get a good translation for this
                text = {
                    "Otine {C:money}$#1#{} a su",
                    "{C:attention}valor de venta{} cuando se",
                    "usa una carta de {C:tarot}Tarot{}",
                },
            },
            j_aij_mummer = {
                name = "Mummer",
                text = {
                    "Activa todas las cartas de",
                    "{C:aij_silver}Acero{} {C:attention}en mano{} cuando se anota",
                    "una carta de {C:aij_silver}Acero{}",
                }
            },
            j_aij_tipteerer = {
                name = "Propinero",
                text = {
                    "Obtiene {C:attention}#2#%{} del {C:money}valor de venta{}",
                    "de otros {C:attention}Comodines{} al final",
                    "de la {C:attention}ronda{}",
                    "{C:inactive}(Actualmente{} {C:money}$#1#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}(Redondeado hacia arriba)",
                }
            },
            j_aij_dizzard = {
                name = "Dizzard",
                text = {
                    "Después de omitir una",
                    "{C:attention}Ciega{}, visita la {C:money}Tienda"
                }
            },
            j_aij_arlecchino = {
                name = "Arlequín",
                text = {
                    "Puedes tomar cualquier carta de",
                    "los {C:attention}Paquetes de Bufón{} y",
                    "{C:attention}Paquetes Estándar{}",
                }
            },
            j_aij_taikomochi = {
                name = "Taikomochi",
                text = {
                    "Las {C:attention}Jotas{} en mano",
                    "otorgan {C:chips}+#1#{} Fichas",
                }
            },
            -- Page 9
            j_aij_sudoku = {
                name = "Sudoku",
                text = {
                    "Fana {X:mult,C:white}X#1#{} Multi por cada",
                    "mano consecutiva que contenga",
                    "una {C:attention}Escalera{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
                }
            },
            j_aij_gnasher = {
                name = "Rechinador",
                text = {
                    "{B:1,C:white,s:0.8}Habilidad Activable",
                    "Una vez por Apuesta, {C:attention}copia{}",
                    "y usa {C:attention}inmediatamente{} un",
                    "{C:attention}consumible{} al azar en mano",
                    "{C:inactive}#1#{}",
                }
            },
            j_aij_executioner = {
                name = "Comodín Verdugo",
                text = {
                    "Gana {C:chips}+#1#{} Fichas cuando una",
                    "carta de {C:attention}figura{} es {C:red}destruida",
                    "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)",
                },
            },
            j_aij_jongleur = {
                name = "Juglar",
                text = {
                    "{C:attention}-$#1#{} al coste",
                    "de {C:green}renovación{}",
                },
            },
            j_aij_event_horizon = { 
                name = "Horizonte de Sucesos",
                text = {
                    "{C:dark_edition}Agujero Negro{} tiene la misma",
                    "rareza que otras cartas de {C:planet}Planeta{}",
                }
            },
            j_aij_the_jester = {
                name = "El Bufón",
                text = {
                    "Crea una copia de {C:tarot}El Loco{}",
                    "al {C:money}vender{} un {C:attention}Comodín{}",
                    "{C:inactive}#1#{}",
                    "{C:inactive,s:0.8}Una vez por ronda{}"
                },
            },
            j_aij_joka_lisa = { 
                name = "La Joka Lisa",
                text = {
                    "Ganas {X:mult,C:white}X#1#{} Multi si el tamaño",
                    "de mano está por encima de {C:attention}7{}",
                    "{C:inactive,s:0.8}El{} {X:mult,C:white,s:0.8}XMulti{} {C:inactive,s:0.8}Aumenta con relación con la{}",
                    "{C:inactive,s:0.8}diferencia de tamaño de mano{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi){}",
                } 
            },
            j_aij_rodeo_clown = { 
                name = "Payaso de Rodeo",
                text = {
                    "Gana {C:mult}+#1#{} Multi por cada",
                    "{C:attention}Ciega{} es derrotada con",
                    "{C:attention}última mano{}",
                    "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)",
                } 
            },
            j_aij_joculator = { 
                name = "Joculator",
                text = {
                    "Saca hasta el {C:attention}doble{} del",
                    "tamaño de tu mano si tienes {C:attention}0{}",
                    "{C:red}descartes{} y te queda {C:attention}#1#{} {C:blue}mano{}",
                }
            },
            j_aij_scurra = {
                name = "Scurra",
                text = {
                    'Reactiva todas las',
                    'cartas jugadas con un',
                    '{C:red}Sello Rojo{}{C:attention}#1#{} vez',
                },
            },
            j_aij_blarney_stone = {
                name = "Piedra de la Elocuencia",
                text = {
                    "Otorga {C:mult}Multi{} igual al",
                    "{C:attention}triple{} del {C:attention}primer dígito{}",
                    "de la {C:attention}puntuación{} actual",
                    "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi){}",
                }
            },
            j_aij_sticker = { 
                name = "Comodín Sticker",
                text = {
                    "{C:mult}+#1#{} Multi por cada {C:attention}sticker{}",
                    "en tus {C:attention}Comodines{}",
                    "{C:inactive}(Actualmente{} {C:mult}+#2#{C:inactive} Multi){}",
                }
            },
            j_aij_feedback_form = { 
                name = "Formulario de Quejas",
                text = { 
                    "Cada carta {C:attention}anotada{} otorga {C:mult}+#1#{}",
                    "Multi si todas las cartas {C:attention}anotadas{}",
                    "tienen diferentes {C:attention}mejoras{}" 
                }
            },
            j_aij_stultor = { 
                name = "Stultor",
                text = { 
                    "Renueva la {C:attention}Ciega Jefe{}",
                    "{C:attention}#1#{} vez por Apuesta,",
                    "sin {C:green}costo{}",
                } 
            },
            j_aij_cesar = {
                name = "César",
                text = {
                    'Ganas {C:money}$#1#{} por mano',
                    'jugada. Aumenta en {C:money}$#2#{} si la',
                    '{C:attention}mano jugada{} es un sólo',
                    '{C:attention}Rey{} de {C:diamonds}Diamantes{}',
                },
            },
            j_aij_charles = {
                name = "Carlos",
                text = {
                    "Gana {X:mult,C:white}X#1#{} Multi si la",
                    "{C:attention}mano jugada{} es un",
                    "sólo {C:attention}Rey{} de {C:hearts}Corazones{}",
                    "{C:inactive}(Actualmente{} {X:mult,C:white}X#2#{C:inactive} Multi){}",
                },
            },
            -- Page10
            j_aij_david = {
                name = "David",
                text = {
                    "Gana {C:chips}+#1#{} Fichas si la",
                    "{C:attention}mano jugada{} es un",
                    "sólo {C:attention}Rey{} de {C:spades}Espadas{}",
                    "{C:inactive}(Actualmente{} {C:chips}+#2#{C:inactive} Fichas){}",
                },
            },
            j_aij_alexandre = {
                name = "Alejandro",
                text = {
                    "Gana {C:mult}+#1#{} Multi si la",
                    "{C:attention}mano jugada{} es un",
                    "sólo {C:attention}Rey{} de {C:clubs}Tréboles{}",
                    "{C:inactive}(Actualmente{} {C:mult}+#2#{C:inactive} Multi){}",
                },
            },
            j_aij_fou_du_roi = {
                name = "Fou du Roi",
                text = {
                    '{C:green}#1# en #2#{} de probabilidad de crear una',
                    'carta de {C:tarot}Tarot{} si la mano jugada',
                    'contiene un {C:attention}Rey{} o {C:attention}Reina',
                    '{C:inactive}(Debe tener espacio)'
                },
            },
            j_aij_fatuus = {
                name = "Fatuus",
                text = {
                    'Si la primera mano jugada',
                    'sólo contiene {C:attention}Reyes{} y',
                    '{C:attention}Reinas{}, otorga un {C:blue}Sello Azul{}',
                    'a una carta jugada',
                },
            },
            j_aij_infuriating_note = { 
                name = "Nota Enfurecedora",
                text = {{ 
                    "{X:mult,C:white}X#1#{} Multi",
                    "Duplicados {C:dark_edition}Negativos{} de este",
                    "Comodín pueden aparecer en la",
                    "{C:attention}Tienda{} y {C:attention}Paquetes de Bufón{}",
                },
                {
                    "{C:inactive}\"He tomado tus cosas, pero",
                    "{C:inactive}sigues avanzando; tendré que",
                    "{C:inactive}esforzarme más, ¡así que",
                    "{C:inactive}ratas para ti!\" -R. R.",
                }
            }
            },
            j_aij_beanstalk = { 
                name = "Tallo de Frijoles",
                text = { 
                    "Las {C:attention}Jotas{} no pueden",
                    "ser {C:red}debilitadas{}",
                    "y {C:attention}siempre{} anotan",
                } 
            },
            j_aij_jerko = { 
                name = "Jerko", 
                text = { 
                    '{C:mult}+#1#{} Multi'
                } 
            },
            j_aij_design_document = { 
                name = "Documento de Diseño",
                text = {
                    "Ganas {C:money}$#1#{} cuando cualquier",
                    "{C:green}probabilidad{} falla",
                }
            },
            j_aij_animatronic = { 
                name = "Animatrónico",
                text = {
                    "{C:attention}+#1#{} al tamaño de mano por",
                    "{C:blue}mano{} consecutiva que",
                    "contenga una {C:attention}Escalera{}",
                    "{C:inactive,s:0.8}(Actualmente {C:attention,s:0.8}+#2#{C:inactive,s:0.8} al tamaño de mano){}",
                    "{C:inactive,s:0.8}(Máximo de {C:attention,s:0.8}+#3#{C:inactive,s:0.8}){}",
                } 
            },
            j_aij_napkin = { 
                name = "Servilleta",
                text = { 
                    "Gana {X:mult,C:white}X#1#{} Multi",
                    "cuando se omiten",
                    "{C:attention}2{} Ciegas {C:attention}seguidas{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi){}",
                }
            },
            j_aij_lost_carcosa = { 
                name = "Carcosa la Antigua",
                text = {
                    "Las {C:chips}Fichas{} y {C:mult}Multi{} de las",
                    "cartas de {C:planet}Planeta{} son alterados",
                    "entre un {C:attention}#1#%{} a {C:attention}#2#%{}",
                    "de sus valores originales",
                }
            },
            j_aij_magic_mirror = { 
                name = "Espejo Mágico",
                text = {
                    "Otorga {C:dark_edition}Negativo{} a la primera",
                    "carta de {C:attention}figura{} anotada",
                    "esta {C:attention}Apuesta{}",
                    "{C:inactive}#1#{}",
                }
            },
            j_aij_mr_lonely = {
                name = "Sr. Solitario",
                text = {
                    "Gana {C:chips}+#1# Fichas por cada",
                    "{C:attention}ranura de Comodín{} vacía",
                    "al final de la {C:attention}ronda{}",
                    "{C:inactive}(Actualmente{} {C:chips}+#2#{C:inactive} Fichas)"
                },
            },
            j_aij_spiders_georg = { 
                name = "Spiders Georg",
                text = { 
                    "Obtiene {C:mult}Multi{} igual a {C:attention}#2#{}",
                    "más el {C:attention}promedio{} de {C:attention}8s{}",
                    "{C:attention}anotados{} en esta partida",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi)",
                } 
            },
            j_aij_fulehung = { 
                name = "Fulehung",
                text = {
                    "AL seleccionar un {C:attention}Ciega{},",
                    "hay una prob. de {C:green}#1# en #2#{} de",
                    "obtener su {C:attention}Etiqueta{}",
                } 
            },
            -- Page 11
            j_aij_bearded_joker = { 
                name = "Comodín Barbudo",
                text = {
                    "{C:mult}+#1#{} Multi por cada",
                    "carta {C:attention}Mejorada{} en tu {C:attention}baraja{}",
                    "{C:inactive}(Actualmente {C:mult}+#2#{} {C:inactive}Multi)",
                }
            },
            j_aij_skomorokh = { 
                name = "Skomorokh",
                text = { 
                    "Gana {X:mult,C:white}X#1#{} Multi",
                    "por cada carta con",
                    "{C:attention}Edición{} en tu {C:attention}baraja{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi)",
                } 
            },
            j_aij_ijoker_co = { 
                name = "iJoker.co",
                text = { 
                    "La {C:money}Tienda{} tiene {C:attention}#1#{} {C:attention}Etiquetas{}",
                    "disponibles para comprar",
                } 
            },
            j_aij_corpse_paint = { 
                name = "Corpse Paint",
                text = { 
                    "Remueve la edición {C:dark_edition}Negativa{}",
                    "de las cartas anotadas y tiene una",
                    "prob. {C:green}#1# en #2#{} de obtener",
                    "{C:attention}+#3#{} al tamaño de mano",
                    "por cada edición removida",
                    "{C:inactive}(Actualmente {C:attention}+#4#{C:inactive} al tamaño de mano)",
                } 
            },
            j_aij_toothy_joker = { 
                name = "Comodín Dientón",
                text = {
                    "{C:chips}+#1#{} Fichas por cada",
                    "carta del {C:tarot}Tarot{} usada en",
                    "esta {C:attention}Apuesta{}",
                    "{C:inactive}(Actualmente{} {C:chips}+#2#{C:inactive} Fichas)",
                } 
            },
            j_aij_mondrian_joker = {
                name = "Comodín Mondrianano",
                text = {
                    "Gana {C:mult}+#1#{} Multi por",
                    "cada {C:attention}4{} en tu {C:attention}baraja{}",
                    "{C:inactive}(Actualmente{} {C:mult}+#2#{}{C:inactive} Multi)",
                },
            },
            j_aij_orphic_joker = {
                name = "Comodín Órfico",
                text = {
                    "Crea {C:attention}#1#{} {C:attention}Comodín{}",
                    "{C:uncommon}Inusual{} al omitir",
                    "una {C:attention}Ciega{}",
                    "{C:inactive}(Debe haber espacio){}",
                },
            },
            j_aij_great_kraken = {
                name = "El Gran Kraken",
                text = {
                    "{X:mult,C:white}X#1#{} Multi por cada",
                    "{C:blue}mano{} restante",
                    "{C:inactive}(Actuamente {X:mult,C:white}X#2#{} {C:inactive}Multi{})",
                    "{C:inactive,s:0.8}(Mínimo {X:mult,C:white,s:0.8}X1{} {C:inactive,s:0.8}Multi){}",
                } 
            },
            j_aij_truhan = { 
                name = "Truhan",
                text = {
                    "Cuando un Comodín es {C:money}vendido{}",
                    "o {C:red}destruido{}, Gana {X:mult,C:white}X#2#{} Multi por cada",
                    "{C:attention}ronda{} superada con ese {C:attention}Comodín{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi)",
                    -- There is no way to know how much Mult will get from each joker
                } 
            },
            j_aij_chippy = {
                name = "Chippy",
                text = { 
                    "Obtiene {C:chips}Fichas{} iguales",
                    "al {C:money}dinero{} gastado",
                    "{C:inactive}(Actualmente {C:chips}+#1#{C:inactive} Fichas)",
                }
            },
            j_aij_hofnarr_the_barbarian = {
                name = "Hofnarr el Bárbaro",
                text = {
                    "{C:mult}+#1#{} Multi",
                    "Contra {C:attention}Ciegas Finales{},",
                    "las {C:attention}deshabilita{}",
                    "y otorga {X:mult,C:white}X#2#{} Multi",
                },
            },
            j_aij_histrio = { 
                name = "Histrión",
                text = {
                    "Gana {C:money}$#1#{} por",
                    "cada {C:blue}mano{} no usada",
                    "al final de la ronda",
                }
            },
            j_aij_egg_cc = {
                name = "\"huevo\"",
                text = {
                    "Gana {C:chips}+#2#{} Fichas",
                    "y {C:money}$#3#{} de {C:attention}valor de venta{}",
                    "al final de la ronda",
                    "{C:inactive}(Actualmente {C:chips}+#1#{C:inactive} Fichas)",
                    "{C:inactive,s:0.8}oye es un \"huevo\"",
                },
            },
            j_aij_sot = { 
                name = "Sot",
                text = {
                    "Ganas {X:mult,C:white}X#1#{} Multi por",
                    "cada {C:attention}Etiqueta{} que poseas",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi)",
                }
            },
            j_aij_stained_glass_joker = {
                name = "Vitral de Comodín",
                text = {
                    "Las {C:attention}Cartas de Vidrio{}",
                    "se consideran como",
                    "cualquier {C:attention}palo{}",
                },
            },
            -- Page 12
            j_aij_overdesigned_joker = {
                name = "Comodín Sobrediseñado",
                text = {
                    {
                        "Al anotar {V:1}#1#{} #3#",
                        "{B:3,V:2}#4##2#{}#5#{}",
                    },
                    {
                        "Palo y efecto {C:attention}rotan{}",
                        "cuando una carta {C:attention}anota{}",
                        "{C:inactive,s:0.8}({V:4}Corazones{C:inactive}->{V:5}Tréboles{C:inactive}->{V:6}Diamantes{C:inactive}->{V:7}Espadas{C:inactive}){}",
                    }
                }
            },
            j_aij_morio = {
                name = "Morio",
                text = {
                    "Cuando la {C:attention}Ciega Jefe{} es",
                    "derrotada, elige {C:attention}cualquier{}",
                    "carta del {C:tarot}Tarot{}",
                    "{C:inactive}(Debe tener espacio)",
                }
            },
            j_aij_visage = { 
                name = "Semblante",
                text = {
                    "Copia el efecto del",
                    "último comodín {C:money}vendido{}",
                }
            },
            j_aij_goofball = { 
                name = "Bobalicón",
                text = {
                    "Las cartas de {C:attention}figura{}",
                    "anotadas {C:aij_plasma}equilibran{} un {C:attention}#1#%{}",
                    "de la {C:chips}Fichas{} y {C:mult}Multi{}",
                }
            },
            j_aij_mandrake = { 
                name = "Mandrágora",
                text = {
                    "Después de {C:attention}#2#{} rondas, al",
                    "{C:money}venderse{} {C:red}destruye{} todas",
                    "las cartas {C:attention}en mano{}",
                    "{C:inactive}(Actualmente {C:attention}#1#{C:inactive}/#2#)",
                }
            },
            j_aij_jester_zombie = {
                name = "Zombi Bufón",
                text = {
                    "Reactiva todas las cartas {C:attention}anotadas{}",
                    "si una {C:attention}carta de juego{} ha sido",
                    "{C:red}destruida{} esta ronda",
                    "{C:inactive}#1#{}",
                }
            },
            j_aij_devil_deal = {
                name = "Pacto Diabólico",
                text = { 
                    "Gana {X:mult,C:white}X#1#{} Multi",
                    "cuando un {C:hearts}Corazón{}",
                    "es {C:attention}destruido",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi)",
                }
            },
            j_aij_totally_nuts = { 
                name = "Maní Enfermito",
                text = { 
                    "{C:attention}+#1#{} Ranuras de Consumibles,",
                    "es {C:attention}consumido{} cuando un",
                    "{C:attention}consumible{} es {C:money}vendido{}",
                } 
            },
            j_aij_mistake = {
                name = "Despiste",
                text = {
                    "Los Comodines {C:attention}Eternos{}",
                    "pueden ser {C:attention}vendidos{}",
                }
            },
            j_aij_banana_man = { 
                name = "Hombre Plátano", 
                text = { 
                    {
                        "{C:attention}Reactiva{} todos",
                        "los Comodines",
                    },
                    {
                        "Cada Comodín tiene una",
                        "prob. de {C:green}#1# en #2#{}",
                        "de ser {C:red}destruido{}",
                        "después de cada {C:blue}mano{}",
                    }
                } 
            },
            j_aij_entropy = { 
                name = "Entropía",
                text = { 
                    "Crea una {C:attention}Etiqueta de Caos{}",
                    "al {C:attention}omitir{} una Ciega",
                } 
            },
            j_aij_urchin = { 
                name = "Pilluelo", 
                text = { 
                    "Ganas {C:money}$#2#{} al final",
                    "de la ronda por cada ",
                    "{C:attention}Ciega{} omitida",
                    "{C:inactive}(Actualmente {C:money}$#1#{}{C:inactive}){}",
                } 
            },
            j_aij_funny_money = { 
                name = "Dinero Cómico", 
                text = { 
                    "Ganas {C:money}$#1#{} cuando",
                    "{C:attention}omites{} una Ciega",
                } },
            j_aij_witchfinder = { 
                name = "Cazador de Brujas", 
                text = { 
                    "Agrega {C:attention}#1#{} {C:tarot}Paquete Arcano{}",
                    "en cada la {C:money}Tienda{}",
                } 
            },
            j_aij_tract = { 
                name = "Tract", 
                text = { 
                    "{C:chips}+#1#{} Fichas por",
                    "{C:attention}Vale{} poseido",
                    "{C:inactive,s:0.8}(Actualmente {C:chips,s:0.8}+#2#{} {C:inactive,s:0.8}Fichas){}",
                } 
            },
            j_aij_stock_broker = { 
                name = "Corredor de Bolsa", 
                text = { 
                    "Multiplica el {C:money}interés{} por una",
                    "cantidad al azar entre",
                    "{C:attention}X#1#{} y {C:attention}X#2#" 
                } 
            },
            -- Page 13
            j_aij_omlette = { 
                name = "Tortilla", 
                text = { 
                    "Gana {C:money}$#1#{} de valor de venta cuando",
                    "una {C:blue}mano{} o {C:red}descarte{} es usado",
                } 
            },
            j_aij_comedy_of_errors = { 
                name = "Comedia de Errores", 
                text = { 
                    "Gana {C:money}$#1#{} al {C:red}descartar{}",
                    "{C:hearts}Corazones{}",
                } 
            },
            j_aij_fuzzy_joker = { 
                name = "Comodín Difuso",
                text = { 
                    "Redondea el {C:mult}Multi{} por encima",
                    "de la siguiente potencia de {C:attention}#1#{}" 
                } 
            },
            j_aij_taggart = { 
                name = "Taggart", 
                text = { 
                    "Crea {C:attention}#1# copia{} de las",
                    "{C:attention}Etiquetas{} adquiridas",
                    "{C:inactive}(Excepto Etiqueta Doble)"
                } 
            },
            j_aij_chitty = { 
                name = "Comodín Canjeable", 
                text = { 
                    "{C:attention}+#1#{} {C:attention}Vale{} disponible",
                    "en la {C:money}Tienda{}",
                } 
            },
            j_aij_whatsisname = { 
                name = '"¿Cómo se llama?"', 
                text = { 
                    "Los paquetes de",
                    "{C:attention}Adivina el Comodín{}",
                    "son más comunes"
                } 
            },
            j_aij_downing_street = { 
                name = "Downing Street", 
                text = { 
                    "Los {C:attention}10s{} anotados tienen una",
                    "prob. de {C:green}#1# en #2#{} de crear una ",
                    "{C:attention}Etiqueta{} al azar",
                } 
            },
            j_aij_aphantasia = { 
                name = "Afantasía", 
                text = { 
                    "Todas las cartas {C:attention}mejoradas{}",
                    "jugadas se vuelven {C:red}Caóticas{}" 
                } 
            },
            j_aij_vitruvian_joker = {
                name = "Comodín de Vitruvio",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si tienes",
                    "exactamente {C:attention}5{} Comodines"
                }
            },
            j_aij_fortune_cookie = { 
                name = "Galleta de la Fortuna", 
                text = { 
                    "Crea una carta del {C:tarot}Tarot{}",
                    "al abrir {C:attention}Paquetes Potenciadores{}",
                    "se consume después de {C:attention}#1#{} paquetes",
                    "{C:inactive}(Debe haber espacio){}",
                } 
            },
            j_aij_tilty_joker = { 
                name = "Comodín Inclinado", 
                text = { 
                    "Las cartas {C:attention}anotadas{} otorgan",
                    "{C:attention}X#1#{} veces sus {C:chips}Fichas{} base",
                } 
            },
            j_aij_opening_move = { 
                name = "Jugada Inicial", 
                text = { 
                    {
                        "Gana {X:mult,C:white}X#1#{} Multi por cada",
                        "carta {C:attention}anotada{} en la",
                        "{C:attention}primera mano{} de la ronda",
                        "{C:inactive,s:0.8}Se reinicia al final de la ronda{}",
                        "{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
                    },
                    {
                        "La {C:attention}primera mano{}",
                        "no anota",
                    },
                } 
            },
            j_aij_bartender = { 
                name = "Bartender", 
                text = { 
                    "Los {C:attention}Consumibles{} pueden tener",
                    "edición {C:dark_edition}Laminada{}, {C:dark_edition}Holográfica{}",
                    "o {C:dark_edition}Policroma{}" 
                } 
            },
            j_aij_mahoney = { 
                name = "Mahoney", 
                text = { 
                    "Pro. de {C:green}#1# en #2#{} de",
                    "crear una {C:attention}Etiqueta de Vale{}",
                    "al {C:attention}omitir{} una Ciega",
                } 
            },
            j_aij_le_fils_de_banane = { 
                name = "Le fils de Banane", 
                text = { 
                    "Las cartas de {C:attention}figura{} anotadas",
                    "otorgan {C:mult}+#3#{} Multi pero tienen una",
                    "prob. de {C:green}#1# en #2#{} de {C:red}destruirse{}",
                } 
            },
            -- Page 14
            j_aij_tetrominoker = { 
                name = "Tetrominoker", 
                text = { 
                    "Los {C:attention}4s{} anotados tienen",
                    "una prob. de {C:green}#1# en #2#{}",
                    "de crear una {C:attention}copia{}",
                    "de sí mismos",
                } 
            },
            j_aij_mr_catfish = { 
                name = "Sr. Bagre", 
                text = { 
                    "Gana {C:money}$#1#{} cada {C:attention}#2#{C:inactive} [#3#]{}",
                    "cartas {C:red}descartadas{}"
                } 
            },
            j_aij_angel_number = { 
                name = "Número Angelical", 
                text = { 
                    "Aumenta todas las",
                    "{C:green}probabilidades{} en {C:attention}+#1#{}",
                    "por cada {C:attention}7{} anotado",
                    "{C:inactive,s:0.8}(Se Reinicia en cada mano){}",
                } 
            },
            j_aij_doctors_orders = { 
                name = "Órdenes del Doctor", 
                text = { 
                    "{X:mult,C:white}X#1#{} Multi por cada {C:attention}9{} en la mano",
                    "jugada, se {C:red}autodestruye{} si no",
                    "se jugaron {C:attention}9s{}"
                } 
            },
            j_aij_blue_eyes_white_joker = { 
                name = "Comodín Blanco de Ojos Azules", 
                text = { 
                    "Si la {C:attention}última mano{} de la ronda",
                    "es exactamente {C:attention}1{} carta,",
                    "gana {C:attention}+#1#{} reactivación",
                } 
            },
            j_aij_lucina = { 
                name = "Bufón Fiestero", 
                text = { 
                    "Cuando se {C:attention}selecciona{} una Ciega,",
                    "{C:red}destruye{} el Comodín de la {C:attention}izquierda",
                    "y otorga una {C:dark_edition}Edición{} al azar",
                    "al Comodín de la {C:attention}derecha",
                } 
            },
            j_aij_circuit_diagram = { 
                name = "Diagrama de Circuito", 
                text = { 
                    "Las cartas {C:attention}Cargadas{}",
                    "siempre se sacan",
                    "primero",
                } 
            },
            j_aij_paracosm = { 
                name = "Paracosmos", 
                text = { 
                    "Sube el {C:planet}nivel{} de la",
                    "{C:attention}mano de póker{} más jugada",
                    "al omitir una {C:attention}Ciega{}",
                    "{C:inactive}(Actualmente #1#)"
                } 
            },
            j_aij_mocap = { 
                name = "Mocap", 
                text = { 
                    {
                        "Al {C:money}vender{} un Comodines,",
                        "obtienes un {C:attention}Comodín{}",
                        "de una rareza inferior"
                    }, 
                    {
                        "{C:legendary}Legendario{} -> {C:rare}Raro{}",
                        "{C:rare}Raro{} -> {C:uncommon}Inusual{}",
                        "{C:uncommon}Inusual{} -> {C:common}Común{}"
                    }
                } 
            },
            j_aij_stagehand = { 
                name = "Tramoyista", 
                text = { 
                    "Todos los {C:attention}Comodines{}",
                    "otorgan {X:mult,C:white}X#1#{} Multi"
                } 
            },
            j_aij_electric_snow = { 
                name = "Ruido Blanco", 
                text = { 
                    "La ronda termina {C:attention}cuando{} te",
                    "quedas sin {C:blue}manos{}",
                } 
            },
            j_aij_colour_test = { 
                name = "Prueba de Color", 
                text = { 
                    "Otorga edición {C:attention}Policroma{} a la",
                    "primera carta anotada en la {C:attention}última{}",
                    "{C:attention}mano{} de la ronda"
                } 
            },
            j_aij_interstate = { 
                name = "Interestatal", 
                text = { 
                    "Ganas {C:blue}+#1#{} Manos esta ronda si la",
                    "{C:attention}primera{} mano de la ronda",
                    "contiene una {C:attention}Escalera{}"
                } 
            },
            j_aij_test_card = { 
                name = "Carta de Ajuste", 
                text = { 
                    "Las {C:attention}Ediciones{} en mano",
                    "activan sus efectos"
                } 
            },
            j_aij_chips_n_dip = {
                name = "Papas con Salsa",
                text = {
                    "{X:chips,C:white}X#1#{} Fichas, pierde {X:chips,C:white}X#2#{}",
                    "Fichas al final de la {C:attention}ronda"
                }
            },
            -- Page 15
            j_aij_bingo_card = { 
                name = "Cartón de Bingo", 
                text = { 
                    "Las {C:attention}Cartas de la Suerte{}",
                    "anotadas tienen una prob. de",
                    "{C:green}#1# en #2#{} de otorgar {X:mult,C:white}X#5#{} Multi y una",
                    "prob. de {C:green}#3# en #4#{} de {C:attention}reactivarse{}"
                } 
            },
            j_aij_homemade_comic = { 
                name = "Cómic Casero", 
                text = { 
                    "Las {C:attention}Cartas Energizadas{}",
                    "anotadas otorgan {X:mult,C:white}X#1#{} Multi",
                } 
            },
            j_aij_fish_fingers = { 
                name = "Dedos de Pescado", 
                text = { 
                    "{C:blue}+#1#{} Manos",
                    "se reduce en {C:red}-#2#{}",
                    "al derrotar una {C:attention}Ciega{}"
                } 
            },
            j_aij_candy_floss = { 
                name = "Algodón de Azúcar", 
                text = { 
                    "{C:aij_plasma}Equilibra{} el {C:attention}#1#%{} de las",
                    "{C:chips}Fichas{} y {C:mult}Multi{}, se reduce",
                    "un {C:attention}#2#%{} al final de la ronda"
                } 
            },
            j_aij_stargazy_pie = { 
                name = "Pie de Atún?", 
                text = { 
                    "Reactiva las siguientes {C:attention}#1#{}",
                    "cartas de {C:planet}Planeta{}" ,
                } 
            },
            j_aij_gameshow = { 
                name = "La Ruleta de la suerte", 
                text = { 
                    {
                        "Hay una prob. de {C:green}#1# en #2#{} de",
                        "otorgar edición {C:dark_edition}Laminada{},",
                        "{C:dark_edition}Holográfica{} o {C:dark_edition}Policroma{} a un",
                        "{C:attention}Comodín{} al selccionar la {C:attention}ciega{}",
                    },
                    { 
                        "Pierdes {C:money}$#3#{} sin importar",
                        "el resultado",
                    } ,
                },
            },
            j_aij_bonus_pay = { 
                name = "Pago Extra",
                text = { 
                    "Ganas {C:money}$#1#{}",
                    "al anotar una",
                    "{C:attention}Carta adicional{}",
                } 
            },
            j_aij_illuminated_joker = { 
                name = "Comodín Iluminado", 
                text = { 
                    "Las Etiquetas de {C:money}Oro{}",
                    "aparecen con más",
                    "{C:attention}frecuencia{}",
                } 
            },
            j_aij_bonus_bob = { 
                name = "Adrián Adicional", 
                text = { 
                    "Las {C:attention}Cartas adicionales{}",
                    "otorgan {X:chips,C:white}X#1#{} Fichas",
                    "al anotar",
                } 
            },
            j_aij_bonus_round = { 
                name = "Ronda Adicional", 
                text = { 
                    "{C:attention}Reactiva{} todas las",
                    "{C:attention}Cartas adicionales{}",
                    "anotadas",
            } 
            },
            j_aij_astrologer = { 
                name = "Astrologo", 
                text = { 
                    {
                        "Slecciona {C:attention}+#1#{} carta adicional",
                        "en los Paquetes {C:planet}Celestiales{} ",
                    },
                    {
                        "Las cartas de {C:planet}Planeta{} se",
                        "reemplazan por su variante",
                        "de {C:mult}Multi{} en apuestas {C:attention}impares{}",
                        "y su variante de {C:chips}Fichas{}",
                        "en apuestas {C:attention}pares{}",
                    },
                } 
            },
            j_aij_planetarium = { 
                name = "Planetario", 
                text = { 
                    {
                        "Las cartas de {C:planet}Planeta{} de tipo {C:chips}Fichas{}",
                        "tu área de {C:attention}consumibles{}",
                        "otorgan {C:chips}+#1#{} Fichas",
                        "para su {C:attention}mano de póker{}" 
                    },
                    {
                        "Las cartas de {C:planet}Planeta{} de tipo {C:mult}Multi{} en",
                        "tu área de {C:attention}consumibles{}",
                        "otorgan {C:mult}+#2#{} Multi",
                        "para su {C:attention}mano de póker{}" 
                    },
                } 
            },
            j_aij_negative_space = { 
                name = "Espacio Negativo", 
                text = { 
                    "{C:attention}+#1#{} al Tamaño de mano por cada",
                    "Comodín {C:dark_edition}Negativo{} que poseas",
                    "{C:inactive,s:0.8}(Actualmente {C:attention,s:0.8}+#2#{} {C:inactive,s:0.8}Tamaño de Mano){}",
                    "{C:inactive,s:0.8}(Máx. {C:attention,s:0.8}+#3#{}{C:inactive,s:0.8})"
                } 
            },
            j_aij_sky_trees = { 
                name = "Árboles del Cielo", 
                text = { 
                    "Los {C:attention}Sellos Azules{} otorgan cartas de",
                    "{C:planet}Planeta{} de tipo {C:mult}Multi{} y {C:chips}Fichas{} en lugar",
                    "de cartas de {C:planet}Planeta{} comunes",
                } 
            },
            j_aij_twisted_pair = { 
                name = "Par Retorcido", 
                text = { 
                    "Si la mano es un {C:attention}Par{}, cada",
                    "carta gana un {C:attention}parche{} del palo",
                    "de la {C:attention}otra carta{}" 
                } 
            },
            -- Page 16
            j_aij_the_grim_joker = { 
                name = "El Comodín Sombrío", 
                text = { 
                    "Los {C:attention}Consumibles{} creados por",
                    "Sellos {C:planet}Azules{} o {C:tarot}Morados{} tienen",
                    "una prob. de {C:green}#1# en #2#{} de ser",
                    "{C:dark_edition}Negativos"
                } 
            },
            j_aij_lexicon = { 
                name = "Léxico", 
                text = { 
                    "Su {C:mult}Multi{} es igual a la",
                    "{C:attention}suma{} de todos los dígitos",
                    "en los valores de tus",
                    "{C:attention}Comodines{}" ,
                    "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
                } 
            },
            j_aij_arngren = { 
                name = "Arngren", 
                text = { 
                    "{C:attention}+#1#{} Ranura de carta",
                    "{C:attention}+#1#{} Paquete potenciador",
                    "{C:attention}+#1#{} Ranura de Vale",
                } 
            },
            j_aij_blacklist = { 
                name = "Lista Negra", 
                text = { 
                    "Los comodines {C:money}vendidos{}",
                    "no reaparecen.",
                    "Lista Negra:",
                } 
            },
            j_aij_croupier = { 
                name = "Crupier", 
                text = { 
                    "Ganas {C:money}$#1#{} si la puntuación",
                    "final es más del {C:attention}doble{}",
                    "de lo requerido",
                } 
            },
            j_aij_headstone = { 
                name = "Lápida", 
                text = { 
                    "Las {C:attention}Cartas de Figura{}",
                    "están al {C:red}fondo{} de la baraja" ,
                } 
            },
            j_aij_chef = { 
                name = "Chef", 
                text = {
                    {
                        "Los Comodines {C:attention}Perecederos{}",
                        "sin edición se vuelven",
                        "{C:dark_edition}Negativos{}",
                    },
                    {
                        "Los Comodines {C:attention}Perecederos{}",
                        "con {C:attention}Ediciones{}",
                        "son más {C:money}baratos{}" 
                    }
                } 
            },
            j_aij_remina = { 
                name = "Remina", 
                text = { 
                    "Al seleccionar la {C:attention}Ciega Pequeña{} o {C:attention}Grande{},",
                    "{C:red}destruye{} todas tus Cartas de {C:planet}Planeta{}",
                    "obtiene sus {C:chips}Fichas{} y {C:mult}Multi{}",
                    "{C:inactive,s:0.8}(Actualmente {C:chips,s:0.8}+#2#{} {C:inactive,s:0.8}Fichas, {C:mult,s:0.8}+#1#{C:inactive,s:0.8} Multi)"
                } 
            },
            j_aij_sherrif = { 
                name = "Comodín Sheriff",
                text = { 
                    "La primera {C:attention}Carta Versatíl{}",
                    "anotada otorga {C:money}$#1#{}",
                } 
            },
            j_aij_alien_joker = { 
                name = "Nave Alienígena", 
                text = { 
                    {
                        "{C:attention}1{} carta se selecciona",
                        "{C:attention}forzosamente{}",
                    },
                    {
                        "La carta {C:attention}Forzada{} otorga",
                        "{X:mult,C:white}X#1#{} Multi al anotar" 
                    }
                } 
            },
            j_aij_nobody = { 
                name = "Nadie", 
                text = { "{C:inactive}¿No hace nada...?", } 
            },
            j_aij_elf = { 
                name = "Elfo", 
                text = { 
                    "Después de omitir {C:attention}#2#{} Ciegas,",
                    "{C:money}vende{} este Comodín",
                    "para crear {C:attention}#3#{} Etiquetas",
                    "de {C:attention}Inversión{}",
                    "{C:inactive}(Actualmente {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_fall_of_count_chaligny = {
                name = "Caída del Conde Chaligny",
                text = { 
                    "La puntuación {C:attention}requerida{}",
                    "de todas las {C:attention}Ciegas{}",
                    "es la baja de la {C:attention}Apuesta{}",
                } 
            },
            j_aij_coulrorachne = { 
                name = "Coulrorachne", 
                text = { 
                    "Gana {C:mult}+#1#{} Multi cada",
                    "{C:attention}#4# {C:inactive}[#3#]{} {C:attention}Ochos{} anotados",
                    "{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)" 
                } 
            },
            j_aij_bad_sun = { 
                name = "El Sol Malo", 
                text = { 
                    "Si la mano {C:attention}jugada{}",
                    "contiene {C:attention}#1#{} o más {C:hearts}Corazones{},",
                    "destruye una carta jugada" 
                } 
            },
            -- Page 17
            j_aij_evil_joker = { 
                name = "Comodín Malvado", 
                text = { 
                    "{X:mult,C:white}X#1#{} Multi, destruye un",
                    "Comodín {C:attention}al azar{} cuando",
                    "se {C:attention}obtiene" 
                } 
            },
            j_aij_sanguine_joker = { 
                name = "Comodín Sanguíneo", 
                text = { 
                    "Los {C:hearts}Corazones{} tienen una",
                    "prob. de {C:green}#1# en #2#{} de crear",
                    "una {C:attention}Etiqueta{} al azar",
                    "al anotar",
                } 
            },
            j_aij_choleric_joker = { 
                name = "Comodín Colérico", 
                text = { 
                    "Los {C:diamonds}Diamantes{} tienen una",
                    "prob. de {C:green}#1# en #2#{} de crear",
                    "una carta de {C:tarot}Tarot{}",
                    "al anotar",
                    "{C:inactive}(Debe haber espacio){}",
                } 
            },
            j_aij_melancholic_joker = { 
                name = "Comodín Melancólico", 
                text = { 
                    "Las {C:spades}Espadas{} tienen una",
                    "prob. de {C:green}#1# en #2#{} de crear",
                    "una carta {C:spectral}Espectral{}",
                    "al anotar",
                    "{C:inactive}(Debe haber espacio){}",
                } 
            },
            j_aij_phlegmatic_joker = { 
                name = "Comodín Flemático", 
                text = { 
                    "Los {C:clubs}Tréboles{} tienen una",
                    "prob. de {C:green}#1# en #2#{} de crear",
                    "una carta de {C:planet}Planeta{} para",
                    "la {C:attention}mano jugada{} al anotar",
                    "{C:inactive}(Debe haber espacio){}",
                } 
            },
            j_aij_majordomo = { 
                name = "Mayordomo", 
                text = { 
                    {
                        "Todos los {C:attention}Comodines{} en",
                        "la {C:money}tienda{} que cuestan",
                        "más de {C:money}$#1#{} tienen el",
                        "sticker de {C:money}Alquiler{}",
                    },
                    {
                        "El {C:attention}Alquiler{} cuesta",
                        "{C:money}$2{} menos"
                    }
                }
            },
            j_aij_skinsuit = { 
                name = 'Traje de "Cuero"', 
                text = { 
                    "Cuando una carta es {C:red}destruida{},",
                    "parchea su {C:attention}palo{} en una {C:attention}carta",
                    "al azar en mano" 
                } 
            },
            j_aij_tool = { 
                name = "Herramienta", 
                text = {
                    "Las cartas que",
                    "cambian de {C:attention}palo{} ganan",
                    "permanentemente {C:mult}+#1#{} Multi",
                } 
            },
            j_aij_youve_got_mail = { 
                name = "Tienes un Email", 
                text = {
                    {
                        "Si {C:red}No{} es {C:dark_edition}Negativo{} cuando se",
                        "selecciona la {C:attention}Ciega{}, crea una",
                        "{C:attention}copia{} {C:dark_edition}Negativa{} de este Comodín",
                        "con valor de venta {C:money}$0{}"
                    },
                    {
                        "{V:1}{B:3,V:2}#1##2#{}{V:1}#3#",
                    }
                } 
            },
            j_aij_cut_here = { 
                name = "Corte Aquí", 
                text = {
                    "Cuando este Comodín es",
                    "{C:red}destruido{}, crea un",
                    "Comodín {C:red}Raro{} al azar"
                } 
            },
            j_aij_a_young_hamlet = { 
                name = "Un Joven Hamlet", 
                text = {
                    "Gana {C:mult}+#2#{} Multi cada",
                    "{C:attention}#3#{C:inactive} [#4#]{} cartas {C:red}descartadas{}",
                    "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
                } 
            },
            j_aij_fleshgait = { 
                name = "Fleshgait", 
                text = {
                    "Las cartas {C:attention}anotadas{} sin",
                    "un {C:attention}parche{} obtienen",
                    "un {C:attention}parche{} al azar"
                } 
            },
            j_aij_firework = { 
                name = "Fuegos Artificiales", 
                text = {
                    "La primera carta de {C:attention}Multi{}",
                    "jugada otorga {X:mult,C:white}X#1#{} Multi",
                    "al anotar",
                } 
            },
            j_aij_bad_guy = { 
                name = "Comodín Malote", 
                text = {
                    "Otorga {C:attention}Laminado{} a",
                    "una carta {C:attention}en mano{} al",
                    "derrotar la {C:attention}Ciega Jefe{}"
                } 
            },
            j_aij_stage_production = { 
                name = "Producción Escénica", 
                text = {
                    "{B:1,C:white,s:0.8}Habilidad Activable",
                    "Una vez por ronda, {C:attention}reemplaza{}",
                    "temporalmente el Comodín a su",
                    "derecha hasta seleccionar la",
                    "siguiente ciega",
                    "{C:inactive}#1#"
                } 
            },
            -- Page 18
            j_aij_pink_slip = { 
                name = "Carta de Renuncia", 
                text = {
                    "{C:attention}+#1#{} al Límite de",
                    "Selección al {C:red}Descartar"
                } 
            },
            j_aij_chromatist = { 
                name = "Cromatista", 
                text = {
                    "{X:mult,C:white}X#1#{} Multi cuando se",
                    "activa una edición",
                    "{C:attention}Policroma{}"
                } 
            },
            j_aij_death_of_a_salesman = { 
                name = "Dead of a Salesman", 
                text = {
                    "La {C:money}Tienda{} puede tener {C:attention}#1#{} {C:attention}Etiqueta{}",
                    "de {C:red}Caos{} o {C:red}Anarquía{}",
                } 
            },
            j_aij_graffiti = { 
                name = "Graffiti", 
                text = {
                    {
                        '{B:1,C:white,s:0.8}Habilidad Activable',
                        'Paga {C:money}$#1#{} para recibir una',
                        '{C:attention}Etiqueta{} al azar'
                    },
                    {
                        'El {C:money}Coste{} aumenta en {C:red}X#2#',
                        'tras cada uso. Se reinicia al',
                        'derrotar una {C:attention}Ciega Jefe{}'
                    }
                } 
            },
            j_aij_parking_space = { 
                name = "Plaza de Aparcamiento", 
                text = {
                    "{X:mult,C:white}X#1#{} Multi si este Comodín",
                    "está en la {C:attention}Ranura de Comodín #2#{}",
                    "{C:inactive}(La ranura cambia al final de la ronda)"
                } 
            },
            j_aij_historian = {
                name = "Historiador", 
                text = {
                    "Añade {C:mult}Multi{} igual al",
                    "{C:attention}triple{} del {C:money}Valor de Venta{}",
                    "del último Comodín vendido",
                    "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
                } 
            },
            j_aij_baddata = {
                name = "BAD_DATA", 
                text = { } -- It has a random description, changes effect every round
            },
            j_aij_office_assistant = {
                name = "Clippy", 
                text = {
                    "{B:1,C:white,s:0.8}Habilidad Activable",
                    'Remueve {C:attention}Perecedero{} o {C:attention}Alquiler{}',
                    'del {C:attention}Comodín{} a la derecha'
                } 
            },
            j_aij_cavalier = {
                name = "Caballería", 
                text = {
                    "{C:mult}+#2#{} Multi por",
                    "cada {C:blue}mano{} anotada",
                    "previamente esta {C:attention}ronda{}",
                    "{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)"
                } 
            },
            j_aij_elder = {
                name = "El Antiguo", 
                text = {
                    'Copia el efecto del',
                    '{C:attention}Comodín{} que has',
                    "tenido por {C:attention}más tiempo{}",
                    "{C:inactive}(Actualmente #1#)"
                } 
            },
            -- Legendary Jokers
            j_aij_pompey = {
                name = "Pompey",
                text = {
                    "{X:mult,C:white}X#1#{} Multi por {C:attention}Comodín{}",
                    "a la {C:attention}derecha{},",
                    "incluyendo a Pompey",
                    "{C:inactive}(Actualmente{} {X:mult,C:white}X#2#{}{C:inactive} Multi){}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_touchstone = {
                name = "Touchstone",
                text = {
                    "{C:attention}+#1#{} tamaño de mano",
                    "Revela las siguientes {C:attention}#2#{}",
                    "cartas de tu mazo",
                },
                unlock = { 
                    "?????" 
                }
            },
            j_aij_fortunato = {
                name = "Fortunato",
                text = {
                    {
                        "Convierte todas las cartas",
                        "{C:attention}jugadas{} sin {C:attention}anotar{}",
                        "en {C:attention}Cartas de Piedra{}",
                    },
                    {
                        "Gana {X:mult,C:white}X#2#{} Multi al",
                        "anotar {C:attention}Cartas de Piedra{}",
                        "{C:inactive}(Actualmente{} {X:mult,C:white}X#1#{} {C:inactive}Multi){}",
                    }
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pellesini = { 
                name = "Pellesini", 
                text = { 
                    "Cuando cualquier Comodín",
                    "es {C:red}destruido{}, crea una",
                    "copia {C:attention}exacta{}",
					"{C:inactive}(Incluyéndose a sí mismo)"
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_nedda = {
                name = "Nedda",
                text = {
                    "Las {C:attention}Reinas{} en mano",
                    "otorgan {X:mult,C:white}X#1#{} Multi"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_silvio = {
                name = "Silvio",
                text = {
                    "Reactiva todos los {C:attention}Reyes{}",
                    "una vez por cada {C:attention}Reina{}",
                    "en mano",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_biancolelli = { 
                name = "Biancolelli", 
                text = { 
                    "{C:aij_plasma}Equilibra{} las {C:chips}Fichas{} y {C:mult}Multi{}", 
                    "después de que los",
                    "{C:attention}Comodines{} se activan",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_toto = { 
                name = "Toto", 
                text = { 
                    "Crea {C:attention}#1#{} copias de",
                    "cada {C:attention}Etiqueta{} adquirida",
                    "{C:inactive}(Excepto Etiqueta Doble)" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_eulenspiegel = { 
                name = "Eulenspiegel", 
                text = { 
                    "Al derrotar una {C:attention}Ciega Jefe{},",
                    "retrocede {C:attention}#1#{} Apuesta y",
                    "pierde {X:mult,C:white}X#2#{} Multi",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#3#{C:inactive} Multi)"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_nichola = {
                name = "Nichola",
                text = {
                    "Al inicio de la ronda, añade",
                    "una {C:attention}Reina{} a tu mano",
                    "con una {C:attention}Mejora{}, {C:dark_edition}Edición{}",
                    "y {C:attention}Sello{} al azar"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_colquhoun = { 
                name = "Colquhoun", 
                text = { 
                    "Todas las cartas ganan {C:money}$#1#{}",
                    "al {C:attention}anotarse{}, aumenta",
                    "en {C:money}$#2#{} cuando se",
                    "derrota la {C:attention}Ciega Jefe{}"
                }, 
                unlock = { 
                    "?????"
                } 
            },
            j_aij_dor = { 
                name = "D'or", 
                text = { 
                    "{X:dark_edition,C:white}#1#{} Multi en la {C:attention}última{}",
                    "mano de la {C:attention}ronda" 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_archy = { 
                name = "Archy", 
                text = { 
                    "Todas las {C:attention}cartas{} iniciales y",
                    "{C:attention}Paquetes Potenciadores{} en",
                    "la {C:money}Tienda{} son gratis" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_sommers = { 
                name = "Sommers", 
                text = { 
                    "Sube de {C:planet}nivel{} todas",
                    "las manos jugadas" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_pace = {
                name = "Pace",
                text = {
                    {
                        "Todas las {C:red}Rarezas{} de Comodines",
                        "tienen la {C:green}misma{} probabilidad",
                        "de aparecer en la {C:money}Tienda",
                        "{C:inactive}(excepto Legendarios)"
                    },
                    {
                        "Todos los Comodines cuestan {C:money}$#1#"
                    }
                },
                unlock = { "?????" }
            },
            j_aij_thomazina = {
                name = "Thomazina",
                text = {
                    "Las cartas {C:attention}enumeradas{} anotadas",
                    "otorgan {C:chips}+#1#{} Fichas. Aumenta en",
                    "{C:chips}+#2#{} Fichas cuando se anota",
                    "una carta {C:attention}enumeradas{}"
                },
                unlock = { "?????" } },
            j_aij_guillaume = { 
                name = "Guillaume", 
                text = { 
                    "Si la {C:attention}Ciega Jefe{} es",
                    "derrotada con menos de",
                    "{C:attention}5{} Comodines, este Comodín",
                    "gana {C:dark_edition}+#2#{} Ranura de Comodín",
                    "{C:inactive}(Actualmente {C:dark_edition}+#1#{C:inactive} Ranuras){}",
                },
                unlock = { "?????" } 
            },
            j_aij_tarlton = { 
                name = "Tarlton", 
                text = { 
                    "Otorga {C:chips}+Fichas{} igual al",
                    "{C:attention}total{} de {C:chips}Fichas{} de la {C:attention}anterior{}",
                    "mano jugada esta ronda",
                    "{C:inactive}(Actualmente {C:chips}+#1#{} {C:inactive}Fichas){}",
                }, 
                unlock = { "?????" }
            },
            j_aij_taillefer = { 
                name = "Taillefer", 
                text = { 
                    "Gana {X:mult,C:white}X#2#{} Multi por {C:blue}mano{} ",
                    "jugada, se {C:red}autodestruye{}",
                    "tras derrotar {C:attention}#3#{}",
                    "{C:attention}Ciegas Jefe{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi, {C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive}){}",
                }, 
                unlock = { "?????" } 
            },
            j_aij_killigrew = {
                name = "Killigrew",
                text = {
                    "{X:mult,C:white}X#1#{} Multi por cada",
                    "{C:attention}Vale{} en poseción",
                    "{C:inactive}(Actualmente{} {X:mult,C:white}X#2#{} {C:inactive}Multi){}",
                },
                unlock = { "?????" }
            },
            j_aij_zerco = {
                name = "Zerco",
                text = {
                    "Aplica {C:dark_edition}Negativo{} a la {C:attention}primera{}",
                    "carta {C:attention}anotada{} cada {C:attention}ronda{}",
                    "{C:inactive}(si no tiene Edición)",
                },
                unlock = { "?????" } },
            j_aij_yu_sze = { 
                name = "Yu Sze", 
                text = { 
                    "Los Comodines sin {C:dark_edition}Edición{}",
                    "otorgan {X:mult,C:white}X#1#{} Multi" ,
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_angoulevent = { 
                name = "Angoulevent", 
                text = { 
                    "{C:attention}Reactiva{} las",
                    "cartas anotadas",
                    "{C:attention}#1#{} veces adicionales",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_bluet = { 
                name = "Bluet", 
                text = { 
                    "Al seleccionar la {C:attention}Ciega{},",
                    "crea una carta {C:spectral}Espectral{}",
                    "{C:dark_edition}Negativa{}",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_bebe = {
                name = "Bébé",
                text = {
                    "{C:blue}+#1#{} Manos",
                },
                unlock = { "?????" } },
            j_aij_pipine = { 
                name = "Pipine", 
                text = { 
                    "{C:red}+#1#{} descartes",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_komar = { 
                name = "Komar", 
                text = { 
                    "Las cartas {C:attention}anotadas{}",
                    "obtienen {C:chips}Fichas{} igual",
                    "al {C:chips}valor{} base de todas",
                    "las {C:attention}cartas{} jugadas",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_lavatch = {
                name = "Lavatch",
                text = {
                    "Los {C:clubs}Tréboles{} anotados",
                    "otorgan {X:mult,C:white}X#1#{} Multi.",
                    "Aumenta en {X:mult,C:white}X#2#{} Multi",
                    "cuando anotas un {C:clubs}Trébol{}"
                },
                unlock = { "?????" } },
            j_aij_martellino = {
                name = "Martellino",
                text = {
                    "Después de {C:attention}#2#{} rondas, {C:money}vende{}",
                    "este Comodín para crear",
                    "cualquier {C:attention}Comodín{} de tu {C:attention}colección",
                    "{C:inactive}(Actualmente {C:attention}#1#{}{C:inactive}/#2#){}",
                },
                unlock = { "?????" }
            },
            j_aij_fantasio = { 
                name = "Fantasio", 
                text = { 
                    "Todas las cartas",
                    "como se consideran",
                    "{C:attention}todos los palos{}",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_dongtong = {
                name = "Dongtong",
                text = {
                    "{C:green}Duplica{} la mayoría",
                    "de potencia de los",
                    "{C:attention}Comodines{}",
                },
                unlock = { "?????" }
            },
            j_aij_naiteh = {
                name = "Nai-Teh",
                text = {
                    "Gana {C:attention}+#2#{} tamaño de",
                    "mano al derrotar",
                    "la {C:attention}Ciega Jefe{}",
                    "{C:inactive,s:0.8}(Actualmente {C:attention,s:0.8}+#1#{C:inactive,s:0.8} tamaño de mano)"
                },
                unlock = { "?????" }
            },
            j_aij_talhak = {
                name = "Talhak",
                text = {
                    "Al derrotar la {C:attention}Ciega Jefe{},",
                    "elige {C:attention}cualquier{} carta {C:spectral}Espectral{}",
                    "no secreta para obtener",
                    "{C:inactive}(Debe tener espacio)"
                },
                unlock = { "?????" }
            },
            j_aij_bozo = {
                name = "Bozo",
                text = {
                    "Al derrotar la",
                    "{C:attention}Ciega Jefe{},",
                    "crea {C:attention}#1#{} Comodines",
                    "{C:dark_edition}Negativos{} al azar"
                },
                unlock = { "?????" }
            },
            j_aij_thalia = {
                name = "Thalia",
                text = {
                    "Si tu primer {C:red}descarte{}",
                    "contiene exactamente {C:attention}1{} carta,",
                    "esta gana permanentemente",
                    "{C:attention}+#1#{} reactivación"

                },
                unlock = { "?????" }
            },
        },
        Planet = {
            c_aij_vulcanoid = {
                name = "Vulcanoid",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_zoozve = {
                name = "Zoozve",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_luna = {
                name = "Luna",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_phobos = {
                name = "Phobos",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_europa = {
                name = "Europa",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_titan = {
                name = "Titan",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_umbriel = {
                name = "Umbriel",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_triton = {
                name = "Triton",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_nix = {
                name = "Nix",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_planet_nine = {
                name = "Planet Nine",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_pallas = {
                name = "Pallas",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_dysnomia = {
                name = "Dysnomia",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Mult",
                }
            },
            c_aij_phaethon = {
                name = "Phaethon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_kamooalewa = {
                name = "Kamooalewa",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_deimos = {
                name = "Deimos",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_callisto = {
                name = "Callisto",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_iapetus = {
                name = "Iapetus",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_oberon = {
                name = "Oberon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_proteus = {
                name = "Proteus",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_charon = {
                name = "Charon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_nibiru = {
                name = "Nibiru",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_kuiper = {
                name = "Kuiper",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Chips",
                }
            },
            c_aij_rogue = {
                name = "Planeta errante",
                text = {
                    'Aumenta de nivel {C:attention}todas{}',
                    'las {C:attention}manos{} mencionadas',
                    'en tus {C:attention}Comodines'
                }
            },
            c_aij_dark_star = {
                name = "Estrella Oscura",
                text = {
                    'Aumenta de nivel {C:attention}todas{}',
                    'las {C:attention}manos{} que no',
                    "hayas {C:attention}jugado{}"
                }
            },
            c_aij_sol = {
                name = "Sol",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#4#{} Multi y",
                    "{C:chips}+#3#{} Fcihas",
                }
            },
            c_aij_paper_weywot = {
                name = "Weywot",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Multii",
                }
            },
            c_aij_paper_namaka = {
                name = "Namaka",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Multi",
                }
            },
            c_aij_paper_ilmare = {
                name = "Ilmare",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Multi",
                }
            },
            c_aij_paper_salacia = {
                name = "Salacia",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Multi",
                }
            },
            c_aij_paper_ixion = {
                name = "Ixion",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_paper_hiiaka = {
                name = "Hiiaka",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_paper_varda = {
                name = "Varda",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_paper_mk2 = {
                name = "Mk2",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            }
        },
        Spectral = {
            c_aij_gravastar = {
                name = 'Gravastar',
                text = {
                    'Sube de {C:planet}nivel{} las',
                    '{C:chips}Fichas{} de todas las',
                    '{C:legendary,E:1}manos de póker'
                }
            },
            c_aij_pulsar = {
                name = 'Pulsar',
                text = {
                    'Sube de {C:planet}nivel{} el',
                    '{C:mult}Multi{} de todas las',
                    '{C:legendary,E:1}manos de póker'
                }
            },
            c_aij_shade = {
                name = 'Espectro',
                text = {
                    'Añade edición {C:dark_edition}Negativa{}',
                    'a {C:attention}1{} carta al azar',
                    'en mano'
                }
            },
            c_aij_trefle = {
                name = 'Trèfle',
                text = {
                    '{C:attention}Cambia{} 1 {C:attention}comodín{}',
                    'por otro al azar',
                    "{C:inactive,s:0.8}(No funciona con Eternos){}",
                }
            },
            c_aij_scopophobia = {
                name = 'Escopofobia',
                text = {
                    '{C:red}Destruye{} un {C:attention}Comodín{} al azar',
                    'y {C:attention}todas{} las cartas en mano',
                }
            },
            c_aij_reshape = {
                name = 'Reestructurar',
                text = {
                    'Transforma todos tus {C:attention}Comodines{} en',
                    'copias de uno de tus {C:attention}Comodines',
                    '{C:inactive,s:0.8}(Se mantienen ediciones y stickers)',
                }
                -- must rework
            },
            c_aij_palmistry = {
                name = 'Quiromancia',
                text = {
                    'Otorga {C:attention}mejoras{} al azar a',
                    'todas las cartas en mano',
                    '{C:red}-#1#{} al tamaño de mano',
                }
            },
            c_aij_gegenschein = {
                name = "Gegenschein",
                text = {
                    'El nivel es las {C:dark_edition}manos secretas{}',
                    'es igual a la {C:attention}cantidad{} de veces',
                    'que hayas {C:attention}jugado{} esa mano',
                }
            },
            c_aij_mirth = {
                name = 'Júbilo',
                text = {
                    'Añade un {V:1}#2#',
                    'a {C:attention}#1#{} carta seleccionada',
                }
            },
        },
        Tag = {
            tag_aij_glimmer = {
                name = 'Etqueta Reluciente',
                text = {
                    "El siguiente comodín de la",
                    "tienda es gratis y se vuelve",
                    "{C:dark_edition}Reluciente"
                }
            },
            tag_aij_silver = {
                name = 'Etqueta Plateada',
                text = {
                    "El siguiente comodín de la",
                    "tienda es gratis y se vuelve",
                    "{C:dark_edition}Plateado"
                }
            },
            tag_aij_stellar = {
                name = 'Etiqueta Estelar',
                text = {
                    "El siguiente comodín de la",
                    "tienda es gratis y se vuelve",
                    "{C:dark_edition}Estelar"
                }
            },
            tag_aij_aureate = {
                name = 'Etiqueta Áurea',
                text = {
                    "El siguiente comodín de la",
                    "tienda es gratis y se vuelve",
                    "{C:dark_edition}Áureo"
                }
            },
            tag_aij_soulbound = {
                name = 'Etiqueta Vinculada',
                text = {
                    'Crea un comodín {C:legendary}Legendario{}',
                    '{C:attention}Perecedero{}',
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            tag_aij_fortunate = {
                name = 'Etiqueta Afortunada',
                text = {
                    'Escoge una carta del {C:tarot}Tarot{}',
                    'para agregar a tus comsumibles',
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            tag_aij_overstuffed = {
                name = 'Etiqueta Hinchada',
                text = {
                    "El siguente {C:attention}Paquete Potenciador{}",
                    "contiene el doble de cartas",
                    "y elecciones disponibles",
                }
            },
            tag_aij_chaos = {
                name = 'Etiqueta del Caos',
                text = {
                    "Puede pasar {C:red}cualquier{} cosa"
                }
            },
            -- Gold Tags
            tag_aij_windfall = {
                name = 'Etiqueta de Bonanza',
                text = {
                    "{C:money}Triplica{} tu dinero"
                    -- TODO needs a max
                }
            },
            tag_aij_unusual = {
                name = 'Etiqueta poco usual',
                text = {
                    "La tienda tiene un",
                    "{C:uncommon}Comodín Inusual{} con",
                    "sus valores {C:attention}duplicados{}"
                }
            },
            tag_aij_recherche = {
                name = 'Etiqueta de Recherché',
                text = {
                    "La tienda tiene un",
                    "{C:rare}Comodín Raro{} con",
                    "sus valores {C:attention}duplicados{}"
                }
            },
            tag_aij_hermetic = {
                name = 'Etiqueta Hermética',
                text = {
                    'Escoge una carta {C:spectral}Espectral{}',
                    'para agregar a tus comsumibles',
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            tag_aij_dark_matter = {
                name = 'Etiqueta de Materia Oscura',
                text = {
                    'Otorga edición {C:dark_edition}Negativa{} a',
                    'uno de tus {C:attention}Comodines{}',
                }
            },
            tag_aij_crystal = {
                name = 'Etiqueta de Cristal',
                text = {
                    'Otorga edición {C:dark_edition}Laminada{} a',
                    'uno de tus {C:attention}comodines{} y a',
                    '{C:attention}#1#{} cartas en tu baraja'
                }
            },
            tag_aij_iridescent = {
                name = 'Etiqueta Iridicente',
                text = {
                    'Otorga edición {C:dark_edition}Holográfica{} a',
                    'uno de tus {C:attention}comodines{} y a',
                    '{C:attention}#1#{} cartas en tu baraja'
                }
            },
            tag_aij_omnichrome = {
                name = 'Etiqueta Omnicromática',
                text = {
                    'Otorga edición {C:dark_edition}Policroma{} a',
                    'uno de tus {C:attention}comodines{} y a',
                    '{C:attention}#2#{} cartas en tu baraja'
                }
            },
            tag_aij_circumplanetary = {
                name = 'Etiqueta Circumplanetaria',
                text = {
                    'Aumenta {C:attention}#1#{} niveles a',
                    "{C:attention}#2#",
                }
            },
            tag_aij_velocity = {
                name = 'Etiqueta de Velocidad',
                text = {
                    'Otorga {C:money}$#1#{}, menos {C:money}$#2#',
                    'por {C:attention}ronda',
                    '{C:inactive}(Otorgará {C:money}$#3#{C:inactive})'
                }
            },
            tag_aij_capital = {
                name = 'Etiqueta de Capital',
                text = {
                    'Ganas {C:money}$#1#{}',
                    'al derrotar la',
                    '{C:attention}Ciega Jefe'
                }
            },
            tag_aij_bierstiefel = {
                name = 'Etiqueta Bierstiefel',
                text = {
                    'Llena todas tus',
                    '{C:attention}ranuras de comodines{}',
                    'con comodines {C:common}Comunes{} o',
                    '{C:uncommon}Inusuales{}'
                }
            },
            tag_aij_ticket = {
                name = 'Etiqueta de Beneficios',
                text = {
                    'Redime un {C:attention}Vale{} al azar',
                    'y su versión {C:dark_edition}mejorada',
                }
            },
            tag_aij_galloping_domino = {
                name = 'Etiqueta Tragaperras',
                text = {
                    'Todas las {C:green}renovaciones{}',
                    'costarán {C:money}$#1#{} en la',
                    "próxima tienda"
                    -- TODO Needs a limit due to effectively quadratic
                    -- money scaling
                }
            },
            tag_aij_gioco = {
                name = 'Etiqueta Gioco',
                text = {
                    '{C:attention}Duplica{} el tamaño de mano',
                    'la siguiente ronda',
                }
            },
            tag_aij_stereoscopic = {
                name = 'Etiqueta Esteroscópica',
                text = {
                    'Otorga la versión {C:money}Dorada{}',
                    'de la próxima {C:attention}etiqueta{} obtenida',
                    '{s:0.8,C:attention}Etiqueta Doble{s:0.8} excluida',
                }
            },
            tag_aij_frugal = {
                name = 'Etiqueta Ahorrativa',
                text = {
                    'Todas las Cartas y',
                    'Paquetes Potenciadores',
                    'serán {C:green}gratis{} en la',
                    "próxima {C:money}tienda",
                }
            },
            tag_aij_dominus = {
                name = 'Etiqueta Dominus',
                text = {
                    'Debilita la {C:attention}Ciea Jefe{} y su',
                    'puntaución requerida es',
                    'la mínima de la apuesta'
                }
            },
            tag_aij_nonstandard = {
                name = 'Etiqueta poco estándar',
                text = {
                    'Crea {C:attention}2 copias{} de',
                    'una carta seleccionada',
                }
            },
            tag_aij_ignoramus = {
                name = 'Etiqueta Ignoramus',
                text = {
                    'Escoge {C:attention}cualquier{} comodín',
                    '{C:common}Común{} o {C:uncommon}Inusual{}',
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            tag_aij_occult = {
                name = 'Etiqueta Ocultista',
                text = {
                    'Crea {C:attention}3{} cartas del {C:tarot}Tarot{}',
                    'y {C:attention}2{} cartas {C:spectral}Espectrales{}',
                    "{C:dark_edition}Negativas"
                }
            },
            tag_aij_asteroid = {
                name = 'Etiqueta de Asteroides',
                text = {
                    'Otorga un Paquete {C:planet}Celestial{}',
                    'con un {C:dark_edition}Agujero Negro{},', 
                    '{C:dark_edition}Pulsar{} y {C:dark_edition}Gravastar{}',
                }
            },
            tag_aij_polydactyly = {
                name = 'Etiqueta Polidactica',
                text = {
                    'Otorga {C:blue}+1 mano{} por cada',
                    '{C:blue}mano{} que no hayas usado',
                    "en la siguiente ronda",
                    '{C:inactive}(Otorgará {C:blue}+#1#{C:inactive} manos)',
                }
            },
            tag_aij_landfill = {
                name = 'Etiqueta de Vertedero',
                text = {
                    'Otorga {C:money}$1{} por carta',
                    '{C:red}descartada{} durante el juego', 
                    '{C:inactive}(Otorga {C:money}$#1#{C:inactive})',
                }
            },
            tag_aij_cinema = {
                name = 'Etiqueta de Cinema',
                text = {
                    'Otorga edición {C:aij_silver}Plateada{} al',
                    'Comodín del {C:attention}extremo izquierdo{}',
                }
            },
            tag_aij_ventripotent = {
                name = 'Etiqueta Ventripotente',
                text = {
                    "El siguiente {C:attention}Paquete Potenciador{} que",
                    "abras contiene el doble de cartas",
                    "y elecciones ilimitadas"
                }
            },
            tag_aij_timelost = {
                name = 'Etiqueta de Almas Perdidas',
                text = {
                    'Ganas un paquete potenciador {C:purple}Adivina',
                    '{C:purple}el Comodín{} con {C:attention}5{} opciones',
                    'perecederas',
                }
            },
            tag_aij_auspicious = {
                name = 'Etiqueta Propicia',
                text = {
                    'Crea {C:attention}3{} {C:dark_edition}Copias Negativas',
                    'de {C:attention}cualquier{} carta del {C:tarot}Tarot{}',
                }
            },
            tag_aij_glamour = {
                name = 'Etiqueta de Glamur',
                text = {
                    'Otorga {C:aij_plasma}Reluciente{} a',
                    '{C:attention}2{} Comodines al azar',
                }
            },
            tag_aij_superlunary = {
                name = 'Etiqueta Superlunar',
                text = {
                    'Otorga edición {C:aij_stellar}Estelar{} a',
                    'uno de tus {C:attention}comodines{} y a',
                    '{C:attention}#1#{} cartas en tu baraja',
                }
            },
            tag_aij_gold_dust = {
                name = 'Etiqueta de Oro',
                text = {
                    'Otorga {C:money}Áureo{} a',
                    '{C:attention}#1#{} cartas en la baraja'
                }
            },
            tag_aij_anarchy = {
                name = 'Etiqueta Anarquista',
                text = {
                    '¡Bajo tu {C:red,E:2}PROPIO{} riesgo{C:red}!!!'
                }
            },
        },
        Tarot = {
            c_aij_magus = {
                name = 'El Mago',
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada en una",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sanctuary_gate = {
                name = 'La Puerta del Santuario',
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada en una",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_isis_urania = {
                name = 'Isis-Urania',
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada en una",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_cubic_stone = {
                name = 'La Piedra Cúbica',
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada en una",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_master_arcanes = { 
                name = 'Maestro de lo Arcano',
                text = {
                    "Prob. de {C:green}#1# en #2#{} de",
                    "crear una carta {C:spectral}Espectral{}",
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            c_aij_two_ways = {
                name = 'Los Dos Caminos',
                text = {
                    "Separa {C:attention}#1#{} carta seleccionada",
                    "en {C:attention}2{} copias con la",
                    "{C:attention}mitad{} de la {C:attention}categoría{}",
                    "{C:inactive,s:0.8}(Los valores impares se dividen{}",
                    "{C:inactive,s:0.8}de forma desbalanceada){}",
                    "{C:inactive}(A=14, K=13, Q=12, J=11)"
                }
            },
            c_aij_osiris = {
                name = 'Osiris',
                text = {
                    "{C:red}Destruye{} {C:attention}1{} Comodín",
                    "seleccionado y ganas {C:attention}x3{}",
                    "veces su {C:money}valor de venta{}",
                    "{C:inactive}(Actualmente{} {C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_balance_and_blade = {
                name = 'El Balance y la Espada',
                text = {
                    "Otorga un {C:attention}parche{} de un palo al azar",
                    "a {C:attention}#1#{} cartas seleccionadas"
                }
            },
            c_aij_veiled_lamp = {
                name = 'La Lámpara Cubierta',
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada en una",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sphinx = {
                name = 'Esfinge',
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada en una",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_tamed_lion = {
                name = 'El León Domesticado',
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada en una",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_broken_fate = {
                name = 'Fe Rota',
                text = {
                    "Altera los valores del",
                    "consumible del {C:attention}extremo",
                    "{C:attention}derecho{} entre {C:attention}X0.75{} y {C:attention}X2.5"
                }
            },
        },
        Other = {
            -- Other
            aij_patches_suit = {
                name = "Parches",
                text = {
                    "{C:attention}Parcheado{} con {V:1}#1#"
                }
            },
            aij_jest_mark_of_the_spear = {
                name = "Marca de la Lanza",
                text = {
                    'Esta {C:attention}carta{} fue',
                    '{C:red}debilitada{} permanentemente',
                    'por {C:attention}La Lanza'
                }
            },
            card_extra_retriggers = {
                text={
                    "Esta carta se reactiva {C:attention}#1#{}",
                    "veces adicionales"
                },
            },
            showdown_blind = {
                name = "Ciega Final",
                text = {
                    "La {C:attention}Ciega Jefe{}",
                    "Que aparece cada",
                    "{C:attention}8{} Apuestas",
                }
            },
            reroll_joker = {
                name = "Reemplazar",
                text = {
                    'Cambia un comodín',
                    'por otro de su',
                    'misma rareza'
                }
            },
            office_assistant_perishable = {
                name = "Perecedero",
                text = {
                    '{C:attention}Reinicia{} el contador',
                    'de los Comodines {C:attention}perecederos{}',
                    'por {C:money}$3'
                }
            },
            office_assistant_rental = {
                name = "Alquiler",
                text = {
                    'Quita el {C:attention}sticker{} de',
                    '{C:attention}Alquiler{} del comodín',
                    'por su {C:money}valor de compra'
                }
            },
            overdesigned_club = {
                name = "Tréboles",
                text = {
                    "Los {C:clubs}Tréboles{} anotados",
                    "otorgan {C:mult}+#1#{} Multi",
                }
            },
            overdesigned_spade = {
                name = "Espadas",
                text = {
                    "Las {C:spades}Espadas{} anotadas",
                    "otorgan {C:chips}+#1#{} Fichas",
                }
            },
            overdesigned_diamond = {
                name = "Diamantes",
                text = {
                    "Los {C:diamonds}Diamantes{} anotados",
                    "otorgan {C:money}$#1#{}",
                }
            },
            overdesigned_heart = {
                name = "Corazones",
                text = {
                    "Los {C:hearts}Corazones{} anotados",
                    "otorgan {X:mult,C:white}X#1#{} Multi",
                }
            },
            p_aij_guess_the_jest = {
                name = "Adivina el Comodín",
                text = {
                    'Escoge {C:attention}#1#{} de {C:attention}#2#{} Comodines',
                    '{C:legendary,E:2}Legendarios{} ocultos'
                }
            },
            m_aij_dyscalcular_numbered_rank = {
                name = "Cartas Enumeradas",
                text = {
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, {C:attention}5{}, {C:attention}6{},",
                    "{C:attention}7{}, {C:attention}8{}, {C:attention}9{} y {C:attention}10{}",
                }
            },
            aij_jest_chaotic_card = {
                name = "Carta Caótica",
                text = {
                    "Su {C:edition}Mejora{} cambia",
                    "después de {C:attention}jugarse{}",
                }
            },
            palindrome = {
                name = "Capicúa",
                text = {
                    "Número que se lee igual de izquierda a derecha",
                    "que de derecha a izquierda.",
                    "{C:inactive}ej. 33, 151, 3003{}"
                }
            },
            -- Stickers
            aij_marked = {
                name = "Marcado",
                text = {
                    'No se puede {C:blue}jugar',
                    'o {C:red}descartar'
                }
            },
            -- Seals
            aij_smiley_seal = {
                name = "Sello Jubiloso",
                text = {
                    'Al {C:red}destruirse{}, aplica',
                    'una edición a {C:attention}#1#{}',
                    '{C:attention}comodín{} al azar'
                }
            },
            aij_melted_seal = {
                name = "Sello Derretido",
            text = {
                    'Al estar en {C:attention}mano{},',
                    'se {C:attention}convierte{} en la primera',
                    'carta anotada sin este {V:1}sello{}'
                }
            },
            nevernamed_credits_info = {
                name = "Info",
                text = {
                    "{s:0.8}-Hizo todos los sprites", 
                    "{s:0.8}-Conceptualizó la mitad de los efectos",
                    "{s:0.8}-Empezó a hacer arte de Balatro",
                    "{s:0.8}desde diciembre del 2024"
                    
                }
            },
            survivalaren_credits_info = {
                name = "Info",
                text = {
                    "{s:0.8}-Programó la mitad del contenido", 
                    "{s:0.8}-Conceptualizó la otra mitad de los efectos",
                    "{s:0.8}-Empezó el mod en primer lugar",
                    "{s:0.8}-Creó el mod en abril de 2025"
                }
            },
            rattling_snow_credits_info = {
                name = "Info",
                text = {
                    "{s:0.8}-Programó las partes más avanzadas",
                    "{s:0.8}-Programó casi toda la interfaz",
                    "{s:0.8}-Creó todos la shaders",
                    "{s:0.8}-Se unió al equipo en abril de 2025"
                }
            },
            jumbocarrot_credits_info = {
                name = "Info",
                text = {
                    "{s:0.8}-Ayudó un montón con bugfixing y mejoras",
                    "{s:0.8}-Playtester principal",
                    "{s:0.8}-Se unió al equipo en septiembre de 2025"
                }
            },
        }
    }
}
