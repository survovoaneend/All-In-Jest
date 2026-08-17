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
            aij_moons_blocking = "Bloqueo de Lunas",
            aij_moons_blocking_tooltip = {
                'Si las {C:planet}Lunas{} están activadas, evita',
                'que aparezcan a la vez varios {C:planet}Planetas{}',
                'del mismo tipo de mano',
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
            aij_lite = 'All in Jest Lite',
            aij_lite_tooltip = {
                'Activa solo una selección del',
                'contenido más {C:attention}cercano a vanilla{}',
                '{s:0.8,C:inactive}(Actualmente 76 cosas)'
            },
            aij_red_destroy_text = "Modificar Descripciones de Comodines",
            aij_red_destroy_text_tooltip = {
                'Cambia todas las descripciones de',
                'cartas {C:attention}Vanilla{} y de otros {C:attention}Mods{}',
                'para que "destruir" sea {C:red}rojo{}.',
                '{s:0.8,C:inactive}(Esto puede afectar negativamente',
                '{s:0.8,C:inactive}las descripciones emergentes de otros mods)'
            },
            aij_guess_names = 'Mostrar Nombres en Adivina el Comodín',
            aij_guess_names_tooltip = {
                'Opción de accesibilidad para {C:purple}Adivina',
                '{C:purple}el Comodín{}, mostrando los',
                'nombres de los Comodines ocultos',
                '{s:0.8,C:inactive}(pero no sus descripciones)'
            },
            k_aij_guess_the_jest = "Adivina el Comodín",
            k_aij_sidereal_packs = "Paquete Sideral",
            k_aij_common_packs = "Paquete Común",
            k_aij_uncommon_packs = "Paquete Inusual",
            k_aij_astral = 'Astral',
            k_aij_memory_card = "¡Memorizado!",
            aij_plus_tag = "+1 Etiqueta",
            aij_refreshed = 'Actualizado',
            aij_paid_off = 'Pagado',
            k_aij_polychrome_ex = '¡Policroma!',
            k_aij_foiled_again = '¡Tonto!',
            k_aij_empty_ex = "¡Vacío!",
            k_aij_p_arcana = "+1 Tarot",
            k_aij_merry_christmas = "¡Navidad!",
            k_aij_change_ex = '¡Cambio!',
            k_aij_blood_spilt_ex = '¡Sangra!',
            k_aij_double_ex = '¡Doble!',
            k_aij_editioned_ex = "¡Edición!",
            k_aij_triple_ex = '¡Triple!',
            k_aij_splat_ex = '¡Splat!',
            k_aij_party_time = "¡Fiesta!",

            aij_borra_triggers = {
                'la carta se anota',
                'la carta se descarta',
                'se usa un consumible',
                'se juega una mano',
                'se descarta una mano',
                'se selecciona una ciega',
                'se derrota una ciega jefe',
                'se omite una ciega',
                'se abre un paquete',
                'se gana dinero',
                'se pierde dinero',
                'se renueva una carta',
                'se activa un comodín',
                'se vende un comodín',
                'se destruye un comodín',
                'se crea una carta',
                'se usa una mejora',
                'se usa un sello',
                'se cambia el palo',
                'se cambia la categoría',
                'se mejora una carta',
                'se rompe una carta',
                'se consume un consumible',
            },
            aij_wanba_attributes = {
                ['mult'] = '+Multi',
                ['chips'] = '+Fichas',
                ['xmult'] = 'XMulti',
                ['balance'] = 'Equilibrio',
                ['retrigger'] = 'Reactivación',
                ['scaling'] = 'Escalado',
                ['diamonds'] = 'Relacionado con Diamantes',
                ['hearts'] = 'Relacionado con Corazones',
                ['spades'] = 'Relacionado con Espadas',
                ['clubs'] = 'Relacionado con Tréboles',
                ['hand_type'] = 'Mano de póker',
                ['ace'] = 'Relacionado con As',
                ['two'] = 'Relacionado con 2',
                ['three'] = 'Relacionado con 3',
                ['four'] = 'Relacionado con 4',
                ['five'] = 'Relacionado con 5',
                ['six'] = 'Relacionado con 6',
                ['seven'] = 'Relacionado con 7',
                ['eight'] = 'Relacionado con 8',
                ['nine'] = 'Relacionado con 9',
                ['ten'] = 'Relacionado con 10',
                ['jack'] = 'Relacionado con Jota',
                ['queen'] = 'Relacionado con Reina',
                ['king'] = 'Relacionado con Rey',
                ['face'] = 'Relacionado con cartas de figura',
                ['economy'] = 'Economía',
                ['generation'] = 'Generación',
                ['destroy_card'] = 'Destrucción de cartas',
                ['hand_size'] = 'Tamaño de mano',
                ['discard'] = 'Descarte',
                ['hands'] = 'Mano',
                ['chance'] = 'Basado en probabilidades',
                ['mod_chance'] = 'Modificación de probabilidades',
                ['tarot'] = 'Relacionado con Tarot',
                ['planet'] = 'Relacionado con Planetas',
                ['spectral'] = 'Relacionado con Espectrales',
                ['food'] = 'Comida',
            },
            b_aij_astral_cards = 'Cartas Astrales',
            b_aij_reroll_tags = 'Renovar Etiquetas',
            k_aij_bullet_king_ex = '¡Rey Bala!',
            k_aij_chaos_ex = '¡Caos!',
            k_aij_create = 'Crear',
            k_aij_destroyed_ex = '¡Destruido!',
            k_aij_does_not_score_ex = '¡No anota!',
            k_aij_downgrade_ex = '¡Degradado!',
            k_aij_hunted_ex = '¡Cazado!',
            k_aij_inherent = 'Inherente',
            k_aij_melted_ex = 'Derretido',
            k_aij_plus_two_moons = '+2 Lunas',
            k_aij_remove = 'Quitar',
            k_aij_replace = 'Reemplazar',
            k_aij_select = 'Seleccionar',
            k_aij_two_into_one_ex = '¡Dos en uno!',
            k_community_member_badge = 'Miembro de la Comunidad',
            k_content_creator_badge = 'Creador de Contenido',
            k_delete = 'Eliminar',
            k_playtester_badge = 'Probador',
            k_tarot_hex = 'Maleficio',
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
            c_aij_mircotransactions = "Microtransacciones",
            c_aij_micromanagement = "Microgestión",
            c_aij_flip_flop = "Voltereta",
            c_aij_full_plate = "Plato Completo",
            c_aij_pandemonium = "Pandemonio",
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
                'Todas las {C:attention}Ciegas Jefe{} normales después',
                'de la {C:attention}Apuesta 1{} son {C:attention}Ciegas de Pozo{}'
            },
            ch_c_aij_no_mult_in_pool = {
                'Estos Comodines son tu {C:attention}única{} fuente de',
                '{C:mult}Multi{}'
            },
            ch_c_aij_all_jokers_perishable_1 = {
                'Todos los Comodines son {C:attention}Perecederos{}'
            },
            ch_c_aij_all_jokers_perishable_2 = {
                'El tiempo de {C:attention}Perecedero{} se reduce',
                'a {C:attention}2{} rondas'
            },
            ch_c_aij_money_times_negative = {
                '{C:attention}Multiplica{} el dinero por {C:red}-1{}',
                'al final de la ronda'
            },
            ch_c_aij_all_jokers_is_food = {
                'Solo pueden aparecer Comodines de',
                '{C:attention}comida{}'
            },
            ch_c_aij_pandemonium_1 = {
                'Todas las Etiquetas de Omitir son',
                'Etiquetas del {C:attention}Caos{}'
            },
            ch_c_aij_pandemonium_2 = {
                'No puedes {C:attention}seleccionar{} la Ciega',
                'Pequeña ni la Ciega Grande'
            },
        },
        extra_joker_dictionary = {
            k_aij_borra_gains = "Gana",
            k_aij_borra_when = "Multi cuando",
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
            -- Cazafantasmas
            k_aij_ghosthunter_ghostless_1 = "pueden aparecer",
            k_aij_ghosthunter_ghostless_2 = "en la",
            k_aij_ghosthunter_ghost_1 = "aparecen",
            k_aij_ghosthunter_ghost_2 = "con más frecuencia",
        },
        labels = {
            -- Editions
            aij_glimmer = "Reluciente",
            aij_silver = "Plata",
            aij_stellar = "Estelar",
            aij_aureate = "Áureo",
            aij_torn = "Rasgado",
            aij_misprint = "Mal Impresa",
            -- Stickers
            aij_marked = "Marcado",
            aij_pc_perishable = "Perecedero",
            aij_pc_eternal = "Eterno",
            aij_pc_rental = "Alquiler",
            aij_mint_condition = "Prístino",
            -- Seals
            aij_smiley_seal = "Sello Sonriente",
            aij_melted_seal = "Sello derretido",
            aij_eye_seal = "Sello Ocular",
            -- Other
        },
        poker_hands = {
            ['aij_Royal Flush'] = "Escalera Real",
        },
        poker_hand_descriptions = {
            ['aij_Royal Flush'] = {
            ""
            },
        },
        -- Credits page jokers
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
            },
            b_aij_melded = {
                name = 'Baraja Derretida',
                text = {
                    'Las Cartas de Juego',
                    'pueden tener {C:attention}dos{}',
                    "mejoras únicas",
                },
                unlock = {
                    "Gana una partida con {C:attention}#1#",
                    "barajas en al menos",
                    "el pozo {V:1}#2#{}",
                }
            },
            b_aij_melded_hidden = {
                name = 'Baraja Derretida',
                text = {},
                unlock = {
                    "Gana una partida con {C:attention}#1#",
                    "barajas en al menos",
                    "el pozo {V:1}#2#{}",
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
                    '+1X Base tras jugar',
                    'una mano',
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
                    'Si la mano jugada contiene',
                    '3 o más cartas, destruye',
                    'todas las cartas jugadas',
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
                    'La mano no puede contener',
                    '3 o más cartas de figura',
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
                    'descartes #1# cartas'
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
                    'Debes anotar la puntucación',
                    'requerida 2 veces',
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
            bl_aij_angling_hook = {
                name = 'Anzuelo Amaranto',
                text = {
                    'Descarta todas las cartas',
                    'jugadas o descartadas',
                    'esta Apuesta al seleccionar',
                    'la Ciega',
                },
            },
            bl_aij_fallen_falcon = {
                name = 'El Halcón Caído',
                text = {
                    'Al iniciar la ronda, se juega',
                    'la mano de póker de mayor',
                    'nivel disponible y se añade',
                    'a la puntuación requerida',
                },
            },
            bl_aij_golden_string = {
                name = 'Ajuga Aúrea',
                text = {
                    'Pierdes {C:red}-$2{} por carta jugada',
                    'Todas las cartas se debilitan',
                    'con $0 o menos',
                },
            },
            bl_aij_mysterious_myriad = {
                name = 'Miríada Misteriosa',
                text = {
                    'Reduce la puntuación final',
                    'de cada mano un 20% por',
                    'cada carta menor a 5 en',
                    'la mano anotada',
                },
            },
            bl_aij_rubber_duck = {
                name = 'Patito Prímula',
                text = {
                    'Todas las manos de póker',
                    'vuelven a nivel 1',
                },
            },
            bl_aij_silver_stag = {
                name = 'Ciervo Ceniciento',
                text = {
                    'Todas las cartas son',
                    'debilitadas excepto las',
                    'descartadas esta Apuesta',
                },
            },
            bl_aij_tarnished_tile = {
                name = 'Cerámica Cobriza',
                text = {
                    'Al iniciar la ronda, duplica',
                    'el tamaño de tu mano y descarta',
                    'todas las cartas de tu baraja',
                },
            },
            bl_aij_the_assistant = {
                name = 'El Asistente',
                text = {
                    'Se convierte una Ciega Jefe',
                    'que contrarresta tu estrategia',
                },
            },
            bl_aij_the_business = {
                name = 'El Negocio',
                text = {
                    'Al ser derrotado, destruye',
                    'el Comodín del extremo izquierdo',
                    'o derecho y crea un',
                    'Comodín Común {C:dark_edition}Eterno{}',
                },
            },
            bl_aij_the_clown = {
                name = 'El Payaso',
                text = {
                    'Al iniciar la ronda,',
                    'se juegan 5 cartas al azar de',
                    'tu mano y se añaden a la',
                    'puntuación requerida',
                },
            },
            bl_aij_the_connection = {
                name = 'La Conexión',
                text = {
                    'La sobrepuntuación anotada',
                    'en esta Ciega se añade a',
                    'todas las Ciegas posteriores',
                },
            },
            bl_aij_the_dagger = {
                name = 'La Daga',
                text = {
                    'La mano debe contener',
                    'un Trébol o una Espada',
                },
            },
            bl_aij_the_fig = {
                name = 'El Higo',
                text = {
                    'Debilita la primera y',
                    'última carta anotada',
                    'en cada mano jugada',
                },
            },
            bl_aij_the_kind = {
                name = 'El Generoso',
                text = {
                    'Mejores Etiquetas de {C:attention}Omitir{} en',
                    'esta Apuesta; duplica el tamaño de la',
                    'Ciega por cada Ciega omitida',
                },
            },
            bl_aij_the_life = {
                name = 'La Vida',
                text = {
                    'Todas las cartas que anotan',
                    'se vuelven Perecederas',
                },
            },
            bl_aij_the_loan = {
                name = 'El Préstamo',
                text = {
                    'Todas las cartas jugadas',
                    'en la última mano de la ronda',
                    'se vuelven de {C:attention}Alquiler{}',
                },
            },
            bl_aij_the_man = {
                name = 'El Hombre',
                text = {
                    'Todas las cartas jugadas',
                    'quedan permanentemente',
                    'boca abajo',
                },
            },
            bl_aij_the_multitude = {
                name = 'La Multitud',
                text = {
                    '#1# de #2# cartas están debilitadas',
                    'Las cartas debilitadas que queden',
                    'en tu baraja al final de la ronda',
                    'son destruidas',
                },
            },
            bl_aij_the_oil = {
                name = 'El Aceite',
                text = {
                    'Las cartas mejoradas tienen',
                    'una prob. de #1# en #2# de',
                    'ser descartadas al sacarse',
                    "de la baraja",
                },
            },
            bl_aij_the_pair = {
                name = 'El Par',
                text = {
                    'Las cartas en mano',
                    'deben contener un Par',
                },
            },
            bl_aij_the_real = {
                name = 'El Interior',
                text = {
                    'Las cartas solo se consideran',
                    'de su categoría y palo originales',
                },
            },
            bl_aij_the_seed = {
                name = 'La Semilla',
                text = {
                    'La Ciega Grande de la próxima',
                    'Apuesta es una Ciega Jefe',
                },
            },
            bl_aij_the_silence = {
                name = 'El Silencio',
                text = {
                    'Las cartas anotadas no',
                    'pueden reactivarse',
                },
            },
            bl_aij_the_solid = {
                name = 'El Macizo',
                text = {
                    'Todas las cartas que anotan',
                    'se vuelven Eternas',
                },
            },
            bl_aij_the_trio = {
                name = 'El Trío',
                text = {
                    'Si la mano contiene 3 cartas de la',
                    'misma categoría tras jugar',
                    'o descartar una mano, debilita 3',
                    'cartas al azar en mano',
                },
            },
            bl_aij_the_wine = {
                name = 'El Vino',
                text = {
                    'Al jugar o descartar',
                    'una carta, descarta una',
                    'carta al azar de tu baraja',
                },
            },
            bl_aij_the_worm = {
                name = 'El Gusano',
                text = {
                    'Destruye todos',
                    'los Comodines Perecederos',
                    'al seleccionar la Ciega',
                },
            },
            bl_aij_wenge_wand = {
                name = 'La Vara de Wenge',
                text = {
                    'Las mejoras tienen',
                    'una prob. de #1# en #2# de',
                    'no activarse',
                },
            },
            bl_aij_wooden_wheel = {
                name = 'Rueda de Roble',
                text = {
                    'Cambia los Comodines del',
                    'extremo izquierdo y derecho',
                    'al seleccionar la Ciega',
                },
            },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "Carta Ferviente",
                text = {
                    "Obtiene {C:chips}+#2#{} Fichas",
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
                    'Otorga {C:chips}+#3#{} Fichas al estar en',
                    'mano, {C:chips}+#2#{} por cada carta de',
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
            m_aij_scorched = {
                name = "Carta Chamuscada",
                text = {
                    'Al descartarse, prob. de {C:green}#1# en #2#{}',
                    'de {C:planet}subir{} de nivel la mano',
                    '{C:attention}de póker{} descartada en {C:attention}#3#{} nivel.'
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
            v_aij_wax_stamp = {
                name = "Sello de Cera",
                text = {
                    '{C:attention}Cartas de juego{} en {C:attention}Paquetes',
                    '{C:attention}Estándar{} tienen {C:attention}el doble{} de',
                    'probabilidad de tener un {C:attention}Sello{}'
                },
            },
            v_aij_seal_of_the_realm = {
                name = "Sello Real",
                text = {
                    'Las {C:attention}cartas de juego{} pueden',
                    'aparecer con {C:attention}Sellos{}',
                    'que {C:attention}tienen{} sus',
                    'propias {C:dark_edition}ediciones{}'
                },
            },
            v_aij_embraced_arcane = {
                name = "Flujo Arcano",
                text = {
                    '{C:attention}+#1#{} selección disponible en',
                    'los Paquetes {C:tarot}Arcanos{}',
                },
            },
            v_aij_thaumaturgy = {
                name = "Taumaturgia",
                text = {
                    '{C:attention}Añade{} un Paquete {C:tarot}Arcano{}',
                    'adicional en todas las {C:money}tiendas',
                },
            },
            v_aij_common_caste = {
                name = "Casta Común",
                text = {
                    '{C:attention}Añade{} un Paquete {C:common}Común',
                    'adicional en todas las {C:money}tiendas',
                },
            },
            v_aij_upper_class = {
                name = "Clase Alta",
                text = {
                    '{C:attention}Añade{} un Paquete {C:uncommon}Inusual{}',
                    'adicional en todas las {C:money}tiendas',
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
            v_aij_recursion = {
                name = "Recursión",
                text = {
                    '{C:attention}+#1# Vale{} a la venta',
                },
            },
            v_aij_recursion_2 = {
                name = "Recursión",
                text = {
                    '{C:attention}+#1# Vale{} a la venta,',
                    'los vales cuestan {C:money}$#2#{} menos',
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
            e_aij_misprint = {
                name = "Mal Impresa",
                text = {
                    "Los {C:attention}valores{} de este {C:attention}Comodín{}",
                    "se {C:attention}aleatorizan{} entre {C:attention}X#1#{} y {C:attention}X#2#{}",
                    "después de jugar la mano",
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
            j_aij_taylor_credits_joker = {
                name = 'Taylor',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_toyrapple_credits_joker = {
                name = 'Toyrapple',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_zan_credits_joker = {
                name = 'Zan',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_aphi_credits_joker = {
                name = 'Aphi',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_bygone_credits_joker = {
                name = 'Bygone',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_cebee_credits_joker = {
                name = 'Cebee',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_cheddar_credits_joker = {
                name = 'Cheddar',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_ghoti_credits_joker = {
                name = 'Ghoti',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_grass_credits_joker = {
                name = 'Grass',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_heisenburger_credits_joker = {
                name = 'Heisenburger',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_jamie_credits_joker = {
                name = 'Jamie!',
                text = {
                    '{C:inactive}"nevernamed y yo somos muy buenos amigos"',
                    '{C:inactive}"a veces nos besamos en la boca"',
                },
            },
            j_aij_marcy_credits_joker = {
                name = 'Marcy',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_metrollen_credits_joker = {
                name = 'Metrollen',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_minibit_credits_joker = {
                name = 'Mini Bit',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_mythie = {
                name = 'Mythie',
                text = {
                    '{C:inactive}"Comer tostada en la cama es"',
                },
            },
            j_aij_mythie_credits_joker = {
                name = 'Mythie',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_papermoon_credits_joker = {
                name = 'Papermoon',
                text = {
                    '{C:inactive}"Estamos invitados a una',
                    '{C:inactive}fiesta de por vida, es de mala educación quedarse demás."',
                },
            },
            j_aij_prototype = {
                name = 'Prototype',
                text = {
                    '{C:inactive}"Jaja, no sé si yo"',
                },
            },
            j_aij_prototype_credits_joker = {
                name = 'Prototype',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_sophe_credits_joker = {
                name = 'Sophe',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_spoofy_credits_joker = {
                name = 'Spoofy',
                text = {
                    '{C:inactive}"Skibby Dee"',
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
            j_aij_heavenbrand_credits_joker = {
                name = "HEAVENBRAND",
                text = {
                    '{C:inactive}"Como dicen en Francia,',
                    '{C:inactive}\'Tomaré dos.\'"',
                    "{C:inactive,s:0.7}\'Mis más sincero pésame por tu condición - Marffe\'{}"
                },
            },
            j_aij_rummikub = {
                name = "Rummikub",
                text = {
                    "Cuando la {C:attention}Ciega Jefe{} sea",
                    "{C:red}derrotada{}, crea una carta de",
                    "juego con una {C:attention}categoría{}",
                    "{C:attention}palo{}, y {C:attention}mejora{} elegidos.",
                }
            },
            j_aij_rudolph = {
                name = "Rodolfo",
                text = {
                    "Si la {C:attention}primera{} carta",
                    "anotada en mano tiene un {C:attention}Sello Rojo{},",
                    "{C:attention}reactiva{} todas las demás cartas"
                }
            },
            j_aij_richie_rich = {
                name = "Ricardo Rico",
                text = {
                    "{X:money,C:white}X$#1#{} al final",
                    "de la ronda"
                }
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
            j_aij_fly_agaric = {
                name = "Amanita Muscaria",
                text = {
                    '{C:attention}Reactiva{} todas las {V:1}Habilidades{}',
                    '{V:1}Activables{}'
                },
            },
            j_aij_lucky_seven = {
                name = "Siete de la Suerte",
                text = {
                    "Convierte todos los {C:attention}7{}",
                    "sin mejoras jugados en",
                    "{C:attention}Cartas de la Suerte{}"
                },
            },
            j_aij_lucky_horseshoe = {
                name = "Herradura de la Suerte",
                text = {
                    'Las {C:attention}Cartas de la Suerte{} en mano',
                    'tienen una prob. {C:green}#1# en #3#{} de',
                    'otorgar {C:money}$#5#{} y una prob. {C:green}#1# en #4#{}',
                    'de otorgar {X:mult,C:white}X#6#{} Multi'
                }
            },
            j_aij_the_ludovico_technique = {
                name = "La Técnica Ludovico",
                text = {
                    "{C:planet}Sube de nivel{} la {C:attention}primera mano{}",
                    "de cada ronda al jugar",
                    "la {C:attention}última mano{} de la ronda",
                    "{C:inactive}(Actualmente {C:attention}#1#{C:inactive})"
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
                },
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
            j_aij_lemarchand_cube = {
                name = "Cubo de LeMarchand",
                text = {
                    "Crea una carta {C:spectral}Espectral{} al azar",
                    "cada {C:attention}#2#{} cartas de {C:tarot}Tarot{} usadas",
                    "{C:inactive}(Debe haber espacio){}",
                    "{C:inactive}({C:attention}#1#{C:inactive}/{C:attention}#2#{C:inactive})"
                }
            },
            j_aij_pierrot = {
                name = "Pierrot",
                text = {
                    "Las cartas {C:attention}enumeradas{} en",
                    "mano otorgan sus {C:chips}Fichas{}"
                }
            },
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
            j_aij_infamous_machine = {
                name = "Máquina Infame",
                text = {
                    'Después de sacar la {C:attention}primera mano{} de cada',
                    'ronda, se {C:red}destruye{} la {C:attention}carta{} del',
                    '{C:attention}del extremo izquierdo{} y este',
                    '{C:attention}Comodín{} gana {C:mult}+#1#{} Multi',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)'
                }
            },
            j_aij_in_vino_veritas = {
                name = "In Vino Veritas",
                text = {
                    "{C:attention}+#1#{} al tamaño de mano cuando se usa",
                    "un {C:attention}consumible{}, se {C:attention}reinicia{}",
                    "al final de la {C:attention}ronda{}",
                    "{C:inactive}(Actualmente {C:attention}+#2#{C:inactive} Tamaño de Mano)",
                    "{C:inactive}(Máximo {C:attention}+#3#{C:inactive} Tamaño de Mano)"
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
            j_aij_octopus = {
                name = "Pulpo",
                text = {
                    'Los {C:attention}7s{} y {C:attention}9s{} anotados',
                    'se convierten en {C:attention}8s{}'
                }
            },
            j_aij_imageboard = {
                name = "Post satírico",
                text = {
                    "Las cartas {C:attention}anotadas{} otorgan",
                    "{C:mult}+#1#{} Multi cada {C:attention}vez{} que",
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
            j_aij_dont_be_a_joker = {
                name = "¡No seas un Comodín!",
                text = {
                    'Cuando un {C:attention}Comodín{} es {C:red}destruido',
                    'o {C:money}vendido{}, este gana su {C:money}valor',
                    '{C:money}de venta'
                }
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
                name = "Pablo Plano",
                text = {
                    "Las cartas {C:attention}sin mejoras{}",
                    "anotadas otorgan {C:mult}+#1#{} Multi",
                },
            },
            j_aij_plain_packaging = {
                name = "Empaque con Adventencia",
                text = {
                    "{C:mult}+#1#{} Multi, {C:mult}-#2#{} Multi cuando",
                    "un {C:attention}Comodín{} es {C:money}vendido{}",
                    "o {C:red}destruido{}"
                }
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
            j_aij_silly_billy = {
                name = "Tadeo el Tarado",
                text = {
                    "{C:mult}+#1#{} Multi por cada",
                    "{C:attention}mejora{}, {C:attention}sello{}, y",
                    "{C:attention}edición{} en la mano jugada"
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
            j_aij_police_sketch = {
                name = "Retrato Policial",
                text = {
                    'Si la mano jugada es {C:attention}Póker{}',
                    'convierte cualquier carta {C:attention}no anotada{}',
                    'en {C:attention}Cartas de Lienzo'
                }
            },
            j_aij_pog = {
                name = "Pog",
                text = {
                    'Cada {C:attention}paquete potenciador{} también',
                    'contiene una {C:attention}Etiqueta{} que puede ser',
                    'adquirida al {C:attention}omitir{} el',
                    'paquete'
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
                    "gana {X:mult,C:white}X#1#{} Multi",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2# {C:inactive} Multi)",
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
                    '{C:chips}Redondea{} las Fichas y el',
                    '{C:mult}Multi{} al {C:attention}palíndromo{} más cercano',
                },
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
                    "{C:inactive,s:0.8}(La proporción cambia cada ronda)",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi){}",
                }
            },
            j_aij_baroque_joker = {
                name = "Comodín Barroco",
                text = {
                    'Este Comodín gana {X:mult,C:white}X#2#{} Multi si',
                    'la mano jugada {C:attention}contiene{} pero no es',
                    'la {C:attention}última{} mano jugada',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Multi)'
                }
            },
            j_aij_dim_bulb = {
                name = "Luz Tenue",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si no tienes",
                    "Comodines {C:uncommon}Inusuales{} o {C:red}Raros{}",
                },
            },
            j_aij_diver = {
                name = "Buzo",
                text = {
                    'Los {C:attention}Paquetes Potenciadores{} contienen',
                    '{C:attention}#1#{} opciones adicionales',
                }
            },
            j_aij_dire_warning = {
                name = "Advertencia Grave",
                text = {
                    '{X:mult,C:white}X#1#{} Multi si la ronda',
                    'anterior se ganó con {C:attention}0{} manos',
                    'restantes',
                    '{C:inactive}(#2#)'
                }
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
            j_aij_hat_trick = {
                name = "Sombrero Mágico",
                text = {
                    "Si la mano jugada",
                    "es una {C:attention}Tercia{}, las",
                    "cartas anotadas otorgan {C:mult}Multi{}",
                    "igual a su {C:attention}nivel{}",
                    "{C:inactive}(Actualmente {C:mult}+#1#{} {C:inactive}Multi)",
                }
            },
            j_aij_magic_hat = {
                name = "Sombrero Mágico",
                text = {
                    "{C:attention}+#1# Tamaño de Mano{} mientras",
                    "usas {C:attention}Paquetes Potenciadores{}"
                }
            },
            j_aij_magazine_ad = {
                name = "Anuncio de Revista",
                text = {
                    "Cuando la {C:attention}Ciega Jefe{} es derrotada,",
                    "aplica un {C:attention}Sello Rojo{} a una carta",
                    "al azar en tu {C:attention}baraja{}"
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
                    "a un mismo {C:attention}palo{}",
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
            j_aij_prisoners_cinema = {
                name = "Cine del Prisionero",
                text = {
                    '{C:attention}#1#{} {C:attention}Paquetes Potenciadores{}',
                    'al azar cada tienda son {C:attention}gratis'
                }
            },
            j_aij_propaganda = {
                name = "Propaganda",
                text = {
                    'Las cartas del {C:attention}palo{} más',
                    '{C:attention}común{} en tu {C:attention}baraja{}',
                    'otorgan {C:mult}+#2#{} Multi al anotar',
                    '{C:inactive}(Actualmente: {C:attention}#1#{C:inactive})'
                }
            },
            j_aij_quark = {
                name = "Quark",
                text = {
                    '{C:planet}Sube{} de nivel {C:attention}Tercia{} si la',
                    'mano es exactamente {C:attention}tres{}',
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
            j_aij_tornado = {
                name = "Tornado",
                text = {
                    {
                        'Gana {X:mult,C:white}X#1#{} Multi después de',
                        'que cada {C:attention}categoría{} haya',
                        'sido anotada al menos una vez',
                        '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}'
                    },
                    {
                        '{C:inactive}(Restantes:#3#',
                        '{C:inactive}#4#'
                    }
                }
            },
            j_aij_rubberhose = {
                name = "Rubberhose",
                text = {
                    '{C:mult}+#1#{} Multi si la mano {C:attention}jugada{}',
                    'contiene solo {C:spades}Palos Oscuros{} o',
                    'solo {C:hearts}Palos Claros{}'
                }
            },
            j_aij_ninja = {
                name = "Ninja",
                text = {
                    '{C:attention}Reactiva{} la {C:attention}primera{} carta',
                    'anotada cuando se anota la {C:attention}última{}',
                    'carta {C:attention}anotada{}'
                }
            },
            j_aij_wax_joker = {
                name = "Comodín de Cera",
                text = {
                    'Después de {C:attention}anotar{} la mano, todos los',
                    '{C:attention}Sellos{} en la mano jugada se',
                    'convierten en Sellos {C:jest_melted}Derretidos{}'
                }
            },
            j_aij_splat = {
                name = "¡Splat!",
                text = {
                    'Prob. de {C:green}#1# en #2#{} para cada',
                    'carta {C:attention}anotada{} de ganar un',
                    'Sello {C:jest_melted}Derretido{}'
                }
            },
            j_aij_windswept_joker = {
                name = "Comodín Azotado",
                text = {
                    'Si la mano jugada contiene una',
                    '{C:attention}Escalera de Color{}, sube de nivel',
                    '{C:attention}Escalera de Color{} por {C:attention}#1#{} niveles'
                }
            },
            j_aij_body_pillow = {
                name = "Almohada Corporal",
                text = {
                    'Las cartas jugadas sin',
                    '{C:attention}anotar{} otorgan {C:money}$#1#{}'
                }
            },
            j_aij_treasure_map = {
                name = "Mapa del Tesoro",
                text = {
                    'Después de omitir {C:attention}#1#-#2#{} Ciegas,',
                    'crea una {C:attention}Etiqueta Estereoscópica{}'
                }
            },
            j_aij_geoglyph = {
                name = "Geoglifo",
                text = {
                    'Las cartas anotadas dan {C:mult}+#1#{} Multi',
                    'por cada carta del mismo',
                    'palo {C:attention}en tu mano{}'
                }
            },
            j_aij_smide = {
                name = "Smide",
                text = {
                    '{C:chips}+#1#{} Fichas por carta de {C:attention}figura{}',
                    'en tu {C:attention}baraja{}',
                    '{C:inactive}(Actualmente {C:chips}+#2#{} {C:inactive}Fichas){}'
                }
            },
            j_aij_poker_face = {
                name = "Cara de Póker",
                text = {
                    '{X:mult,C:white}X#1#{} Multi por mano {C:attention}consecutiva{}',
                    'jugada que{C:attention} no anote ´por encima',
                    'de la {C:attention}puntuación requerida{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}'
                }
            },
            j_aij_crab_in_a_bucket = {
                name = "Cangrejo en Cubeta",
                text = {
                    '{C:chips}+#1#{} Fichas por carta por encima',
                    'de {C:attention}#2#{} en tu {C:attention}baraja{}',
                    '{C:inactive}(Actualmente {C:chips}+#3#{} {C:inactive}Fichas){}'
                }
            },
            j_aij_ten_sharp = {
                name = "Diez en Punto",
                text = {
                    '{C:attention}Reactiva{} todas las cartas',
                    'anotadas {C:attention}adyacentes{} a un {C:attention}10{}'
                }
            },
            j_aij_legerdemain = {
                name = "Prestidigitación",
                text = {
                    '{C:red}+#1# Descartes{} esta ronda',
                    'cuando se {C:money}vende{} un {C:attention}Comodín{}',
                    'durante una {C:attention}Ciega{}',
                },
            },
            j_aij_game_bro = {
                name = "Game Bro",
                text = {
                    'Otorga {C:mult}Multi{} igual a',
                    'el {C:attention}doble{} de la {C:attention}ronda{} actual',
                    '{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)',
                },
            },
            j_aij_alas = {
                name = "¡Ay!",
                text = {
                    'Este Comodín gana {C:chips}+#1#{} Fichas',
                    'cuando una carta es',
                    '{C:red}descartada',
                    '{C:inactive}(Actualmente {C:chips}+#2#{} {C:inactive}Fichas){}'
                }
            },
            j_aij_brass_joker = {
                name = "Comodín de Latón",
                text = {
                    'Cuando se usa un {C:attention}Comodín{} con una',
                    '{V:1}Habilidad Activada{}, este',
                    '{C:attention}Comodín{} gana {C:mult}+Multi',
                    'igual al costo en {C:money}dinero{}',
                    'de usar la habilidad',
                    '{C:inactive}(Actualmente {C:mult}+#1#{} {C:inactive}Multi){}'
                }
            },
            j_aij_veggie_joker = {
                name = "Comodín Vegetal",
                text = {
                    'Cuando cualquier carta {C:attention}numerada{}',
                    'es {C:red}destruida{}, gana {C:attention}triple{} su',
                    'categoría como {C:chips}Fichas',
                    '{C:inactive}(Actualmente {C:chips}+#1#{} {C:inactive}Fichas){}'
                }
            },
            j_aij_meaty_joker = {
                name = "Comodín Charcutero",
                text = {
                    '{X:mult,C:white}X#1#{} Multi por cada {C:attention}#2#{}',
                    'cartas en tu {C:attention}baraja{}',
                    "{C:inactive}(Actualmente {X:mult,C:white}X#3#{C:inactive} Multi){}",
                    "{C:inactive}(Mínimo {X:mult,C:white}X1{C:inactive} Multi){}"
                }
            },
            j_aij_funny_bunch = {
                name = "Grupo Cómico",
                text = {
                    'Gana {X:mult,C:white}X#1#{} Multi por',
                    'Comodín {C:common}Común{}',
                    "{C:inactive}(Mínimo {X:mult,C:white}X#2#{C:inactive} Multi){}"
                }
            },
            j_aij_wizard = {
                name = "Comodín Hechicero",
                text = {
                    'Prob. de {C:green}#1# en #2#{} para cada',
                    'carta {C:attention}no mejorada{} anotada',
                    'de convertirse en una {C:red}Carta Multi{}',
                    '{C:blue}Carta Adicional{}, o {C:green}Carta de la Suerte{}'
                }
            },
            j_aij_single_cell = {
                name = "Célula Única",
                text = {
                    'La primera carta {C:attention}enumerada{}',
                    'anotada de cada mano otorga {C:chips}+#1#{} Fichas',
                }
            },
            j_aij_dwarf = {
                name = "Enano",
                text = {
                    'Los {C:attention}2s{}, {C:attention}3s{}, {C:attention}4s{} y {C:attention}5s{} otorgan {C:mult}Multi',
                    'igual a {C:attention}#1#{} menos su',
                    '{C:attention}categoría{} al anotar'
                }
            },
            j_aij_gopnik = {
                name = "Gopnik",
                text = {
                    '{B:1,C:white,s:0.8}Habilidad Activable',
                    'Paga {C:money}$#1#{} para otorgar',
                    'a este Comodín {C:mult}+#3#{} Multi',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)'
                }
            },
            j_aij_scopaesthesia = {
                name = "Escopastecia",
                text = {
                    '{C:attention}Revela{} la siguiente carta',
                    'en tu {C:attention}baraja',
                    'Las {C:attention}cartas{} que compartan su {C:attention}categoría{}',
                    'otorgan {X:mult,C:white}X#1#{} Multi'
                }
            },
            j_aij_outlet = {
                name = "Tomacorriente",
                text = {
                    'Cuando se {C:attention}selecciona{} una Ciega,',
                    'añade una {C:attention}Carta Energizada{}',
                    'a tu mano'
                }
            },
            j_aij_neon_sign = {
                name = "Letrero de Neón",
                text = {
                    '{X:mult,C:white}X#1#{} Multi si la mano jugada',
                    'contiene un {C:attention}Full House{} y',
                    'la mano anterior {C:attention}no',
                    '{C:inactive}(#2#)'
                }
            },
            j_aij_blemmya = {
                name = "Blemia",
                text = {
                    'Si la mano {C:attention}jugada{} contiene un',
                    'número {C:attention}impar{} de cartas, la',
                    'carta {C:attention}mediana{} se convierte',
                    'en una carta de {C:attention}figura{}'
                }
            },
            j_aij_sam_mcgee = {
                name = "Sam McGee",
                text = {
                    'Gana {X:mult,C:white}X#2#{} Multi por cada',
                    'carta después de {C:attention}#1#{} en la mano {C:attention}jugada{}'
                }
            },
            j_aij_kingmaker = {
                name = "Hacedor de Reyes",
                text = {
                    'Todas las cartas anotadas tienen una',
                    '{C:green}#1# en #2#{} probabilidad de ser',
                    'convertidas en {C:attention}Reyes{}',
                    'después de anotar'
                }
            },
            j_aij_candidate = {
                name = "Candidato",
                text = {
                    {
                        'Los Comodines {C:common}Comunes{}',
                        'otorgan {C:chips}+#2#{} Fichas'
                    },
                    {
                        'Los Comodines {C:uncommon}Inusuales{} y {C:rare}Raros{}',
                        'otorgan {C:mult}+#1#{} Multi'
                    }
                }
            },
            j_aij_bullseye = {
                name = "Diana",
                text = {
                    '{X:mult,C:white}X#1#{} Multi si las {C:chips}Fichas{}',
                    'totales son múltiplo de {C:attention}10{}'
                }
            },
            j_aij_glasgow_smile = {
                name = "Sonrisa de Glasgow",
                text = {
                    {
                        '{C:chips}+#1#{} Fichas cuando se anota una',
                        '{C:attention}Carta Adicional{}'
                    },
                    {
                        'Si la {C:attention}primera{} mano de la ronda',
                        'es una sola {C:attention}Carta Adicional{},',
                        '{C:red}destrúyela{} y aumenta esta',
                        'cantidad por {C:chips}+#2#{} Fichas'
                    }
                }
            },
            j_aij_whats_left = {
                name = "Lo Que Queda",
                text = {
                    "Copia las habilidades de los",
                    "últimos {C:attention}#1#{} {C:money}vendidos{} {C:attention}comodines{}",
                    "{C:inactive}(Excluyendo Lo Que Queda){}"
                }
            },
            j_aij_beelzebub = {
                name = "Belcebú",
                text = {
                    'Gana {C:mult}+#1#{} Multi cuando',
                    'se añade cualquier',
                    '{C:attention}carta de juego{} a tu {C:attention}baraja',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)'
                }
            },
            j_aij_cheese_squigglies = {
                name = "Quesitos",
                text = {
                    'Gana {X:mult,C:white}X#2#{} Multi',
                    'por cada {C:green}renovación{} en la Tienda,',
                    '{C:attention}comido{} después de {C:attention}#4#{} renovaciones',
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi, {C:attention}#3#{C:inactive}/{C:attention}#4#{C:inactive}){}",
                }
            },
            j_aij_comic_panel = {
                name = "Panel de Cómic",
                text = {
                    'Prob. de {C:green}#1# en #2#{} de otorgar una',
                    '{C:attention}mejora{} al azar a',
                    '{C:attention}todas{} las cartas en la mano jugada'
                }
            },
            j_aij_father_and_son = {
                name = "Padre e Hijo",
                text = {
                    'Gana {X:mult,C:white}X#2#{} Multi si la mano',
                    '{C:attention}anotada{} contiene exactamente',
                    '{C:attention}un Rey{} y {C:attention}una Jota{}',
                    '{C:inactive}(Actualmente{} {X:mult,C:white}X#1#{}{C:inactive} Multi){}'
                }
            },
            j_aij_blue_star = {
                name = "Estrella Azul",
                text = {
                    'Prob. de {C:green}#1# en #2#{} de {C:planet}subir de nivel{}',
                    'la mano jugada si contiene',
                    'una {C:attention}Carta Adicional{} o',
                    '{C:attention}Carta Ferviente'
                }
            },
            j_aij_corndog = {
                name = "Corndog",
                text = {
                    "Las próximas {C:attention}#1#{} manos",
                    "{C:attention}anotadas{} son {C:attention}consideradas{}",
                    "como {C:attention}Escalera de Color",
                    "independientemente de qué",
                    "cartas se {C:attention}jueguen{}"
                }
            },
            j_aij_goblet = {
                name = "Cáliz",
                text = {
                    '{C:attention}+#1#{} Ranuras de Consumibles'
                }
            },
            j_aij_scrunched_joker = {
                name = "Comodín Apretado",
                text = {
                    {
                        "{C:chips}+#1#{} Fichas y {C:mult}+#2#{} Multi en",
                        "la {C:attention}primera{} y {C:attention}última{} mano de la ronda"
                    },
                    {
                        "{C:chips}+#3#{} Fichas y {C:mult}+#4#{} Multi",
                        "en el resto de manos jugadas"
                    },
                }
            },
            j_aij_funny_bone = {
                name = "Hueso Chistoso",
                text = {
                    'Cuando se {C:money}vende{} o',
                    '{C:red}destruye{} cualquier Comodín, crea una',
                    '{C:tarot}Carta de Tarot{} al azar'
                }
            },
            j_aij_the_bell = {
                name = "La Campana",
                text = {
                    "{B:1,C:white,s:0.8}Habilidad Activable",
                    'Paga {C:money}$#1#{} para renovar',
                    'el {C:attention}Vale{} de la Tienda',
                }
            },
            j_aij_shredded_joker = {
                name = "Comodín Triturado",
                text = {
                    '{C:mult}+#1#{} Multi por carta',
                    '{C:red}descartada{} esta {C:attention}ronda',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)'
                }
            },
            j_aij_triple_sundae = {
                name = "Sundae Triple",
                text = {
                    {
                        '{C:chips}+#1#{} Fichas, {C:mult}+#2#{} Multi y',
                        'Ganas {C:money}$#3#{} al final de la {C:attention}ronda'
                    },
                    {
                        'Se consume {C:attention}parcialmente{}',
                        'después de esta ronda por',
                        "hasta {C:attention}#4#{} Rondas",
                    },
                }
            },
            j_aij_double_sundae_1 = {
                name = "Sundae Doble",
                text = {
                    {
                        '{C:chips}+#1#{} Fichas y {C:mult}+#2#{} Multi',
                    },
                    {
                        'Se consume {C:attention}parcialmente{}',
                        'después de esta ronda por',
                        "hasta {C:attention}#4#{} Rondas",
                    },
                }
            },
            j_aij_double_sundae_2 = {
                name = "Sundae Doble",
                text = {
                    {
                        '{C:chips}+#1#{} Fichas y Ganas {C:money}$#2#{}',
                        'al final de la {C:attention}ronda'
                    },
                    {
                        'Se consume {C:attention}parcialmente{}',
                        'después de esta ronda por',
                        "hasta {C:attention}#4#{} Rondas",
                    },
                }
            },
            j_aij_double_sundae_3 = {
                name = "Sundae Doble",
                text = {
                    {
                        '{C:mult}+#1#{} Multi y Ganas {C:money}$#2#{}',
                        'al final de la {C:attention}ronda'
                    },
                    {
                        'Se consume {C:attention}parcialmente{}',
                        'después de esta ronda por',
                        "hasta {C:attention}#4#{} Rondas",
                    },
                }
            },
            j_aij_sundae_1 = {
                name = "Sundae",
                text = {
                    {
                        '{C:chips}+#1#{} Fichas',
                    },
                    {
                        'Se consume {C:attention}parcialmente{}',
                        'en esta ronda',
                    },
                }
            },
            j_aij_sundae_2 = {
                name = "Sundae",
                text = {
                    {
                        '{C:mult}+#1#{} Multi',
                    },
                    {
                        'Se consume {C:attention}parcialmente{}',
                        'en esta ronda',
                    },
                }
            },
            j_aij_sundae_3 = {
                name = "Sundae",
                text = {
                    {
                        'Ganas {C:money}$#1#{} al final',
                        "de la {C:attention}ronda"
                    },
                    {
                        'Se consume {C:attention}parcialmente{}',
                        'en esta ronda',
                    },
                }
            },
            j_aij_crypto_trader = {
                name = "Trader Cripto",
                text = {
                    "Prob. de {C:green}#1# en #2#{} de multiplicar",
                    "el {C:money}Interés{} por {C:attention}#3#{}; si no,",
                    "no ganas {C:money}Interés"
                }
            },
            j_aij_semaphore = {
                name = "Semáforo",
                text = {
                    'Las cartas anotadas otorgan {C:mult}+#1#{} Multi',
                    'por cada {C:red}descarte{} restante'
                }
            },
            j_aij_jeremy_bearimy = {
                name = "Jeremy Bearimy",
                text = {
                    '{C:attention}Reactiva{} todos los {C:attention}efectos{}',
                    'que se activan cuando se',
                    '{C:attention}selecciona{} o {C:attention}derrota{} una Ciega'
                }
            },
            j_aij_dark_magician = {
                name = "Mago Oscuro",
                text = {
                    'Las {C:tarot}Cartas de Tarot{}, {C:planet}Cartas de Planeta{},',
                    'y {C:spectral}Cartas Espectrales{} son',
                    '{C:attention}consideradas{} de igual rareza',
                }
            },
            j_aij_numbertaker = {
                name = "El Desnumerador",
                text = {
                    {
                        'Elimina las {C:attention}categorías{} de',
                        'las cartas {C:attention}enumeradas{} anotadas'
                    },
                    {
                        'Este {C:attention}Comodín{} gana {C:mult}multi{} igual',
                        'a las categorías eliminadas',
                        '{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)',
                    }
                }
            },
            j_aij_party_time = {
                name = "¡Hora de Fiesta!",
                text = {
                    'Todos los {C:attention}Comodines{} ganan',
                    '{C:chips}+#1#{} Fichas cuando se',
                    '{C:attention}derrota{} una {C:attention}Ciega{}',
                }
            },
            j_aij_goon_joker = {
                name = "Comodín Matón",
                text = {
                    '{C:mult}#2#{} Multi en la {C:attention}Ciega Jefe{},',
                    '{C:mult}+#1#{} Multi en las demás',
                }
            },
            j_aij_goo_joker = {
                name = "Comodín Pegajoso",
                text = {
                    "Las cartas {C:attention}mejoradas{}",
                    "anotadas otorgan {C:mult}+#1#{} Multi"
                }
            },
            j_aij_eye_test = {
                name = "Prueba de Vista",
                text = {
                    '{C:mult}+#1#{} Multi por {C:attention}mano{}',
                    '{C:attention}consecutiva{} con {C:attention}más{} cartas',
                    'que la mano {C:attention}anterior',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)',
                },
            },
            j_aij_jokey_bear = {
                name = "Oso Comediante",
                text = {
                    {
                        'Si la puntuación de la mano {C:attention}jugada',
                        'excede el {C:attention}requerimiento total',
                        'de la {C:attention}Ciega{}, {X:mult,C:white}X#1#{} Multi',
                        'y ganas {C:money}$#2#{}'
                    },
                    {
                        'Se {C:attention}reactiva{} hasta que la puntuación',
                        'no exceda el {C:attention}requerimiento',
                        '{C:attention}total de la Ciega'
                    }
                }
            },
            j_aij_psycho = {
                name = "Psicópata",
                text = {
                    'Cuando se {C:attention}selecciona{} una Ciega,',
                    '{C:red}destruye{} el Comodín a su {C:attention}izquierda',
                    'y gana {X:mult,C:white}X#1#{} Multi por {C:money}$1{}',
                    'de su valor de {C:money}venta{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{}{C:inactive} Multi){}'
                }
            },
            j_aij_bear = {
                name = "Osezno",
                text = {
                    '{C:mult}+#1#{} Multi por cada {C:money}$5{}',
                    '{C:attention}por debajo{} de {C:money}$#2#',
                    '{C:inactive}(Actualmente {C:mult}+#3#{C:inactive} Multi)',
                }
            },
            j_aij_coconut = {
                name = "Cocomodín",
                text = {
                    'Crea una {C:attention}Etiqueta de Malabares{}',
                    'cuando se {C:money}vende{} este Comodín{}'
                }
            },
            j_aij_tin_man = {
                name = "Hombre de Hojalata",
                text = {
                    'Otorga mejora de {C:attention}Acero{} a todas las cartas',
                    '{C:attention}en mano{} del palo {C:hearts}Corazón{} que',
                    'no tengan mejoras al final de la ronda'
                }
            },
            j_aij_crayon_rubbing = {
                name = "Dibujo de Crayón",
                text = {
                    'Añade {C:chips}fichas{} iguales a la',
                    'suma de los {C:attention}valores{}',
                    '{C:attention}numéricos{} del {C:attention}Comodín',
                    'a su derecha',
                    "{C:inactive}(Actualmente {C:chips}+#1#{} {C:inactive}Fichas)"
                }
            },
            j_aij_doormat = {
                name = "Alfombra de Bienvenida",
                text = {
                    'Otorga una {C:attention}mejora{} al azar',
                    'a la primera carta que saques',
                    'cada {C:attention}ronda{}'
                }
            },
            j_aij_ghosthunter = {
                name = "Cazafantasmas",
                text = {
                    'Las cartas {C:spectral}Espectrales{} #1#',
                    '#2# {C:money}Tienda'
                }
            },
            j_aij_family_tree = {
                name = "Árbol Familiar",
                text = {
                    'Cuando se {C:red}derrota{} la',
                    '{C:attention}Ciega Jefe{}, crea la {C:attention}Etiqueta',
                    'asociada con la {C:attention}Rareza',
                    'del {C:attention}Comodín{} a su {C:attention}derecha'
                }
            },
            j_aij_no_junk_mail = {
                name = "Sin Correo Spam",
                text = {
                    'Los {C:attention}Paquetes Estándar{} en',
                    'la Tienda son {C:money}gratis{}'
                }
            },
            j_aij_over_the_counter = {
                name = "Sin Receta",
                text = {
                    'Al abrir un {C:attention}Paquete',
                    '{C:attention}Potenciador{}, elige {C:attention}#1#{} carta',
                    'de tu {C:attention}baraja{} para sacarla'
                }
            },
            j_aij_happy_as_larry = {
                name = "Felipe Feliz",
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Multi',
                    },
                    {
                        'Prob. de {C:green}#2# en #3#{} de {C:attention}reactivarse{},',
                        'la {C:attention}probabilidad{} disminuye por {C:green}#4#{} en',
                        'cada {C:attention}reactivación{} posterior'
                    }
                }
            },
            j_aij_yin = {
                name = "Yin",
                text = {
                    'Las cartas anotadas de {C:spades}Palos Oscuros{} otorgan {C:mult}+#1#{}',
                    'Multi por cada {C:spades}Palo Oscuro{} {C:attention}único',
                    'en la mano {C:attention}anotada'
                }
            },
            j_aij_yang = {
                name = "Yang",
                text = {
                    'Las cartas anotadas de {C:hearts}Palos Claros{} otorgan {C:mult}+#1#{}',
                    'Multi por cada {C:hearts}Palo Claro{} {C:attention}único',
                    'en la mano {C:attention}anotada'
                }
            },
            j_aij_requiem = {
                name = "Réquiem",
                text = {
                    'Todos los {C:attention}Comodines{} y los',
                    '{C:attention}Paquetes{} de {C:attention}Bufón{} son {C:money}gratis'
                }
            },
            j_aij_haughty_joker = {
                name = "Comodín Arrogante",
                text = {
                    '{C:chips}+#1#{} Fichas si la mano jugada',
                    'contiene una {C:attention}Escalera Real'
                }
            },
            j_aij_imperious_joker = {
                name = "Comodín Imperial",
                text = {
                    '{C:mult}+#1#{} Multi si la mano jugada',
                    'contiene una {C:attention}Escalera Real'
                }
            },
            j_aij_disco_joker = {
                name = "Comodín Disco",
                text = {
                    '{C:attention}Reactiva{} todas las cartas',
                    'anotadas con {C:attention}Ediciones'
                }
            },
            -- NEW
            j_aij_oklo_reactor = {
                name = "Reactador de Oklo",
                text = {
                    '{C:attention}Reactiva{} todas las {C:attention}Cartas',
                    '{C:attention}de Oro{} jugadas {C:attention}#1#{} veces adicionales'
                }
            },
            j_aij_mammon = {
                name = "Mamón",
                text = {
                    '{C:attention}Aumenta{} el pago de las',
                    'cartas {C:money}de Oro{} por {C:money}$#1#{} por carta',
                    '{C:money}de Oro{} anotada esta {C:attention}ronda',
                    '{C:inactive}(Actualmente {C:money}+#2#{C:inactive} Dólares)',
                }
            },
            j_aij_quadrangled_joker = {
                name = "Comodín Cuadrangular",
                text = {
                    'Añade las {C:chips}Fichas{} y el {C:mult}Multi{} de',
                    '{C:attention}Póker{} si la mano jugada',
                    'tiene exactamente {C:attention}4{} cartas',
                    '{C:inactive,s:0.8}(Actualmente {C:chips,s:0.8}+#1#{}{C:inactive,s:0.8} Fichas, {C:mult,s:0.8}+#2#{}{C:inactive,s:0.8} Multi)',
                }
            },
            j_aij_plutonium = {
                name = "Plutonio",
                text = {
                    'Si la mano jugada es {C:attention}Carta más Alta{},',
                    '{C:attention}reactiva{} todas las cartas anotadas{}',
                    '{C:attention}#1#{} veces'
                }
            },
            j_aij_uranium = {
                name = "Uranio",
                text = {
                    'Si la mano jugada es {C:attention}Doble Par{},',
                    '{C:attention}reactiva{} todas las cartas anotadas{}',
                }
            },
            j_aij_quicksilver = {
                name = "Mercurio",
                text = {
                    'Si la mano jugada es un {C:attention}Par{},',
                    '{C:attention}reactiva{} todas las cartas anotadas{}',
                }
            },
            j_aij_neptunium = {
                name = "Neptunio",
                text = {
                    'Si la mano jugada es {C:attention}Escalera de Color{},',
                    '{C:attention}reactiva{} todas las cartas anotadas{}',
                    '{C:attention}#1#{} veces'
                }
            },
            j_aij_copper = {
                name = "Cobre",
                text = {
                    'Si la mano jugada es una {C:attention}Tercia{},',
                    '{C:attention}reactiva{} todas las cartas anotadas{}',
                }
            },
            j_aij_tin = {
                name = "Estaño",
                text = {
                    'Si la mano jugada es un {C:attention}Color{},',
                    '{C:attention}reactiva{} todas las cartas anotadas{}',
                }
            },
            j_aij_abandoned_joker = {
                name = "Comodín Abandonado",
                text = {
                    '{C:red}Destruye{} todas las cartas de {C:attention}figura',
                    'jugadas en la {C:attention}primera mano{} de la ronda'
                }
            },
            j_aij_father_christmas = {
                name = "Papá Noel",
                text = {
                    'Ganas {C:money}$#1#{} cuando se',
                    'anota cualquier carta'
                }
            },
            j_aij_bullet_king = {
                name = "Rey Bala",
                text = {
                    'Los {C:attention}Reyes{} también activan sus',
                    'efectos {C:attention}en mano{} cuando',
                    'son anotados'
                }
            },
            j_aij_jogre = {
                name = "Jogre",
                text = {
                    'Siempre ganas exactamente',
                    '{C:money}$#1#{} al final de la ronda',
                }
            },
            j_aij_christmas_eve = {
                name = "Nochebuena",
                text = {
                    'Crea una {C:attention}Etiqueta de Cupón{} cuando',
                    'se derrotas a la {C:attention}Ciega Grande{}'
                }
            },
            j_aij_desiderium = {
                name = "Desiderium",
                text = {
                    'Gana {X:mult,C:white}X#1#{} Multi al',
                    'salir de la Tienda',
                    '{C:attention}sin{} gastar {C:money}dinero',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}'
                }
            },
            j_aij_diamantaire = {
                name = "Diamantista",
                text = {
                    'Si la mano es un solo {C:diamonds}Diamante{},',
                    'conviértela en {C:attention}Carta de Oro{}',
                    'y gana {C:money}$#1#'
                }
            },
            j_aij_zenzizenzizenzic = {
                name = "Zenzizenzizenzic",
                text = {
                    {
                        '{C:chips}+#1#{} Fichas si la mano anotada',
                        'contiene exactamente {C:attention}4{} cartas'
                    },
                    {
                        'Gana {C:chips}+#2#{} Fichas al activarse, y',
                        'aumenta el {C:attention}escalado{} en {C:attention}+#3#{}'
                    }
                }
            },
            j_aij_nihilartikel = {
                name = "Nihilartikel",
                text = {
                    {
                        '{C:dark_edition}+#1#{} Ranuras de Comodín'
                    },
                    {
                        '{C:red}-$#2#{} al final de la ronda'
                    }
                }
            },
            j_aij_gloaming = {
                name = "Atardecer Crepúscular",
                text = {
                    'Las cartas anotadas otorgan',
                    '{X:mult,C:white}X#1#{} Multi en la {C:attention}última',
                    '{C:attention}mano{} de la ronda'
                }
            },
            j_aij_dandiprat = {
                name = "Dandiprat",
                text = {
                    'Los {C:attention}2s{}, {C:attention}3s{}, {C:attention}4s{} y {C:attention}5s{}',
                    'otorgan {C:money}$#1#{} al anotarse'
                }
            },
            j_aij_clapperdudgeon = {
                name = "Clapperdudgeon",
                text = {
                    '{X:mult,C:white}X#1#{} Multi si tienes',
                    '{C:money}$#2#{} o menos'
                }
            },
            j_aij_quantum_foam = {
                name = "Espuma Cuántica",
                text = {
                    'Las cartas {C:attention}sin mejoradas{} tienen',
                    'una prob. de {C:green}#1# en #2#{} de {C:attention}reactivarse'
                }
            },
            j_aij_bon_vivant = {
                name = "Bon Vivant",
                text = {
                    'Ganas {C:money}$#1#{} después de que',
                    '{C:attention}#3#{}{C:inactive}[#2#]{} cartas hayan sido',
                    'anotadas {C:attention}esta ronda'
                }
            },
            j_aij_slubberdegullion = {
                name = "Slubberdegullion",
                text = {
                    '{C:red}+#1# Descarte{} esta ronda si',
                    'la mano {C:attention}jugada{} contiene',
                    'al menos {C:attention}3{} cartas sin anotar'
                }
            },
            j_aij_tussaud = {
                name = "Tussaud",
                text = {
                    'Gana {X:mult,C:white}X#1#{} Multi por {C:attention}Sello{}',
                    'único en tu {C:attention}baraja{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}'
                }
            },
            j_aij_maguelonne = {
                name = "Maguelonne",
                text = {
                    'Al derrotar una Ciega,',
                    '{C:red}destruye{} una {C:attention}Carta de Figura{}',
                    'al azar restante de tu',
                    'baraja y gana {X:mult,C:white}X#1#{} Multi',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}'
                }
            },
            j_aij_famulus = {
                name = "Famulus",
                text = {
                    'Ganas {C:money}$#1#{} cuando se usa',
                    'una {C:tarot}Carta de Tarot{}'
                }
            },
            j_aij_flibbertigibbit = {
                name = "Flibbertigibbit",
                text = {
                    'Ganas {C:money}$#1#{} por cada palo',
                    '{C:attention}único{} {C:attention}descartado{}'
                }
            },
            j_aij_haggler = {
                name = "Regateador",
                text = {
                    'Las {C:attention}Cartas de Oro{} tienen',
                    'una prob. de {C:green}#1# en #2#{} de',
                    'otorgar {C:money}$#3#{} cuando se {C:attention}descartan'
                }
            },
            j_aij_halter_sack = {
                name = "Halter-sack",
                text = {
                    '{X:mult,C:white}X#3#{} Multi si la mano anota',
                    'al menos {C:attention}4{} cartas,',
                    'se {C:attention}reduce{} en {X:mult,C:white}X#2#{} Multi',
                    'por cada {C:red}descarte{} usado esta ronda',
                }
            },
            j_aij_hallucinaut = {
                name = "Hallucinaut",
                text = {
                    'Gana {X:mult,C:white}X#1#{} Multi cuando se',
                    'compra un {C:attention}Paquete Potenciador{},',
                    '{C:attention}se reinicia{} cuando se',
                    'derrota una {C:attention}Ciega Jefe{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{}{C:inactive} Multi){}'
                }
            },
            j_aij_gummy = {
                name = "Gummy",
                text = {
                    '{C:chips}+#1#{} Fichas',
                    '{C:mult}+#2#{} Multi',
                }
            },
            j_aij_mariachi = {
                name = "Mariachi",
                text = {
                    '{C:mult}+#1#{} Multi por {C:attention}mejora{}',
                    '{C:attention}única{} en tu {C:attention}baraja{}',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)'
                }
            },
            j_aij_dot_matrix = {
                name = "Matriz de Puntos",
                text = {
                    '{C:mult}+#1#{} Multi por cada',
                    '{C:attention}rango{} único restante en la baraja',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)'
                }
            },
            j_aij_barcode = {
                name = "Código de Barras",
                text = {
                    'Los {C:attention}Paquetes Potenciadores{} son',
                    '{C:attention}#1#%{} más baratos'
                }
            },
            j_aij_coryat = {
                name = "Coryat",
                text = {
                    "{C:attention}+#1#{} Ranuras de Tienda",
                    "{C:attention}+#2#{} Ranuras de Potenciadores",
                    "{C:attention}+#3#{} Ranura de Vale",
                },
                unlock = { "?????" }
            },
            j_aij_dongtong = {
                name = "Dongtong",
                text = {
                    {
                        "Aumenta la mayoría de valores de",
                        "los {C:attention}Comodines{} en un {C:green}100%"
                    },
                    {
                        "Duplica la {C:attention}Puntuación{}",
                        "{C:attention}Requerida{} de las {C:attention}Ciegas{}"
                    }
                },
            },
            j_aij_hardy = {
                name = "Hardy",
                text = {
                    "Otorga edición de {C:aij_silver}Plata{} a todas",
                    "las cartas {C:attention}mejoradas{} anotadas"
                },
                unlock = { "?????" }
            },
            j_aij_laurel = {
                name = "Laurel",
                text = {
                    "Gana {X:mult,C:white}X#1#{} Multi por cada carta",
                    "{C:attention}mejorada{} en tu {C:attention}baraja{}",
                    "{C:inactive}(Actualmente{} {X:mult,C:white}X#2#{} {C:inactive}Multi){}"
                },
                unlock = { "?????" }
            },
            j_aij_dicky = {
                name = "Dicky",
                text = {
                    "Al final de la ronda, todas las cartas",
                    'que {C:attention}no{} fueron sacadas',
                    'esta ronda {C:attention}ganan{}',
                    '{X:mult,C:white}X#1#{} Multi {C:attention}permanentemente{}'
                },
                unlock = { "?????" }
            },
            j_aij_bogdonoff = {
                name = "Bogdonoff",
                text = {
                    {
                        'Puedes adquirir hasta',
                        '{C:red}-$#1#{} de deuda'
                    },
                    {
                        'Al salir de la {C:attention}Tienda{},',
                        'deja tu dinero en {C:money}$0{}'
                    }
                },
                unlock = { "?????" }
            },
            j_aij_cairoli = {
                name = "Cairoli",
                text = {
                    "Gana {X:mult,C:white}X#1#{} Multi cuando se",
                    'omite cualquier {C:attention}Paquete Potenciador{}',
                    'o {C:attention}Ciega{}',
                    "{C:inactive}(Actualmente{} {X:mult,C:white}X#2#{} {C:inactive}Multi){}"
                },
                unlock = { "?????" }
            },
            j_aij_xinmo = {
                name = "Xinmo",
                text = {
                    "{C:dark_edition}+#1#{} Ranuras de Comodín,",
                    '{C:red}-#2#{} Tamaño de Mano'
                },
                unlock = { "?????" }
            },
            j_aij_bizco = {
                name = "Bizco",
                text = {
                    "Las {C:attention}#1#{} cartas del",
                    'extremo izquierdo que',
                    'tengas {C:attention}en mano{} anotan'
                },
                unlock = { "?????" }
            },
            j_aij_pablillos = {
                name = "Pablillos",
                text = {
                    "Todas las {C:attention}Etiquetas{} son reemplazadas",
                    'por su equivalente en {C:money}Dorado{}'
                },
                unlock = { "?????" }
            },
            j_aij_melpomene = {
                name = "Melpomene",
                text = {
                    "Las cartas de {C:attention}figura{} anotadas otorgan",
                    '{C:chips}Fichas{} y {C:mult}Multi{} iguales a',
                    'los {C:planet}valores base{} de la',
                    'mano de póker jugada'

                },
                unlock = { "?????" }
            },
            -- NEW
            j_aij_pedestrian = {
                name = "Peatón",
                text = {
                    '{C:attention}Reactiva{} la carta anotada si su',
                    '{C:attention}categoría{} es {C:attention}menor{}',
                    'a la carta {C:attention}anterior{}'
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
                    'Si la mano jugada {C:attention}contiene{} una',
                    '{C:attention}Escalera Real{}, todas las cartas',
                    'jugadas ganan {X:mult,C:white}X#1#{} Multi',
                },
            },
            j_aij_sunny_side = {
                name = "Lado Soleado",
                text = {
                    "Cuando se gana {C:money}dinero{},",
                    "este {C:attention}Comodín{} gana",
                    "{C:attention}el doble{} de ese {C:money}dinero{} como",
                    "valor de venta, y {C:red}resta{}",
                    "el {C:money}dinero{} obtenido"
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
            j_aij_mike_check = {
                name = "Mike Check",
                text = {
                    "Crea un {C:attention}Comodín{} {C:uncommon}Inusual{} al azar",
                    "cada {C:attention}#1#{} Comodines vendidos",
                    "{C:inactive}({C:attention}#2#{}{C:inactive}/#1#)"
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
            j_aij_cloudwatching = {
                name = "Observador de Nubes",
                text = {
                    "{C:attention}+#1# Elección de Etiqueta{}",
                    "en la omisión de {C:attention}Ciegas{}"
                }
            },
            j_aij_pinhead = {
                name = "Cabeza de Pino",
                text = {
                    "Ganas {C:money}$#1#{} si la {C:attention}Ciega{} es",
                    "es derrotada con {C:attention}1{} {C:blue}mano{}",
                },
            },
            j_aij_pure_baseball_card = {
                name = "Tarjeta de Béisbol Pura",
                text = {
                    "Los {C:attention}Comodines{} {C:uncommon}Inusuales{} y {C:rare}Raros{}",
                    "ganan {X:mult,C:white}X#1#{} Multi cuando una {C:attention}Ciega{} es",
                    "{C:attention}derrotada{}"
                }
            },
            j_aij_phoney_baloney = {
                name = "Chorizo Embustero",
                text = {
                    "Otorga {C:attention}#2#{} {C:green}renovaciones{} gratis al",
                    "inicio de cada {C:attention}Apuesta{},",
                    "{C:attention}consumido{} al llegar a",
                    "{C:attention}0{} {C:green}renovaciones{} {C:inactive}({C:attention}#1#{C:inactive} Restantes)"
                }
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
            j_aij_saucy_jacky = {
                name = "Jacky el Atrevido",
                text = {
                    {
                        "{C:red}Destruye{} todas las {C:attention}Reinas{} anotadas",
                    },
                    {
                        "Las {C:attention}Jotas{} anotadas otorgan {C:mult}+#2#{} Multi",
                        "por cada {C:attention}Reina{} {C:red}destruida{} así",
                        "{C:inactive}(Actualmente {C:mult}+#1#{} {C:inactive}Multi){}"
                    }
                }
            },
            j_aij_petrushka = {
                name = "Petrushka",
                text = {
                    "Otorga igual {C:mult}+Multi{} a las",
                    "{C:attention}categorías{} anotadas",
                    "{C:inactive,s:0.8}(A=14, K=13, Q=12, J=11)"
                },
            },
            j_aij_peeping_tom = {
                name = "Mario Mirón",
                text = {
                    "Revela las siguientes {C:attention}#1#{}",
                    "cartas en tu baraja"
                }
            },
            j_aij_pigpen = {
                name = "Pigpen",
                text = {
                    "Otorga {C:chips}Fichas{} iguales al número",
                    "de veces que se ha jugado la",
                    "{C:attention}mano de póker{}, multiplicado por su {C:attention}nivel{}"
                }
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
                    "comprado un {C:attention}Vale{}",
                    "esta {C:attention}Apuesta{}",
                    "{C:inactive}#2#{}",
                }
            },
            j_aij_kuruko = {
                name = "Kuruko",
                text = {
                    "Las cartas anotadas otorgan {C:mult}+#1#{} Multi",
                    "por cada carta con la misma",
                    "{C:attention}categoría{} en tu {C:attention}baraja{}"
                }
            },
            j_aij_mixel_perfect = {
                name = "Comodín Mixel",
                text = {
                    "{C:mult}+#1#{} Multi si la",
                    "{C:attention}mano anotada{} contiene un",
                    "número {C:attention}impar{} de cartas",
                },
            },
            j_aij_slippery_when_wet = {
                name = "Piso Mojado",
                text = {
                    "Las cartas anotadas otorgan {C:chips}Fichas{}",
                    "iguales a la {C:attention}categoría{}",
                    "de las cartas {C:attention}adyacentes{}"
                }
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
            j_aij_bucolic_hills = {
                name = "Colinas Bucólicas",
                text = {
                    'Gana {C:money}$#1#{} al jugar',
                    'la {C:attention}última mano{} de la ronda'
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
            j_aij_the_artist = {
                name = "El Artista",
                text = {
                    "{C:attention}+#1#{} límite de selección para",
                    "las cartas de {C:tarot}Tarot{}"
                }
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
            j_aij_red_wine = {
                name = "Vino Tinto",
                text = {
                    "La {C:attention}primera{} carta anotada",
                    "en cada {C:attention}mano{} se vuelve",
                    "de {C:hearts}Corazones{}",
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
            j_aij_heavy_sixer = {
                name = "Seis Pesado",
                text = {
                    "Aplica {C:dark_edition}Holográfico{} a",
                    "todos los {C:attention}6s{} anotados"
                }
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
            j_aij_big_ears = {
                name = "Comodín Orejón",
                text = {
                    "Gana {C:chips}+#2#{} Fichas cuando se anota",
                    "una carta {C:attention}par{}, {C:red}-#3#{} Fichas cuando",
                    "se anota una carta {C:attention}impar{}",
                    "{C:inactive}(Actualmente {C:chips}+#1#{} {C:inactive}Fichas)"
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
                    "en cartas de {C:attention}figura{} se {C:green}duplican"
                }
            },
            j_aij_j_file = {
                name = "Archivos-J",
                text = {
                    "Al inicio de la {C:attention}ronda{},",
                    "busca {C:attention}#1#{} carta de tu",
                    "{C:attention}baraja{} a tu mano"
                }
            },
            j_aij_clay_joker = {
                name = "Comodín de Arcilla",
                text = {
                    "Copia las habilidades de los",
                    "últimos {C:attention}#1#{} {C:attention}comodines{} {C:red}destruidos{}",
                    "{C:inactive}(Excluyendo Comodín de Arcilla){}"
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
            j_aij_joker_baby = {
                name = "Comodín Bebé",
                text = {
                    "Las cartas anotadas {C:attention}2s{}, {C:attention}3s{}, {C:attention}4s{}, y {C:attention}5s{}",
                    "obtienen {C:mult}+#1#{} Multi",
                }
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
                    "{C:aij_plasma}Equilibra{} las {C:chips}Fichas{} y {C:mult}Multi{}",
                    "{C:attention}base{} de la {C:attention}mano{} jugada",
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
            j_aij_gematria = {
                name = "Gematria",
                text = {
                    "{C:mult}+#1#{} Multi si la {C:attention}mano jugada{} es",
                    "mencionada por uno de tus",
                    "{C:attention}Comodines",
                    "{C:inactive}({C:mult}+#2#{C:inactive} Multi)"
                }
            },
            j_aij_spectre = {
                name = "Aparación",
                text = {
                    "Al derrotar la {C:attention}Ciega Jefe{},",
                    "reemplaza tus {C:attention}consumibles{}",
                    "con cartas {C:spectral}Espectrales{}",
                }
            },
            j_aij_stave = {
                name = "Stave",
                text = {
                    "Cuando un Comodín con una {C:dark_edition}Edición{}",
                    "es {C:money}vendido{}, otorga su {C:dark_edition}Edición{} a",
                    "un {C:attention}Comodín{} sin edición al azar",
                    "{C:inactive}(Si es posible)",
                    "{C:inactive}(Excepto Negativo)"
                }
            },
            j_aij_postcard_from_perdition_trail = {
                name = "Postal del Sendero de la Perdición",
                text = {
                    "Todas las cartas anotadas con {C:attention}sellos{} tienen",
                    "sus sellos {C:red}removidos{} y este Comodín",
                    "gana {X:mult,C:white}X#2#{} Multi por cada",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Multi)"
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
            j_aij_duende = {
                name = "Duende",
                text = {
                    "Gana {C:money}$#2#{} al final de la ronda",
                    "por cada ranura de {C:attention}Comodín{} vacía",
                    "{C:inactive}(Excepto Duende)",
                    "{C:inactive}(Actualmente {C:money}$#1#{C:inactive})"
                }
            },
            j_aij_curse_of_scotland = {
                name = "Maldición de Escocia",
                text = {
                    "Si la {C:attention}primera mano{} de la ronda",
                    "es exactamente {C:attention}una{} carta, conviértela",
                    "en un {C:attention}9{} de {C:diamonds}Diamantes{}"
                }
            },
            j_aij_czar = {
                name = "Czar",
                text = {
                    {
                        'Este Comodín copia la',
                        'habilidad de un {C:attention}Comodín{} descubierto',
                        'al azar de tu {C:attention}colección{},',
                        'el Comodín copiado {C:attention}cambia{} cuando',
                        'al {C:green}renovada{} la {C:money}Tienda{}'
                    }
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
            j_aij_second_tier_meme = {
                name = "Meme de Segunda",
                text = {
                    "Si la mano es tu {C:attention}segunda{}",
                    "{C:attention}más{} jugada,",
                    "{C:attention}reactiva{} todas las cartas {C:attention}anotadas{}",
                    "{C:inactive}({C:attention}#1#{C:inactive})"
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
            j_aij_tumbler = {
                name = "Tumbler",
                text = {
                    "{X:mult,C:white}X#1#{} Multi, pierde {X:mult,C:white}X#2#{} Multi",
                    "cuando se {C:attention}selecciona{} una carta"
                }
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
            j_aij_vesti_la_guibba = {
                name = "Vesti la Giubba",
                text = {
                    "Si la {C:attention}mano jugada{} contiene",
                    "una {C:attention}Escalera{}, crea un",
                    "{C:attention}Comodín{} {C:common}Común{} o {C:uncommon}Inusual{} al azar",
                    "{C:inactive}(Debe haber espacio)"
                }
            },
            j_aij_valentine = {
                name = "Mi Valentín",
                text = {
                    '{X:mult,C:white}X#1#{} Multi por cada {C:attention}par único{}',
                    'en la mano anotada'
                }
            },
            j_aij_vecchio_dolore = {
                name = "Vecchio Dolore",
                text = {
                    {
                        'En la próxima {C:green}renovación{}, crea',
                        'copias {C:dark_edition}Negativas{} de todos los',
                        'artículos ofrecidos en la {C:money}Tienda{}',
                        'antes de renovar',
                    },
                    {
                        'En la siguiente {C:green}renovación{}, crea',
                        'un {C:attention}Comodín{} al azar que',
                        'tiene la misma {C:attention}rareza{} que',
                        'el {C:attention}Comodín{} más barato',
                    },
                },
            },
            j_aij_guiser = {
                name = "Cuentista", -- It was hard to get a good translation for this
                text = {
                    "Otine {C:money}$#1#{} a su",
                    "{C:attention}valor de venta{} cuando se",
                    "usa una carta de {C:tarot}Tarot{}",
                },
            },
            j_aij_mummer = {
                name = "Mummer",
                text = {
                    "Reactiva todas las {C:attention}Cartas de",
                    "Acero{} en mano una vez por cada",
                    "{C:attention}Carta de Acero{} en la mano anotada",
                }
            },
            j_aij_mushroom_cloud = {
                name = "Nube de Hongo",
                text = {
                    "{B:1,C:white,s:0.8}Habilidad Activable",
                    "{C:red}Destruye{} todos los {C:attention}Comodines{}",
                    "y gana {C:money}$#1#{}"
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
            j_aij_tonpraten = {
                name = "Tonpraten",
                text = {
                    "{C:mult}+#1#{} Multi, {C:attention}siempre{}",
                    "se {C:attention}activa{} al final"
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
            j_aij_arlecchina = {
                name = "Arlecchina",
                text = {
                    "Gana {X:mult,C:white}X#2#{} Multi cuando se",
                    "{C:attention}omite{} un {C:attention}Paquete de Bufón{}",
                    "o {C:attention}Paquete Estándar{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{C:inactive} Multi)"
                }
            },
            j_aij_arecibo_message = {
                name = "Arecibo",
                text = {
                    "{C:attention}Reactiva{} todas las",
                    "cartas si tienes la",
                    "{C:planet}Carta de Planeta{}",
                    "de la {C:attention}mano{} jugada"
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
                    'Este Comodín gana {C:chips}+#1#{} Fichas',
                    'cuando se {C:attention}destruye{} una carta de {C:attention}figura{}',
                    '{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)',
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
                    {
                        'Obtiene {X:mult,C:white}X#1#{} Multi',
                        'cuando una mano sube de nivel',
                        '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}',
                    },
                    {
                        '{C:attention}Se reinicia{} cuando la misma',
                        '{C:attention}mano{} sube de nivel',
                        'dos veces seguidas',
                        '{C:inactive}(Última mano subida: {C:attention}#3#{C:inactive}){}',
                    },
                },
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
            j_aij_the_jolly = {
                name = "El Jolly",
                text = {
                    'Si la mano jugada {C:attention}contiene{} una',
                    '{C:attention}Escalera de Color{}, se anota',
                    'con niveles adicionales iguales',
                    'a los niveles {C:attention}combinados{} de',
                    '{C:attention}Color{} y {C:attention}Escalera'
                }
            },
            j_aij_the_treachery_of_jokers = {
                name = "Comodin Traidor",
                text = {
                    '{X:mult,C:white}X#1#{} Multi, va en tu',
                    'ranura de {C:attention}consumibles{}'
                }
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
            j_aij_rock_n_roll_clown = {
                name = "Payaso de Rock n' Roll",
                text = {
                    "Las cartas anotadas otorgan {C:chips}+#1#{} Fichas",
                    "por {C:attention}nivel{} de {C:attention}todas{} las manos",
                    "de {C:attention}póker{} {C:attention}combinadas",
                    "{C:inactive}(Actualmente {C:chips}+#2#{C:inactive} Fichas)"
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
                    'cartas jugadas con',
                    'un {C:red}Sello Rojo{} {C:attention}#1#{} vez',
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
                    "Todas las {C:attention}mejoras únicas{} en",
                    "la {C:attention}mano jugada{} dan {X:mult,C:white}X#1#{} Multi",
                    "al ser anotadas"
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
                    "Las {C:attention}Jotas{} no pueden ser",
                    "{C:red}debilitadas{}, {C:red}volteadas{} o {C:red}marcadas{}",
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
            j_aij_dendroglyph = {
                name = "Dendroglifo",
                text = {
                    "Las {C:attention}Cartas de Madera{} anotadas",
                    "otorgan {C:mult}+#1#{} Multi por",
                    "{C:attention}Carta de Madera{} en mano"
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
            j_aij_lonely_night = {
                name = "Noche Solitaria",
                text = {
                    '{C:attention}Reactiva{} todas las cartas anotadas',
                    'si al menos una ranura de {C:attention}Comodín{}',
                    'está {C:attention}vacía'
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
                    "Al seleccionar un {C:attention}Ciega{},",
                    "hay una prob. de {C:green}#1# en #2#{} de",
                    "obtener su {C:attention}Etiqueta{}",
                } 
            },
            -- Page 11
            j_aij_bearded_joker = {
                name = "Comodín Barbudo",
                text = {
                    "{C:mult}+#1#{} Multi por cada carta",
                    "{C:attention}Mejorada{} en tu {C:attention}baraja{}",
                    "{C:inactive}(Actualmente {C:mult}+#2#{} {C:inactive}Multi)",
                }
            },
            j_aij_bobblehead = {
                name = "Cabeza Saltarina",
                text = {
                    "Los {C:attention}Comodines{} de tu",
                    "{C:attention}rareza más común{} {C:inactive}(excluyendo",
                    "{C:inactive}Cabeza Saltarina){} aparecen más seguido",
                    "{C:inactive}(Actualmente: {C:attention}#1#{C:inactive})"
                }
            },
            j_aij_bowls_of_joy = {
                name = "Bowls of Joy",
                text = {
                    "Al {C:green}renovar{} la {C:attention}Tienda{},",
                    "prob. {C:green}#1# en #2#{} de ganar",
                    "{C:money}valor de venta{} igual al",
                    "coste de {C:green}renovar{}"
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
                    "Hay {C:attention}dos{} {C:attention}Etiquetas{} al azar",
                    "disponibles para comprar en cada {C:money}Tienda{}",
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
            j_aij_toynbee_joker = {
                name = "Comodín Toynbee",
                text = {
                    "Crea una {C:planet}Carta de Planeta{} para",
                    "la primera {C:attention}mano de póker{} jugada",
                    "de la ronda cuando la Ciega es {C:attention}derrotada",
                    "{C:inactive}(Actualmente {C:attention}#1#{C:inactive}){}",
                    "{C:inactive}(Debe haber espacio){}"
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
                    "{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi{})",
                    "{C:inactive,s:0.8}(Mínimo {X:mult,C:white,s:0.8}X1{} {C:inactive,s:0.8}Multi){}",
                }
            },
            j_aij_great_white_north = {
                name = "El Gran Norte Blanco",
                text = {
                    "Las cartas jugadas otorgan {C:mult}+#1#{} Multi",
                    "cuando son {C:attention}anotadas{}"
                }
            },
            j_aij_truhan = {
                name = "Truhan",
                text = {
                    "Cuando un Comodín es {C:money}vendido{}",
                    "o {C:red}destruido{}, Gana {X:mult,C:white}X#2#{} Multi por cada",
                    "{C:attention}ronda{} superada con ese {C:attention}Comodín{}",
                    "{C:inactive}(Actualmente {X:mult,C:white}X#1#{} {C:inactive}Multi)",
                }
            },
            j_aij_trophy_kill = {
                name = "Trofeo de Caza",
                text = {
                    "{X:mult,C:white}X#1#{} Multi después de que los {C:attention}#2# de",
                    "{C:attention}#3#{} hayan sido {C:red}destruidos{}",
                    "{C:inactive}#4#"
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
            j_aij_circle_joker = {
                name = "Comodín Circular",
                text = {
                    '{X:mult,C:white}X#1#{} Multi si cada {C:attention}categoría{}',
                    "en la mano anotada es {C:attention}menor{}",
                    "que la {C:attention}anterior{}"
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
            j_aij_the_house_that_jack_built = {
                name = "La Casa de Jota",
                text = {
                    "Las {C:attention}Jotas{} anotadas otorgan {C:chips}Fichas{} y {C:mult}Multi{}",
                    "iguales al {C:planet}nivel{} de {C:attention}Full House{}"
                }
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
            j_aij_one_little_duck = {
                name = "Un Patito",
                text = {
                    "Gana {C:mult}+#2#{} Multi por cada",
                    "{C:attention}2{} que es {C:attention}jugado{}",
                    "pero sin {C:attention}anotar{}",
                    "{C:inactive}(Actualmente {C:mult}+#1#{} {C:inactive}Multi)"
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
            j_aij_totem_pole = {
                name = "Totem de Movimiento",
                text = {
                    '{C:attention}Mezcla{} los Comodines antes',
                    'de anotar, {X:mult,C:white}X#1#{} Multi'
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
            j_aij_error_404 = {
                name = "Error 404",
                text = {
                    '{C:attention}Copia{} la habilidad de',
                    'un {C:attention}Comodín{} al azar',
                    '{C:attention}Cambia{} cada mano',
                    "{C:inactive}(Actualmente: {C:attention}#1#{C:inactive})"
                },
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
                }
            },
            j_aij_funny_phone = {
                name = "Teléfono Gracioso",
                text = {
                    "Gana entre {C:chips}+#3# y #2#{} Fichas",
                    "al {C:green}renovar{} la {C:attention}Tienda{}",
                    "{C:inactive}(Actualmente {C:chips}+#1#{} {C:inactive}Fichas){}"
                }
            },
            j_aij_witchfinder = {
                name = "Cazador de Brujas",
                text = {
                    "Agrega {C:attention}#1#{} {C:tarot}Paquete Arcano{}",
                    "en cada la {C:money}Tienda{}",
                }
            },
            j_aij_warhol = {
                name = "Warhol",
                text = {
                    "Los {C:attention}Sellos{} tienen los efectos de los",
                    "sellos {C:blue}Azul{}, {C:money}Oro{}",
                    "y {C:purple}Morado{} simultáneamente",
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
            j_aij_stock_photo = {
                name = "Foto de Stock",
                text = {
                    {
                        "Abre un {C:attention}Mega Paquete Estándar{}",
                        "al entrar a la {C:money}Tienda{}",
                    },
                    {
                        "Prob. {C:green}#1# en #2#{} de",
                        "{C:red}autodestruirse{} si {C:attention}omites{}",
                    }
                }
            },
            j_aij_enraging_photo = {
                name = "Foto Enfurecedora",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si algún {C:attention}Comodín{},",
                    "{C:attention}consumible{}, o {C:attention}carta de juego{} ha sido",
                    "{C:money}vendido{} o {C:red}destruido{} esta ronda",
                    "{C:inactive}#2#"
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
            j_aij_jpeg = {
                name = "Comodin.jpeg",
                text = {
                    "Si la {C:attention}primera mano{} de la ronda",
                    "no contiene {C:attention}ningún{} palo repetido,",
                    "mejora a {C:attention}Versátiles{} todas las cartas",
                    "anotadas {C:attention}sin mejoras{}"
                }
            },
            j_aij_fuzzy_joker = { 
                name = "Comodín Difuso",
                text = {
                    '{C:mult}Redondea{} el Multi al',
                    'siguiente múltiplo de {C:attention}#1#{}',
                },
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
            j_aij_theyre_laughing_at_you = {
                name = "Se Rien de Ti...",
                text = {
                    "Cuando la {C:attention}Ciega Jefe{} es derrotada, otorga",
                    "edición {C:dark_edition}Negativa{} a un",
                    "{C:attention}Comodín{} {C:common}Común{} al azar"
                }
            },
            j_aij_opening_move = { 
                name = "Jugada Inicial", 
                text = { 
                    {
                        "Gana {X:mult,C:white}X#1#{} Multi por cada",
                        "carta {C:attention}jugada{} en la",
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
                    "Prob. de {C:green}#1# en #2#{} de",
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
                    "{C:green}probabilidades{} en {C:attention}#1#{}",
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
                    'Obtiene {X:mult,C:white}X#1#{} Multi',
                    'por cada {C:attention}Comodín{} que poseas',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)',
                },
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
                    "Otorga edición {C:attention}Polícroma{} a la",
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
            j_aij_candy_wrapper = {
                name = "Envoltura de Caramelo",
                text = {
                    '{C:mult}+#1#{} Multi por cada {C:money}$1{} de',
                    '{C:money}valor de venta{} de todos los',
                    '{C:attention}consumibles{} que poseas',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)',
                }
            },
            j_aij_stargazy_pie = { 
                name = "¿Pie de Atún?", 
                text = { 
                    "Reactiva las siguientes {C:attention}#1#{}",
                    "cartas de {C:planet}Planeta{}",
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
                        "Selecciona {C:attention}+#1#{} carta adicional",
                        "en los Paquetes {C:planet}Celestiales{} ",
                    },
                    {
                        "Las cartas de {C:planet}Planeta{} se",
                        "reemplazan por su variante",
                        "de {C:mult}Multi{} en apuestas {C:attention}impares{}",
                        "y su variante de {C:chips}Fichas{}",
                        "en apuestas {C:attention}pares{}",
                    },
                },
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
                },
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
            j_aij_crop_circle = {
                name = "Círculo de Cosecha",
                text = {
                    'Añade una {C:attention}mejora al azar',
                    'a {C:attention}#1# cartas{} al azar en mano',
                    'cuando se usa una carta de {C:planet}Planeta{}'
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
                    'Cuando cualquier Comodín se',
                    '{C:red}destruye{}, crea una',
                    "{C:attention}copia{} exacta{}",
					'{C:inactive}(Debe haber espacio){}',
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
                    "después de que los otros",
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
                    "Los {V:1}#3#s{} anotados",
                    "otorgan {X:mult,C:white}X#1#{} Multi,",
                    "aumenta en {X:mult,C:white}X#2#{} Multi",
                    "cuando anotas un {V:1}#3#{}",
                    "{s:0.8,C:inactive}(El palo cambia al final de la ronda)"
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
                    'Todas las cartas cuentan',
                    'como {C:attention}todos los palos{}',
                },
                unlock = { 
                    "?????" 
                } 
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
                    "crea {C:attention}dos{} Comodines",
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
            j_aij_a_v_g_m = {
                name = 'A.V.G.M',
                text = {
                    '{B:1,C:white,s:0.8}Habilidad Activable',
                    'Gasta {C:money}$#3#{} por una prob. de {C:green}#1# en #2#{}',
                    'de crear al azar un {C:attention}Comodín{} ,',
                    '{C:attention}consumible{}, {C:attention}carta de juego{},',
                    'o {C:attention}etiqueta{}',
                },
            },
            j_aij_aluzinnu = {
                name = 'Aluzinnu',
                text = {
                    'Los vales {C:attention}Jeroglífico{} y {C:attention}Petroglifo{}',
                    'no tienen {C:red}desventajas{} y',
                    'pueden aparecer {C:attention}varias{} veces',
                },
            },
            j_aij_ambrosius = {
                name = 'Ambrosio',
                text = {
                    'Los {C:tarot}Paquetes Arcanos{} tienen {C:attention}#3#{} opciones más,',
                    'una prob. de {C:green}#1# en #2#{} de {C:attention}aumentar{} en {C:attention}#4#',
                    'si la {C:attention}mano jugada{} contiene solo',
                    '{C:attention}Reyes{} de {C:paperback_crowns}Coronas{}',
                },
            },
            j_aij_anagraph = {
                name = 'Anágrafo',
                text = {
                    'Cuando un {C:attention}Comodín{} o {C:attention}carta de juego{}',
                    'se {C:money}venda{} o {C:red}destruya{}',
                    "crea una {C:attention}copia{} exacta y",
                    'la {C:red}destruye{} de inmediato',
                }
            },
            j_aij_blacklight = {
                name = 'Blacklight',
                text = {
                    '{C:attention}+#1#{} tamaño de mano en Apuestas {C:attention}pares{}',
                    '{C:inactive}(Actualmente {C:attention}+#2#{} {C:inactive}tamaño de mano){}',
                },
            },
            j_aij_cerium = {
                name = 'Cerio',
                text = {
                    'Si la mano jugada es un {C:attention}Full de Color{},',
                    '{C:attention}reactiva{} todas las cartas {C:attention}#1#{} veces',
                },
            },
            j_aij_chipped_joker = {
                name = 'Comodín Astillado',
                text = {
                    'Cuando se anota una {C:attention}Carta de Piedra{}',
                    'pierde {C:red}-#1#{} Fichas y este',
                    '{C:attention}Comodín{} gana {C:chips}+#1#{} Fichas',
                    '{C:inactive}(Actualmente {C:chips}+#2#{} {C:inactive}Fichas)',
                },
            },
            j_aij_chocolate_coins = {
                name = 'Monedas de Chocolate',
                text = {
                    {
                    'Este {C:attention}Comodín{} gana {X:mult,C:white}X#1#{} Multi',
                    'cuando una carta se mejora a',
                    '{C:attention}Oro{}, pierde {X:mult,C:white}X#2#{} Multi',
                    'cuando se gana {C:money}dinero{}',
                    'durante una {C:attention}Ciega{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}El Diablo{} al obtenerse',
                        '{C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_clay_credits_joker = {
                name = 'Clay',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_coffee_thermos = {
                name = 'Termo de Café',
                text = {
                    '{C:attention}Reactiva{} todos los efectos',
                    '{C:attention}en mano{} durante las próximas',
                    '{C:attention}#1#{} rondas',
                },
            },
            j_aij_conboi_credits_joker = {
                name = 'Conboi',
                text = {
                    '{C:inactive}"Skibby Dee"',
                },
            },
            j_aij_cool_joker = {
                name = 'Cool Joker',
                text = {
                    '{B:1,C:white,s:0.8}Habilidad Activada',
                    '{V:1}Activa{} este {C:attention}Comodín{} cuando',
                    '{C:attention}normalmente{} anotaría',
                    '{X:mult,C:white}X#1#{} Multi',
                },
            },
            j_aij_embroidery = {
                name = 'Bordado',
                text = {
                    {
                        'Las {C:attention}Cartas de Lienzo{} dan {C:mult}+#2#',
                        'Multi si tienen {C:attention}categoría{}',
                    },
                    {
                        'Las {C:attention}Cartas de Lienzo{} dan {C:chips}+#1#',
                        'Fichas si {C:red}no{}',
                        'tienen {C:attention}categoría{}',
                    },
                },
            },
            j_aij_farceur = {
                name = 'Farceur',
                text = {
                    '{B:1,C:white,s:0.8}Habilidad Activada',
                    'Paga {C:money}$#1#{} para otorgar',
                    'a este Comodín {X:mult,C:white}X#3#{} Multi',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}',
                },
            },
            j_aij_first_draft = {
                name = 'Primer Borrador',
                text = {
                    'Copia la habilidad del',
                    '{C:attention}Comodín{} de la izquierda',
                },
            },
            j_aij_four_leaf_clover = {
                name = 'Trébol de Cuatro Hojas',
                text = {
                    '{C:attention}#1#%{} de prob. de aumentar la',
                    '{C:attention}rareza{} de los Comodines en la {C:money}Tienda{}',
                    'El porcentaje equivale al número de',
                    '{C:attention}4{} en tu {C:attention}Baraja{}',
                },
            },
            j_aij_furbo_e_stupido = {
                name = 'Furbo e Stupido',
                text = {
                    'Las cartas {C:attention}Discalculares{} también',
                    'cuentan como {C:attention}Ases{} y {C:attention}Jotas{}',
                },
            },
            j_aij_gille = {
                name = 'Gille',
                text = {
                    'Puede {C:attention}renovar{} las {C:attention}Etiquetas{} disponibles',
                },
            },
            j_aij_glass_delusion = {
                name = 'Ilusión de Vidrio',
                text = {
                    'Cuando se rompe una {C:attention}Carta de Vidrio{},',
                    'una prob. de {C:green}#1# en #2#{} de',
                    'añadir {C:attention}dos copias{} de ella a',
                    'tu baraja',
                },
            },
            j_aij_headache = {
                name = 'Dolor de Cabeza',
                text = {
                    '{C:mult}+#2#{} Multi',
                    '{C:attention}+$#1#{} costo de {C:green}renovación{}',
                },
            },
            j_aij_imperial_bower = {
                name = 'Imperial Bower',
                text = {
                    '{C:attention}Primera carta{} sacada',
                    'cada ronda cuenta como',
                    '{C:attention}cualquier{} categoría y palo',
                    '{C:inactive}(Las categorías no pueden formar manos de póker)',
                },
            },
            j_aij_in_memorium = {
                name = 'In Memoriam',
                text = {
                    {
                        'Este {C:attention}Comodín{} gana',
                        '{X:mult,C:white}X#1#{} Multi cada vez que se abre',
                        'un {C:spectral}Paquete Espectral{}',
                        '{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)',
                    },
                    {
                        'Tras obtener este {C:attention}Comodín{},',
                        'un {C:attention}paquete{} en la próxima {C:money}Tienda{}',
                        'será un {C:spectral}Paquete Espectral{}',
                    },
                },
            },
            j_aij_infuriating_note_2 = {
                name = 'Infuriating Note',
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Multi',
                        'Pueden aparecer copias {C:dark_edition}Negativas{}',
                        'de este Comodín en la {C:attention}Tienda{}',
                        'y los {C:attention}Paquetes de Comodines{}',
                    },
                    {
                        '{C:inactive}"Algunos paquetes son rojos,',
                        '{C:inactive}pero más de ellos azules;',
                        '{C:inactive}no importa lo que traigan,',
                        '{C:inactive}te los robaré a ti!',
                        '{C:inactive}',
                        '{C:inactive,s:0.8}¡Gracias por las cosas, comodín! -R. R.{}',
                    },
                },
            },
            j_aij_infuriating_note_3 = {
                name = 'Infuriating Note',
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Multi',
                        'Pueden aparecer copias {C:dark_edition}Negativas{}',
                        'de este Comodín en la {C:attention}Tienda{}',
                        'y los {C:attention}Paquetes de Comodines{}',
                    },
                    {
                        '{C:inactive}Lo que daría',
                        '{C:inactive}por ver la cara que pones.',
                        '{C:inactive}Pediste un objeto,',
                        '{C:inactive}y hallaste esta nota en su lugar!',
                        '{C:inactive}',
                        '{C:inactive,s:0.8}Gracias por tu constante apoyo{}',
                        '{C:inactive,s:0.8}¡Jujujujujulu...! -R. R.{}',
                    },
                },
            },
            j_aij_infuriating_note_4 = {
                name = 'Infuriating Note',
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Multi',
                        'Pueden aparecer copias {C:dark_edition}Negativas{}',
                        'de este Comodín en la {C:attention}Tienda{}',
                        'y los {C:attention}Paquetes de Comodines{}',
                    },
                    {
                        '{C:inactive}Debería matarte,',
                        '{C:inactive}pero no sería difícil;',
                        '{C:inactive}así que por una risa,',
                        '{C:inactive}¡robé tu carta!',
                        '{C:inactive}',
                        '{C:inactive,s:0.8}¡Buena suerte, tonto! -R. R.{}',
                    },
                },
            },
            j_aij_infuriating_note_5 = {
                name = 'Infuriating Note',
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Multi',
                        'Pueden aparecer copias {C:dark_edition}Negativas{}',
                        'de este Comodín en la {C:attention}Tienda{}',
                        'y los {C:attention}Paquetes de Comodines{}',
                    },
                    {
                        '{C:inactive}Si llegaras a encontrarme,',
                        '{C:inactive}te haría arrodillar.',
                        '{C:inactive}Eres solo un roedor,',
                        '{C:inactive}y yo soy el Gran Queso! -R. R.',
                    },
                },
            },
            j_aij_infuriating_note_6 = {
                name = 'Infuriating Note',
                text = {
                    {
                        '{X:mult,C:white}X#1#{} Multi',
                        'Pueden aparecer copias {C:dark_edition}Negativas{}',
                        'de este Comodín en la {C:attention}Tienda{}',
                        'y los {C:attention}Paquetes de Comodines{}',
                    },
                    {
                        '{C:inactive}Quieres una salida,',
                        '{C:inactive}pero aún no sabes lo bastante;',
                        '{C:inactive}el camino es para ti,',
                        '{C:inactive}¡así que no hagas trampa en la red! -R. R.',
                    },
                },
            },
            j_aij_invisible_man = {
                name = 'Invisible Man',
                text = {
                    'Todas las {C:attention}cartas de figura{} cuentan como',
                    '{C:attention}Reyes{}, {C:attention}Reinas{} y {C:attention}Jotas{}',
                    '{C:inactive}(Excepto para formar manos de póker)',
                },
            },
            j_aij_iron = {
                name = 'Hierro',
                text = {
                    'Si la mano jugada es {C:attention}Cuarteto{},',
                    '{C:attention}reactiva{} todas las cartas que anotan',
                },
            },
            j_aij_isonomic_joker = {
                name = 'Isonomic Joker',
                text = {
                    'Las cartas jugadas con palo {C:paperback_stars}Estrella',
                    'tienen una prob. de {C:green}#1# en #2#{}',
                    'de crear un',
                    '{C:attention}Consumible{} al azar al',
                    'anotarse',
                    '{C:inactive}(Debe haber espacio){}',
                },
            },
            j_aij_jawbreaker = {
                name = 'Rompe Mandíbulas',
                text = {
                    {
                    'Este {C:attention}Comodín{} gana {X:mult,C:white}X#1#{} Multi',
                    'cuando una carta se mejora a',
                    '{C:attention}Piedra{}, pierde {X:mult,C:white}X#2#{} Multi si',
                    'la mano jugada no contiene',
                    'ninguna {C:attention}carta sin anotar{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}La Torre{} al obtenerse',
                        '{C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_liquorice = {
                name = 'Regaliz',
                text = {
                    {
                    'Este {C:attention}Comodín{} gana {X:mult,C:white}X#1#{} Multi',
                    'cuando una carta se mejora a',
                    '{C:attention}Multi{}, pierde {X:mult,C:white}X#2#{} Multi cuando',
                    'el {C:mult}Multi{} de la mano supera las {C:chips}Fichas{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}La Emperatriz{} al obtenerse',
                        '{C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_mad_scientist = {
                name = 'Científico Loco',
                text = {
                    'Cuando una carta está {C:attention}mejorada{},',
                    'una {C:attention}mejora{}',
                    '{C:attention}aleatoria{} distinta se le',
                    'fusiona',
                },
            },
            j_aij_memory_card = {
                name = 'Tarjeta de Memoria',
                text = {
                    'Si la primera mano de la ronda',
                    'es exactamente 1 carta,',
                    'sacala primero en Ciegas futuras',
                    '{C:inactive}(Solo puede guardar una carta)',
                    '{C:inactive,s:0.8}(Solo se activa en la posición del extremo izquierdo)',
                },
            },
            j_aij_monarchic_joker = {
                name = 'Comodín Monocromático',
                text = {
                    'Las cartas jugadas con palo {C:paperback_crowns}Corona',
                    'tienen una prob. de {C:green}#1# en #2#{}',
                    'de crear un {C:paperback_minor_arcana}Arcano',
                    '{C:paperback_minor_arcana}Menor{} al azar al anotarse',
                },
            },
            j_aij_mp_blind_drawn = {
                name = 'Dibujo a Ciegas',
                text = {
                    '{X:mult,C:white}X#1#{} Multi',
                    'No puedes ver al {X:purple,C:white}Némesis{}',
                    'ni la puntuación ni las manos restantes',
                    'durante las {C:attention}Ciegas PvP{}',
                },
            },
            j_aij_mp_fall_of_count_chaligny = {
                name = 'Caída del Conde Chaligny',
                text = {
                    'Fija la {C:attention}puntuación{} requerida',
                    'de todas las {C:attention}Ciegas{} a {C:attention}1X{} Base',
                    '{C:inactive}(No afecta a las ciegas PvP){}',
                },
            },
            j_aij_peanut_brittle = {
                name = 'Crocante de Maní',
                text = {
                    {
                    'Obtiene {X:mult,C:white}X#1#{} Multi cuando una',
                    'carta se mejora a {C:attention}Vidrio{}, pierde {X:mult,C:white}X#2#{} Multi',
                    'cuando se rompe una {C:attention}Carta de Vidrio{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}La Justicia{} al obtenerse',
                        '{C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_pinup_poster = {
                name = 'Póster Pin-Up',
                text = {
                    {
                        'Este {C:attention}Comodín{} siempre está',
                        '{C:attention}fijado{} a la ranura izquierda',
                    },
                    {
                        'Gana {X:mult,C:white}X#1#{} Multi por',
                        'cada carta de {C:red}Corazones{} que',
                        'siga en tu {C:attention}baraja{}',
                        '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}',
                    },
                },
            },
            j_aij_pretzel_sticks = {
                name = 'Palitos de Pretzel',
                text = {
                    {
                    'Obtiene {X:mult,C:white}X#1#{} Multi cuando una',
                    'carta se mejora a carta de {C:attention}Madera{}, pierde',
                    '{X:mult,C:white}X#2#{} Multi cuando se activa un',
                    'efecto de {C:attention}carta en mano{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}La Puerta del Santuario{}',
                        'al obtenerse {C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_pygmalion = {
                name = 'Pygmalion',
                text = {
                    'Todas las {C:attention}Cartas de Piedra{}',
                    'cuentan como {C:attention}Reinas{}',
                },
            },
            j_aij_run = {
                name = '>RUN',
                text = {
                    'Los {C:attention}Comodines{} a la {C:attention}izquierda{}',
                    'de este {C:attention}Comodín{} se activan {C:attention}antes{} de que',
                    'la mano se anote, en vez de {C:attention}después{}',
                    '{C:inactive}(Si aplica){}',
                },
            },
            j_aij_suibhne = {
                name = 'Suibhne',
                text = {
                    'Obtiene {X:chips,C:white}X#1#{} Fichas por cada carta',
                    'en la {C:attention}mano jugada{} si la mano',
                    'contiene solo {C:attention}Reyes{} de {C:paperback_stars}Estrellas{}',
                    '{C:inactive}(Actualmente {X:chips,C:white}X#2#{C:inactive} Fichas){}',
                },
            },
            j_aij_tabula_rasa = {
                name = 'Tabula Rasa',
                text = {
                    'Al seleccionar una {C:attention}Ciega{},',
                    'este Comodín remueve su propia {C:dark_edition}Edición{}',
                    'y sus efectos se vuelven {C:jest_inherent}inerentes{}',
                },
            },
            j_aij_cyclops = {
                name = 'Cíclope',
                text = {
                    'Gana {C:mult}+#1#{} Multi si la',
                    '{C:attention}primera mano{} de la ronda tiene',
                    'exactamente {C:attention}una{} carta',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi){}',
                },
            },
            j_aij_american_comic = {
                name = 'Cómic Americano',
                text = {
                    'Añade {C:attention}#1#{} ranura extra a la',
                    '{C:money}Tienda{}, que siempre contiene',
                    'un {C:common}Comodín Común{} al azar',
                },
            },
            j_aij_red_joker = {
                name = 'Comodín Rojo',
                text = {
                    'Gana {C:mult}+#2#{} Multi por cada carta anotada',
                    'Se {C:attention}reinicia{} al jugar una carta',
                    'que ya se había anotado',
                    '{C:inactive}(El historial de cartas se borra al reiniciar){}',
                    '{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)',
                },
            },
            j_aij_bouffon = {
                name = 'Bouffon',
                text = {
                    'Activa los efectos de las cartas',
                    '{C:attention}en mano{} de las {C:attention}#1#{} cartas',
                    '{C:attention}restantes{} en tu baraja',
                },
            },
            j_aij_soft_serve = {
                name = 'Helado Suave',
                text = {
                    'Los {C:attention}Comodines{}, {C:tarot}Tarots{} y',
                    '{C:planet}Planetas{} de mods no pueden aparecer',
                    'en la {C:money}Tienda{}; se consume tras',
                    '{C:attention}#1#{} compras',
                },
            },
            j_aij_skytower = {
                name = 'Torre Celeste',
                text = {
                    'Las manos distintas de tu',
                    '{C:attention}mano{} más jugada se anotan',
                    'con {C:attention}#1#{} niveles adicionales',
                },
            },
            j_aij_lawfirm = {
                name = 'Bufete',
                text = {
                    '{B:1,C:white,s:0.8}Habilidad Activable',
                    'Paga {C:money}$#3#{} por una prob. de',
                    '{C:green}#1# en #2#{} de desactivar la',
                    '{C:attention}Ciega Jefe{}',
                },
            },
            j_aij_cutesy_joker = {
                name = 'Comodín Adorable',
                text = {
                    'Las {C:green}probabilidades{} de los',
                    '{C:attention}Consumibles{} están garantizadas',
                },
            },
            j_aij_lead = {
                name = 'Plomo',
                text = {
                    'Si la mano jugada es una',
                    '{C:attention}Escalera{}, reactiva todas',
                    'las cartas anotadas',
                },
            },
            j_aij_silver = {
                name = 'Plata',
                text = {
                    'Si la mano jugada es un',
                    '{C:attention}Full House{}, reactiva todas las',
                    'cartas anotadas',
                },
            },
            j_aij_unobtanium = {
                name = 'Unobtanio',
                text = {
                    'Si la mano jugada es un',
                    '{C:attention}Quintilla{}, reactiva todas',
                    'las cartas anotadas',
                },
            },
            j_aij_neutronium = {
                name = 'Neutronio',
                text = {
                    'Si la mano jugada es un',
                    '{C:attention}Cinco de Color{}, reactiva todas',
                    'las cartas anotadas',
                },
            },
            j_aij_scroggin = {
                name = 'Scroggin',
                text = {
                    {
                        'Gana {X:mult,C:white}X#1#{} Multi cuando una carta',
                        'se mejora a {C:attention}Versátil{}; pierde',
                        '{X:mult,C:white}X#2#{} Multi cuando la mano contiene',
                        'un {C:attention}Color{}',
                        '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}Los Enamorados{} al obtenerse',
                        '{C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_blueberries = {
                name = 'Arándanos',
                text = {
                    {
                        'Gana {X:mult,C:white}X#1#{} Multi cuando una carta',
                        'se mejora a {C:attention}Ferviente{}; pierde',
                        '{X:mult,C:white}X#2#{} Multi cuando una carta',
                        'se {C:attention}reactiva',
                        '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}El Mago{} al obtenerse',
                        '{C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_drying_paint = {
                name = 'Pintura Secándose',
                text = {
                    '{B:1,C:white,s:0.8}Habilidad Activable',
                    'Durante una {C:attention}Ciega{}, gasta',
                    '{C:attention}#3#{} {C:blue}mano{} para darle',
                    'a este Comodín {X:mult,C:white}X#1#{} Multi',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{} {C:inactive}Multi){}',
                },
            },
            j_aij_vexed = {
                name = 'Irritado',
                text = {
                    'Los Comodines {C:money}vendidos{} tienen una',
                    'prob. fija de {C:attention}#1#%{} de reaparecer',
                    '{C:attention}inmediatamente',
                },
            },
            j_aij_club_card = {
                name = 'Carta de Tréboles',
                text = {
                    '{X:mult,C:white}X#1#{} Multi si la baraja tiene',
                    'al menos {C:attention}#2# {C:clubs}Tréboles{}',
                    '{C:inactive}(Actualmente {C:attention}#3#{C:inactive})',
                },
            },
            j_aij_profile = {
                name = 'Perfil',
                text = {
                    'Las cartas anotadas a la',
                    'izquierda y derecha de las',
                    'cartas de {C:attention}figura{} dan {C:mult}+#1#{} Multi',
                },
            },
            j_aij_borra = {
                name = 'Borra',
                text = {
                    'Gana {C:mult}+#1#{} Multi cuando ocurre',
                    'cualquier cosa',
                    '{C:inactive}(Actualmente {C:mult}+#1#{} {C:inactive}Multi)',
                },
                unlock = { "?????" },
            },
            j_aij_dongfang = {
                name = 'Dongfang',
                text = {
                    'Reactiva todas las cartas {C:planet}Planeta{}',
                    '{C:attention}#1#{} veces',
                },
                unlock = { "?????" },
            },
            j_aij_gonnella = {
                name = 'Gonella',
                text = {
                    'Crea un Comodín con {C:dark_edition}Edición{}',
                    'al azar y de la misma rareza',
                    'cuando se {C:money}vende{} un Comodín',
                    'sin {C:dark_edition}Edición{}',
                },
                unlock = { "?????" },
            },
            j_aij_antonio = {
                name = 'Antonio',
                text = {
                    'Al anotar una carta, todas las',
                    'cartas de la baraja con la misma',
                    '{C:attention}categoría{} ganan permanentemente',
                    '{C:mult}+#1#{} Multi',
                },
            },
            j_aij_wamba = {
                name = 'Wamba',
                text = {
                    {
                        'Los Comodines {C:attention}#1#{} son',
                        '{C:attention}#2#X{} más comunes',
                    },
                    {
                        '{B:1,C:white,s:0.8}Habilidad Activable',
                        'Cambia el {C:attention}tipo{} de Comodín',
                        'que aparece con más frecuencia',
                    },
                },
            },
            j_aij_gelato = {
                name = 'Gelato',
                text = {
                    'Gana {C:money}$#1#{} al final de la ronda, {C:red}se autodestruye{}',
                    'si la Ciega no se derrota en una {C:attention}sola mano{}'
                }
            },
            j_aij_stracciatella = {
                name = 'Stracciatella',
                text = {
                    {
                        'Después de cada mano, prob. de {C:green}#1# en #2#{}',
                        'de que cada carta anotada obtenga {C:money}$#3#{}',
                        'al anotar',
                    },
                    {
                        '{C:red}Se autodestruye{} después de activarse'
                    }
                }
            },
            j_aij_parfait = {
                name = 'Parfait',
                text = {
                    {
                        'Al final de la ronda, prob. de {C:green}#1# en #2#{}',
                        'de que el Comodín de la derecha obtenga {X:mult,C:white}X#3#{} Multi',
                    },
                    {
                        '{C:red}Se autodestruye{} después de activarse'
                    }
                }
            },
            j_aij_triple_gooberberry_sunrise = {
                name = 'Triple Gooberberry Sunrise',
                text = {
                    '{C:green}+#1#{} a todas las {C:attention}probabilidades{},',
                    'se {C:attention}consume{} tras {C:attention}#2#{} Apuestas',
                }
            },
            j_aij_poppins = {
                name = 'Poppins',
                text = {
                    'Gana {C:money}$#1#{} por cada mano de póker {C:attention}única{}',
                    'contenida en la mano jugada'
                }
            },
            j_aij_beekeeper = {
                name = 'Apicultor',
                text = {
                    'Los {C:attention}6s{} en mano',
                    'otorgan {C:chips}+#1#{} Fichas y',
                    '{C:mult}+#2#{} Multi'
                }
            },
            j_aij_queen_bee = {
                name = 'Abeja Reina',
                text = {
                    'Las {C:attention}Reinas{} anotadas otorgan',
                    '{X:mult,C:white}X1{} Multi, más {X:mult,C:white}X#1#{} Multi',
                    'por cada {C:attention}6{} en mano',
                    '{C:inactive}(Otorgará {X:mult,C:white}X#2#{} {C:inactive}Multi)'
                }
            },
            j_aij_corporate_memphis = {
                name = 'Corporate Memphis',
                text = {
                    'Al {C:attention}omitir{} una Ciega, la siguiente',
                    '{C:money}Tienda{} gana {C:attention}+#1#{} Ranuras de Tienda',
                    '{C:inactive}(Actualmente {C:attention}+#2#{} {C:inactive}Ranuras de Tienda)'
                }
            },
            j_aij_jackpot = {
                name = 'Olla de Oro',
                text = {
                    'Gana {C:money}$#1#{} al final de la ronda,',
                    'aumenta en {C:money}$#2#{} cuando una',
                    '{C:attention}Carta de la Suerte{} se activa con éxito'
                }
            },
            j_aij_saveloy = {
                name = 'Saveloy',
                text = {
                    '{C:mult}+#1#{} Multi, {C:mult}-#2#{} Multi',
                    'al {C:green}renovar{} la {C:money}tienda'
                }
            },
            j_aij_cheerio = {
                name = 'Cheerio',
                text = {
                    '{C:chips}+#1#{} Fichas, al {C:attention}renovar{}',
                    'en la {C:money}Tienda{}, pierdes Fichas igual',
                    'al {C:money}costo{} de renovar'
                }
            },
            j_aij_dog_treat = {
                name = 'Galleta de Perro',
                text = {
                    'Si la Ciega se gana en una {C:attention}mano{},',
                    'ganas {C:money}$#1#{} y {C:red}se autodestruye{}',
                }
            },
            j_aij_turrn = {
                name = 'Turrón',
                text = {
                    '{C:attention}+#1#{} Ranuras de Tienda',
                    '{C:red}-#2#{} Ranura de Tienda al final de la ronda',
                }
            },
            j_aij_emergent_pattern = {
                name = 'Patrón Emergente',
                text = {
                    'Reactiva las cartas anotadas',
                    'si la {C:attention}mano jugada{} contiene',
                    "exactamente {C:attention}#1#{} cartas",
                }
            },
            j_aij_bit_flip = {
                name = 'Bit Flip',
                text = {
                    'Después de jugar la mano, cada {C:attention}dígito{}',
                    "de tu {C:aij_plasma}puntuación total{}",
                    'tiene una prob. de {C:green}#1# en #2#{}',
                    'de aumentar en {C:attention}#3#{}',
                }
            },
            j_aij_the_hare = {
                name = 'La Liebre',
                text = {
                    'Añade {C:aij_plasma}#1#{} a tu',
                    'puntuación total cada mano',
                }
            },
            j_aij_scarab = {
                name = 'Escarabajo',
                text = {
                    '{C:attention}-#1#{} Apuesta mientras',
                    'tengas este Comodín',
                    '{C:inactive, s:0.8}(No puede venderse ni destruirse',
                    '{C:inactive, s:0.8}durante la Apuesta Final)',
                }
            },
            j_aij_bingsu = {
                name = 'Bingsu',
                text = {
                    'Todas las cartas anotadas otorgan {C:chips}+#1#{} Fichas,',
                    'prob. de {C:green}#3# en #4#{} de reducir en',
                    '{C:chips}-#2#{} Fichas al anotar',
                }
            },
            j_aij_flushed_face = {
                name = 'Comodín Sonrojado',
                text = {
                    'Obtiene {C:mult}+#1#{} Multi por cada',
                    '{C:attention}Carta de Figura{} anotada en un {C:attention}Color{}',
                    '{C:inactive}(Actualmente {C:mult}+#2#{C:inactive} Multi)',
                }
            },
            j_aij_the_herald = {
                name = 'El Heraldo',
                text = {
                    '{C:blue}La mano{} siempre cuenta como',
                    'que contiene la {C:attention}mano',
                    '{C:attention}jugada{} más',
                    '{C:inactive}(Actualmente: {C:attention}#1#{C:inactive})',
                },
            },
            j_aij_the_mermaid = {
                name = 'La Sirena',
                text = {
                    'Puedes {C:red}descartar{} {C:attention}1{} vez',
                    'dentro de {C:attention}Paquetes Potenciadores{}',
                },
            },
            j_aij_tortilla_chips = {
                name = 'Chips de Tortilla',
                text = {
                    {
                    'Obtiene {X:mult,C:white}X#1#{} Multi cuando una',
                    'carta se convierte en una carta {C:attention}Adicional{},',
                    'pierde {X:mult,C:white}X#2#{} Multi cuando',
                    'las {C:chips}Fichas{} de la mano superan al {C:mult}Multi{}',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#3#{} {C:inactive}Multi){}',
                    },
                    {
                        'Crea {C:tarot}El Hierofante{} al obtenerse',
                        '{C:inactive}(Debe haber espacio){}',
                    },
                },
            },
            j_aij_train_conductor = {
                name = 'Conductor de Tren',
                text = {
                    {
                        'Los Comodines de {C:mult}+Multi{} otorgan en su lugar',
                        '{C:mult}XMulti{} igual al {C:attention}#1#%{} de',
                        'sus valores originales',
                        '{C:inactive}(Mínimo {X:mult,C:white}X1.2{C:inactive} Multi)',
                    },
                    {
                        'Los Comodines de {C:mult}XMulti{} otorgan en su lugar',
                        '{C:mult}+Multi{} igual al {C:attention}#2#%{} de',
                        'sus valores originales',
                    },
                },
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
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_kamooalewa = {
                name = "Kamooalewa",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_deimos = {
                name = "Deimos",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_callisto = {
                name = "Callisto",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_iapetus = {
                name = "Iapetus",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_oberon = {
                name = "Oberon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_proteus = {
                name = "Proteus",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_charon = {
                name = "Charon",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_nibiru = {
                name = "Nibiru",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
                }
            },
            c_aij_kuiper = {
                name = "Kuiper",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Aumento de nivel",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Fichas",
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
            c_aij_possession = {
                name = 'Posesión',
                text = {
                    'Remueve {C:dark_edition}Edición{} y {C:attention}Mejora{}',
                    'de {C:attention}#1#{} carta seleccionada y hace',
                    'sus {C:attention}efectos {C:jest_inherent}Inherentes{}'
                }
            },
            c_aij_tetragrammaton = {
                name = 'Tetragrámaton',
                text = {
                    {
                        'Crea una carta de juego con',
                        'una {C:attention}categoría{}, {C:attention}palo{},',
                        'y {C:attention}mejora{} elegidos',
                    },
                    {
                        'Crea {C:attention}#1#{} cartas de juego al {C:attention}azar{}',
                    },
                },
            },
            c_aij_maw = {
                name = 'Fauces',
                text = {
                    '{C:red}Destruye{} un {C:attention}Comodín{} al azar',
                    'y {C:attention}todas{} las cartas en mano',
                }
            },
            c_aij_tallow = {
                name = 'Sebo',
                text = {
                    'Añade un {V:1}#2#',
                    'a {C:attention}#1#{} cartas seleccionadas',
                }
            },
            c_aij_barathrum = {
                name = 'Barathrum',
                text = {
                    '{C:red}Elimina permanentemente{} una',
                    'carta del {C:tarot}Tarot{} de tu',
                    'elección del {C:attention}pozo'
                }
            },
            c_aij_providence = {
                name = 'Providencia',
                text = {
                    'Otorga una {C:attention}Etiqueta de Astrología{}',
                },
            },
        },
        aij_astral = {
            c_aij_algol = {
                name = 'Algol',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Algol',
                    },
                    {
                        '{C:attention}Algol: {}Ganas {C:money}$#2#{} después',
                        'de jugar la mano'
                    }
                }
            },
            c_aij_algol_pin = {
                name = 'Algol',
                text = {
                    "Ganas {C:money}$#2#{} después",
                    "de jugar la mano"
                }
            },

            c_aij_alcyone = {
                name = 'Alcíone',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Alcíone',
                    },
                    {
                        '{C:attention}Alcíone: {}Sacas {C:attention}#2#{} cartas adicionales',
                        'después de jugar la mano'
                    }
                }
            },
            c_aij_alcyone_pin = {
                name = 'Alcíone',
                text = {
                    'Sacas {C:attention}#2#{} cartas adicionales',
                    'después de jugar la mano',
                }
            },

            c_aij_aldebaran = {
                name = 'Aldebarán',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Aldebarán',
                    },
                    {
                        '{C:attention}Aldebarán: {}{C:aij_plasma}Balancea{} un {C:attention}#2#%{} de {C:chips}Fichas{} y {C:mult}Multi',
                        'después de jugar la {C:attention}mano{}'
                    }
                }
            },
            c_aij_aldebaran_pin = {
                name = 'Aldebarán',
                text = {
                    '{C:aij_plasma}Balancea{} {C:attention}#2#%{} de {C:chips}Fichas{} y {C:mult}Multi',
                    'después de jugar la {C:attention}mano{}',
                }
            },

            c_aij_capella = {
                name = 'Capella',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Capella',
                    },
                    {
                        '{C:attention}Capella: Prob. de {}{C:green}#2# de #3#{} crear una',
                        'carta de {C:planet}Planeta{} al azar',
                    }
                }
            },
            c_aij_capella_pin = {
                name = 'Capella',
                text = {
                    '{C:attention}Prob. de {}{C:green}#2# de #3#{} crear',
                    'una carta de {C:planet}Planeta{} al azar',
                }
            },

            c_aij_sirius = {
                name = 'Sirius',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Sirius',
                    },
                    {
                        '{C:attention}Sirius: {}Reactiva {C:attention}#2#{}',
                        'carta al azar'
                    }
                }
            },
            c_aij_sirius_pin = {
                name = 'Sirius',
                text = {
                    'Reactiva {C:attention}#2#{}',
                    'carta al azar'
                }
            },

            c_aij_procyon = {
                name = 'Proción',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Proción',
                    },
                    {
                        '{C:attention}Proción: {}Añade {C:money}$#2#{} de valor de venta',
                        'a un {C:attention}Comodín{} al azar'
                    }
                }
            },
            c_aij_procyon_pin = {
                name = 'Proción',
                text = {
                    'Añade {C:money}$#2#{} de valor de venta',
                    'a un {C:attention}Comodín{} al azar'
                }
            },

            c_aij_regulus = {
                name = 'Régulo',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Régulo',
                    },
                    {
                        '{C:attention}Régulo: {}Prob. de {C:green}#2# de #3#{} subir de',
                        '{C:planet}nivel{} la mano {C:attention}jugada{}',
                    }
                }
            },
            c_aij_regulus_pin = {
                name = 'Régulo',
                text = {
                    'Prob. de {C:green}#2# de #3#{} subir de nivel',
                    'la mano {C:attention}jugada{}',
                }
            },

            c_aij_alkaid = {
                name = 'Alkaid',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Alkaid',
                    },
                    {
                        '{C:attention}Alkaid: {}Otorga una mejora',
                        'al azar a {C:attention}#2#{} carta al azar',
                    }
                }
            },
            c_aij_alkaid_pin = {
                name = 'Alkaid',
                text = {
                    'Otorga una mejora al azar',
                    'a {C:attention}#2#{} carta al azar',
                }
            },

            c_aij_algorab = {
                name = 'Algorab',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Algorab',
                    },
                    {
                        '{C:attention}Algorab: {}{C:green}#2# de #3#{} Prob. de crear',
                        'una carta {C:tarot}Tarot{} al azar'
                    }
                }
            },
            c_aij_algorab_pin = {
                name = 'Algorab',
                text = {
                    '{C:green}#2# de #3#{} Prob. de crear',
                    'una carta {C:tarot}Tarot{} al azar'
                }
            },

            c_aij_spica = {
                name = 'Espiga',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Espiga',
                    },
                    {
                        '{C:attention}Espiga: {}{C:red}Debilita{} la {C:attention}Ciega Jefe{} en',
                        'la {C:attention}primera mano{} de la ronda',
                    }
                }
            },
            c_aij_spica_pin = {
                name = 'Espiga',
                text = {
                    '{C:red}Debilita{} la {C:attention}Ciega Jefe{} en',
                    'la {C:attention}primera mano{} de la ronda',
                }
            },

            c_aij_arcturus = { -- So Arturo is also a Star name? lol
                name = 'Arturo',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Arturo',
                    },
                    {
                        '{C:attention}Arturo: {}{C:attention}+#2#{} {C:red}Descartes{}',
                    }
                }
            },
            c_aij_arcturus_pin = {
                name = 'Arturo',
                text = {
                    '{C:attention}+#2#{} {C:red}Descartes{}',
                }
            },

            c_aij_antares = {
                name = 'Antares',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Antares',
                    },
                    {
                        '{C:attention}Antares: {}{C:red}Destruye{} una carta',
                        '{C:attention}en mano',
                    }
                }
            },
            c_aij_antares_pin = {
                name = 'Antares',
                text = {
                    '{C:red}Destruye{} una carta',
                    '{C:attention}en mano',
                }
            },

            c_aij_vega = {
                name = 'Vega',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Vega',
                    },
                    {
                    '{C:attention}Vega: {}{C:attention}Reactivas{} todas las',
                    'cartas en {C:attention}mano{}',
                    }
                }
            },
            c_aij_vega_pin = {
                name = 'Vega',
                text = {
                    '{C:attention}Reactivas{} todas las',
                    'cartas en {C:attention}mano{}',
                }
            },

            c_aij_deneb_algedi = {
                name = 'Deneb Algedi',
                text = {
                    {
                        'Alinea {C:attention}#1#{} con {C:attention}Deneb Algedi',
                    },
                    {
                        '{C:attention}Deneb Algedi: {}{C:blue}+#2#{} Mano',
                        'la primera vez',
                        'que se juegue esta mano',
                    }
                }
            },
            c_aij_deneb_algedi_pin = {
                name = 'Deneb Algedi',
                text = {
                    '{C:blue}+#2#{} Mano la',
                    'primera vez',
                    'que se juegue esta mano'
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
                    '{C:attention}+#1#{} renovaciones gratis',
                    'en la próxima {C:money}Tienda{}',
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
            tag_aij_astrology = {
                name = 'Etiqueta de Astrología',
                text = {
                    '{C:attention}Reactiva{} la próxima carta',
                    '{C:planet}Planeta{} usada entre {C:attention}2y 4{} veces',
                },
            },
            tag_aij_grand_astrologer = {
                name = 'Etiqueta del Gran Astrólogo',
                text = {
                    'La próxima carta {C:planet}Planeta{} usada',
                    'sube de nivel todas las manos de',
                    'póker entre {C:attention}2 y 4{} veces',
                },
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
            c_aij_twilight = {
                name = 'Crepúsculo',
                text = {
                    'Ganas {C:money}$#1#{} por cada nivel de',
                    'tu mano de póker más jugada',
                    '{C:inactive}(Máx. de {C:money}$#2#{C:inactive})',
                    '{C:inactive}(Actualmente {C:money}$#3#{C:inactive} - #4#)',
                },
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
                name = 'La Balanza y la Espada',
                text = {
                    "Otorga un {C:attention}parche{} de un palo al",
                    "azar a {C:attention}#1#{} cartas seleccionadas"
                }
            },
            c_aij_veiled_lamp = {
                name = 'La Lámpara Oculta',
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
            c_aij_sacrifice = {
                name = 'El Sacrificio',
                text = {
                    "{C:red}Destruye{} {C:attention}#1#{} carta seleccionada",
                    "para crear una carta con",
                    "{C:attention}palo{}, {C:attention}categoría{} y",
                    "una {C:attention}mejora{} al azar"
                }
            },
            c_aij_reaper = {
                name = 'La Parca',
                text = {
                    "Selecciona {C:attention}#1#{} cartas.",
                    "Todas las {C:attention}#1#{} cartas serán",
                    "{C:attention}convertidas{} en {C:attention}copias{}",
                    "de una de ellas",
                }
            },
            c_aij_urns = {
                name = 'Las Urnas',
                text = {
                    "{C:red}Destruye{} {C:attention}#1#{} carta {C:attention}mejorada{} seleccionada",
                    "y aplica su {C:attention}mejora{} a {C:attention}#2#{}",
                    "cartas al {C:attention}azar{}"
                }
            },
            c_aij_typhon = {
                name = 'El Tifón',
                text = {
                    "Mejora {C:attention}#1#{} cartas",
                    "seleccionadas en",
                    "{C:attention}#2#s{}"
                }
            },
            c_aij_rising_dead = {
                name = 'El Despertar de los Muertos',
                text = {
                    "Selecciona {C:attention}#1#{} cartas, otorga a la",
                    "carta de la {C:attention}derecha{} la {C:attention}Mejora{}",
                    "y el {C:attention}Sello{} de la izquierda"
                }
            },
        },
        aij_hex_tarot = {
            c_aij_error = {
                name = 'El Error',
                text = {
                    "Otorga {C:red}Caótico{} a hasta",
                    "{C:attention}#1#{} cartas seleccionadas"
                }
            },
            c_aij_janitor = {
                name = 'El Conserje',
                text = {
                    "{C:red}Destruye{} todas las",
                    "cartas en {C:attention}mano{}"
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
            p_aij_sidereal = {
                name = "Paquete Sideral",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} cartas {C:spectral}Astrales{}",
                    "para usar inmediatamente"
                }
            },
            undiscovered_aij_astral = {
                name = 'Carta Astral Desconocida',
                text = {
                    'Encuentra esta carta en una partida',
                    'sin códigos para descubrir qué hace'
                }
            },
            aij_astral_prograde = {
                name = "Progrado",
                text = {
                    "Se alinea con tu mano {C:attention}menos{}",
                    "jugada"
                }
            },
            aij_astral_retrograde = {
                name = "Retrógrado",
                text = {
                    "Se alinea con tu mano {C:attention}más{}",
                    "jugada"
                }
            },
            aij_astral_passigrade = {
                name = "Pasígrado",
                text = {
                    "Se alinea con una mano {C:attention}aleatoria"
                }
            },
            p_aij_common_normal_1 = {
                name = "Paquete Común",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:common}Comunes{}"
                }
            },
            p_aij_common_normal_2 = {
                name = "Paquete Común",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:common}Comunes{}"
                }
            },
            p_aij_common_normal_3 = {
                name = "Paquete Común",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:common}Comunes{}"
                }
            },
            p_aij_common_jumbo_1 = {
                name = "Paquete Común Jumbo",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:common}Comunes{}"
                }
            },
            p_aij_common_jumbo_2 = {
                name = "Paquete Común Jumbo",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:common}Comunes{}"
                }
            },
            p_aij_common_mega_1 = {
                name = "Mega Paquete Común",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:common}Comunes{}"
                }
            },
            p_aij_uncommon_normal_1 = {
                name = "Paquete Inusual",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:uncommon}Inusuales{}"
                }
            },
            p_aij_uncommon_normal_2 = {
                name = "Paquete Inusual",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:uncommon}Inusuales{}"
                }
            },
            p_aij_uncommon_normal_3 = {
                name = "Paquete Inusual",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:uncommon}Inusuales{}"
                }
            },
            p_aij_uncommon_jumbo_1 = {
                name = "Paquete Inusual Jumbo",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:uncommon}Inusuales{}"
                }
            },
            p_aij_uncommon_jumbo_2 = {
                name = "Paquete Inusual Jumbo",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:uncommon}Inusuales{}"
                }
            },
            p_aij_uncommon_mega_1 = {
                name = "Mega Paquete Inusual",
                text = {
                    "Escoge {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{} Comodines",
                    "{C:uncommon}Inusuales{}"
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
            aij_pc_eternal = {
                name = "Eterno",
                text = {
                    '{C:red}No puede ser destruido{}',
                }
            },
            aij_pc_perishable = {
                name = "Perecedero",
                text = {
                    'Se debilita tras anotar {C:attention}#1#{} veces',
                    '{C:inactive}({C:attention}#2#{} restantes{C:inactive}){}'
                }
            },
            aij_pc_rental = {
                name = "Alquiler",
                text = {
                    'Pierde {C:money}$#1#{} al final de la ronda',
                    'cuando está en tu baraja'
                }
            },
            aij_pc_rental_alt = {
                name = "Alquiler",
                text = {
                    'Prob. de {C:green}#2# en #3#{} de no perder',
                    '{C:money}$#1#{} al final de la ronda',
                    'cuando está en tu baraja'
                }
            },
            aij_mint_condition = {
                name = "Prístino",
                text = {
                    'Este {C:attention}Comodín{} cuesta',
                    '{C:money}$10{} adicionales'
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
            aij_eye_seal = {
                name = "Sello Ocular",
                text = {
                    'Activa los efectos de {C:attention}en mano{}',
                    'mientras permanece en la',
                    '{C:attention}baraja{}',
                },
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
    },
}