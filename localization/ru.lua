return {
    misc = {
        dictionary = {
            k_coder_badge = "Кодер",
            k_artist_badge = "Художник",
            k_moon = "Луна",
            k_moon_q = "Луна?",
            k_star = "Звезда",
            k_tag = "Жетон",
            k_star_q = "Звезда?",
            k_asteroid = "Астероид",
            k_tarot_q = "Таро?",
            k_active = "Активно",
            k_inactive = "Неактивно",
            aij_requires_restart = "Требуется перезапуск",
            aij_doesnt_requires_restart = "Перезапуск не требуется",
            aij_upgraded_tags = "Золотые жетоны",
            aij_enable_moons = "Включить Луны",
            aij_enable_moons_tooltip = {
                'Позволяет появляться',
                '{C:planet}Планетам{}, дающим',
                '{C:chips}Фишки{} и {C:mult}Множ.{}',
            },
            aij_alter_trypophobia = "Изменить Трипофобию",
            aij_alter_trypophobia_tooltip = {
                '{C:attention}Меняет{} спрайт джокера',
                '{C:attention}Трипофобия{}, чтобы он',
                'выглядел {C:attention}менее пугающим'
            },
            aij_no_copy_neg = "Копировать Негативные карты",
            aij_no_copy_neg_tooltip = {
                'Позволяет копировать',
                'издание {C:dark_edition}Негативный{}',
                'на {C:attention}игральных картах{}.',
                'Если {C:attention}выкл{} (по умолч.), копии',
                '{C:dark_edition}Негативных{} карт {C:red}теряют{} издание'
            },
            aij_blue_stake_rework = 'Переработка Синей ставки',
            aij_blue_stake_rework_tooltip = {
                '{C:attention}Меняет{} Синюю ставку:',
                'вместо {C:red}-1{} сброса появляются',
                'новые {C:attention}Блайнды Ямы{}'
            },
            aij_random_deck_skins = 'Случайные скины колод',
            aij_random_deck_skins_tooltip = {
                '{C:attention}Игральные карты{}, добавленные',
                'в колоду, имеют случайные',
                '{C:attention}скины рубашек'
            },
            k_aij_guess_the_jest = "Угадай шутку",
            k_aij_memory_card = "Запомнено!", 
            aij_plus_tag = "+1 Жетон", 
            aij_refreshed = 'Обновлено', -- Office Assistant
            aij_paid_off = 'Оплачено', -- Office Assistant
            k_aij_polychrome_ex = 'Полихромный!', 
            k_aij_foiled_again = 'Снова фольга!', 
            k_aij_p_arcana = "+1 Аркана", 
            k_aij_merry_christmas = "С Рождеством!", 
            k_aij_change_ex = 'Изменено!', 
            k_aij_blood_spilt_ex = 'Кровь пролита!', 
            k_aij_double_ex = 'Удвоено!', 
            k_aij_triple_ex = 'Утроено!', 
            k_aij_chaos_ex = 'Хаос!', 
            k_aij_two_into_one_ex = 'Два в одном!', 
            k_aij_plus_two_moons = "+2 Луны", 
            k_aij_does_not_score_ex = "Не подсчитано!" 

        },
        v_dictionary = {
            a_aij_exp_mult="^#1# Множ.",

            a_aij_mult_equal="=#1# Множ.",

            a_aij_ante_minus="-#1# Анте",

            a_aij_win_ante_plus="+#1# Победное Анте",

            a_aij_percent_balance = "+%#1#",
            a_aij_percent_balance_minus = "-%#1#",
            
            a_aij_hands_minus = "-#1# руки",

            a_aij_joker_slots = '+#1# слот джокера',
            a_aij_joker_slots_minus = '-#1# слот джокера',

            a_aij_odds = "+#1# к шансу",

            a_aij_jokers = "+#1# джокера",
        },
        challenge_names = {
            c_aij_bananarama = "Бананарама",
            c_aij_sharpest_tool = "Острый инструмент",
            c_aij_the_pit = "Яма",
        },
        v_text = {
            -- Challenges
            ch_c_aij_sharpest_tool_1 = {
                'Только {C:common}Обычные{} джокеры могут',
            },
            ch_c_aij_sharpest_tool_2 = {
                'появляться в {C:attention}Магазине{} или {C:attention}Шутовских наборах'
            },
            ch_c_aij_all_pit_blinds = {
                'Все обычные босс-блайнды после 1 Анте заменяются на {C:attention}Блайнды Ямы{}'
            },
        },
        extra_joker_dictionary = {
            -- You've got Mail
            k_aij_youve_got_mail = "Вам письмо!",
            k_aij_youve_got_mail_goodbye = "Прощайте",
            k_aij_youve_got_mail_none = "Ничего не делает...",
            k_aij_youve_got_mail_plus_prefix = "+",
            k_aij_youve_got_mail_dollar_prefix = "$",
            k_aij_youve_got_mail_xmult_prefix = "X",
            k_aij_youve_got_mail_mult_text = " Множ.",
            k_aij_youve_got_mail_chip_text = " Фишек",
            k_aij_youve_got_mail_dollars_text = " за сыгранную руку",
            -- Overdesigned
            k_aij_overdesigned_give_prefix = "дают",
            k_aij_overdesigned_earn_prefix = "приносят",
            k_aij_overdesigned_heart = "Червы",
            k_aij_overdesigned_club = "Трефы",
            k_aij_overdesigned_spade = "Пики",
            k_aij_overdesigned_diamond = "Бубны",
            -- Jerko
            k_aij_jerko_retrigger = "Срабатывает ещё",
            k_aij_jerko_times = "раз",
            -- Blacklist
            k_aij_blacklist_empty = 'Нет',
            k_aij_blacklist_and = 'И',
            k_aij_blacklist_more = 'ещё',
        },
        labels = {
            -- Editions
            aij_glimmer = "Мерцающий",
            aij_silver = "Серебряный",
            aij_stellar = "Звёздный",
            aij_aureate = "Золочёный",
            aij_torn = "Рваный",
            -- Stickers
            aij_marked = "Меченый",
            aij_unusual_doubled = "Удвоенный",
            aij_recherche_doubled = "Удвоенный",
            -- Seals
            aij_smiley_seal = "Печать-смайлик",
            aij_melted_seal = "Растаявшая печать",
            -- Other
            aij_jest_chaotic_card = "Хаотичный", 
        },
        poker_hands = {
            ['aij_Royal Flush'] = "Флеш-рояль",
        },
        poker_hand_descriptions = {
            ['aij_Royal Flush'] = {
                "5 старших карт в ряд (по достоинству)",
                "одной масти, где",
                "самая младшая карта - 10"
            },
        },
    },
    descriptions = {
        Back = {
            b_aij_fabled = {
                name = 'Сказочная колода',
                text = {
                    '{C:legendary,E:1}Легендарные{} джокеры могут',
                    'появляться в {C:attention}Магазине',
                    '{C:attention}-1{} слот джокера'
                },
                unlock = {
                    'Найдите',
                    '{C:legendary,E:1}Легендарного{} джокера',
                }
            },
            b_aij_fabled_hidden = {
                name = 'Сказочная колода',
                text = {},
                unlock = {
                    'Найдите {C:legendary,E:1}Легендарного{}',
                    'джокера',
                }
            },
            b_aij_branching = {
                name = 'Ветвящаяся колода',
                text = {
                    'При пропуске блайнда',
                    'предлагает выбор из {C:attention}3{} жетонов',
                },
                unlock = {
                    'Пропустите не менее {C:attention}5{}',
                    'блайндов за одну партию',
                }
            },
            b_aij_branching_hidden = {
                name = 'Ветвящаяся колода',
                text = {},
                unlock = {
                    'Пропустите не менее {C:attention}5{}',
                    'блайндов за одну партию',
                }
            },
            b_aij_patchwork = {
                name = 'Лоскутная колода',
                text = {
                    'Все игральные карты {C:attention}появляются',
                    'со случайной {C:attention}нашивкой масти'
                },
                unlock = {
                    'Имейте не менее {C:attention}13',
                    'карт с {C:attention}нашивкой',
                    '{C:attention}масти{} одновременно'
                }
            },
            b_aij_patchwork_hidden = {
                name = 'Лоскутная колода',
                text = {},
                unlock = {
                    'Имейте не менее {C:attention}13',
                    'карт с {C:attention}нашивкой',
                    '{C:attention}масти{} одновременно'
                }
            }
        },
        Stake = All_in_Jest.config.blue_stake_rework and {
            stake_blue = {
                name = "Синяя ставка",
                text = {
                    'Босс-блайнд в Анте',
                    '{C:attention}4{} или {C:attention}5{} становится Блайндом Ямы',
                    '{s:0.8}Включает все предыдущие ставки'
                }
            },
        } or {},
        Partner = {
            pnr_aij_simply = {
                name = "Просто",
                text = {
                    "Получает {C:mult}+#1#{} множ. в",
                    "конце раунда",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} множ.)",
                },
                unlock={
                    "Выиграйте партию с",
                    "{C:attention}Простофилей{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_fourwarning = {
                name = "Четвёрка",
                text = {
                    "Получает {C:chips}+#1#{} фишек, если",
                    "в сбросе есть {C:attention}4-ка",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} фишек)",
                },
                unlock={
                    "Выиграйте партию с",
                    "{C:attention}Тетрафобией{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_nellie = {
                name = "Нелли",
                text = {
                    "{C:dark_edition}Негативные{} джокеры",
                    "встречаются в {C:attention}#1#X{} чаще",
                },
                unlock={
                    "Выиграйте партию с",
                    "{C:attention}Негативной Нэнси{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_scratch = {
                name = "Каляка",
                text = {
                    '{C:attention}Повторно активирует{} крайнего левого',
                    '{C:attention}#1#{} крайнего правого джокера',
                    'в {C:blue}нечётных{} {C:attention}раундах'
                },
                unlock={
                    "Выиграйте партию с",
                    "{C:attention}Калякой-малякой{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_banger = {
                name = "Бэнгер",
                text = {
                    '{C:green}Обновления{} стоят на {C:money}$#1#{} меньше',
                    '{C:inactive}(Не может быть ниже {C:money}$0{C:inactive}){}'
                },
                unlock={
                    "Выиграйте партию с",
                    "{C:attention}Глупой сосиской{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_flub = {
                name = "Ошибочка",
                text = {
                    '{C:attention}Вечные{} джокеры',
                    '{C:money}#1#{}'
                },
                unlock={
                    "Выиграйте партию с",
                    "{C:attention}Ошибкой{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
        },
        Sleeve = {
            sleeve_aij_fabled = {
                name = "Сказочный рукав",
                text = {
                    '{C:legendary,E:1}Легендарные{} джокеры могут',
                    'появляться в {C:attention}Магазине',
                    '{C:attention}-1{} слот джокера'
                }
            },
            sleeve_aij_fabled_alt = {
                name = "Сказочный рукав",
                text = {
                    '{C:legendary,E:1}Легендарные{} джокеры появляются',
                    '{C:attention}чаще'
                },
            },
            sleeve_aij_patchwork = {
                name = "Лоскутный рукав",
                text = {
                    'Все игральные карты {C:attention}появляются',
                    'со {C:attention}случайной{} нашивкой масти'
                }
            },
            sleeve_aij_patchwork_alt = {
                name = "Лоскутный рукав",
                text = {
                    'Все игральные карты {C:attention}появляются',
                    'с {C:attention}2 случайными{} нашивками масти'
                },
            },
        },
        Blind = {
            --Normal Blinds
            bl_aij_the_beith = {
                name = "Бейт",
                text = {
                    'Все Бубны',
                    'вытягиваются последними'
                },
            },
            bl_aij_the_elm = {
                name = "Вяз",
                text = {
                    'Все Трефы',
                    'вытягиваются последними'
                },
            },
            bl_aij_the_alder = {
                name = "Ольха",
                text = {
                    'Все Червы',
                    'вытягиваются последними'
                },
            },
            bl_aij_the_willow = {
                name = "Ива",
                text = {
                    'Все Пики',
                    'вытягиваются последними'
                },
            },
            bl_aij_the_branch = {
                name = "Ветвь",
                text = {
                    'Все карты с лицом',
                    'вытягиваются последними'
                },
            },
            bl_aij_the_horror = {
                name = "Ужас",
                text = {
                    'Делает случайного джокера',
                    "Временным на",
                    "последней руке раунда",
                },
            },
            bl_aij_the_oak = {
                name = "Дуб",
                text = {
                    'Ослабляет',
                    'крайнего правого джокера',
                },
            },
            bl_aij_the_ingot = {
                name = "Слиток",
                text = {
                    'Делает всех джокеров',
                    'Вечными на последней',
                    'руке раунда',
                },
            },
            bl_aij_the_hazel = {
                name = "Лещина",
                text = {
                    "Делает случайного джокера",
                    "Арендуемым после",
                    "победы над блайндом", 
                },
            },
            bl_aij_the_apple = {
                name = "Яблоко",
                text = {
                    'Уничтожает крайнего левого джокера,',
                    "если блайнд побежден",
                    "за одну руку",
                },
            },
            bl_aij_the_neck = {
                name = "Шея",
                text = {
                    'Можно сбрасывать',
                    'только по 1 карте'
                },
            },
            bl_aij_the_groan = {
                name = "Стон",
                text = {
                    '+1X к базе после',
                    'каждой сыгранной руки',
                },
            },
            bl_aij_the_ash = {
                name = "Пепел",
                text = {
                    '+0.2X к базе за каждую',
                    'карту ниже #1# в',
                    'полной колоде',
                },
            },
            bl_aij_the_clay = {
                name = "Глина",
                text = {
                    'Случайно увеличенный блайнд',
                },
            },
            bl_aij_the_aspen = {
                name = "Осина",
                text = {
                    '+2X к базе за каждый',
                    'блайнд, побежденный в этом Анте',
                },
            },
            bl_aij_the_evergreen = {
                name = "Вечнозелёный",
                text = {
                    '+0.2X к базе за каждую',
                    'карту выше #1# в',
                    'полной колоде',
                },
            },
            bl_aij_the_enigma = {
                name = "Загадка",
                text = {
                    'Улучшенные карты',
                    'вытягиваются последними',
                },
            },
            bl_aij_the_bullion = {
                name = "Слиток золота",
                text = {
                    '-$5 за каждую сыгранную',
                    'улучшенную карту',
                },
            },
            bl_aij_the_elbow = {
                name = "Локоть",
                text = {
                    'Сыгранные улучшения',
                    'становятся случайными',
                },
            },
            bl_aij_the_thorn = {
                name = "Шип",
                text = {
                    'Ослабляет все',
                    'улучшенные карты',
                },
            },
            bl_aij_the_twin = {
                name = "Близнец",
                text = {
                    'Улучшенные карты',
                    'вытягиваются рубашкой вверх',
                },
            },
            bl_aij_the_giant = {
                name = "Гигант",
                text = {
                    'Очень большой блайнд',
                    '+2 руки'
                },
            },
            bl_aij_the_auroch = {
                name = "Тур",
                text = {
                    'Все #1# и #2#',
                    'вытягиваются рубашкой вверх'
                },
            },
            bl_aij_the_journey = {
                name = "Путешествие",
                text = {
                    '+1 Победное Анте, если',
                    'подсчитана карта',
                    'масти #1# в этом раунде',
                },
            },
            bl_aij_the_gift = {
                name = "Подарок",
                text = {
                    "Устанавливает деньги на $0",
                    "Даёт $1 за каждую",
                    "сыгранную или сброшенную карту"
                },
            },
            bl_aij_the_ancestor = {
                name = "Предок",
                text = {
                    'Покерные комбинации, которые вы',
                    'сбросили в этом раунде,',
                    'нельзя играть'  
                },
            },
            bl_aij_the_god = {
                name = "Бог",
                text = {
                    'Все карты должны',
                    'быть подсчитаны'
                },
            },
            bl_aij_the_beast = {
                name = "Зверь",
                text = {
                    'Уничтожает всех продуктовых джокеров',
                    'после победы над',
                    'этим блайндом'
                },
            },
            bl_aij_the_ulcer = {
                name = "Язва",
                text = {
                    "-1 рука",
                    "-1 сброс"
                },
            },
            bl_aij_the_need = {
                name = "Нужда",
                text = {
                    "Нужно иметь хотя бы",
                    "$20, чтобы руки",
                    "приносили очки"
                },
            },
            bl_aij_the_day = {
                name = "День",
                text = {
                    'Рука должна содержать',
                    'Червы или Бубны'
                },
            },
            bl_aij_the_celebration = {
                name = "Праздник",
                text = {
                    '+0.2X к базе за неиспользованные',
                    'руки/сбросы в этом Анте'
                },
            },
            bl_aij_the_storm = {
                name = "Шторм",
                text = {
                    'Если подсчитанная рука содержит',
                    '3 или больше карт,',
                    "уничтожает все сыгранные карты"
                },
            },
            bl_aij_the_frost = {
                name = "Мороз",
                text = {
                    'Уничтожает одну случайную карту',
                    'в руке после того, как',
                    'рука сыграна'
                },
            },
            bl_aij_the_yew = {
                name = "Тис",
                text = {
                    'Все нечётные карты',
                    'ослаблены'
                },
            },
            bl_aij_the_hoard = {
                name = "Клад",
                text = {
                    'Избыточные очки этого Анте',
                    'добавляются к этому блайнду',
                    'при выборе'
                },
            },
            bl_aij_the_pear = {
                name = "Груша",
                text = {
                    'Случайно меняет масть и',
                    'ранг карт в руке',
                    'после подсчёта'
                },
            },
            bl_aij_the_elk = {
                name = "Лось",
                text = {
                    'Нельзя играть покерные комбинации,',
                    'которые были сыграны',
                    'ранее в этом Анте'
                },
            },
            bl_aij_the_birch = {
                name = "Берёза",
                text = {
                    'Все чётные карты',
                    'ослаблены'
                },
            },
            bl_aij_the_sun = {
                name = "Солнце",
                text = {
                    'Пики и Трефы',
                    'вытягиваются рубашкой',
                    'вверх'
                },
            },
            bl_aij_the_spear = {
                name = "Копьё",
                text = {
                    'Все сыгранные карты в',
                    'победной руке',
                    'навсегда ослабляются'
                },
            },
            bl_aij_the_steed = {
                name = "Скакун",
                text = {
                    'Ослабляет карты в руке,',
                    'когда рука',
                    'сыграна'
                },
            },
            bl_aij_the_figure = {
                name = "Фигура",
                text = {
                    'Рука не может содержать',
                    '3 или более карт с лицом',
                },
            },
            bl_aij_the_lake = {
                name = "Озеро",
                text = {
                    'Карты, сыгранные в этом',
                    'Анте, вытягиваются',
                    'последними'
                },
            },
            bl_aij_the_field = {
                name = "Поле",
                text = {
                    'Все карты ослаблены,',
                    'пока не сброшено #1#',
                    'карт'
                },
            },
            bl_aij_the_wound = {
                name = "Рана",
                text = {
                    'Руки не приносят очки,',
                    'пока не останется 0',
                    'сбросов'
                },
            },
            bl_aij_the_brimstone = {
                name = "Сера",
                text = {
                    'Вы теряете половину',
                    'денег при',
                    'каждом сбросе'
                },
            },
            bl_aij_the_blush = {
                name = "Румянец",
                text = {
                    'Нужно сбрасывать по 5',
                    'карт за раз'
                },
            },
            --Pit Blinds
            bl_aij_the_heart = {
                name = "Сердце",
                text = {
                    'Нужно сыграть руку,',
                    'содержащую #1#,',
                    'прежде чем руки начнут давать очки'
                },
            },
            bl_aij_the_rains = {
                name = "Ливни",
                text = {
                    'Если сыгранная рука побеждает',
                    'блайнд, подсчитанные карты',
                    'теряют все улучшения,',
                    'издания и печати'
                },
            },
            bl_aij_the_child = {
                name = "Дитя",
                text = {
                    'Понижает ранг всех',
                    'подсчитываемых карт на 1'
                },
            },
            bl_aij_the_moon = {
                name = "Луна",
                text = {
                    'Все карты в нечётных',
                    'раундах ослаблены'
                },
            },
            bl_aij_the_shell = {
                name = "Раковина",
                text = {
                    '#1# из #2# карт ослаблены',
                    '#3# из #4# карт вытягиваются',
                    'рубашкой вверх'
                },
            },
            bl_aij_the_earth = {
                name = "Земля",
                text = {
                    'Превращает все карты в руке',
                    'в Каменные карты',
                    'после подсчёта'
                },
            },
            bl_aij_the_dragon = {
                name = "Дракон",
                text = {
                    'Нельзя брать карты,',
                    'пока рука не пуста',
                },
            },
            bl_aij_the_mountain = {
                name = "Гора",
                text = {
                    'Очень большой блайнд',
                    '+1 размер руки'
                },
            },
            bl_aij_the_conflagration = {
                name = "Пожар",
                text = {
                    'Если сыгранная рука побеждает',
                    'блайнд, уничтожает все карты,',
                    'сыгранные и в руке'
                },
            },
            bl_aij_the_umbilical = {
                name = "Пуповина",
                text = {
                    'Каждую руку метит одну карту;',
                    'меченые карты нельзя',
                    'играть или сбрасывать'
                },
            },
            bl_aij_the_divine = {
                name = "Божество",
                text = {
                    'Рука должна содержать',
                    'улучшенную карту'
                },
            },
            bl_aij_the_bird = {
                name = "Птица",
                text = {
                    'Перетасовывает 1 случайного',
                    'джокера перед подсчётом'
                },
            },
            bl_aij_the_arrow = {
                name = "Стрела",
                text = {
                    'Счёт сыгранной руки должен',
                    'превышать счёт всех',
                    'предыдущих сыгранных рук'
                },
            },
            bl_aij_the_brilliance = {
                name = "Блеск",
                text = {
                    'Нужно набрать требуемый',
                    'счёт дважды',
                    '+2 руки',
                },
            },
            -- Finisher Blinds
            bl_aij_obsidian_blade = {
                name = "Обсидиановый клинок",
                text = {
                    '-1 рука',
                    '-1 сброс',
                    '-1 размер руки',
                    'Большой блайнд'
                },
            },
            bl_aij_aureate_coin = {
                name = "Золочёная монета",
                text = {
                    '+0.1X к базе',
                    'за каждый $1, потраченный',
                    'в этом Анте'
                },
            },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "Пылкая карта",
                text = {
                    "Получает {C:chips}+#2#{} фишек",
                    "при подсчёте"
                }
            },
            m_aij_dyscalcular = {
                name = "Сбивчивая карта",
                text = {
                    "Считается любым {C:attention}числовым{} рангом",
                    "{C:inactive}(Кроме составления покерных комбинаций)"
                }
            },
            m_aij_charged = {
                name = "Заряженная карта",
                text = {
                    "{C:attention}Улучшения{} дают {C:attention}+#1#%{} эффекта,",
                    "если {C:attention}сыграны вместе{} или",
                    "{C:attention}находятся в руке вместе{} с этой картой",
                }
            },
            m_aij_ice = {
                name = "Ледяная карта",
                text = {
                    "{C:attention}Всегда{} засчитывается и",
                    "{C:red}Игнорирует{} лимит выбора карт",
                    "{C:inactive}Лишние Ледяные карты не",
					"{C:inactive}влияют на тип руки"
                }
            },
            m_aij_wood = {
                name = "Деревянная карта",
                text = {
                    'Пока в руке, даёт {C:chips}+#3#{} фишек,',
                    '{C:chips}+#2#{} дополнительно за каждую другую',
                    '{C:attention}Деревянную{} карту в руке',
                    '{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} фишек)'
                }
            },
            m_aij_simulated = {
                name = "Симулированная карта",
                text = {
                    '{C:attention}Возвращается{} в руку',
                    'при розыгрыше в',
                    '{C:attention}первый{} раз за раунд'
                }
            },
            m_aij_canvas = {
                name = "Холщовая карта",
                text = {
                    '{C:attention}Копирует{} ранг и масть',
                    'карты {C:attention}справа'
                }
            },
        },
        Voucher = {
            v_aij_fairy_dust ={
                name = "Пыльца феи",
                text = {
                    "{C:dark_edition}Мерцающие{}, {C:dark_edition}Серебряные{} и",
                    "{C:dark_edition}Звёздные{} карты",
                    "появляются в {C:attention}#1#X{} чаще",
                },
            },
            v_aij_live_pixie ={
                name = "Живая пикси",
                text = {
                    "{C:dark_edition}Мерцающие{}, {C:dark_edition}Серебряные{} и",
                    "{C:dark_edition}Звёздные{} карты",
                    "появляются в {C:attention}#1#X{} чаще",
                },
            },
            v_aij_gold_medal ={
                name = "Золотая медаль",
                text = {
                    "{C:money}Золотые{} жетоны появляются",
                    "в {C:attention}#1#X{} чаще",
                },
            },
            v_aij_trophy ={
                name = "Трофей",
                text = {
                    "Жетон пропуска {C:attention}Большого блайнда",
                    "имеет шанс {C:green}#1# к #2#",
                    "стать {C:money}Золотым"
                },
            },
            v_aij_sticker_sheet ={
                name = "Лист наклеек",
                text = {
                    '{C:attention}Ослабляет{} эффект',
                    '{C:red}вредных',
                    '{C:attention}стикеров'
                },
            },
            v_aij_polkadot ={
                name = "Полька-дот",
                text = {
                    '{C:attention}Ослабляет{} эффект',
                    '{C:red}вредных',
                    '{C:attention}стикеров'
                },
            },
        },
        Edition = {
            e_aij_negative_playing_card = {
                name = "Негативная",
                text = {
                    "{C:dark_edition}+#1#{} размер руки",
                    "{C:inactive}(Убирается с копий)"
                },
            },
            e_aij_glimmer = {
                name = "Мерцающий",
                text = {
                    "{C:aij_plasma}Усредняет{} {C:attention}#1#%{} от",
                    "{C:chips}Фишек{} и {C:mult}Множ.{}"
                }
            },
            e_aij_silver = {
                name = "Серебряный",
                text = {
                    "Эффекты {C:attention}X#1#{}",
                }
            },
            e_aij_stellar = {
                name = "Звёздный",
                text = {
                    "{C:chips}+#1#{} Фишек и",
                    "{C:mult}+#2#{} Множ. за каждый {C:attention}уровень{}",
                    "сыгранной комбинации"
                }
            },
            e_aij_aureate = {
                name = "Золочёный",
                text = {
                    "{X:money,C:white}X#1#{} {C:money}${}",
                    "{C:inactive}(Максимум {C:money}$#2#{}{C:inactive})"
                }
            },
            e_aij_torn = {
                name = "Рваный",
                text = {
                    
                }
            },
        },
        Joker = {
            -- Credit stuff
            j_aij_nevernamed_credits_joker = {
                name = "Nevernamed",
                text = {
                    '{C:inactive}"Это место намеренно',
                    '{C:inactive}оставлено пустым"',
                },
            },
            j_aij_survivalaren_credits_joker = {
                name = "Survivalaren",
                text = {
                    '{C:inactive}"Не напрягайся"'
                },
            },
            j_aij_rattling_snow_credits_joker = {
                name = "RattlingSnow353",
                text = {
                    '{C:inactive}"Мастер на все руки, мастер',
                    '{C:inactive}ничего, хотя часто лучше,',
                    '{C:inactive}чем мастер чего-то одного."'
                },
            },
            j_aij_jumbocarrot_credits_joker = {
                name = "Jumbocarrot",
                text = {
                    '{C:inactive}"Привет Алекс"'
                },
            },
            -- Jokers
            j_aij_flying_ace = {
                name = "Летающий ас",
                text = {
                    "Даёт {C:money}$#1#{} в конце раунда",
                    "за каждого {C:attention}Туза{} уникальной {C:attention}масти{},",
                    "подсчитанного в этом раунде",
                    "{C:inactive}(Сейчас{} {C:money}$#2#{}{C:inactive}){}"
                },
            },
            j_aij_lucky_seven = {
                name = "Счастливая семёрка",
                text = {
                    "Превращает все подсчитанные",
                    "{C:attention}7-ки{} без улучшений в",
                    "{C:attention}Счастливые карты{}"
                },
            },
            j_aij_you_broke_it = {
                name = "Ты сломал это!",
                text = {
                    "Превращает каждую подсчитанную неулучшенную {C:attention}#1#{}",
                    "в {C:attention}#2#{}",
                    "{s:0.8}Ранг и улучшение",
                    "{s:0.8}меняются в конце раунда"
                },
            },
            j_aij_birthday_clown = {
                name = "Клоун-именинник",
                text = {
                    "{X:mult,C:white}X#1#{} Множ. на",
                    "{C:attention}1{} раунд в каждом {C:attention}Анте{}",
                    "{C:inactive}#2#"
                },
            },
            j_aij_memory_card = { 
                name = "Карта памяти", 
                text = { 
                    "Если первая рука раунда",
                    "состоит из ровно {C:attention}1{} карты,",
                    "{C:attention}вытягивает{} её {C:attention}первой{}",
                    "в будущих Блайндах",
                    "{C:inactive}(Хранит только одну карту)",
                    "{C:inactive}(Работает только в крайнем левом слоте)" 
                } 
            },
            j_aij_sleepy_joker = { 
                name = "Сонный джокер", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ., если сыгранная рука", 
                    "содержит только {C:spades}Пики{} и {C:clubs}Трефы"
                } 
            },
            j_aij_invisible_man = { 
                name = "Человек-невидимка", 
                text = { 
                    "Все {C:attention}карты с лицом{} считаются",
                    "{C:attention}Королями{}, {C:attention}Дамами{} и {C:attention}Валетами",
                    "{C:inactive}(Кроме составления покерных комбинаций)"
                } 
            },
            j_aij_handsome_joker = { 
                name = "Красивый джокер", 
                text = { 
                    "Получает {X:mult,C:white}X#1#{} Множ. за",
                    "каждую {C:attention}#2#{}",
                    "в вашей {C:attention}полной колоде",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#3#{} {C:inactive}Множ.)",
                } 
            },
            j_aij_whiteface_grotesque = { 
                name = "Белый Гротеск", 
                text = { 
                    "Этот джокер получает {C:chips}+#1#{} Фишек",
                    "за каждую {C:attention}карту с лицом{} в",
                    "{C:attention}руке{}, когда рука сыграна",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)"
                }
            },
            j_aij_the_clown_show = { 
                name = "Клоунское шоу", 
                text = { 
                    "{C:chips}+#1#{} Фишек за каждого {C:attention}джокера,",
                    "купленного в этой партии",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)"
                } 
            },
            j_aij_little_devil = {
                name = "Дьяволёнок",
                text = {
                    "При {C:attention}пропуске{} {C:attention}Блайнда{},",
                    "создаёт {C:attention}Стандартный{}, {C:tarot}Очаровательный{},",
                    "{C:planet}Жетон метеора{}, {C:spectral}Эфирный{} или",
                    "{C:red}Шутовской {C:attention}Жетон{}"
                },
            },
            j_aij_pierrot = { 
                name = "Пьеро", 
                text = { 
                    "{C:attention}Числовые{} карты в",
                    "руке дают свои {C:chips}Фишки" 
                } 
            },
            j_aij_hat_trick = { 
                name = "Трюк со шляпой", 
                text = { 
                    "Если сыгранная рука -",
                    "{C:attention}Сет{},",
                    "подсчитанные карты дают {C:mult}Множ.{}",
                    "равный их {C:attention}уровню",
                    "{C:inactive}(Сейчас {C:mult}+#1#{} {C:inactive}Множ.)",
                } 
            },
            j_aij_squeezy_pete = {
                name = "Сквизи Пит",
                text = {
                    "Получает {X:mult,C:white}X#1#{} Множ. за",
                    "{C:attention}последовательно{} сыгранную руку,",
                    "содержащую {C:attention}Фулл-хаус{}",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{}{C:inactive} Множ.){}",
                },
            },
            j_aij_infinite_jest = { 
                name = "Бесконечная шутка", 
                text = { 
                    "Повышает уровень {C:attention}всех покерных",
                    "{C:attention}комбинаций{} при победе над {C:attention}Босс-блайндом"
                } 
            },
            j_aij_bloody_mary = { name = "Кровавая Мэри", text = { "" } },
            j_aij_trypophobia = {
                name = "Трипофобия",
                text = {
                    "{C:mult}+#1#{} Множ., если подсчитанная рука",
                    "содержит только {C:attention}8-ки{}",
                },
            },
            j_aij_rummikub = { name = "Руммикуб", text = { "" } },
            j_aij_imperial_bower = { 
                name = "Имперский козырь", 
                text = { 
                    "{C:attention}Первая карта{}, вытянутая",
                    "в каждом раунде, считается картой",
                    "{C:attention}любого{} ранга и масти",
                    "{C:inactive}(Ранги не могут составлять комбинации)"
                } 
            },
            j_aij_ultrasound = {
                name = "Ультразвук",
                text = {
                    "Выбор {C:attention}Бустерного набора{} показывает",
                    "одно из его содержимого"
                }
            },
            j_aij_negative_nancy = {
                name = "Негативная Нэнси",
                text = {
                    "{C:dark_edition}Негативные{} джокеры появляются в {C:attention}#1#X{}",
                    "чаще в {C:attention}Магазине{}"
                },
            },
            j_aij_old_joker = { 
                name = "Старый джокер", 
                text = { 
                    "Этот джокер получает {C:chips}+#2#{} Фишек",
                    "и {C:mult}+#4#{} Множ. при победе над {C:attention}Босс-блайндом",
                    "{C:inactive,s:0.8}(Сейчас {C:chips,s:0.8}+#1#{}{C:inactive,s:0.8} Фишек, {C:mult,s:0.8}+#3#{}{C:inactive,s:0.8} Множ.)",
                } 
            },
            j_aij_imageboard = { 
                name = "Имиджборд", 
                text = { 
                    "Каждая {C:attention}подсчитанная{} карта даёт {C:mult}+#1#{} Множ.",
                    "за каждый {C:attention}раз{}, когда её {C:attention}ранг{}",
                    "был {C:attention}подсчитан{} в этой руке",
                    "{C:inactive}(пр. {C:attention}2 2 2{C:inactive} -> {C:mult}+#1#{C:inactive}, {C:mult}+#2#{C:inactive}, {C:mult}+#3#{C:inactive})"
                } 
            },
            j_aij_carousel = { 
                name = "Карусель", 
                text = { 
                    "{C:attention}Вращает{} масть",
                    "{C:attention}подсчитанных{} карт после подсчёта",
                    "{C:inactive,s:0.8}(Пики -> Червы -> Трефы -> Бубны)"
                } 
            },
            j_aij_slippery_when_wet = { name = "Скользко", text = { "" } },
            j_aij_founding_father = { 
                name = "Отц-основатель", 
                text = { 
                    "{C:attention}Заряженные карты{}",
                    "{C:attention}в два раза{} эффективнее"
                } 
            },
            j_aij_scary_story = {
                name = "Страшная история",
                text = {
                    "Игральные карты стандартного издания",
                    "в {C:attention}Стандартных наборах{}",
                    "имеют шанс {C:green}#1# к #2#{}",
                    "стать {C:dark_edition}Негативными{}"
                },
            },
            j_aij_doodle = {
                name = "Каляка",
                text = {
                    "В начале каждого {C:attention}раунда{}, шанс {C:green}#1# к #2#{}",
                    "скопировать {C:attention}обоих соседних{}",
                    "джокеров до конца",
                    "{C:attention}раунда",
                    "{C:inactive}#3#"
                },
            },
            j_aij_joqr = { name = "Joqr", text = { "" } },
            j_aij_greasepaint = { 
                name = "Грим", 
                text = {
                    {
                        "Ослабляет соседних {C:attention}джокеров{}"
                    },
                    {
                        "Ослабленные {C:attention}джокеры{} и",
                        "{C:attention}карты{} дают {X:mult,C:white}X#1#{} Множ."
                    }  
                } 
            },
            j_aij_public_bathroom = {
                name = "Общественный туалет",
                text = {
                    "Этот джокер получает {C:mult}+#1#{} Множ.",
                    "за каждую подсчитанную {C:attention}2-ку{} во {C:attention}Флеше{}",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множ.)"
                },
            },
            j_aij_diogenes = { name = "Диоген", text = { "" } },
            j_aij_blank_card = {
                name = "Пустая карта",
                text = {
                    "Каждый раз, когда {C:attention}игральная карта{}",
                    "выбирается из {C:attention}Стандартного набора{},",
                    "создаёт её точную {C:attention}копию{}"
                },
            },
            j_aij_comedians_manifesto = { 
                name = "Манифест комика", 
                text = { 
                    "{C:attention}Короли{} и {C:attention}Дамы{} в",
                    "{C:attention}Стандартных наборах{}",
                    "становятся {C:attention}Валетами" 
                } 
            },
            j_aij_circuit_board = { name = "Печатная плата", text = { "" } },
            j_aij_platinum_chip = { name = "Платиновая фишка", text = { "" } },
            j_aij_cctv = { 
                name = "Видеонаблюдение", 
                text = { 
                    "Когда {C:attention}Стеклянная карта{} {C:attention}разбивается{},",
                    "даёт {C:money}$#1#{} и улучшает",
                    "случайную карту в руке",
                    "до {C:attention}Стеклянной{}"
                } 
            },
            j_aij_pell_mel = { 
                name = "Кавардак", 
                text = { 
                    "{X:mult,C:white}X1{} Множ., плюс {X:mult,C:white}X#1#{} Множ.",
                    "за каждую {C:attention}уникальную{} масть в",
                    "{C:attention}сыгранной руке",
                } 
            },
            j_aij_pput_together = { name = "Собрано вместе", text = { "" } },
            j_aij_krampus = {
                name = "Крампус",
                text = {
                    {
                        "Подсчитанные {C:attention}Золотые карты{}",
                        "превращаются в {C:attention}Каменные карты{}",
                    },
                    {
                        "{C:attention}Каменные карты{} дают",
                        "{C:money}$#1#{} при подсчёте"
                    }
                },
            },
            j_aij_art_of_the_deal = { 
                name = "Искусство сделки", 
                text = { 
                    "Получает {C:mult}+#2#{} Множ., когда",
                    "{C:money}деньги{} заработаны",
                    "Сбрасывается, если у вас",
                    "{C:money}$#3#{} или меньше",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множ.)"
                } 
            },
            j_aij_word_art = { 
                name = "Word Art", 
                text = { 
                    "{X:mult,C:white}X1{} Множ., плюс {X:mult,C:white}X#1#{} Множ.",
                    " за каждого {C:attention}Туза{}, {C:attention}Короля{}, {C:attention}Даму{},",
                    "или {C:attention}Валета{} в сыгранной руке"
                } 
            },
            j_aij_atom = {
                name = "Атом",
                text = {
                    "Повышает уровень {C:attention}Старшей карты{},",
                    "если сыгранная рука -",
                    "один {C:attention}Туз{}"
                },
            },
            j_aij_plain_jane = {
                name = "Простушка", 
                text = {
                    "Подсчитанные {C:attention}неулучшенные{}",
                    "карты дают {C:mult}+#1#{} Множ."
                },
            },
            j_aij_paper_bag = { 
                name = "Бумажный пакет", 
                text = { 
                    "Этот джокер получает {C:chips}+#1#{} Фишек",
                    "за каждый {C:attention}уровень{} каждой",
                    "{C:red}сброшенной{} покерной комбинации",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)" 
                } 
            },
            j_aij_fruity_joker = { 
                name = "Фруктовый джокер", 
                text = { 
                    "{C:attention}Полихромные{} карты и",
                    "джокеры дают {C:mult}+#1#{} Множ.",
                } 
            },
            j_aij_jokia = { name = "Джокия", text = { "" } },
            j_aij_the_mycologists = {
                name = "Микологи",
                text = {
                    "Если сыгранная рука - ровно {C:attention}#1#{},",
                    "{C:red}уничтожает{} правую карту и передаёт",
                    "её {C:chips}Фишки{}, {C:dark_edition}Улучшение{} и",
                    "{C:dark_edition}Издание{} левой карте"
                }
            },
            j_aij_cool_joker = { 
                name = "Крутой джокер", 
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая способность",
                    "{V:1}Активируйте{} этого {C:attention}Джокера{}, когда он",
                    "должен {C:attention}обычно{} сработать для",
                    "{X:mult,C:white}X#1#{} Множ." 
                } 
            },
            j_aij_square_eyes = { 
                name = "Квадратные глаза", 
                text = {
                    "Подсчитанные {C:attention}4-ки{} дают {C:mult}+#1#{} Множ.",
                    "за каждую {C:attention}4-ку{} в сыгранной руке"
                } 
            },
            j_aij_punk_joker = {
                name = "Панк-джокер",
                text = {
                    "Если рука подсчитывает",
                    "{C:attention}Дикую карту{}, превращает случайную",
                    "неулучшенную подсчитанную карту",
                    "в {C:attention}Дикую карту{}"
                },
            },
            j_aij_slim_joker = { 
                name = "Тонкий джокер", 
                text = { 
                    "{C:mult}+#1#{} Множ.",
                    "{C:mult}-#2#{} Множ. за карту",
                    "в сыгранной руке",
                } 
            },
            j_aij_wireframe = { 
                name = "Каркас", 
                text = { 
                    "{C:attention}Первая{} сыгранная рука каждого",
                    "раунда {C:attention}возвращается{} в вашу {C:attention}руку",
                } 
            },
            j_aij_soviet = { 
                name = "Советский", 
                text = { 
                    "{C:mult}+#1#{} Множ., если {C:attention}сыгранная рука{}",
                    "не содержит {C:attention}Королей{} или {C:attention}Дам{}"
                } 
            },
            j_aij_mustachio = { name = "Усач", text = { "" } },
            j_aij_penny = {
                name = "Пенни",
                text = {
                    "Карты с {C:money}Золотой печатью{} имеют шанс",
                    "{C:green}#1# к #2#{} {C:attention}сработать повторно"
                },
            },
            j_aij_doctors_note = { 
                name = "Справка от врача", 
                text = { 
                    "Все {C:attention}числовые{} {C:hearts}Червы{}",
                    "считаются {C:attention}одним рангом",
                    "{C:inactive}(Кроме составления покерных комбинаций)"
                } 
            },
            j_aij_silly_sausage = { 
                name = "Глупая сосиска", 
                text = { 
                    "{C:green}Обновления{} стоят на {C:money}$#1#{} меньше",
                    "{C:attention}Уменьшается{} на {C:money}$#2#{}",
                    "в конце раунда"
                } 
            },
            j_aij_joker_baby = { name = "Джокер-малыш", text = { "" } },
            j_aij_anchor = { 
                name = "Якорь", 
                text = { 
                    "Этот джокер и",
                    "соседние джокеры {C:attention}не могут{}",
                    "{C:attention}быть {C:red}уничтожены" 
                } 
            },
            j_aij_hei_tiki = { 
                name = "Хей-тики", 
                text = { 
                    "Этот {C:attention}Джокер{} получает {X:mult,C:white}X#2#{} Множ.,",
                    "если итоговые {C:chips}Фишки{} сыгранной руки",
                    "превышают {C:mult}Множ.{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множ.)"
                } 
            },
            j_aij_polybius = { 
                name = "Полибий", 
                text = { 
                    "Даёт {C:mult}Множ.{} и {C:chips}Фишки{} всех",
                    "типов рук, {C:attention}содержащихся{}",
                    "{C:attention}внутри{} сыгранной руки", 
                } 
            },
            j_aij_joker_sighting = { name = "Наблюдение джокера", text = { "" } },
            j_aij_pencil_drawing = { 
                name = {
                    "Карандашный рисунок",
                },
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая способность",
                    "Заплатите {C:money}$#1#{}, чтобы добавить {C:attention}случайную",
                    "{C:attention}игральную карту{} в руку"
                } 
            },
            j_aij_holy_bible = { name = "Библия", text = { "" } },
            j_aij_great_white_north = { name = "Крайний Север", text = { "" } },
            j_aij_right_angle = { 
                name = "Прямой угол", 
                text = { 
                    "Активирует все {C:attention}10-ки{} в руке,",
                    "когда подсчитывается {C:attention}9-ка{}" 
                } 
            },
            j_aij_adoring_joker = {
                name = "Обожающий джокер",
                text = {
                    "{C:attention}После того как{} {C:attention}Джокеры{} сработали,",
                    "устанавливает {C:mult}Множ.{} на {C:attention}наивысший",
                    "{C:mult}Множ.,{} достигнутый в этом {C:attention}Анте",
                    "{C:inactive}(Сейчас {C:mult}#1# {C:inactive}Множ.)"
                } 
            },
            j_aij_lucignolo = {
                name = "Лучиньоло",
                text = {
                    "Даёт {C:money}$#1#{}, когда любая",
                    "игральная карта {C:attention}уничтожается{}"
                },
            },
            j_aij_scorecard = { 
                name = "Счётная карточка", 
                text = { 
                    "При выборе {C:attention}Блайнда{},",
                    "повышает уровень {C:attention}случайной",
                    "{C:attention}покерной комбинации{} на {C:attention}#1#"
                } 
            },
            j_aij_punch_and_judy = { 
                name = "Панч и Джуди", 
                text = { 
                    {
                        "Если {C:attention}сыгранная рука{} содержит",
                        "ровно {C:attention}#1# Короля{} и {C:attention}#1# Даму{},",
                        "повторно активирует все подсчитанные карты"
                    },
                    {
                        "{C:attention}Короли{} и {C:attention}Дамы{}",
                        "всегда подсчитываются"
                    }
                } 
            },
            j_aij_nature_tapes = { 
                name = "Звуки природы", 
                text = { 
                    "Когда используется карта {C:planet}Планеты",
                    "типа {C:mult}Множ.{}, этот джокер",
                    "получает {C:mult}+#1#{} Множ.",
                    "{C:inactive}(Сейчас {C:mult}+#2# {C:inactive}Множ.)",
                } 
            },
            j_aij_low_priest = { 
                name = "Низший жрец", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ.,",
                    "{X:mult,C:white}-X#2#{} Множ. за каждый {C:attention}уровень{}",
                    "сыгранной руки"
                } 
            },
            j_aij_oil_and_water = { name = "Масло и Вода", text = { "" } },
            j_aij_big_ears = { name = "Большие уши", text = { "" } },
            j_aij_causal_absent_paranoia = { name = "Причинно-отсутствующая паранойя", text = { "" } },
            j_aij_hand_drawn = { 
                name = "Рисунок от руки", 
                text = { 
                    "В {C:attention}начале{} раунда,",
                    "продолжайте тянуть карты,",
                    "пока рука не будет {C:attention}содержать{}",
                    "вашу самую частую {C:attention}комбинацию{}" 
                }
            },
            j_aij_haruspex = { 
                name = "Гаруспик", 
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая способность",
                    "Потратьте {C:attention}#1#{} {C:red}Сброс{}, чтобы выбрать {C:attention}#2#{}",
                    "карту из {C:attention}колоды{} и",
                    "{C:attention}взять{} её в руку"
                } 
            },
            j_aij_bobblehead = { name = "Бошкотряс", text = { "" } },
            j_aij_topsy_the_clown = { 
                name = "Клоун Топси", 
                text = { 
                    "Округляет {C:chips}Фишки{} и {C:mult}Множ. раунда",
                    "вверх до ближайшего",
                    "{C:attention}палиндрома" 
                } 
            },
            j_aij_cloudwatching = { name = "Созерцание облаков", text = { "" } },
            j_aij_line_in_the_sand = {
                name = "Черта на песке",
                text = {
                    "{C:attention}Сброшенные{} карты не возвращаются",
                    "в {C:attention}колоду{} до конца Анте"
                }
            },
            j_aij_hairy_joker = { name = "Волосатый джокер", text = { "" } },
            j_aij_realty_sign = {
                name = "Знак «Продаётся»",
                text = {
                    "Розыгрыш {C:attention}Фулл-хауса{}",
                    "увеличивает {C:money}стоимость продажи{}",
                    "этого джокера на {C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = { 
                name = "Гнилое яблоко", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#2#{} Множ.,",
                    "если {C:attention}подсчитанная рука{} содержит",
                    "{C:attention}#4#{} {C:spades}Тёмных{} масти и {C:attention}#3#{} {C:hearts}Светлых{} масти",
                    "{C:inactive,s:0.8}(Пропорция меняется в конце раунда)",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множ.)"
                } 
            },
            j_aij_dim_bulb = {
                name = "Тусклая лампочка",
                text = {
                    "{X:mult,C:white}X#1#{} Множ., если у вас нет",
                    "{C:uncommon}Необычных{} или {C:red}Редких{} {C:attention}джокеров{}",
                },
            },
            j_aij_blood_artist = { 
                name = "Кровавый художник", 
                text = { 
                    "Когда любой джокер или карта",
                    "{C:money}проданы{} или {C:attention}уничтожены{},",
                    "уменьшает требование очков текущего {C:attention}Блайнда{}",
                    "на {C:attention}#1#%"
                } 
            },
            j_aij_null_joker = {
                name = "Нулевой джокер",
                text = {
                    "Устанавливает все {C:green}вероятности{}",
                    "на {C:attention}ноль{}"
                },
            },
            j_aij_magick_joker = {
                name = "Магический джокер",
                text = {
                    "Сыгранные {V:1}#1#{} дают свои",
                    "{C:chips}+Фишки{} как {C:mult}+Множ.{}",
                    "{C:inactive,s:0.8}(Масть меняется в конце раунда){}"
                }
            },
            j_aij_jeff_the_joker = {
                name = "Джокер Джефф",
                text = {
                    'При выборе {C:attention}Малого блайнда{},',
                    '{C:red}уничтожает{} всех остальных джокеров и',
                    'этот джокер получает {X:mult,C:white}X#2#{} Множ. за каждого',
                    '{C:inactive}(Сейчас {X:mult,C:white}X#1#{C:inactive})'
                },
            },
            j_aij_zanni = { 
                name = "Дзанни", 
                text = { 
                    "{C:attention}Числовые{} карты имеют шанс {C:green}#1# к #2#{}",
                    "создать карту {C:tarot}Таро{}",
                    "при {C:attention}подсчёте"
                } 
            },
            j_aij_furbo_e_stupido = { 
                name = "Хитрый и глупый", 
                text = { 
                    "{C:attention}Сбивчивые{} карты также",
                    "считаются {C:attention}Тузами и {C:attention}Валетами" 
                } 
            },
            j_aij_read_em_and_weep = {
                name = "Смотри и плачь", 
                text = { 
                    "Если рука содержит {C:attention}Стрит{},",
                    "превращает все {C:attention}сыгранные{} карты в",
                    "одну случайную {C:attention}масть",
                    "перед подсчётом" 
                } 
            },
            j_aij_goblin_joker = { 
                name = "Гоблин-джокер", 
                text = { 
                    "После {C:red}сброса{}, вытягивает {C:attention}#1#",
                    "дополнительных карт" 
                } 
            },
            j_aij_string_theory = { 
                name = "Теория струн", 
                text = { 
                    "Рука всегда считается",
                    "содержащей {C:attention}Стрит" 
                } 
            },
            j_aij_jesters_privelege = {
                name = "Привилегия шута",
                text = {
                    "{C:legendary}Легендарные{} джокеры могут",
                    "появляться в {C:attention}Магазине{}",
                },
            },
            j_aij_privelege_fabled = {
                name = "Привилегия шута",
                text = {
                    "{C:legendary}Легендарные{} джокеры появляются",
                    "{C:attention}чаще{}",
                },
            },
            j_aij_quark = {
                name = "Кварк",
                text = {
                    'Повышает уровень {C:attention}Сета{}, если',
                    'подсчитанная рука состоит ровно из {C:attention}трех{}',
                    'карт {C:attention}одного ранга',
                    'но {C:attention}разных мастей{}'
                },
            },
            j_aij_lucky_carder = { name = "Удачливый игрок", text = { "" } },
            j_aij_silver_screen = { 
                name = "Серебряный экран", 
                text = { 
                    "Когда {C:attention}карта с лицом{}",
                    "{C:red}уничтожается{}, добавляет {C:aij_silver}Серебряное издание{} к",
                    "случайной карте в {C:attention}руке" 
                } 
            },
            j_aij_pedrolino = { 
                name = "Педролино", 
                text = { 
                    "{C:money}Продайте{} эту карту, чтобы снизить",
                    "{C:attention}требование очков{}",
                    "текущего {C:attention}Блайнда{} на {C:attention}#1#%"
                } 
            },
            j_aij_pierrette = { 
                name = "Пьеретта", 
                text = { 
                    "Повторно активирует все эффекты",
                    "{C:attention}сброса {C:attention}карт" 
                } 
            },
            j_aij_scaramouche = { 
                name = "Скарамуш", 
                text = { 
                    "{C:attention}Повторно активирует{} все подсчитанные",
                    "карты, если {C:attention}сыгранная рука{} -",
                    "{C:attention}#1#{}",
                    "{C:inactive}(Рука меняется в",
                    "{C:inactive}конце раунда){}"
                } 
            },
            j_aij_clay_joker = { 
                name = "Глиняный джокер", 
                text = { 
                    "Копирует эффект",
                    "последнего {C:red}уничтоженного{} джокера" 
                } 
            },
            j_aij_sunny_joker = { 
                name = "Солнечный джокер", 
                text = { 
                    "Если сыгранная рука {C:attention}содержит{}",
                    "{C:attention}Флеш-рояль{}, все подсчитываемые",
                    "карты получают {X:mult,C:white}X#1#{} Множ." 
                } 
            },
            j_aij_red_wine = { name = "Красное вино", text = { "" } },
            j_aij_mute_joker = { 
                name = "Немой джокер", 
                text = { 
                    "В этом раунде, первая сыгранная {C:attention}#1#{}",
                    "{C:red}уничтожает{} все подсчитанные карты",
                    "{C:inactive}(Покерная комбинация меняется в конце раунда)"
                } 
            },
            j_aij_scapino = { 
                name = "Скапино", 
                text = { 
                    "{C:green}Обновление{} в {C:money}Магазине{} стоит",
                    "{C:money}+$#1#{}, но также пополняет",
                    "{C:attention}Бустерные наборы" 
                } 
            },
            j_aij_pinhead = {
                name = "Булавкоголовый",
                text = {
                    "Даёт {C:money}$#1#{}, если {C:attention}Блайнд{}",
                    "побежден {C:attention}одной рукой{}"
                },
            },
            j_aij_saltimbanco = { 
                name = "Сальтимбанко", 
                text = { 
                    "Во время подсчёта,",
                    "успешные {C:green}вероятности{}",
                    "дают {X:mult,C:white}XМнож{}, равный {X:mult,C:white}X1{}",
                    "плюс их шанс {C:red}неудачи{}",
					"{C:inactive}(Пр: {C:green}1 к 4{} {C:inactive} -> {X:mult,C:white}X1.75{C:inactive})"
                } 
            },
            j_aij_pulcinella = { name = "Пульчинелла", text = { "" } },
            j_aij_petrushka = {
                name = "Петрушка",
                text = {
                    "Даёт {C:mult}+Множ{}, равный",
                    "общему {C:attention}рангу{}",
                    "всех {C:attention}подсчитанных карт{}",
                    "{C:inactive,s:0.8}(Т=14, K=13, Д=12, В=11)"
                },
            },
            j_aij_void = { 
                name = "Пустота", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ., если карты {C:planet}Планет{}",
                    "не использовались в этом {C:attention}Анте",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_kasperle = { 
                name = "Касперле", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ., если вы",
                    "купили {C:attention}Купон{}",
                    "в этом {C:attention}Анте",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_tumbler = { name = "Акробат", text = { "" } },
            j_aij_plain_packaging = { name = "Простая упаковка", text = { "" } },
            j_aij_mixel_perfect = {
                name = "Идеальный Миксель",
                text = {
                    "{C:mult}+#1#{} Множ., если {C:attention}подсчитанная рука{}",
                    "содержит {C:attention}нечётное{}",
                    "количество карт"
                },
            },
            j_aij_columbina = { 
                name = "Коломбина",
                text = {
                    "{C:aij_plasma}Усредняет{} {C:attention}#1#%{} от {C:chips}Фишек{} и",
                    "{C:mult}Множ.{}, увеличивается на {C:attention}#2#%{},",
                    "когда используется {C:spectral}Спектральная{} карта"
                }
            },
            j_aij_j_file = { 
                name = "Досье на Д.", 
                text = { 
                    "В начале {C:attention}раунда,",
                    "находит {C:attention}#1#{} карту из вашей",
                    "{C:attention}колоды{} и берет в руку" 
                } 
            },
            j_aij_bumper_sticker = { 
                name = "Наклейка на бампер", 
                text = { 
                    "Сыгранные {C:attention}карты{}",
                    "навсегда получают",
                    "{C:mult}+#1#{} Множ. при подсчёте"
                } 
            },
            j_aij_vesti_la_guibba = { name = "Vesti la Giubba", text = { "" } },
            j_aij_dead_president = {
                name = "Мёртвый президент",
                text = {
                    "Продайте этого {C:attention}Джокера{}, чтобы",
                    "{C:attention}удвоить{} {C:money}стоимость продажи{}",
                    "соседних {C:attention}Джокеров",
                    "{C:inactive}(Максимум {C:money}$#1#{}{C:inactive})"
                },
            },
            j_aij_second_tier_meme = { name = "Мем второго сорта", text = { "" } },
            j_aij_teeny_joker = {
                name = "Крошечный джокер",
                text = {
                    "{C:chips}+#1#{} Фишек, если сыгранная рука",
                    "содержит только {C:attention}2-ки{}",
                },
            },
            j_aij_clowns_on_parade = {
                name = "Парад клоунов",
                text = {
                    "Этот {C:attention}Джокер{} получает {C:chips}+#2#{} Фишек,",
                    "если сыгранная рука содержит",
                    "хотя бы три {C:attention}2-ки{}",
                    "{C:inactive}(Сейчас{} {C:chips}+#1#{} {C:inactive}Фишек){}"
                },
            },
            j_aij_rising_sun = { 
                name = "Восходящее солнце", 
                text = { 
                    "Повторно активирует {C:attention}первую{} и {C:attention}последнюю{}",
                    "подсчитанные карты в {C:attention}первой{} и",
                    "{C:attention}последней руке{} раунда",
                }
             },
            j_aij_red_sky = {
                name = "Красное небо",
                text = {
                    "Подсчитанные карты в {C:attention}первой{} и",
                    "{C:attention}последней руке{} раунда дают",
                    "свои {C:chips}+Фишки{} как {C:mult}+Множ.{}"
                }
            },
            j_aij_blind_drawn = {
                name = "Вслепую",
                text = {
                    "{X:mult,C:white}X#1#{} Множ.",
                    "Нельзя видеть {C:attention}Босс-блайнд{} или",
                    "его эффекты до выбора",
                }
            },
            j_aij_mp_blind_drawn = {
                name = "Вслепую",
                text = {
                    "{X:mult,C:white}X#1#{} Множ.",
                    "Нельзя видеть счёт вашего {X:purple,C:white}Соперника{}",
                    "или оставшиеся руки",
                    "во время {C:attention}PvP Блайндов{}",
                }
            },
            j_aij_heidelberg_tun = {
                name = "Гейдельбергская бочка",
                text = {
                    "Применяет {C:dark_edition}Негатив{} к",
                    "первому купленному {C:attention}расходнику{}",
                    "в каждом магазине",
                    "{C:inactive}#1#"
                },
            },
            j_aij_open_mind = {
                name = "Открытый разум",
                text = {
                    "{C:attention}+#1#{} дополнительный",
                    "{C:attention}Бустерный набор{} доступен",
                    "для покупки в {C:attention}Магазине{}"
                },
            },
            j_aij_little_boy_blue = { 
                name = "Маленький Бой Блу", 
                text = { 
                    "{C:chips}+#1#{} Фишек",
                    "Появляются только {C:chips}Фишечные{} Джокеры"
                } 
            },
            j_aij_big_red = { 
                name = "Большой Красный", 
                text = { 
                    "{C:mult}+#1#{} Множ.",
                    "Появляются только {C:mult}Множительные{} Джокеры" 
                } 
            },
            j_aij_party_streamers = {
                name = "Серпантин",
                text = {
                    "Если {C:attention}первая рука{} раунда",
                    "состоит ровно из {C:attention}1{} карты без",
                    "{C:attention}Печати{}, она получает {C:red}Красную{}, {C:blue}Синюю{},",
                    "или {C:money}Золотую{} {C:attention}Печать{}"
                },
            },
            j_aij_kilroy = { 
                name = "Килрой", 
                text = { 
                    "{C:attention}Удваивает{} значение",
                    "{C:chips}Фишек{} этого Джокера при {C:money}продаже",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)",
                } 
            },
            j_aij_janus = { 
                name = "Янус", 
                text = { 
                    "Эффекты {C:attention}изданий{},",
                    "{C:attention}улучшений{} и {C:attention}печатей",
                    "на {C:attention}картах с лицом{} {C:green}удваиваются" 
                } 
            },
            j_aij_honker = { 
                name = "Гудок", 
                text = { 
                    "Этот Джокер получает {C:red}+#1#{} Множ.,",
                    "когда {C:attention}Карта с множителем{} подсчитывается",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множ.)",
                } 
            },
            j_aij_mummy = { name = "Мумия", text = { "" } },
            j_aij_sitcom = { name = "Ситком", text = { "" } },
            j_aij_in_vino_veritas = { name = "Истина в вине", text = { "" } },
            j_aij_beefeater = { name = "Бифитер", text = { "" } },
            j_aij_tetraphobia = {
                name = "Тетрафобия",
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} Множ.",
                    "за каждую сброшенную {C:attention}4-ку{}, сбрасывается,",
                    "когда {C:attention}4-ка{} подсчитывается",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множ.)",
                },
            },
            j_aij_jack_of_all_trades = {
                name = "Мастер на все руки",
                text = {
                    "{C:attention}Валеты{} считаются любой {C:attention}мастью",
                },
            },
            j_aij_jumbo_joker = { 
                name = "Джамбо-джокер", 
                text = { 
                    "Могут появляться только {C:attention}Джамбо{} и {C:attention}Мега",
                    "{C:attention}Бустерные наборы" 
                } 
            },
            j_aij_pellucid_joker = { 
                name = "Прозрачный джокер", 
                text = { 
                    "Когда {C:attention}Джокер{} с {C:dark_edition}Изданием{}",
                    "{C:money}продан{} или {C:red}уничтожен{}, добавляет",
                    "случайную игральную карту с",
                    "таким же {C:dark_edition}Изданием{} в колоду"
                } 
            },
            j_aij_cosmological_constant = {
                name = "Космологическая постоянная",
                text = {
                    "{C:aij_plasma}Усредняет{} {C:attention}базовые{} {C:chips}Фишки{} и {C:mult}Множ.{}",
                    "сыгранной {C:attention}покерной комбинации"
                },
            },
            j_aij_monster = { name = "Монстр", text = { "" } },
            j_aij_mistigri = {
                name = "Мистигри",
                text = {
                    "{C:attention}+1{} размер руки за каждых {C:attention}2",
                    "{C:attention}Валетов{} в руке"
                },
            },
            j_aij_simple_simon = {
                name = "Простофиля",
                text = {
                    "{C:chips}+#1#{} Фишек",
                },
            },
            j_aij_giocoliere = {
                name = "Джокольере",
                text = {
                    "{C:attention}+#1#{} размер руки{} во время",
                    "каждого {C:attention}Босс-блайнда"
                },
            },
            j_aij_spectre = { 
                name = "Призрак", 
                text = { 
                    "Когда {C:attention}Босс-блайнд{}",
                    "побежден, заменяет все имеющиеся",
                    "{C:attention}расходники{} на случайные",
                    "{C:spectral}Спектральные{} карты" 
                } 
            },
            j_aij_dapper_dan = { 
                name = "Щёголь Дэн", 
                text = { 
                    "{C:dark_edition}Издания{} джокеров",
                    "{C:attention}в два раза{} эффективнее",
                    "{C:inactive}(Кроме Негативного)"
                } 
            },
            j_aij_average_joe = {
                 name = "Обычный парень", 
                 text = { 
                    "{C:aij_plasma}Усредняет{} {C:attention}#1#%{} от",
                    "{C:chips}Фишек{} и {C:mult}Множ.{}"
                } 
            },
            j_aij_silent_sam = { 
                name = "Молчаливый Сэм", 
                text = { 
                    "Каждая {C:attention}карта{} в",
                    "руке дает {X:mult,C:white}X#1#{} Множ."
                } 
            },
            j_aij_pantomimus = { 
                name = "Пантомимус", 
                text = { 
                    "Этот Джокер получает {C:chips}+#2#{}",
                    "Фишек за карту в {C:attention}руке",
                    "в конце {C:attention}раунда",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)"
                } 
            },
            j_aij_sneaky_pete = {
                name = "Хитрый Пит",
                text = {
                    'Даёт {C:money}$#2#{} в конце раунда',
                    'за каждую {C:money}Золотую печать{}',
                    'в вашей {C:attention}полной колоде',
                    '{C:inactive}(Сейчас {C:money}$#1#{C:inactive})'
                },
            },
            j_aij_peeping_tom = { name = "Подглядывающий Том", text = { "" } },
            j_aij_la_commedia_e_finita = {
                name = "Комедия окончена",
                text = {
                    "Этот Джокер получает {C:mult}+#1#{} Множ.,",
                    "когда {C:attention}карта с лицом{} {C:attention}уничтожается",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множ.)"
                },
            },
            j_aij_straight_to_hell = {
                name = "Прямиком в ад",
                text = {
                    "Этот {C:attention}Джокер{} получает {X:mult,C:white}X#1#{} Множ.,",
                    "когда сброс содержит {C:attention}Стрит{}",
                    '{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множ.)'
                },
            },
            j_aij_guiser = {
                name = "Ряженый",
                text = {
                    "Получает {C:money}$#1#{} к {C:attention}стоимости продажи{},",
                    "когда используется карта {C:tarot}Таро{}"
                },
            },
            j_aij_mummer = { 
                name = "Скоморох", 
                text = { 
                    "Активирует все {C:aij_silver}Стальные{} карты",
                    "в {C:attention}руке{}, когда {C:aij_silver}Стальная",
                    "карта {C:attention}подсчитывается",
                } 
            },
            j_aij_tipteerer = {
                name = "Типтирер",
                text = {
                    "Даёт {C:attention}#2#%{} от {C:money}стоимости продажи{}",
                    "других {C:attention}Джокеров{}, округляя вверх,",
                    "в конце {C:attention}раунда{}",
                    "{C:inactive}(Сейчас{} {C:money}$#1#{}{C:inactive}){}"
                },
            },
            j_aij_honest_john = { name = "Честный Джон", text = { "" } },
            j_aij_dizzard = { 
                name = "Глупец", 
                text = { 
                    "После {C:attention}пропуска Блайнда{},",
                    "посетите {C:money}Магазин" 
                } 
            },
            j_aij_arlecchino = { 
                name = "Арлекино", 
                text = { 
                    "Можно брать неограниченное число опций",
                    "в {C:attention}Шутовских наборах{} и",
                    "{C:attention}Стандартных наборах" 
                } 
            },
            j_aij_arlecchina = { name = "Арлекина", text = { "" } },
            j_aij_taikomochi = { 
                name = "Тайкомоти", 
                text = { 
                    "{C:attention}Валеты{} в руке",
                    "дают {C:chips}+#1#{} Фишек"
                } 
            },
            j_aij_sudoku = { 
                name = "Судоку", 
                text = { 
                    "Этот Джокер получает {X:mult,C:white}X#1#{} Множ.",
                    "за последовательно сыгранную руку,",
                    "содержащую {C:attention}Стрит{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множ.)"
                } 
            },
            j_aij_gnasher = { 
                name = "Грызун", 
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая способность",
                    "Раз в Анте, {C:attention}копирует{} и",
                    "{C:attention}сразу же{} использует случайный",
                    "имеющийся {C:attention}расходник",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_executioner = {
                name = "Палач",
                text = {
                    "Этот Джокер получает {C:chips}+#1#{} Фишек,",
                    "когда {C:attention}карта с лицом{} {C:attention}уничтожается",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)"
                },
            },
            j_aij_jongleur = {
                name = "Менестрель",
                text = {
                    "{C:attention}-$#1#{} к стоимости {C:green}обновления",
                },
            },
            j_aij_event_horizon = { 
                name = "Горизонт событий", 
                text = { 
                    "{C:dark_edition}Чёрная дыра{} имеет ту же",
                    "редкость, что и другие карты {C:planet}Планет",
                } 
            },
            j_aij_the_jester = {
                name = "Шут",
                text = {
                    "Первый {C:attention}Джокер{},",
                    "проданный в каждом раунде,",
                    "создает {C:tarot}Дурака{}",
                    "{C:inactive}#1#{}"
                },
            },
            j_aij_joka_lisa = { 
                name = "Джока Лиза", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ. за каждый {C:attention}размер", 
                    "{C:attention}руки{} выше {C:attention}7{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множ.){}",
                    "{C:inactive}(Минимум {X:mult,C:white}X1{C:inactive} Множ.){}"
                } 
            },
            j_aij_tonpraten = { name = "Тонпратен", text = { "" } },
            j_aij_rodeo_clown = { 
                name = "Родео-клоун", 
                text = { 
                    "Этот Джокер получает {C:mult}+#1#{} Множ.,",
                    "если {C:attention}Блайнд{} побежден на",
                    "{C:attention}последней руке{} раунда",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множ.)"
                } 
            },
            j_aij_joculator = { 
                name = "Джокулятор", 
                text = { 
                    "Тяните до {C:attention}двойного{} размера",
                    "руки, если у вас {C:attention}0{} {C:red}сбросов",
                    "и осталось {C:attention}#1#{} {C:blue}рук" 
                } 
            },
            j_aij_scurra = {
                name = "Скурра",
                text = {
                    'Повторно активирует все сыгранные карты',
                    'с {C:red}Красной печатью',
                    'ещё {C:attention}#1#{} раз'
                },
            },
            j_aij_pigpen = { name = "Свинарник", text = { "" } },
            j_aij_cyclops = { name = "Циклоп", text = { "" } },
            j_aij_blarney_stone = { 
                name = "Камень красноречия", 
                text = { 
                    "Добавляет {C:mult}Множ.{}, равный",
                    "{C:attention}тройной{} {C:attention}первой цифре{}",
                    "текущего {C:attention}счета{}",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множ.){}"
                } 
            },
            j_aij_sticker = { 
                name = "Стикер", 
                text = { 
                    "{C:mult}+#1#{} Множ. за каждый {C:attention}стикер{}",
                    "на ваших {C:attention}Джокерах{}",
                    "{C:inactive}(Сейчас{} {C:mult}+#2#{C:inactive} Множ.){}",
                } 
            },
            j_aij_feedback_form = { 
                name = "Форма обратной связи", 
                text = { 
                    "Каждая {C:attention}подсчитываемая{} карта дает {C:mult}+#1#",
                    "Множ., если все {C:attention}подсчитываемые{} карты",
                    "имеют разные {C:attention}улучшения" 
                }
            },
            j_aij_stultor = { 
                name = "Стултор", 
                text = { 
                    "Обновите {C:attention}Босс-блайнд {C:attention}#1#{} раз",
                    "за Анте, бесплатно" 
                } 
            },
            j_aij_david = {
                name = "Давид",
                text = {
                    "Этот Джокер получает {C:chips}+#1#{}",
                    "Фишек, если {C:attention}сыгранная рука{}",
                    "состоит только из {C:spades}Пиковых{} {C:attention}Королей{}",
                    "{C:inactive}(Сейчас{} {C:chips}+#2#{C:inactive} Фишек){}",
                },
            },
            j_aij_charles = {
                name = "Карл",
                text = {
                    "Этот Джокер получает {X:mult,C:white}X#1#{}",
                    "Множ., если {C:attention}сыгранная рука{}",
                    "состоит только из {C:hearts}Червовых{} {C:attention}Королей{}",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{C:inactive} Множ.){}",
                },
            },
            j_aij_cesar = {
                name = "Цезарь",
                text = {
                    'Даёт {C:money}$#1#{} за каждую сыгранную',
                    'руку. Увеличивается на {C:money}$#2#{},',
                    'если {C:attention}сыгранная рука{} состоит только из',
                    '{C:diamonds}Бубновых {C:attention}Королей'
                },
            },
            j_aij_alexandre = {
                name = "Александр",
                text = {
                    "Этот Джокер получает {C:mult}+#1#{}",
                    "Множ., если {C:attention}сыгранная рука{}",
                    "состоит только из {C:clubs}Трефовых{} {C:attention}Королей{}",
                    "{C:inactive}(Сейчас{} {C:mult}+#2#{C:inactive} Множ.){}",
                },
            },
            j_aij_sannio = { name = "Саннио", text = { "" } },
            j_aij_stock_photo = { name = "Стоковое фото", text = { "" } },
            j_aij_fou_du_roi = {
                name = "Королевский шут",
                text = {
                    '{C:green}#1# к #2#{} шанс создать',
                    '{C:tarot}Таро{}, если сыгранная рука',
                    'содержит {C:attention}Короля{} или {C:attention}Даму',
                    '{C:inactive}(Должно быть место)'
                },
            },
            j_aij_fatuus = {
                name = "Фатуус",
                text = {
                    'Если первая рука раунда',
                    'содержит только {C:attention}Королей{} и',
                    '{C:attention}Дам{}, применяет {C:blue}Синюю печать',
                    'к случайной сыгранной карте',
                },
            },
            j_aij_enraging_photo = { name = "Бесящее фото", text = { "" } },
            j_aij_infuriating_note = { 
                name = "Бесящая записка", 
                text = {{ 
                    "{X:mult,C:white}X#1#{} Множ.",
                    "{C:dark_edition}Негативные{} копии этого",
                    "Джокера могут появляться в",
                    "{C:attention}Магазине{} и {C:attention}Шутовских наборах{}", 
                },
                {
                    "{C:inactive}\"Я забрал твои вещи, но",
                    "{C:inactive}ты продолжаешь идти;",
                    "{C:inactive}мне придется постараться лучше,",
                    "{C:inactive}чтоб тебе навредить!\" -Р. Р.",
                }
            }
            },
            j_aij_magic_hat = { name = "Волшебная шляпа", text = { "" } },
            j_aij_anagraph = { 
                name = "Анаграф", 
                text = { 
                    "Когда любой {C:attention}Джокер{} или {C:attention}Игральная ",
                    "{C:attention}карта{} {C:money}проданы{} или {C:red}уничтожены{}",
                    "создает точную {C:attention}копию{} и",
                    "немедленно {C:red}уничтожает{} её",
                    "снова" 
                } 
            },
            j_aij_beanstalk = { 
                name = "Бобовый стебель", 
                text = { 
                    "{C:attention}Валеты{} {C:attention}не могут{} быть {C:red}ослаблены",
                    "и {C:attention}всегда{} дают очки" 
                } 
            },
            j_aij_phoney_baloney = { name = "Фальшивка", text = { "" } },
            j_aij_jerko = { 
                name = "Придурок", 
                text = { 
                    '{C:mult}+#1#{} Множ.'
                } 
            },
            j_aij_design_document = { 
                name = "Диз-док", 
                text = { 
                    "Даёт {C:money}$#1#{}, когда любая",
                    "{C:green}вероятность{} проваливается"
                } 
            },
            j_aij_animatronic = { 
                name = "Аниматроник", 
                text = {
                    "{C:attention}+#1#{} размер руки за последовательную",
                    "руку, содержащую {C:attention}Стрит",
                    "{C:inactive}(Сейчас {C:attention}+#2#{C:inactive} размер руки){}",
                    "{C:inactive}(Максимум {C:attention}+#3#{C:inactive}){}"
                } 
            },
            j_aij_arecibo_message = { name = "Послание Аресибо", text = { "" } },
            j_aij_napkin = { 
                name = "Салфетка", 
                text = { 
                    "Этот Джокер получает {X:mult,C:white}X#1#{}",
                    "Множ., когда {C:attention}2{} Блайнда",
                    "пропущены {C:attention}подряд",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множ.){}",
                }
            },
            j_aij_lost_carcosa = { 
                name = "Потерянная Каркоза", 
                text = { 
                    "Случайно меняет {C:chips}Фишки{} и {C:mult}Множ.",
                    "использованных карт {C:planet}Планет",
                    "от {C:attention}#1#%{} до {C:attention}#2#%{}",
                    "их исходных значений"
                } 
            },
            j_aij_magic_mirror = { 
                name = "Волшебное зеркало", 
                text = { 
                    "Применяет {C:dark_edition}Негатив{} к первой",
                    "подсчитанной {C:attention}карте с лицом{} в этом {C:attention}Анте",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_postcard_from_perdition_trail = { name = "Открытка с тропы погибели", text = { "" } },
            j_aij_mr_lonely = {
                name = "Мистер Одиночество",
                text = {
                    "Этот Джокер получает {C:chips}+#1# Фишек",
                    "за пустой {C:attention}слот Джокера{}",
                    "в конце {C:attention}раунда{}",
                    "{C:inactive}(Сейчас{} {C:chips}+#2#{C:inactive} Фишек)"
                },
            },
            j_aij_spiders_georg = { 
                name = "Паук Георг", 
                text = { 
                    "Умножает {C:mult}Множ.{} на {C:attention}#2#{} плюс",
                    "{C:attention}среднее{} количество {C:attention}8-ок{},",
                    "{C:attention}подсчитанных{} за руку в этой партии",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множ.)",
                } 
            },
            j_aij_gille = { name = "Жиль", text = { "" } },
            j_aij_fulehung = { 
                name = "Фюлехунг", 
                text = { 
                    "При выборе {C:attention}Блайнда{},",
                    "{C:green}#1# к #2#{} шанс получить",
                    "его {C:attention}Жетон пропуска" 
                } 
            },
            j_aij_bearded_joker = { 
                name = "Бородатый джокер", 
                text = { 
                    "{C:mult}+#1#{} Множ. за каждую {C:attention}Улучшенную{}",
                    "карту в вашей {C:attention}полной колоде",
                    "{C:inactive}(Сейчас {C:mult}+#2#{} {C:inactive}Множ.)"
                } 
            },
            j_aij_skomorokh = { 
                name = "Скоморох", 
                text = { 
                    "Этот Джокер получает {X:mult,C:white}X#1#{} Множ.", 
                    "за каждую {C:attention}Изданную{} карту в вашей",
                    "{C:attention}полной колоде",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{} {C:inactive}Множ.)"
                } 
            },
            j_aij_silly_billy = { name = "Силли Билли", text = { "" } },
            j_aij_ijoker_co = { 
                name = "iJoker.co", 
                text = { 
                    "{C:attention}#1#{} случайных {C:attention}Жетона{} доступны",
                    "для покупки в каждом {C:money}магазине" 
                } 
            },
            j_aij_corpse_paint = { 
                name = "Корпспейнт", 
                text = { 
                    "Снимает {C:dark_edition}Негатив{} с",
                    "подсчитанных карт. За каждую,",
                    "{C:green}#1# к #2#{} шанс, что этот Джокер",
                    "получит {C:attention}+#3# размер руки",
                    "{C:inactive}(Сейчас {C:attention}+#4#{C:inactive} размер руки)"
                } 
            },
            j_aij_toothy_joker = { 
                name = "Зубастый джокер", 
                text = { 
                    "{C:chips}+#1#{} Фишек за каждую карту {C:tarot}Таро,",
                    "использованную в этом {C:attention}Анте",
                    "{C:inactive}(Сейчас{} {C:chips}+#2#{C:inactive} Фишек)"
                } 
            },
            j_aij_mondrian_joker = {
                name = "Мондриан",
                text = {
                    "{C:mult}+#1#{} Множ. за каждую {C:attention}4-ку",
                    "в вашей {C:attention}полной колоде",
                    "{C:inactive}(Сейчас{} {C:mult}+#2#{}{C:inactive} Множ.)"
                },
            },
            j_aij_orphic_joker = {
                name = "Орфический джокер",
                text = {
                    "Создаёт {C:attention}#1#{} случайного",
                    "{C:uncommon}Необычного{} {C:attention}Джокера{}, когда",
                    "{C:attention}Блайнд{} пропущен",
                    "{C:inactive}(Должно быть место){}"
                },
            },
            j_aij_the_artist = { 
                name = "Художник", 
                text = { 
                    "{C:attention}+#1#{} к лимиту выбора для",
                    "карт {C:tarot}Таро" 
                } 
            },
            j_aij_toynbee_joker = { name = "Тойнби", text = { "" } },
            j_aij_aluzinnu = {
                name = "Алузинну",
                text = {
                    "Купоны {C:attention}Иероглиф{} и {C:attention}Петроглиф",
                    "не имеют {C:attention}никаких{} {C:red}недостатков{} и",
                    "могут появляться {C:attention}многократно"
                }
            },
            j_aij_great_kraken = { 
                name = "Великий Кракен", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ. за каждую",
                    "оставшуюся {C:blue}руку",
                    "{C:inactive}(Даст {X:mult,C:white}X#2#{} {C:inactive}Множ.)",
                    "{C:inactive}(Минимум {X:mult,C:white}X1{C:inactive} Множ.)"
                } 
            },
            j_aij_truhan = { 
                name = "Трухан", 
                text = { 
                    "Когда любой Джокер {C:money}продан{} или",
                    "{C:red}уничтожен{}, этот Джокер получает {X:mult,C:white}X#2#{}",
                    "Множ. за каждый {C:attention}раунд{}, который тот Джокер",
                    "был на руках",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множ.)"
                } 
            },
            j_aij_chippy = { 
                name = "Чиппи", 
                text = { 
                    "Этот Джокер получает {C:chips}Фишки{},",
                    "равные потраченным {C:money}деньгам",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)",
                } 
            },
            j_aij_hofnarr_the_barbarian = {
                name = "Хофнарр-варвар",
                text = {
                    "{C:mult}+#1#{} Множ.",
                    "На {C:attention}Финальных Босс-блайндах{}, {C:attention}отключает{}",
                    "их и даёт {X:mult,C:white}X#2#{} Множ."
                },
            },
            j_aij_histrio = { 
                name = "Гистрион", 
                text = { 
                    "Даёт на {C:money}$#1#{} больше за",
                    "каждую {C:attention}неиспользованную руку",
                    "в конце раунда"
                } 
            },
            j_aij_loregg = { name = "Лорегг", text = { "" } },
            j_aij_egg_cc = {
                name = "\"яйцо\"",
                text = {
                    "Этот Джокер получает {C:chips}+#2#{} Фишек",
                    "и {C:money}$#3#{} к {C:attention}стоимости продажи{}",
                    "в конце раунда",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)",
                    "{C:inactive}хей это \"яйцо\""
                },
            },
            j_aij_sot = { 
                name = "Пьянчуга", 
                text = { 
                    "Получает {X:mult,C:white}X#1#{} Множ. за",
                    "каждый имеющийся {C:attention}Жетон",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{} {C:inactive}Множ.)"
                } 
            },
            j_aij_fat_ed = { name = "Толстый Эд", text = { "" } },
            j_aij_stained_glass_joker = {
                name = "Витражный джокер",
                text = {
                    "{C:attention}Стеклянные карты{} считаются",
                    "как любая {C:attention}масть{}",
                },
            },
            j_aij_mushroom_cloud = { name = "Грибное облако", text = { "" } },
            j_aij_overdesigned_joker = {
                name = "Перегруженный джокер",
                text = {
                    {
                        "Подсчитанные {V:1}#1#{} #3# {B:3,V:2}#4##2#{}#5#",
                    },
                    {
                        "Масть и эффект {C:attention}вращаются{},",
                        "когда карта {C:attention}подсчитывается",
                        "{C:inactive}({V:4}Червы{C:inactive}->{V:5}Трефы{C:inactive}->{V:6}Бубны{C:inactive}->{V:7}Пики{C:inactive}){}"
                    }
                }
            },
            j_aij_morio = {
                name = "Морио",
                text = {
                    "Когда {C:attention}Босс-блайнд{}",
                    "побежден, выберите {C:attention}любую{}",
                    "карту {C:tarot}Таро{} для создания",
                    "{C:inactive}(Должно быть место)"
                }
            },
            j_aij_visage = { 
                name = "Лик", 
                text = { 
                    "Копирует эффект",
                    "последнего {C:money}проданного{} джокера" 
                } 
            },
            j_aij_goofball = { 
                name = "Балбес", 
                text = { 
                    "Подсчитанные {C:attention}карты с лицом{} {C:aij_plasma}усредняют{}",
                    "{C:attention}#1#%{} от {C:chips}Фишек{} и {C:mult}Множ.{}"
                } 
            },
            j_aij_heyokha = { name = "Хейокха", text = { "" } },
            j_aij_casual_absent_paranoia = { name = "Случайно-отсутствующая паранойя", text = { "" } },
            j_aij_mandrake = { 
                name = "Мандрагора", 
                text = { 
                    "Спустя {C:attention}#2#{} раундов, {C:money}продайте",
                    "этого Джокера, чтобы {C:red}уничтожить{}",
                    "все карты {C:attention}в руке",
                    "{C:inactive}(Сейчас {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_jester_zombie = { 
                name = "Шут-зомби", 
                text = { 
                    "Повторно активирует все {C:attention}подсчитанные{} карты,",
                    "если {C:attention}игральная карта{} была",
                    "{C:red}уничтожена{} в этом раунде",
                    "{C:inactive}#1#{}"
                } 
            },
            j_aij_richie_rich = { name = "Богатенький Ричи", text = { "" } },
            j_aij_devil_deal = { 
                name = "Сделка с дьяволом", 
                text = { 
                    "Этот Джокер получает {X:mult,C:white}X#1#{}",
                    "Множ., когда {C:hearts}Черва{}",
                    "{C:attention}уничтожается",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{} {C:inactive}Множ.)",
                } 
            },
            j_aij_totally_nuts = { 
                name = "Полный отпад", 
                text = { 
                    "{C:attention}+#1#{} Слотов расходников,",
                    "{C:attention}расходуются{}, когда",
                    "{C:attention}расходник{} {C:money}продается" 
                } 
            },
            j_aij_warhol = { name = "Уорхол", text = { "" } },
            j_aij_mistake = {
                name = "Ошибка",
                text = {
                    "{C:attention}Вечные{} Джокеры",
                    "могут быть {C:attention}проданы",
                }
            },
            j_aij_depth_of_delusion = { name = "Глубина заблуждения", text = { "" } },
            j_aij_curse_of_scotland = { name = "Проклятие Шотландии", text = { "" } },
            j_aij_banana_man = { 
                name = "Человек-банан", 
                text = { 
                    {
                        "{C:attention}Повторно активирует{} всех",
                        "остальных Джокеров",
                    },
                    {
                        "Каждый Джокер имеет шанс {C:green}#1# к #2#{}",
                        "быть {C:red}уничтоженным",
                        "после каждой руки"
                    }
                } 
            },
            j_aij_corny_joker = { name = "Банальный джокер", text = { "" } },
            j_aij_entropy = { 
                name = "Энтропия", 
                text = { 
                    "Создает {C:attention}Жетон Хаоса,",
                    "когда Блайнд {C:attention}пропущен"
                } 
            },
            j_aij_urchin = { 
                name = "Беспризорник", 
                text = { 
                    "Даёт {C:money}$#2#{} в конце",
                    "раунда за каждый {C:attention}Блайнд{},",
                    "пропущенный в этой партии",
                    "{C:inactive}(Сейчас {C:money}$#1#{}{C:inactive}){}"
                } 
            },
            j_aij_machine_intelligence = { name = "Машинный интеллект", text = { "" } },
            j_aij_grandma = { name = "Бабушка", text = { "" } },
            j_aij_funny_money = { 
                name = "Фальшивые деньги", 
                text = { 
                    "Даёт {C:money}$#1#{} при",
                    "{C:attention}пропуске{} Блайнда"
                } },
            j_aij_witchfinder = { 
                name = "Охотник на ведьм", 
                text = { 
                    "{C:attention}#1#{} дополнительный {C:tarot}Набор аркана{}",
                    "доступен в {C:money}Магазине"
                } 
            },
            j_aij_trophy_kill = { name = "Трофейное убийство", text = { "" } },
            j_aij_tract = { 
                name = "Тракт", 
                text = { 
                    "{C:chips}+#1#{} Фишек за каждый",
                    "имеющийся {C:attention}Купон",
                    "{C:inactive}(Сейчас {C:chips}+#2#{} {C:inactive}Фишек){}"
                } 
            },
            j_aij_stock_broker = { 
                name = "Биржевой маклер", 
                text = { 
                    "Умножает {C:money}проценты{} на",
                    "случайную величину между",
                    "{C:attention}X#1#{} и {C:attention}X#2#" 
                } 
            },
            j_aij_omlette = { 
                name = "Омлет", 
                text = { 
                    "Получает {C:money}$#1#{} к стоимости продажи,",
                    "когда используется {C:blue}рука{} или {C:red}сброс",
                } 
            },
            j_aij_stave = { name = "Нотный стан", text = { "" } },
            j_aij_sunny_side = { name = "Яичница", text = { "" } },
            j_aij_omelette = { name = "Омлет", text = { "" } },
            j_aij_theyre_looking_at_you = { name = "Они смотрят на тебя...", text = { "" } },
            j_aij_comedy_of_errors = { 
                name = "Комедия ошибок", 
                text = { 
                    "Даёт {C:money}$#1#{}, когда",
                    "{C:hearts}Черва{} {C:red}сбрасывается",
                } 
            },
            j_aij_fuzzy_joker = { 
                name = "Нечёткий джокер",
                text = { 
                    "Округляет {C:mult}Множ.{} вверх до",
                    "следующей степени {C:attention}#1#" 
                } 
            },
            j_aij_saucy_jacky = { name = "Дерзкий Джеки", text = { "" } },
            j_aij_funny_phone = { name = "Смешной телефон", text = { "" } },
            j_aij_taggart = { 
                name = "Таггарт", 
                text = { 
                    "Создаёт {C:attention}#1# копию{} каждого",
                    "полученного {C:attention}Жетона",
                    "{C:inactive}(Кроме Жетона-дубля)"
                } 
            },
            j_aij_chitty = { 
                name = "Читти", 
                text = { 
                    "{C:attention}+#1#{} {C:attention}Купон{} доступен",
                    "для покупки в {C:attention}Магазине" 
                } 
            },
            j_aij_whatsisname = { 
                name = "Как-его-там", 
                text = { 
                    "Наборы {C:attention}Угадай шутку{}",
                    "встречаются чаще"
                } 
            },
            j_aij_downing_street = { 
                name = "Даунинг-стрит", 
                text = { 
                    "Подсчитываемые {C:attention}10-ки{} имеют шанс {C:green}#1# к #2#{}",
                    "создать случайный {C:attention}Жетон"
                } 
            },
            j_aij_one_little_duck = { name = "Одна маленькая уточка", text = { "" } },
            j_aij_four_leaf_clover = { name = "Четырёхлистный клевер", text = { "" } },
            j_aij_aphantasia = { 
                name = "Афантазия", 
                text = { 
                    "Все сыгранные {C:attention}улучшенные{} карты",
                    "становятся {C:red}Хаотичными{}" 
                } 
            },
            j_aij_tabula_rasa = { 
                name = "Табула Раса", 
                text = { 
                    "При выборе {C:attention}Блайнда{},",
                    "{C:dark_edition}Издание{} этого Джокера удаляется,",
                    "и его эффекты становятся {C:jest_inherent}врожденными" 
                } 
            },
            j_aij_vitruvian_joker = {
                name = "Витрувианский клоун",
                text = {
                    "{X:mult,C:white}X#1#{} Множ., если у вас",
                    "ровно {C:attention}5{} Джокеров"
                }
            },
            j_aij_american_comic = { name = "Американский комик", text = { "" } },
            j_aij_from_the_top_rope = { name = "С верхней веревки", text = { "" } },
            j_aij_fortune_cookie = { 
                name = "Печенье с предсказанием", 
                text = { 
                    "Создает случайную карту {C:tarot}Таро,",
                    "когда любой {C:attention}Бустерный{}",
                    "{C:attention}набор{} открывается. Исчезает",
                    "после {C:attention}#1#{} наборов",
                    "{C:inactive}(Должно быть место){}",
                } 
            },
            j_aij_tilty_joker = { 
                name = "Тилт", 
                text = { 
                    "{C:attention}Подсчитываемые{} карты дают {C:attention}X#1#",
                    "их базовых {C:chips}Фишек" 
                } 
            },
            j_aij_opening_move = { 
                name = "Дебют", 
                text = { 
                    {
                        "Получает {X:mult,C:white}X#1#{} Множ.{} на этот раунд",
                        "за каждую карту {C:attention}подсчитанную{} в",
                        "{C:attention}первой руке{} раунда",
                        "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множ.)",
                    },
                    {
                        "{C:attention}Первая рука{} каждого раунда",
                        "{C:red}не{} добавляется к вашему счету",
                    },
                } 
            },
            j_aij_bartender = { 
                name = "Бармен", 
                text = { 
                    "{C:attention}Расходники{} могут быть",
                    "{C:dark_edition}Фольгированными{}, {C:dark_edition}Голографическими{} или",
                    "{C:dark_edition}Полихромными" 
                } 
            },
            j_aij_mahoney = { 
                name = "Махоуни", 
                text = { 
                    "{C:green}#1# к #2#{} шанс",
                    "создать {C:attention}Жетон-купон{},",
                    "когда Блайнд {C:attention}пропущен",
                } 
            },
            j_aij_le_fils_de_banane = { 
                name = "Сын банана", 
                text = { 
                    "Подсчитанные {C:attention}карты с лицом{} дают {C:mult}+#3#",
                    "Множ., но имеют {C:green}#1# к #2#{}",
                    "шанс {C:red}уничтожить{} себя" 
                } 
            },
            j_aij_pygmalion = { 
                name = "Пигмалион", 
                text = { 
                    "Все {C:attention}Каменные{} карты",
                    "считаются {C:attention}Дамами",
                } 
            },
            j_aij_grue = { name = "Грю", text = { "" } },
            j_aij_heavy_sixer = { name = "Тяжелая шестёрка", text = { "" } },
            j_aij_tetrominoker = { 
                name = "Тетроминокер", 
                text = { 
                    "Подсчитываемые {C:attention}4-ки{} имеют {C:green}#1# к #2#{}",
                    "шанс создать {C:attention}копию{}",
                    "себя" 
                } 
            },
            j_aij_mr_catfish = { 
                name = "Мистер Сом", 
                text = { 
                    "Даёт {C:money}$#1#{} каждые {C:attention}#2#{C:inactive} [#3#]{}",
                    "сброшенных карт"
                } 
            },
            j_aij_angel_number = { 
                name = "Число ангела", 
                text = { 
                    "{C:attention}+#1#{} ко всем {C:green}указанным",
                    "{C:green}вероятностям{} за каждую",
                    "подсчитываемую {C:attention}7-ку{}, сыгранную в этой руке",
                } 
            },
            j_aij_doctors_orders = { 
                name = "Назначение врача", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ. за каждую {C:attention}9-ку{} в сыгранной",
                    "руке, {C:red}самоуничтожается{}, если",
                    "{C:attention}9-ки{} не были сыграны"
                } 
            },
            j_aij_blue_eyes_white_joker = { 
                name = "Синеглазый белый джокер", 
                text = { 
                    "Если {C:attention}последняя рука{} раунда",
                    "состоит ровно из {C:attention}1{} карты,",
                    "она навсегда получает",
                    "{C:attention}+#1# повторную активацию"
                } 
            },
            j_aij_lucina = { 
                name = "Пирующий шут", 
                text = { 
                    "При {C:attention}выборе Блайнда,",
                    "{C:red}уничтожает{} Джокера {C:attention}слева",
                    "и применяет случайное {C:dark_edition}Издание",
                    "к Джокеру {C:attention}справа",
                } 
            },
            j_aij_circuit_diagram = { 
                name = "Принципиальная схема", 
                text = { 
                    "{C:attention}Заряженные{} карты всегда",
                    "замешиваются наверх колоды",
                } 
            },
            j_aij_paracosm = { 
                name = "Паракосм", 
                text = { 
                    "Повышает уровень",
                    "самой частой {C:attention}покерной комбинации,",
                    "когда {C:attention}Блайнд{} пропущен",
                    "{C:inactive}(Сейчас #1#)"
                } 
            },
            j_aij_mocap = { 
                name = "Мокап", 
                text = { 
                    {
                        "Когда {C:legendary}Легендарный{}, {C:rare}Редкий{},",
                        "или {C:uncommon}Необычный{} Джокер {C:money}продан{},",
                        "создаёт {C:attention}случайного{} Джокера",
                        "следующей более низкой редкости"
                    }, 
                    {
                        "{C:legendary}Легендарный{} -> {C:rare}Редкий{}",
                        "{C:rare}Редкий{} -> {C:uncommon}Необычный{}",
                        "{C:uncommon}Необычный{} -> {C:common}Обычный{}"
                    }
                } 
            },
            j_aij_stagehand = { 
                name = "Рабочий сцены", 
                text = { 
                    "Все {C:attention}Джокеры{} дают",
                    "{X:mult,C:white}X#1#{} Множ."
                } 
            },
            j_aij_the_mermaid = { name = "Русалка", text = { "" } },
            j_aij_colour_test = { 
                name = "Цветовой тест", 
                text = { 
                    "Применяет {C:attention}Полихром{} к первой",
                    "подсчитываемой карте на {C:attention}последней",
                    "{C:attention}руке{} раунда"
                } 
            },
            j_aij_test_card = { 
                name = "Настроечная таблица", 
                text = { 
                    "{C:attention}Издания{} в руке",
                    "активируют свои эффекты"
                } 
            },
            j_aij_interstate = { 
                name = "Автострада", 
                text = { 
                    "{C:blue}+#1#{} Руки в этом раунде, если",
                    "{C:attention}первая{} рука раунда",
                    "содержит {C:attention}Стрит{}"
                } 
            },
            j_aij_bowls_of_joy = { name = "Чаши радости", text = { "" } },
            j_aij_chips_n_dip = {
                name = "Чипсы и соус",
                text = {
                    "{X:chips,C:white}X#1#{} Фишек, теряет {X:chips,C:white}X#2#{} Фишек",
                    "в конце {C:attention}раунда"
                }
            },
            j_aij_homemade_comic = { 
                name = "Самодельный комикс", 
                text = { 
                    "Подсчитанные {C:attention}Заряженные карты{}",
                    "дают {X:mult,C:white}X#1#{} Множ.",
                } 
            },
            j_aij_gematria = { name = "Гематрия", text = { "" } },
            j_aij_bingo_card = { 
                name = "Карточка Бинго", 
                text = { 
                    "Подсчитанные {C:attention}Счастливые карты{} имеют",
                    "{C:green}#1# к #2#{} шанс на {X:mult,C:white}X#5#{} Множ.",
                    "и {C:green}#3# к #4#{} шанс {C:attention}сработать повторно"
                } 
            },
            j_aij_fish_fingers = { 
                name = "Рыбные палочки", 
                text = { 
                    "{C:blue}+#1#{} Руки за раунд,",
                    "теряет {C:blue}-#2#{} Руку, когда Блайнд",
                    "{C:attention}побежден"
                } 
            },
            j_aij_joker_png = { 
                name = "Joker.png", 
                text = { 
                    {
                    '{B:1,C:white,s:0.8}Активируемая способность',
                    'Этот Джокер {C:attention}копирует{}',
                    '{C:attention}эффект{} случайного {C:attention}Джокера',
                    },
                    {
                    'Заплатите {C:money}$#1#{}, чтобы обновить, увеличивается',
                    'на {C:money}$#1#{} за обновление в этом Анте'
                    }
                } 
            },
            j_aij_kuruko = { name = "Куруко", text = { "" } },
            j_aij_candy_floss = { 
                name = "Сахарная вата", 
                text = { 
                    "{C:aij_plasma}Усредняет{} {C:attention}#1#%{} от {C:chips}Фишек{}",
                    "и {C:mult}Множ.{}, уменьшается",
                    "на {C:attention}#2#%{} в конце раунда"
                } 
            },
            j_aij_stargazy_pie = { 
                name = "Пирог со звёздами", 
                text = { 
                    "Повторно активирует следующие {C:attention}#1#{}",
                    "использованные карты {C:planet}Планет" 
                } 
            },
            j_aij_electric_snow = { 
                name = "Электрический снег", 
                text = { 
                    "Раунд заканчивается только {C:attention}после{}",
                    "{C:attention}последней руки{} раунда" 
                } 
            },
            j_aij_gameshow = { 
                name = "Телеигра", 
                text = { 
                    {
                        "{C:green}#1# к #2#{} шанс добавить",
                        "{C:dark_edition}Фольгированное{}, {C:dark_edition}Голографическое{} или",
                        "{C:dark_edition}Полихромное{} издание",
                        "случайному {C:attention}Джокеру",
                        "при выборе {C:attention}блайнда",
                    },
                    { 
                        "{C:money}-$#3#{} при срабатывании",
                        "независимо от исхода"
                    } ,
                },
            },
            j_aij_bonus_pay = { 
                name = "Премия", 
                text = { 
                    "Даёт {C:money}$#1#{}, когда",
                    "{C:attention}Бонусная карта{} подсчитывается"
                } 
            },
            j_aij_illuminated_joker = { 
                name = "Иллюминированный джокер", 
                text = { 
                    "{C:money}Золотые{} Жетоны появляются",
                    "{C:attention}чаще" 
                } 
            },
            j_aij_magazine_ad = { name = "Реклама в журнале", text = { "" } },
            j_aij_bonus_bob = { 
                name = "Бонус Боб", 
                text = { 
                    "{C:attention}Бонусные карты{} дают",
                    "{X:chips,C:white}X#1#{} Фишек при подсчёте"
                } 
            },
            j_aij_bonus_round = { 
                name = "Бонус-раунд", 
                text = { 
                    "{C:attention}Повторно активирует{} все",
                    "подсчитанные {C:attention}Бонусные карты{}",
            } 
            },
            j_aij_jack_o_lantern = { name = "Фонарь Джека", text = { "" } },
            j_aij_astrologer = { 
                name = "Астролог", 
                text = { 
                    {
                        "{C:attention}+#1#{} выбор в {C:planet}Небесных наборах" 
                    },
                    {
                        "Карты {C:planet}Планет{} заменяются",
                        "их {C:mult}Множ.{} вариантом в {C:attention}нечётных",
                        "Анте и их {C:chips}Фишечным",
                        "вариантом в {C:attention}чётных{} Анте"
                    },
                } 
            },
            j_aij_planetarium = { 
                name = "Планетарий", 
                text = { 
                    {
                        "Карты {C:planet}Планет{} типа {C:chips}Фишки{} в",
                        "ваших {C:attention}расходниках{} дают",
                        "{C:chips}+#1#{} Фишек для их",
                        "указанной {C:attention}покерной комбинации" 
                    },
                    {
                        "Карты {C:planet}Планет{} типа {C:mult}Множ.{} в",
                        "ваших {C:attention}расходниках{} дают",
                        "{C:mult}+#2#{} Множ. для их",
                        "указанной {C:attention}покерной комбинации" 
                    },
                } 
            },
            j_aij_negative_space = { 
                name = "Негативное пространство", 
                text = { 
                    "{C:attention}+#1#{} Размер руки за каждого",
                    "{C:dark_edition}Негативного{} Джокера",
                    "{C:inactive}(Сейчас {C:attention}+#2#{} {C:inactive}Размер руки){}",
                    "{C:inactive}(Максимум {C:attention}+#3#{}{C:inactive})"
                } 
            },
            j_aij_stargazer = { name = "Звездочет", text = { "" } },
            j_aij_skald = { name = "Скальд", text = { "" } },
            j_aij_sky_trees = { 
                name = "Небесные деревья", 
                text = { 
                    "{C:attention}Синие печати{} дают карты",
                    "{C:planet}Планет{} обоих типов ({C:mult}Множ.{} и {C:chips}Фишки{})",
                    "вместо {C:attention}базовых{} карт {C:planet}Планет" 
                } 
            },
            j_aij_the_freezer = { name = "Морозильник", text = { "" } },
            j_aij_twisted_pair = { 
                name = "Витая пара", 
                text = { 
                    "Если рука - {C:attention}Пара{}, каждая карта",
                    "получает {C:attention}нашивку масти{}, соответствующую",
                    "масти {C:attention}другой карты" 
                } 
            },
            j_aij_the_grim_joker = { 
                name = "Мрачный джокер", 
                text = { 
                    "{C:attention}Расходники{}, созданные",
                    "{C:planet}Синими{} или {C:tarot}Фиолетовыми{} Печатями, имеют",
                    "{C:green}#1# к #2# шанс{} быть",
                    "{C:dark_edition}Негативными"
                } 
            },
            j_aij_lexicon = { 
                name = "Лексикон", 
                text = { 
                    "Добавляет {C:mult}Множ.{}, равный",
                    "{C:attention}сумме{} всех цифр в",
                    "{C:attention}описаниях способностей{} имеющихся",
                    "{C:attention}Джокеров" ,
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множ.)"
                } 
            },
            j_aij_dendroglpyh = { name = "Дендроглиф", text = { "" } },
            j_aij_prank_caller = { name = "Телефонный хулиган", text = { "" } },
            j_aij_arngren = { 
                name = "Arngren", 
                text = { 
                    "{C:attention}+#1#{} Слот карты, {C:attention}+#1#{} Слот",
                    "Бустера, и {C:attention}+#1#{} Слот Купона",
                    "в {C:money}магазине"
                } 
            },
            j_aij_blacklist = { 
                name = "Чёрный список", 
                text = { 
                    "{C:money}Проданные{} джокеры больше не могут",
                    "появляться",
                    "Сейчас в черном списке:",
                } 
            },
            j_aij_croupier = { 
                name = "Крупье", 
                text = { 
                    "Даёт {C:money}$#1#{}, если финальный счёт",
                    "более чем в {C:attention}два раза{} превышает",
                    "требование блайнда" 
                } 
            },
            j_aij_the_lucovico_technique = { name = "Метод Людовико", text = { "" } },
            j_aij_headstone = { 
                name = "Надгробие", 
                text = { 
                    "Все {C:attention}Карты с лицом{} замешиваются",
                    "в {C:red}низ{} вашей колоды" 
                } 
            },
            j_aij_full_monty = { name = "Полный Монти", text = { "" } },
            j_aij_chef = { 
                name = "Шеф-повар", 
                text = {
                    {
                        "Базовые {C:attention}Временные{}",
                        "Джокеры становятся {C:dark_edition}Негативными",
                    },
                    {
                        "{C:attention}Издания{} на {C:attention}Временных",
                        "Джокерах больше не имеют",
                        "наценки в {C:money}магазине" 
                    }
                } 
            },
            j_aij_screamer = { name = "Крикун", text = { "" } },
            j_aij_evil_twin = { name = "Злой близнец", text = { "" } },
            j_aij_cubic_joker = { name = "Кубический джокер", text = { "" } },
            j_aij_remina = { 
                name = "Ремина", 
                text = { 
                    "Когда выбран {C:attention}Малый блайнд{} или {C:attention}Большой блайнд",
                    "этот Джокер",
                    "{C:red}уничтожает{} все {C:planet}Карты планет{}",
                    "в ваших {C:attention}расходниках{} и",
                    "получает их {C:chips}Фишки{} и {C:mult}Множ.{}",
                    "{C:inactive,s:0.8}(Сейчас {C:chips,s:0.8}+#2#{} {C:inactive,s:0.8}Фишек, {C:mult,s:0.8}+#1#{C:inactive,s:0.8} Множ.)"
                } 
            },
            j_aij_jpeg = { name = ".jpeg", text = { "" } },
            j_aij_sherrif = { 
                name = "Шериф",
                text = { 
                    "Первая подсчитанная {C:attention}Дикая карта{}",
                    "каждой руки приносит {C:money}$#1#{}"
                } 
            },
            j_aij_alien_joker = { 
                name = "Инопланетный джокер", 
                text = { 
                    {
                        "{C:attention}Принуждает 1{} карту",
                        "быть выбранной",
                    },
                    {
                        "{C:attention}Принудительно выбранные{} карты дают",
                        "{X:mult,C:white}X#1#{} Множ. при подсчёте" 
                    }
                } 
            },
            j_aij_nobody = { 
                name = "Никто", 
                text = { 
                    "{C:inactive}Ничего не делает...?" 
                } 
            },
            j_aij_broken_dreams = { name = "Разбитые мечты", text = { "" } },
            j_aij_elf = { 
                name = "Эльф", 
                text = { 
                    "После пропуска {C:attention}#2#{} Блайндов,",
                    "{C:money}продайте{} этого Джокера, чтобы создать",
                    "{C:attention}#3# Инвестиционных жетонов",
                    "{C:inactive}(Сейчас {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_fall_of_count_chaligny = {
                name = "Падение графа Шаллини",
                text = { 
                    "Устанавливает {C:attention}требуемый{} счёт",
                    "всех {C:attention}Блайндов{} на {C:attention}1X{} Базы"
                } 
            },
            j_aij_mp_fall_of_count_chaligny = {
                name = "Падение графа Шаллини",
                text = { 
                    "Устанавливает {C:attention}требуемый{} счёт",
                    "всех {C:attention}Блайндов{} на {C:attention}1X{} Базы",
                    "{C:inactive}(Не влияет на PvP блайнды){}"
                } 
            },
            j_aij_coulrorachne = { 
                name = "Кулрорахна", 
                text = { 
                    "Этот Джокер получает {C:mult}+#1#{} Множ.",
                    "каждые {C:attention}#4# {C:inactive}[#3#]{} подсчитанных {C:attention}8-ок",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множ.)" 
                } 
            },
            j_aij_bad_sun = { 
                name = "Плохое солнце", 
                text = { 
                    "Если {C:attention}сыгранная{} рука содержит {C:attention}#1#",
                    "или более {C:hearts}Червей{}, уничтожает",
                    "{C:attention}случайную{} сыгранную карту" 
                } 
            },
            j_aij_lemarchand_cube = { name = "Куб Лемаршана", text = { "" } },
            j_aij_duende = { name = "Дуэнде", text = { "" } },
            j_aij_evil_joker = { 
                name = "Злой джокер", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множ., уничтожает",
                    "{C:attention}случайного{} Джокера при",
                    "{C:attention}получении" 
                } 
            },
            j_aij_sanguine_joker = { 
                name = "Сангвинический джокер", 
                text = { 
                    "Сыгранные карты масти {C:hearts}Червы",
                    "имеют {C:green}#1# к #2#{} шанс",
                    "создать случайный {C:attention}Жетон{}",
                    "при подсчёте"
                } 
            },
            j_aij_choleric_joker = { 
                name = "Холерический джокер", 
                text = { 
                    "Сыгранные карты масти {C:diamonds}Бубны",
                    "имеют {C:green}#1# к #2#{} шанс",
                    "создать случайную карту {C:tarot}Таро{}",
                    "при подсчёте",
                    "{C:inactive}(Должно быть место){}"
                } 
            },
            j_aij_phlegmatic_joker = { 
                name = "Флегматичный джокер", 
                text = { 
                    "Сыгранные карты масти {C:clubs}Трефы",
                    "имеют {C:green}#1# к #2#{} шанс",
                    "создать карту {C:planet}Планеты",
                    "для {C:attention}сыгранной руки{}",
                    "при подсчёте",
                    "{C:inactive}(Должно быть место){}"
                } 
            },
            j_aij_melancholic_joker = { 
                name = "Меланхоличный джокер", 
                text = { 
                    "Сыгранные карты масти {C:spades}Пики",
                    "имеют {C:green}#1# к #2#{} шанс",
                    "создать случайную",
                    "{C:spectral}Спектральную{} карту при подсчёте",
                    "{C:inactive}(Должно быть место){}"
                } 
            },
            j_aij_majordomo = { 
                name = "Мажордом", 
                text = { 
                    {
                        "Все {C:attention}Джокеры{} в {C:money}магазине,",
                        "которые стоят больше {C:money}$#1#",
                        "получают {C:money}Арендуемый{} стикер" 
                    },
                    {
                        "{C:attention}Аренда{} вычитает на {C:money}$2{} меньше"
                    }
                }
            },
            j_aij_skinsuit = { 
                name = "Кожаный костюм", 
                text = { 
                    "Когда карта {C:red}уничтожается{},",
                    "пришивает её {C:attention}масть{} на {C:attention}случайную",
                    "{C:attention}карту{} в руке" 
                } 
            },
            j_aij_shock_humor = { name = "Шоковый юмор", text = { "" } },
            j_aij_the_house_that_jack_built = { name = "Дом, который построил Джек", text = { "" } },
            j_aij_clownbug = { name = "Клоун-жук", text = { "" } },
            j_aij_infamous_machine = { 
                name = "Печально известная машина", 
                text = {
                
                } 
            },
            j_aij_weatherman = { 
                name = "Синоптик", 
                text = {
                
                } 
            },
            j_aij_headfooter = { 
                name = "Headfooter", 
                text = {
                
                } 
            },
            j_aij_rudolph = { 
                name = "Рудольф", 
                text = {
                
                } 
            },
            j_aij_cut_here = { 
                name = "Отрезать здесь", 
                text = {
                    "Когда этот Джокер",
                    "{C:red}уничтожается{}, создаёт",
                    "случайного {C:red}Редкого{} Джокера"
                } 
            },
            j_aij_a_young_hamlet = { 
                name = "Юный Гамлет", 
                text = {
                    "Этот Джокер получает {C:mult}+#2#{} Множ.",
                    "каждые {C:attention}#3#{C:inactive} [#4#]{} {C:red}сброшенных{} карт",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множ.)"
                } 
            },
            j_aij_mike_check = { 
                name = "Майк Чек", 
                text = {
                
                } 
            },
            j_aij_pure_baseball_card = { 
                name = "Чистая бейсбольная карточка", 
                text = {
                
                } 
            },
            j_aij_rock_n_roll_clown = { 
                name = "Рок-н-ролльный клоун", 
                text = {
                
                } 
            },
            j_aij_vecchio_dolore = { 
                name = "Веккьо Долоре", 
                text = {
                
                } 
            },
            j_aij_firework = { 
                name = "Фейерверк", 
                text = {
                    "Первая сыгранная {C:attention}Множительная",
                    "карта даёт {X:mult,C:white}X#1#{} Множ.",
                    "при подсчёте",
                } 
            },
             j_aij_bad_guy = { 
                name = "Плохой парень", 
                text = {
                    "Применяет {C:attention}Фольгу{} к случайной",
                    "карте {C:attention}в руке{}, когда",
                    "{C:attention}Босс-блайнд{} побеждён"
                } 
            },
            
            j_aij_tool = { 
                name = "Инструмент", 
                text = {
                    "Карты, меняющие {C:attention}масть{},",
                    "навсегда получают {C:mult}+#1#{} Множ."
                } 
            },
            j_aij_youve_got_mail = { 
                name = "Вам письмо", 
                text = {
                    {
                        "Если {C:red}Не{} {C:dark_edition}Негативный{}, когда",
                        "{C:attention}Блайнд{} выбран, создает",
                        "{C:dark_edition}Негативную {C:attention}копию{} этого Джокера",
                        "с {C:money}$0{} стоимости продажи"
                    },
                    {
                        "{V:1}{B:3,V:2}#1##2#{}{V:1}#3#",
                    }
                } 
            },
            j_aij_fleshgait = { 
                name = "Флешгейт", 
                text = {
                    "{C:attention}Подсчитанные{} карты без",
                    "{C:attention}нашивки масти{} получают",
                    "случайную {C:attention}нашивку масти"
                } 
            },
            j_aij_czar = { 
                name = "Царь", 
                text = {
                    "Копирует {C:attention}эффект{}",
                    "{C:attention}случайного{} открытого Джокера",
                    "из вашей {C:attention}коллекции",
                    "{C:inactive}(Меняется при обновлении",
                    "{C:inactive}Магазина)"
                } 
            },
            j_aij_stage_production = { 
                name = "Постановка", 
                text = {
                    "{B:1,C:white,s:0.8}Активируемая способность",
                    "Раз в раунд, {C:attention}временно",
                    "{C:attention}обновляет{} Джокера справа",
                    "до выбора следующего блайнда",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_pink_slip = { 
                name = "Уведомление об увольнении", 
                text = {
                    "{C:attention}+#1# Лимит выбора{}",
                    "для {C:red}Сбросов"
                } 
            },
            j_aij_chromatist = { 
                name = "Хроматист", 
                text = {
                    "{X:mult,C:white}X#1#{} Множ., когда",
                    "{C:attention}Полихромное{} издание",
                    "срабатывает"
                } 
            },
            j_aij_death_of_a_salesman = { 
                name = "Смерть коммивояжёра", 
                text = {
                    "{C:attention}#1#{} {C:red}Жетон Хаоса{} или {C:red}Анархии",
                    "доступен для покупки в",
                    "каждом {C:money}Магазине"
                } 
            },
            j_aij_parking_space = { 
                name = "Парковочное место", 
                text = {
                    "{X:mult,C:white}X#1#{} Множ., если этот Джокер",
                    "в {C:attention}Слоте Джокера #2#{}",
                    "{C:inactive}(Слот меняется в конце раунда)"
                } 
            },
            j_aij_graffiti = { 
                name = "Граффити", 
                text = {
                    {
                        '{B:1,C:white,s:0.8}Активируемая способность',
                        'Заплатите {C:money}$#1#{}, чтобы получить',
                        'случайный {C:attention}Жетон'
                    },
                    {
                        '{C:money}Стоимость{} увеличивается на {C:red}X#2#',
                        'после использования. Сбрасывается после',
                        'победы над {C:attention}Босс-блайндом{}'
                    }
                } 
            },
            j_aij_historian = {
                name = "Историк", 
                text = {
                    "Добавляет {C:mult}Множ.{}, равный",
                    "{C:attention}тройной{} {C:money}Стоимости продажи{}",
                    "последнего проданного Джокера",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множ.)"
                } 
            },
            j_aij_baddata = {
                name = "БИТЫЕ_ДАННЫЕ", 
                text = {
                } 
            },
            j_aij_office_assistant = {
                name = "Офисный помощник", 
                text = {
                    "{B:1,C:white,s:0.8}Активируемая способность",
                    'Чинит {C:attention}Временного{} или',
                    '{C:attention}Арендуемого{} Джокера {C:attention}справа'
                } 
            },
            j_aij_cavalier = {
                name = "Кавалер", 
                text = {
                    "{C:mult}+#2#{} Множ. за каждую {C:attention}руку,",
                    "ранее подсчитанную в этом {C:attention}раунде",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множ.)"
                } 
            },
            j_aij_elder = {
                name = "Старейшина", 
                text = {
                    'Копирует эффект',
                    '{C:attention}Джокера{}, которым вы',
                    "владеете {C:attention}дольше всего{}",
                    "{C:inactive}(Сейчас #1#)"
                } 
            },


            j_aij_prototype = { name = "Прототип", text = {
                "{C:inactive}\"Лол, я не знаю, есть ли",
            "{C:inactive}у меня цитаты\""} },
            j_aij_spoofy = { name = "Спуфи", text = {
                "{C:inactive}\"Ты должен поиграть в Braptro\""} },
            j_aij_toyrapple = { name = "Toyrapple", text = {""} },
            j_aij_grass = { name = "Трава", text = {
                "\"игра\""} },
            j_aij_mythie = { name = "Мифи", text = {
                "{C:inactive}\"Есть тосты в постели -",
            "{C:inactive}моя способность\""} },
            j_aij_zan = { name = "Зан", text = {""} },
            j_aij_metrollen = { name = "Metrollen", text = {""} },
            j_aij_clay = { name = "Глина", text = {""} },
            j_aij_generic = { name = "Джен-Эрик", text = {
                "{C:inactive}\"Остальное было скрыто",
                "{C:inactive}ради баланса игры\""
            } },
            j_aij_cheddar = { name = "Чеддер", text = {""} },
            



            j_aij_nybbas = { name = "Ниббас", text = { "" }, unlock = { "?????" } },
            j_aij_doink = { name = "Дойнк", text = { "" }, unlock = { "?????" } },
            j_aij_monarcho = { name = "Монархо", text = { "" }, unlock = { "?????" } },
            j_aij_pompey = {
                name = "Помпей",
                text = {
                    "{X:mult,C:white}X#1#{} Множ. за каждого {C:attention}Джокера{}",
                    "справа,",
                    "включая Помпея",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{}{C:inactive} Множ.){}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_touchstone = {
                name = "Оселок",
                text = {
                    "{C:attention}+#1#{} размер руки",
                    "Раскрывает следующие {C:attention}#2#{}",
                    "карты в вашей колоде",
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_fortunato = {
                name = "Фортунато",
                text = {
                    {
                        "Превращает все {C:attention}сыгранные{}, но {C:attention}не подсчитанные{}",
                        "карты в {C:attention}Каменные карты{}",
                    },
                    {
                        "Этот {C:attention}Джокер{} получает {X:mult,C:white}X#2#{} Множ.,",
                        "когда {C:attention}Каменная карта{} подсчитывается",
                        "{C:inactive}(Сейчас{} {X:mult,C:white}X#1#{} {C:inactive}Множ.){}",
                    }
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pellesini = { 
                name = "Пеллесини", 
                text = { 
                    "Когда любой Джокер",
                    "{C:red}уничтожается{}, создаёт",
                    "{C:attention}точную{} копию",
					"{C:inactive}(Включая себя)"
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_nedda = {
                name = "Недда",
                text = {
                    "{C:attention}Дамы{} в руке",
                    "дают {X:mult,C:white}X#1#{} Множ."
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_silvio = {
                name = "Сильвио",
                text = {
                    "Повторно активирует всех {C:attention}Королей{}",
                    "один раз за каждую {C:attention}Даму{}",
                    "в руке",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_biancolelli = { 
                name = "Бьянколелли", 
                text = { 
                    "{C:aij_plasma}Усредняет{} {C:chips}Фишки{} и {C:mult}Множ.{}", 
                    "после срабатывания Джокеров"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_toto = { 
                name = "Тото", 
                text = { 
                    "Создаёт {C:attention}#1#{} копии",
                    "каждого полученного {C:attention}Жетона",
                    "{C:inactive}(Кроме Жетона-дубля)" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_grock = { name = "Грок", text = { "" }, unlock = { "?????" } },
            j_aij_eulenspiegel = { 
                name = "Ойленшпигель", 
                text = { 
                    "Когда {C:attention}Босс-блайнд{} побеждён,",
                    "{C:attention}-#1#{} Анте и этот Джокер",
                    "теряет {X:mult,C:white}X#2#{} Множ.",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#3#{C:inactive} Множ.)"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_deburau = { name = "Дебюро", text = { "" }, unlock = { "?????" } },
            j_aij_dacosta = { name = "Д'акоста", text = { "" }, unlock = { "?????" } },
            j_aij_durie = { name = "Дьюри", text = { "" }, unlock = { "?????" } },
            j_aij_nichola = {
                name = "Никола",
                text = {
                    'В начале раунда, добавляет',
                    'одну случайную {C:attention}Даму',
                    'в руку со случайным',
                    '{C:attention}Улучшением{},',
                    '{C:dark_edition}Изданием{} и {C:attention}Печатью{}'
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fleeman = { name = "Флиман", text = { "" }, unlock = { "?????" } },
            j_aij_colquhoun = { 
                name = "Колхун", 
                text = { 
                    "Все карты приносят {C:money}$#1#{}",
                    "при {C:attention}подсчёте{}, увеличивается",
                    "на {C:money}$#2#{}, когда {C:attention}Босс-блайнд{}",
                    "побеждён"
                }, 
                unlock = { 
                    "?????"
                } 
            },
            j_aij_dor = { 
                name = "Д'ор", 
                text = { 
                    "{X:dark_edition,C:white}#1#{} Множ. на {C:attention}последней{}",
                    "руке {C:attention}раунда" 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_archy = { 
                name = "Арчи", 
                text = { 
                    "Все начальные {C:attention}карты{} и",
                    "{C:attention}Бустерные наборы{} в",
                    "{C:money}Магазине{} бесплатны" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_sommers = { 
                name = "Соммерс", 
                text = { 
                    "{C:attention}Повышает уровень{} всех",
                    "сыгранных рук" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_pace = {
                name = "Пейс",
                text = {
                    {
                        "Все {C:red}Редкости{} Джокеров",
                        "имеют {C:green}равный{} шанс",
                        "появления в {C:money}Магазине",
                        "{C:inactive}(кроме Легендарных)"
                    },
                    {
                        "Все Джокеры стоят {C:money}$#1#"
                    }
                },
                unlock = { "?????" }
            },
            j_aij_thomazina = {
                 name = "Томазина",
                 text = {
                    "Подсчитанные {C:attention}числовые{} карты",
                    "дают {C:chips}+#1#{} Фишек. Увеличивается на",
                    "{C:chips}+#2#{} Фишек, когда {C:attention}числовая{}",
                    "карта подсчитывается"
                },
                unlock = { "?????" } },
            j_aij_mathurine = { name = "Матюрина", text = { "" }, unlock = { "?????" } },
            j_aij_guillaume = { 
                name = "Гийом", 
                text = { 
                    "Если {C:attention}Босс-блайнд{}",
                    "побеждён с менее чем",
                    "{C:attention}5{} Джокерами, этот Джокер",
                    "получает {C:dark_edition}+#2#{} Слот Джокера",
                    "{C:inactive}(Сейчас {C:dark_edition}+#1#{C:inactive} Слот Джокера){}",
                },
                unlock = { "?????" } 
            },
            j_aij_tarlton = { 
                name = "Тарлтон", 
                text = { 
                    "Даёт {C:chips}+Фишки{}, равные",
                    "{C:attention}общим{} {C:chips}Фишкам{} {C:attention}предыдущей{}",
                    "сыгранной {C:attention}руки{} в этом раунде",
                    "{C:inactive}(Сейчас {C:chips}+#1#{} {C:inactive}Фишек){}",
                }, 
                unlock = { "?????" }
            },
            j_aij_roland = { name = "Роланд", text = { "" }, unlock = { "?????" } },
            j_aij_borra = { name = "Борра", text = { "" }, unlock = { "?????" } },
            j_aij_taillefer = { 
                name = "Тайлефер", 
                text = { 
                    "Этот Джокер получает {X:mult,C:white}X#2#{} Множ.",
                    "за сыгранную руку,",
                    "{C:red}самоуничтожается{} после",
                    "победы над {C:attention}#3#{} {C:attention}Босс-блайндами{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множ., {C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive}){}",
                }, 
                unlock = { "?????" } 
            },
            j_aij_killigrew = {
                name = "Киллигрю",
                text = {
                    "{X:mult,C:white}X#1#{} Множ. за каждый",
                    "имеющийся {C:attention}Купон",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{} {C:inactive}Множ.){}",
                },
                unlock = { "?????" }
            },
            j_aij_dongfang = { name = "Дунфан", text = { "" }, unlock = { "?????" } },
            j_aij_zerco = {
                name = "Зерко",
                text = {
                    "Применяет {C:dark_edition}Негатив{} к {C:attention}первой{}",
                    "подсчитанной {C:attention}карте{} каждого {C:attention}раунда{}",
                    "{C:inactive}(если у неё нет Издания)"
                },
                unlock = { "?????" } },
            j_aij_yu_sze = { 
                name = "Юй Сы", 
                text = { 
                    "Джокеры без {C:dark_edition}Изданий{}",
                    "дают {X:mult,C:white}X#1#{} Множ." 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_brusquet = { name = "Бруске", text = { "" }, unlock = { "?????" } },
            j_aij_rahere = { name = "Рахере", text = { "" }, unlock = { "?????" } },
            j_aij_gonnella = { name = "Гоннелла", text = { "" }, unlock = { "?????" } },
            j_aij_gong_gil = { name = "Кон Гиль", text = { "" }, unlock = { "?????" } },
            j_aij_angoulevent = { 
                name = "Ангулеван", 
                text = { 
                    "Повторно активирует все сыгранные карты",
                    "{C:attention}#1#{} дополнительных раза" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_coryat = { name = "Кориат", text = { "" }, unlock = { "?????" } },
            j_aij_bluet = { 
                name = "Блюэт", 
                text = { 
                    "При выборе {C:attention}Блайнда{},",
                    "создает {C:dark_edition}Негативную{}",
                    "{C:spectral}Спектральную{} карту"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_bebe = {
                 name = "Бебе",
                 text = {
                    "{C:blue}+#1#{} Руки за раунд",
                },
                 unlock = { "?????" } },
            j_aij_pipine = { 
                name = "Пипин", 
                text = { 
                    "{C:red}+#1#{} сброс за раунд" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_golitsyn = { name = "Голицын", text = { "" }, unlock = { "?????" } },
            j_aij_buzheninova = { name = "Буженинова", text = { "" }, unlock = { "?????" } },
            j_aij_yakov = { name = "Яков", text = { "" }, unlock = { "?????" } },
            j_aij_komar = { 
                name = "Комар", 
                text = { 
                    "Все {C:attention}подсчитываемые{} карты получают {C:chips}Фишки,",
                    "равные базовому {C:chips}значению Фишек{}",
                    "всех {C:attention}других{} сыгранных карт" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_lavatch = {
                 name = "Лавач",
                 text = {
                    "Подсчитанные {C:clubs}Трефы{} дают {X:mult,C:white}X#1#{} Множ.,",
                    "увеличивается на {X:mult,C:white}X#2#{} Множ.,",
                    "когда {C:clubs}Трефа{} подсчитывается",
                },
                 unlock = { "?????" } },
            j_aij_Ffwllier = { name = "Ффулльер", text = { "" }, unlock = { "?????" } },
            j_aij_martellino = {
                name = "Мартеллино",
                text = {
                    "Спустя {C:attention}#2#{} раундов, {C:money}продайте{} этого",
                    "Джокера, чтобы создать {C:attention}любого Джокера{}",
                    "из вашей {C:attention}коллекции",
                    "{C:inactive}(Сейчас {C:attention}#1#{}{C:inactive}/#2#){}"
                },
                unlock = { "?????" }
            },
            j_aij_shir_ei = { name = "Ширей", text = { "" }, unlock = { "?????" } },
            j_aij_xinmo = { name = "Синьмо", text = { "" }, unlock = { "?????" } },
            j_aij_chunyu = { name = "Чуньюй", text = { "" }, unlock = { "?????" } },
            j_aij_fantasio = { 
                name = "Фантазио", 
                text = { 
                    "Все карты считаются",
                    "картами {C:attention}каждой масти",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_sexton = { name = "Секстон", text = { "" }, unlock = { "?????" } },
            j_aij_dongtong = {
                name = "Дунтун",
                text = {
                    {
                    "{C:green}Удваивает{} большинство значений",
                    "{C:attention}Джокеров",
                    },
                    {
                        "Удваивает {C:attention}Требования{}",
                        "{C:attention}Блайндов"
                    }
            },
                unlock = { "?????" }
            },
            j_aij_naiteh = {
                name = "Най-Те",
                text = {
                    "Получает {C:attention}+#2#{} размер руки, когда",
                    "{C:attention}Босс-блайнд{} побеждён",
                    "{C:inactive}(Сейчас {C:attention}+#1#{C:inactive} размер руки)"
                },
                unlock = { "?????" }
            },
            j_aij_talhak = {
                name = "Талхак",
                text = {
                    "Когда {C:attention}Босс-блайнд{} побеждён,",
                    "выберите {C:attention}любую{} не-секретную",
                    "{C:spectral}Спектральную{} карту для создания",
                    "{C:inactive}(Должно быть место)"
                },
                unlock = { "?????" }
            },
            j_aij_bozo = {
                name = "Бозо",
                text = {
                    "Когда {C:attention}Босс-блайнд{}",
                    "побеждён, создает {C:attention}#1#{}",
                    "случайных {C:dark_edition}Негативных{} Джокеров",
                },
                unlock = { "?????" }
            },
            j_aij_thalia = {
                name = "Талия",
                text = {
                    "Если {C:attention}первый сброс{} раунда",
                    "содержит ровно {C:attention}1{} карту, она",
                    "навсегда получает {C:attention}+#1#{} повторную активацию"

                },
                unlock = { "?????" }
            },
        },
        Planet = {
            c_aij_vulcanoid = {
                name = "Вулканоид",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_zoozve = {
                name = "Зузве",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_luna = {
                name = "Луна",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_phobos = {
                name = "Фобос",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_europa = {
                name = "Европа",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_titan = {
                name = "Титан",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_umbriel = {
                name = "Умбриэль",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_triton = {
                name = "Тритон",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_nix = {
                name = "Никта",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_planet_nine = {
                name = "Девятая планета",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_pallas = {
                name = "Паллада",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_dysnomia = {
                name = "Дисномия",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_phaethon = {
                name = "Фаэтон",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_kamooalewa = {
                name = "Камоалева",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_deimos = {
                name = "Деймос",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_callisto = {
                name = "Каллисто",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_iapetus = {
                name = "Япет",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_oberon = {
                name = "Оберон",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_proteus = {
                name = "Протей",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_charon = {
                name = "Харон",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_nibiru = {
                name = "Нибиру",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_kuiper = {
                name = "Койпер",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_rogue = {
                name = "Планета-сирота",
                text = {
                    'Повышает уровень {C:attention}всех',
                    '{C:attention}рук{}, упомянутых',
                    'вашими {C:attention}Джокерами'
                }
            },
            c_aij_dark_star = {
                name = "Тёмная звезда",
                text = {
                    'Повышает уровень {C:attention}всех',
                    "{C:attention}рук{}, которые еще не",
                    "были {C:attention}сыграны"
                }
            },
            c_aij_sol = {
                name = "Солнце",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#4#{} Множ. и",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_paper_weywot = {
                name = "Вейвот",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_paper_namaka = {
                name = "Намака",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_paper_ilmare = {
                name = "Ильмарэ",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_paper_salacia = {
                name = "Салация",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множ.",
                }
            },
            c_aij_paper_ixion = {
                name = "Иксион",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_paper_hiiaka = {
                name = "Хииака",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_paper_varda = {
                name = "Варда",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_paper_mk2 = {
                name = "Мк2",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} Фишек",
                }
            }
        },
        Spectral = {
            c_aij_gravastar = {
                name = 'Гравастар',
                text = {
                    '{C:attention}Повышает уровень{}',
                    '{C:chips}Фишек{} всех',
                    '{C:legendary,E:1}покерных комбинаций'
                }
            },
            c_aij_pulsar = {
                name = 'Пульсар',
                text = {
                    '{C:attention}Повышает уровень{}',
                    '{C:mult}Множ.{} всех',
                    '{C:legendary,E:1}покерных комбинаций'
                }
            },
            c_aij_shade = {
                name = 'Тень',
                text = {
                    'Добавляет {C:dark_edition}Негативное{} издание',
                    'к {C:attention}#1#{} случайной',
                    'карте в руке'
                }
            },
            c_aij_trefle = {
                name = 'Трефы',
                text = {
                    '{C:attention}Обновляет{} одного',
                    'выбранного {C:attention}Джокера',
                    "{C:inactive}(Не может быть{}",
                    "{C:inactive}вечным){}"
                }
            },
            c_aij_trefle_controller = {
                name = 'Трефы',
                text = {
                    '{C:attention}Обновляет{}',
                    '{C:attention}крайнего правого{} Джокера',
                    "{C:inactive}(Не может быть{}",
                    "{C:inactive}вечным){}"
                }
            },
            c_aij_scopophobia = {
                name = 'Скопофобия',
                text = {
                    '{C:red}Уничтожает{} случайного {C:attention}Джокера',
                    'и {C:attention}все карты{} в руке',
                }
            },
            c_aij_reshape = {
                name = 'Перековка',
                text = {
                    'Превращает всех {C:attention}Джокеров{} в копии',
                    'случайного имеющегося {C:attention}Джокера',
                    '{C:inactive}(Джокеры сохраняют свои',
                    '{C:inactive}стикеры и издания)'
                }
            },
            c_aij_palmistry = {
                name = 'Хиромантия',
                text = {
                    'Даёт всем картам',
                    'в руке случайное',
                    '{C:attention}улучшение{},',
                    '{C:red}-#1#{} размер руки'
                }
            },
            c_aij_gegenschein = {
                name = "Противосияние",
                text = {
                    'Устанавливает уровень всех',
                    '{C:attention}сыгранных{} {C:dark_edition}секретных рук{}',
                    'равным {C:attention}количеству{} раз,',
                    'сколько они были',
                    '{C:attention}сыграны'
                }
            },
            c_aij_mirth = {
                name = 'Веселье',
                text = {
                    'Добавляет {V:1}#2#',
                    'к {C:attention}#1#{} выбранной',
                    'карте в руке'
                }
            },
        },
        Tag = {
            tag_aij_glimmer = {
                name = 'Мерцающий жетон',
                text = {
                    'Следующий стандартный джокер',
                    'в магазине становится бесплатным',
                    'и {C:aij_plasma}Мерцающим'
                }
            },
            tag_aij_silver = {
                name = 'Серебряный жетон',
                text = {
                    'Следующий стандартный джокер',
                    'в магазине становится бесплатным',
                    'и {C:aij_silver}Серебряным'
                }
            },
            tag_aij_stellar = {
                name = 'Звёздный жетон',
                text = {
                    'Следующий стандартный джокер',
                    'в магазине становится бесплатным',
                    'и {C:aij_stellar}Звёздным'
                }
            },
            tag_aij_aureate = {
                name = 'Золочёный жетон',
                text = {
                    'Следующий стандартный джокер',
                    'в магазине становится бесплатным',
                    'и {C:money}Золочёным'
                }
            },
            tag_aij_soulbound = {
                name = 'Связанный жетон',
                text = {
                    'Создает случайного {C:attention}Временного{} ',
                    '{C:legendary}Легендарного{} Джокера',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_fortunate = {
                name = 'Удачливый жетон',
                text = {
                    'Выберите {C:attention}любую{} карту {C:tarot}Таро{}',
                    'для создания',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_overstuffed = {
                name = 'Набитый жетон',
                text = {
                    "Следующий открытый {C:attention}Бустерный набор{}",
                    "содержит {C:attention}в два раза больше{} вариантов",
                    "и доступных выборов"
                }
            },
            tag_aij_chaos = {
                name = 'Жетон Хаоса',
                text = {
                    "Имеет {C:red}случайный{} эффект"
                }
            },
            -- Gold Tags
            tag_aij_windfall = {
                name = 'Жетон удачи',
                text = {
                    "{C:money}Утраивает{} ваши деньги"
                }
            },
            tag_aij_unusual = {
                name = 'Необычный жетон',
                text = {
                    "В магазине есть бесплатный",
                    "{C:uncommon}Необычный Джокер{} с",
                    "{C:attention}удвоенными{} значениями"
                }
            },
            tag_aij_recherche = {
                name = 'Изысканный жетон',
                text = {
                    "В магазине есть бесплатный",
                    "{C:rare}Редкий Джокер{} с",
                    "{C:attention}удвоенными{} значениями"
                }
            },
            tag_aij_hermetic = {
                name = 'Герметичный жетон',
                text = {
                    'Выберите {C:attention}не-секретную{}',
                    '{C:spectral}Спектральную{} карту для создания',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_dark_matter = {
                name = 'Жетон тёмной материи',
                text = {
                    'Применяет {C:dark_edition}Негатив{} к',
                    '{C:attention}случайному{} Джокеру',
                    'без издания'
                }
            },
            tag_aij_crystal = {
                name = 'Кристальный жетон',
                text = {
                    'Применяет {C:dark_edition}Фольгу{} к',
                    '{C:attention}случайному{} Джокеру и',
                    '{C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_iridescent = {
                name = 'Радужный жетон',
                text = {
                    'Применяет {C:dark_edition}Голографию{}',
                    'к {C:attention}случайному{} Джокеру',
                    'и {C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_omnichrome = {
                name = 'Омнихромный жетон',
                text = {
                    'Применяет {C:dark_edition}Полихром{} к',
                    '{C:attention}крайнему правому{} стандартному',
                    'Джокеру',
                }
            },
            tag_aij_circumplanetary = {
                name = 'Околопланетный жетон',
                text = {
                    'Улучшает {C:attention}самую частую',
                    '{C:attention}покерную комбинацию{} на',
                    '{C:attention}#1# уровней',
                    '{C:inactive}(Сейчас #2#)'
                }
            },
            tag_aij_velocity = {
                name = 'Скоростной жетон',
                text = {
                    'Даёт {C:money}$#1#{}, минус {C:money}$#2#',
                    'за {C:attention}раунд',
                    '{C:inactive}(Даст {C:money}$#3#{C:inactive})'
                }
            },
            tag_aij_capital = {
                name = 'Капитальный жетон',
                text = {
                    'После победы над',
                    'Босс-блайндом,',
                    'получите {C:money}$#1#'
                }
            },
            tag_aij_bierstiefel = {
                name = 'Пивной жетон',
                text = {
                    'Заполняет все пустые',
                    '{C:attention}слоты Джокера{}',
                    'случайными {C:common}Обычными{} или',
                    '{C:uncommon}Необычными{} Джокерами'
                }
            },
            tag_aij_ticket = {
                name = 'Билетный жетон',
                text = {
                    '{C:attention}Выкупает{} случайный',
                    'Купон и его',
                    '{C:attention}улучшенную{} версию'
                }
            },
            tag_aij_galloping_domino = {
                name = 'Жетон домино',
                text = {
                    '{C:attention}Все{} обновления стоят',
                    '{C:money}$#1#{} в следующем магазине'
                }
            },
            tag_aij_gioco = {
                name = 'Жетон джоко',
                text = {
                    '{C:attention}Удваивает{} размер руки',
                    'в следующем раунде',
                }
            },
            tag_aij_stereoscopic = {
                name = 'Стереоскопический жетон',
                text = {
                    'Даёт {C:money}Золотую{} копию',
                    'следующего выбранного {C:attention}Жетона',
                    '{s:0.8,C:attention}Жетон-дубль{s:0.8} исключен',
                }
            },
            tag_aij_frugal = {
                name = 'Бережливый жетон',
                text = {
                    '{C:attention}Все{} карты и',
                    'бустерные наборы в следующем',
                    'магазине бесплатны',
                }
            },
            tag_aij_dominus = {
                name = 'Жетон Доминус',
                text = {
                    'Выберите {C:attention}любой Босс-блайнд{} для',
                    'замены текущего'
                }
            },
            tag_aij_nonstandard = {
                name = 'Нестандартный жетон',
                text = {
                    'Создает {C:attention}2 копии{}',
                    'любой игральной карты',
                }
            },
            tag_aij_ignoramus = {
                name = 'Жетон невежды',
                text = {
                    'Выберите {C:attention}любого{} {C:common}Обычного',
                    'или {C:uncommon}Необычного{} Джокера',
                    'для создания',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_occult = {
                name = 'Оккультный жетон',
                text = {
                    'Создает {C:attention}3 карты {C:tarot}Таро{}',
                    'и {C:attention}2 {C:spectral}Спектральных{} карты', 
                    '{s:0.8}Они {s:0.8,C:dark_edition}Негативные',
                }
            },
            tag_aij_asteroid = {
                name = 'Жетон астероида',
                text = {
                    'Даёт бесплатный',
                    '{C:planet}Небесный набор', 
                    'с {C:dark_edition}Чёрной дырой{},',
                    '{C:dark_edition}Пульсаром{} и {C:dark_edition}Гравастаром{}',
                }
            },
            tag_aij_polydactyly = {
                name = 'Полидактильный жетон',
                text = {
                    'Даёт {C:blue}+1 руку{} в след. раунде',
                    'за неиспользованную {C:blue}руку{} в этой партии', 
                    '{C:inactive}(Даст {C:blue}+#1#{C:inactive} рук)',
                }
            },
            tag_aij_landfill = {
                name = 'Свалочный жетон',
                text = {
                    'Даёт {C:money}$1{} за карту',
                    '{C:red}сброшенную{} в этой партии', 
                    '{C:inactive}(Даст {C:money}$#1#{C:inactive})',
                }
            },
            tag_aij_cinema = {
                name = 'Киножетон',
                text = {
                    'Применяет {C:aij_silver}Серебро{} к',
                    '{C:attention}крайнему левому{} стандартному',
                    'Джокеру',
                }
            },
            tag_aij_ventripotent = {
                name = 'Вентрипотентный жетон',
                text = {
                    "Следующий открытый {C:attention}Бустерный набор{}",
                    "содержит {C:attention}в два раза больше{} вариантов",
                    "и {C:attention}неограниченный{} выбор"
                }
            },
            tag_aij_timelost = {
                name = 'Потерянный во времени жетон',
                text = {
                    'Даёт бесплатный {C:purple}Набор',
                    '{C:purple}Угадай шутку{} с',
                    '{C:attention}5{} временными опциями',
                }
            },
            tag_aij_auspicious = {
                name = 'Благоприятный жетон',
                text = {
                    'Создает {C:attention}3{} {C:dark_edition}Негативных копии',
                    'карты {C:tarot}Таро',
                    '{C:attention}на ваш выбор'
                }
            },
            tag_aij_glamour = {
                name = 'Гламурный жетон',
                text = {
                    'Применяет {C:aij_plasma}Мерцание{} к',
                    '{C:attention}2 случайным{} Джокерам',
                    'без издания'
                }
            },
            tag_aij_superlunary = {
                name = 'Надлунный жетон',
                text = {
                    'Применяет {C:aij_stellar}Звёздный{}',
                    'к {C:attention}случайному{} Джокеру',
                    'и {C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_gold_dust = {
                name = 'Жетон золотой пыли',
                text = {
                    'Применяет {C:money}Золочёный{} к',
                    '{C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_anarchy = {
                name = 'Жетон анархии',
                text = {
                    'Имеет {C:red}СЛУЧАЙНЫЙ{} эффект{C:red}!!!'
                }
            },
        },
        Tarot = {
            c_aij_magus = {
                name = 'Маг',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту до",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sanctuary_gate = {
                name = 'Врата святилища',
                text = {
                    "Улучшает {C:attention}#1#{}",
                    "выбранные карты до",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_isis_urania = {
                name = 'Исида-Урания',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту до",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_cubic_stone = {
                name = 'Кубический камень',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту до",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_master_arcanes = { 
                name = 'Мастер Арканов',
                text = {
                    "{C:green}#1# к #2#{} шанс",
                    "создать случайную",
                    "{C:spectral}Спектральную{} карту",
                    '{C:inactive}(Должно быть место)'
                }
            },
            c_aij_two_ways = {
                name = 'Два пути',
                text = {
                    "Разделяет {C:attention}#1#{} выбранную карту",
                    "на {C:attention}2{} копии с",
                    "{C:attention}половиной{} оригинального {C:attention}ранга{}",
                    "{C:inactive}(Нечетные карты делятся максимально поровну){}",
                    "{C:inactive}(Т=14, К=13, Д=12, В=11)"
                }
            },
            c_aij_osiris = {
                name = 'Осирис',
                text = {
                    "{C:red}Уничтожает{} {C:attention}1{} выбранного",
                    "Джокера и даёт тройную",
                    "{C:money}стоимость продажи",
                    "{C:inactive}(Сейчас{} {C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_osiris_controller = {
                name = 'Осирис',
                text = {
                    "{C:red}Уничтожает{} {C:attention}крайнего правого{}",
                    "Джокера и даёт тройную",
                    "{C:money}стоимость продажи",
                    "{C:inactive}(Сейчас{} {C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_balance_and_blade = {
                name = 'Весы и Клинок',
                text = {
                    "Пришивает {C:attention}нашивку{} случайной масти",
                    "на {C:attention}#1#{} выбранные карты"
                }
            },
            c_aij_veiled_lamp = {
                name = 'Скрытая лампа',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту до",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sphinx = {
                name = 'Сфинкс',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту до",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_tamed_lion = {
                name = 'Укрощённый лев',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту до",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_broken_fate = {
                name = 'Сломанная судьба',
                text = {
                    "Случайно меняет значения",
                    "{C:attention}крайнего левого расходника",
                    "между {C:attention}X0.75{} и {C:attention}X2.5",
                    "от их {C:attention}стандартных{} значений"
                }
            },
        },
        Other = {
            -- Other
            aij_patches_suit = {
                name = "Нашивки",
                text = {
                    "{C:attention}Нашивка{} с {V:1}#1#"
                }
            },
            aij_jest_mark_of_the_spear = {
                name = "Метка Копья",
                text = {
                    'Эта {C:attention}карта{} была',
                    'навсегда {C:red}ослаблена',
                    'блайндом {C:attention}Копьё'
                }
            },
            card_extra_retriggers = {
                text={
                    "Повторно активирует эту карту {C:attention}#1#{} дополнительных раз",
                },
            },
            showdown_blind = {
                name = "Финальный Босс-блайнд",
                text = {
                    "{C:attention}Босс-блайнд{},",
                    "который появляется каждое",
                    "{C:attention}#1#-е{} Анте",
                }
            },
            reroll_joker = {
                name = "Обновить",
                text = {
                    'Заменяет Джокера на',
                    'случайного Джокера',
                    'той же редкости'
                }
            },
            office_assistant_perishable = {
                name = "Временный",
                text = {
                    '{C:attention}Сбрасывает{} счетчик',
                    'на {C:attention}Временных{} Джокерах',
                    'за {C:money}$3'
                }
            },
            office_assistant_rental = {
                name = "Арендуемый",
                text = {
                    'Убирает {C:attention}Арендуемый',
                    '{C:attention}стикер{} за',
                    '{C:money}базовую цену{} Джокера'
                }
            },
            overdesigned_club = {
                name = "Трефы",
                text = {
                    "Подсчитанные {C:clubs}Трефы{}",
                    "дают {C:mult}+#1#{} Множ.",
                }
            },
            overdesigned_spade = {
                name = "Пики",
                text = {
                    "Подсчитанные {C:spades}Пики{}",
                    "дают {C:chips}+#1#{} Фишек",
                }
            },
            overdesigned_diamond = {
                name = "Бубны",
                text = {
                    "Подсчитанные {C:diamonds}Бубны{}",
                    "приносят {C:money}$#1#{}",
                }
            },
            overdesigned_heart = {
                name = "Червы",
                text = {
                    "Подсчитанные {C:hearts}Червы{}",
                    "дают {X:mult,C:white}X#1#{} Множ.",
                }
            },
            p_aij_guess_the_jest = {
                name = "Набор Угадай шутку",
                text = {
                    'Выберите {C:attention}#1#{} из {C:attention}#2#{} скрытых',
                    '{C:legendary,E:2}Легендарных{} Джокеров'
                }
            },
            m_aij_dyscalcular_numbered_rank = {
                name = "Числовые ранги",
                text = {
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, {C:attention}5{}, {C:attention}6{},",
                    "{C:attention}7{}, {C:attention}8{}, {C:attention}9{}, и {C:attention}10{}",
                }
            },
            palindrome = {
                name = "Палиндром",
                text = {
                    "Многозначное число, которое",
                    "{C:attention}не меняется{} при чтении наоборот",
                    "{C:inactive}пр. 33, 151, 3003{}"
                }
            },
            -- Stickers
            aij_marked = {
                name = "Меченый",
                text = {
                    'Нельзя {C:blue}играть',
                    'или {C:red}сбрасывать'
                }
            },
            aij_unusual_doubled = {
                name = "Удвоенный",
                text = {
                    'Эффекты {C:attention}X2{}',
                    '{C:inactive,s:0.8}(Получено от Необычного жетона){}'
                }
            },
            aij_recherche_doubled = {
                name = "Удвоенный",
                text = {
                    'Эффекты {C:attention}X2{}',
                    '{C:inactive,s:0.8}(Получено от Изысканного жетона){}'
                }
            },
            -- (not a sticker but treated as such)
            aij_jest_chaotic_card = {
                name = "Хаотичный",
                text = {
                    "{X:mult,C:white} X#1# {} Множ.",
                    "{C:edition}Улучшение{}",
                    "{C:attention}становится случайным{} после",
                    "розыгрыша",
                }
            },
            -- Seals
            aij_smiley_seal = {
                name = "Печать-смайлик",
                text = {
                    'При {C:red}уничтожении{}, применяет',
                    'издание к {C:attention}#1#{}',
                    'случайному {C:attention}Джокеру'
                }
            },
            aij_melted_seal = {
                name = "Растаявшая печать",
		        text = {
                    'Когда удерживается в {C:attention}руке{},',
                    '{C:attention}превращается{} в первую',
                    'не-{V:1}Растаявшую{} {C:attention}печать{}, подсчитанную в раунде'
		        }
            },
            nevernamed_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Сделал весь арт", 
                    "{s:0.8}-Придумал концепт около половины эффектов",
                    "{s:0.8}-Начал Balatro Art в декабре 2024"
                    
                }
            },
            survivalaren_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Закодил около половины контента", 
                    "{s:0.8}-Придумал концепт около половины эффектов",
                    "{s:0.8}-Начал этот мод",
                    "{s:0.8}-Создал мод в начале апреля 2025"
                }
            },
            rattling_snow_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Закодил большинство сложных вещей",
                    "{s:0.8}-Закодил почти весь UI",
                    "{s:0.8}-Закодил все шейдеры",
                    "{s:0.8}-Присоединился к команде в конце апреля 2025"
                }
            },
            jumbocarrot_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Помогает тонной багфиксов и полировкой",
                    "{s:0.8}-Серьезно, так много багфиксов",
                    "{s:0.8}-Главный плейтестер",
                    "{s:0.8}-Присоединился к команде в сентябре 2025"
                }
            },
        }
    }
}