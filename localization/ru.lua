return {
    misc = {
        dictionary = {
            -- Основные термины
            k_coder_badge = "Программист",
            k_artist_badge = "Художник",
            k_moon = "Луна",
            k_moon_q = "Луна?",
            k_star = "Звезда",
            k_tag = "Тег",
            k_star_q = "Звезда?",
            k_asteroid = "Астероид",
            k_tarot_q = "Таро?",
            k_active = "Активно",
            k_inactive = "Неактивно",
            
            -- Настройки мода
            aij_requires_restart = "Требует перезапуска",
            aij_doesnt_requires_restart = "Не требует перезапуска",
            aij_upgraded_tags = "Золотые теги",
            aij_enable_moons = "Включить луны",
            aij_enable_moons_tooltip = {
                'Включает появление {C:chips}фишек{}- и {C:mult}множителя{}-типа',
                '{C:planet}планет{}'
            },
            aij_alter_trypophobia = "Изменить трипофобию",
            aij_alter_trypophobia_tooltip = {
                '{C:attention}Изменяет{} спрайт',
                '{C:attention}Трипофобии{} на',
                '{C:attention}менее вызывающий отвращение'
            },
            aij_no_copy_neg = "Копировать негативные карты",
            aij_no_copy_neg_tooltip = {
                'Позволяет копировать издание',
                '{C:dark_edition}Негативное{} на {C:attention}игровых картах{}.',
                'Когда {C:attention}выключено{} (по умолчанию), скопированные',
                '{C:dark_edition}Негативные{} карты {C:red}теряют{} своё издание'
            },
            aij_blue_stake_rework = "Переработка синей ставки",
            aij_blue_stake_rework_tooltip = {
                '{C:attention}Изменяет{} синюю ставку на использование',
                'новых {C:attention}Ямных боссов{} вместо',
                '{C:red}-1{} сброса'
            },
            aij_lite = "All in Jest Lite",
            aij_lite_tooltip = {
                'Включает только выбранный набор',
                'наиболее {C:attention}приближенных к ваниле{} предметов',
                '{s:0.8,C:inactive}(Сейчас 76 штук)'
            },
            aij_red_destroy_text = "Изменить описания джокеров",
            aij_red_destroy_text_tooltip = {
                'Изменяет все описания {C:attention}Ванильных{} и',
                '{C:attention}Модных{} карт,',
                'делая слово "уничтожить" {C:red}красным{}.',
                '{s:0.8,C:inactive}(Это может негативно повлиять на',
                '{s:0.8,C:inactive}подсказки из других модов)'
            },
            aij_random_deck_skins = "Случайные рубашки колод",
            aij_random_deck_skins_tooltip = {
                '{C:attention}Игровые карты{}, добавленные в',
                'колоду, имеют случайные {C:attention}рубашки колод'
            },
            
            -- Разные фразы
            k_aij_guess_the_jest = "Угадай Шутку",
            k_aij_memory_card = "Запомнено!",
            aij_plus_tag = "+1 Тег",
            aij_refreshed = 'Обновлено',
            aij_paid_off = 'Оплачено',
            k_aij_polychrome_ex = 'Полихром!',
            k_aij_foiled_again = 'Снова Фольга!',
            k_aij_p_arcana = "+1 Аркана",
            k_aij_merry_christmas = "С Рождеством!",
            k_aij_change_ex = 'Смена!',
            k_aij_blood_spilt_ex = 'Пролита кровь!',
            k_aij_double_ex = 'Удвоено!',
            k_aij_triple_ex = 'Утроено!',
            k_aij_chaos_ex = 'Хаос!',
            k_aij_two_into_one_ex = 'Два в одном!',
            k_aij_plus_two_moons = "+2 Луны",
            k_aij_does_not_score_ex = "Не начисляет очки!",
            k_aij_create = "Создать"
        },
        
        v_dictionary = {
            a_aij_exp_mult="^#1# Множитель",
            a_aij_mult_equal="=#1# Множитель",
            a_aij_ante_minus="-#1# Анте",
            a_aij_win_ante_plus="+#1# Анте победы",
            a_aij_percent_balance = "+%#1#",
            a_aij_percent_balance_minus = "-%#1#",
            a_aij_hands_minus = "-#1# Рук",
            a_aij_joker_slots = '+#1# Слот джокера',
            a_aij_joker_slots_minus = '-#1# Слот джокера',
            a_aij_odds = "+#1# Шанс",
            a_aij_jokers = "+#1# Джокеров",
        },
        
        challenge_names = {
            c_aij_bananarama = "Бананарама",
            c_aij_sharpest_tool = "Острейший инструмент",
            c_aij_the_pit = "Яма",
        },
        
        v_text = {
            ch_c_aij_sharpest_tool_1 = {
                'Могут появляться только {C:common}Обычные{} джокеры',
            },
            ch_c_aij_sharpest_tool_2 = {
                'в {C:attention}Магазине{} или в {C:attention}Буффон-паках'
            },
            ch_c_aij_all_pit_blinds = {
                'Все обычные боссы после 1 анте — {C:attention}Ямные боссы{}'
            },
        },
        
        extra_joker_dictionary = {
            k_aij_youve_got_mail = "У Вас Почта!",
            k_aij_youve_got_mail_goodbye = "До свидания",
            k_aij_youve_got_mail_none = "Ничего не делает...",
            k_aij_youve_got_mail_plus_prefix = "+",
            k_aij_youve_got_mail_dollar_prefix = "$",
            k_aij_youve_got_mail_xmult_prefix = "X",
            k_aij_youve_got_mail_mult_text = " Множитель",
            k_aij_youve_got_mail_chip_text = " Фишки",
            k_aij_youve_got_mail_dollars_text = " за каждую сыгранную руку",
            k_aij_overdesigned_give_prefix = "дают",
            k_aij_overdesigned_earn_prefix = "зарабатывают",
            k_aij_overdesigned_heart = "Черви",
            k_aij_overdesigned_club = "Трефы",
            k_aij_overdesigned_spade = "Пики",
            k_aij_overdesigned_diamond = "Бубны",
            k_aij_jerko_retrigger = "Перезапускает",
            k_aij_jerko_times = "раз(а)",
            k_aij_blacklist_empty = 'Нет',
            k_aij_blacklist_and = 'И',
            k_aij_blacklist_more = 'ещё',
        },
        
        labels = {
            aij_glimmer = "Мерцание",
            aij_silver = "Серебро",
            aij_stellar = "Звёздный",
            aij_aureate = "Златокованый",
            aij_torn = "Рваный",
            aij_marked = "Меченая",
            aij_unusual_doubled = "Удвоена",
            aij_recherche_doubled = "Удвоена",
            aij_smiley_seal = "Печать Улыбки",
            aij_melted_seal = "Печать Таяния",
            aij_jest_chaotic_card = "Хаотичная",
        },
        
        poker_hands = {
            ['aij_Royal Flush'] = "Королевский флеш",
        },
        
        poker_hand_descriptions = {
            ['aij_Royal Flush'] = {
                "5 карт подряд (последовательные ранги)",
                "все карты одной масти",
                "с младшей картой достоинства 10"
            },
        },
        
        tutorial = {
            k_aij_line1 =  {"Эй."},
            k_aij_line2 =  {"Ты играешь уже", "довольно долго,", "и я подумал..."},
            k_aij_line3 =  {"Не пора ли тебе", "пойти ва-банк?"}
        },
    },
    
    descriptions = {
                Back = {
            b_aij_fabled = {
                name = 'Колода Сказаний',
                text = {
                    '{C:legendary,E:1}Легендарные{} джокеры могут',
                    'появляться в {C:attention}Магазине',
                    '{C:attention}-1{} Слот джокера'
                },
            },
            b_aij_fabled_hidden = {
                name = 'Колода Сказаний',
                text = {},
            },
            b_aij_branching = {
                name = 'Ветвистая Колода',
                text = {
                    'Пропуски дают выбор',
                    'между {C:attention}3{} тегами',
                },
            },
            b_aij_branching_hidden = {
                name = 'Ветвистая Колода',
                text = {},
            },
            b_aij_patchwork = {
                name = 'Колода Лоскутов',
                text = {
                    'Все игровые карты {C:attention}появляются',
                    'со случайным {C:attention}лоскутом масти'
                },
            },
            b_aij_patchwork_hidden = {
                name = 'Колода Лоскутов',
                text = {},
            },
        },
        
        Stake = All_in_Jest.config.blue_stake_rework and {
            stake_blue = {
                name = "Синяя ставка",
                text = {
                    'Босс на анте',
                    '{C:attention}4{} или {C:attention}5{} — это Ямный босс',
                    '{s:0.8}Применяет все предыдущие ставки'
                }
            },
        } or {},
                Partner = {
            pnr_aij_simply = {
                name = "Простушка",
                text = {
                    "Получает {C:mult}+#1#{} Множитель в",
                    "конце раунда",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множитель)",
                },
                unlock={
                    "Выиграйте игру с",
                    "{C:attention}Простой Саймон{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_fourwarning = {
                name = "Четыре-предупреждение",
                text = {
                    "Получает {C:chips}+#1#{} Фишек, если",
                    "в сбросе есть {C:attention}4",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)",
                },
                unlock={
                    "Выиграйте игру с",
                    "{C:attention}Тетрафобией{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_nellie = {
                name = "Нелли",
                text = {
                    "{C:dark_edition}Негативные{} джокеры",
                    "{C:attention}#1#X{} чаще встречаются",
                },
                unlock={
                    "Выиграйте игру с",
                    "{C:attention}Негативной Нэнси{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_scratch = {
                name = "Царапка",
                text = {
                    '{C:attention}Перезапускает{} крайнего левого',
                    '{C:attention}#1#{} крайнего правого джокера',
                    'на {C:blue}нечётных{} {C:attention}раундах'
                },
                unlock={
                    "Выиграйте игру с",
                    "{C:attention}Каракулей{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_banger = {
                name = "Хит",
                text = {
                    '{C:green}Перероллы{} стоят {C:money}$#1#{} меньше',
                    '{C:inactive}(Не может быть меньше {C:money}$0{C:inactive}){}'
                },
                unlock={
                    "Выиграйте игру с",
                    "{C:attention}Глупой Сосиской{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
            pnr_aij_flub = {
                name = "Промах",
                text = {
                    '{C:attention}Вечные{} джокеры',
                    'стоят {C:money}#1#{}'
                },
                unlock={
                    "Выиграйте игру с",
                    "{C:attention}Ошибкой{} на",
                    "{C:attention}Золотой ставке{}",
                },
            },
        },
        Sleeve = {
            sleeve_aij_fabled = {
                name = "Рукав Сказаний",
                text = {
                    '{C:legendary,E:1}Легендарные{} джокеры могут',
                    'появляться в {C:attention}Магазине',
                    '{C:attention}-1{} Слот джокера'
                }
            },
            sleeve_aij_fabled_alt = {
                name = "Рукав Сказаний",
                text = {
                    '{C:legendary,E:1}Легендарные{} джокеры появляются',
                    'чаще {C:attention}'
                },
            },
            sleeve_aij_patchwork = {
                name = "Рукав Лоскутов",
                text = {
                    'Все игровые карты {C:attention}появляются',
                    'со случайным {C:attention}лоскутом масти'
                }
            },
            sleeve_aij_patchwork_alt = {
                name = "Рукав Лоскутов",
                text = {
                    'Все игровые карты {C:attention}появляются',
                    'с {C:attention}2 случайными{} лоскутами масти'
                },
            },
        },
        Blind = {
            -- Обычные блайнды
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
                    'Все Черви',
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
                    'Все лицевые карты',
                    'вытягиваются последними'
                },
            },
            bl_aij_the_horror = {
                name = "Ужас",
                text = {
                    'Применяет "Скоропортящийся" к',
                    'случайному джокеру на',
                    'последней руке раунда',
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
                    'Применяет "Вечный" ко всем',
                    'джокерам на последней',
                    'руке раунда',
                },
            },
            bl_aij_the_hazel = {
                name = "Орешник",
                text = {
                    "Применяет \"Аренда\" к",
                    "случайному джокеру, когда",
                    "блайнд побеждён",
                },
            },
            bl_aij_the_apple = {
                name = "Яблоко",
                text = {
                    'Уничтожает крайнего левого джокера,',
                    "если блайнд пройден",
                    "за одну руку",
                },
            },
            bl_aij_the_neck = {
                name = "Шея",
                text = {
                    'Можно сбрасывать',
                    'только по 1 карте за раз'
                },
            },
            bl_aij_the_groan = {
                name = "Стон",
                text = {
                    '+0.1X Базы после',
                    'розыгрыша руки',
                },
            },
            bl_aij_the_ash = {
                name = "Ясень",
                text = {
                    '+0.2X Базы за',
                    'каждую карту ниже #1# в',
                    'полной колоде',
                },
            },
            bl_aij_the_clay = {
                name = "Глина",
                text = {
                    'Случайно большой блайнд',
                },
            },
            bl_aij_the_aspen = {
                name = "Осина",
                text = {
                    '+2X Базы за Блайнд,',
                    'пройденный в этой Анте',
                },
            },
            bl_aij_the_evergreen = {
                name = "Вечнозелёный",
                text = {
                    '+0.2X Базы за',
                    'каждую карту выше #1# в',
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
                name = "Бульон",
                text = {
                    '-$5 за каждую сыгранную',
                    'улучшенную карту',
                },
            },
            bl_aij_the_elbow = {
                name = "Локоть",
                text = {
                    'Сыгранные улучшения',
                    'рандомизируются',
                },
            },
            bl_aij_the_thorn = {
                name = "Терновник",
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
                name = "Великан",
                text = {
                    'Очень большой блайнд',
                    '+2 Руки'
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
                    '+1 Анта Победы, если карта',
                    'масти #1# была',
                    'разыграна в этом раунде',
                },
            },
            bl_aij_the_gift = {
                name = "Дар",
                text = {
                    "Устанавливает деньги в $0",
                    "Зарабатывает $1 за каждую",
                    "сыгранную или сброшенную карту"
                },
            },
            bl_aij_the_ancestor = {
                name = "Предок",
                text = {
                    'Покерные комбинации, которые вы',
                    'сбросили в этом раунде,',
                    'нельзя разыграть'  
                },
            },
            bl_aij_the_god = {
                name = "Бог",
                text = {
                    'Все карты',
                    'должны набирать очки'
                },
            },
            bl_aij_the_beast = {
                name = "Зверь",
                text = {
                    'Уничтожает всех джокеров-еду,',
                    'когда этот блайнд',
                    'побеждён'
                },
            },
            bl_aij_the_ulcer = {
                name = "Язва",
                text = {
                    "-1 Рука",
                    "-1 Сброс"
                },
            },
            bl_aij_the_need = {
                name = "Нужда",
                text = {
                    "Нужно иметь как",
                    "минимум $20, чтобы",
                    "руки набирали очки"
                },
            },
            bl_aij_the_day = {
                name = "День",
                text = {
                    'Рука должна содержать',
                    'Черву или Бубну'
                },
            },
            bl_aij_the_celebration = {
                name = "Празднование",
                text = {
                    '+0.2X Базы за неиспользованную',
                    'руку/сброс в этой Анте'
                },
            },
            bl_aij_the_storm = {
                name = "Шторм",
                text = {
                    'Если разыгранная рука содержит',
                    '3 или более карт,',
                    "уничтожить все сыгранные карты"
                },
            },
            bl_aij_the_frost = {
                name = "Мороз",
                text = {
                    'Уничтожает одну случайную карту',
                    'в руке после того, как рука',
                    'разыграна'
                },
            },
            bl_aij_the_yew = {
                name = "Тис",
                text = {
                    'Все нечётные ранги',
                    'ослаблены'
                },
            },
            bl_aij_the_hoard = {
                name = "Сокровищница",
                text = {
                    'Избыточные очки в этой Анте',
                    'добавляются к этому блайнду,',
                    'когда он выбран'
                },
            },
            bl_aij_the_pear = {
                name = "Груша",
                text = {
                    'Рандомизирует масть и',
                    'ранг карт, оставшихся в',
                    'руке после набора очков'
                },
            },
            bl_aij_the_elk = {
                name = "Лось",
                text = {
                    'Нельзя разыгрывать покерные комбинации,',
                    'которые уже разыгрывались',
                    'ранее в этой анте'
                },
            },
            bl_aij_the_birch = {
                name = "Берёза",
                text = {
                    'Все чётные ранги',
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
                    'победной руке навсегда',
                    'ослабляются'
                },
            },
            bl_aij_the_steed = {
                name = "Конь",
                text = {
                    'Ослабляет карты, оставшиеся',
                    'в руке, когда рука',
                    'разыграна'
                },
            },
            bl_aij_the_figure = {
                name = "Фигура",
                text = {
                    'Рука не может содержать',
                    '3 или более лицевых карт',
                },
            },
            bl_aij_the_lake = {
                name = "Озеро",
                text = {
                    'Карты, сыгранные в этой',
                    'Анте, вытягиваются',
                    'последними'
                },
            },
            bl_aij_the_field = {
                name = "Поле",
                text = {
                    'Все карты ослаблены, пока',
                    'не будет сброшено #1#',
                    'карт'
                },
            },
            bl_aij_the_wound = {
                name = "Рана",
                text = {
                    'Руки не набирают',
                    'очки, пока не',
                    'останется 0 сбросов'
                },
            },
            bl_aij_the_brimstone = {
                name = "Сера",
                text = {
                    'Теряйте половину',
                    'своих денег',
                    'за каждый сброс'
                },
            },
            bl_aij_the_blush = {
                name = "Румянец",
                text = {
                    'Нужно сбрасывать по 5',
                    'карт за раз'
                },
            },
            -- Ямные блайнды
            bl_aij_the_heart = {
                name = "Сердце",
                text = {
                    'Должны разыграть руку,',
                    'содержащую #1#,',
                    'прежде чем руки начнут набирать очки'
                },
            },
            bl_aij_the_rains = {
                name = "Дожди",
                text = {
                    'Если разыгранная рука побеждает',
                    'блайнд, сыгранные карты',
                    'теряют все улучшения,',
                    'издания и печати'
                },
            },
            bl_aij_the_child = {
                name = "Дитя",
                text = {
                    'Уменьшает ранг всех',
                    'набирающих очки карт на 1'
                },
            },
            bl_aij_the_moon = {
                name = "Луна",
                text = {
                    'Все карты на нечётных по счёту',
                    'руках ослаблены'
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
                    'Превращает все карты, оставшиеся',
                    'в руке, в Каменные карты',
                    'после набора очков'
                },
            },
            bl_aij_the_dragon = {
                name = "Дракон",
                text = {
                    'Нельзя вытягивать карты,',
                    'пока рука не опустеет',
                },
            },
            bl_aij_the_mountain = {
                name = "Гора",
                text = {
                    'Очень большой блайнд',
                    '+1 Размер руки'
                },
            },
            bl_aij_the_conflagration = {
                name = "Пожар",
                text = {
                    'Если разыгранная рука побеждает',
                    'блайнд, уничтожить все карты,',
                    'сыгранные и оставшиеся в руке'
                },
            },
            bl_aij_the_umbilical = {
                name = "Пуповина",
                text = {
                    'Отмечает одну случайную карту за руку,',
                    'отмеченные карты нельзя',
                    'разыграть или сбросить'
                },
            },
            bl_aij_the_divine = {
                name = "Божественное",
                text = {
                    'Рука должна содержать',
                    'улучшенную карту'
                },
            },
            bl_aij_the_bird = {
                name = "Птица",
                text = {
                    'Перемешивает 1 случайного',
                    'джокера перед набором очков'
                },
            },
            bl_aij_the_arrow = {
                name = "Стрела",
                text = {
                    'Очки разыгранной руки должны',
                    'превышать очки всех',
                    'предыдущих разыгранных рук'
                },
            },
            bl_aij_the_brilliance = {
                name = "Сияние",
                text = {
                    'Нужно достичь требования',
                    'по очкам дважды',
                    '+2 Руки',
                },
            },
            -- Финальные блайнды
            bl_aij_obsidian_blade = {
                name = "Обсидиановый Клинок",
                text = {
                    '-1 Рука',
                    '-1 Сброс',
                    '-1 Размер руки',
                    'Большой блайнд'
                },
            },
            bl_aij_aureate_coin = {
                name = "Златокованая Монета",
                text = {
                    '+0.1X Базы',
                    'за $1, потраченный',
                    'в этой анте'
                },
            },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "Пылкая Карта",
                text = {
                    "Получает {C:chips}+#2#{} фишек",
                    "когда набирает очки"
                }
            },
            m_aij_dyscalcular = {
                name = "Дизкалькулярная Карта",
                text = {
                    "Считается как каждый {C:attention}числовой{} ранг",
                    "{C:inactive}(Кроме составления покерных комбинаций)"
                }
            },
            m_aij_charged = {
                name = "Заряженная Карта",
                text = {
                    "{C:attention}Улучшения{} дают {C:attention}+#1#%{} эффекта,",
                    "если {C:attention}сыграны вместе с{} или",
                    "{C:attention}оставлены в руке с{} этой картой",
                }
            },
            m_aij_ice = {
                name = "Ледяная Карта",
                text = {
                    "{C:attention}Всегда{} набирает очки и",
                    "{C:red}Игнорирует{} лимит розыгрыша",
                    "{C:inactive}Лишние Ледяные карты не",
                    "{C:inactive}влияют на тип руки"
                }
            },
            m_aij_wood = {
                name = "Деревянная Карта",
                text = {
                    'Когда остаётся в руке, {C:chips}+#3#{} фишек,',
                    '{C:chips}+#2#{} больше за каждую другую',
                    '{C:attention}Деревянную{} карту, оставшуюся в руке',
                    '{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} фишек)'
                }
            },
            m_aij_simulated = {
                name = "Симулированная Карта",
                text = {
                    '{C:attention}Возвращается{} в руку',
                    'когда сыграна в {C:attention}первый{}',
                    'раз в раунде'
                }
            },
            m_aij_canvas = {
                name = "Карта-Холст",
                text = {
                    '{C:attention}Копирует{} ранг и масть',
                    'карты {C:attention}справа'
                }
            },
        },
        Voucher = {
            v_aij_fairy_dust ={
                name = "Фея-Пыльца",
                text = {
                    "{C:dark_edition}Мерцающие{}, {C:dark_edition}Серебряные{} и",
                    "{C:dark_edition}Звёздные{} карты",
                    "появляются в {C:attention}#1#X{} чаще",
                },
            },
            v_aij_live_pixie ={
                name = "Живая Пикси",
                text = {
                    "{C:dark_edition}Мерцающие{}, {C:dark_edition}Серебряные{} и",
                    "{C:dark_edition}Звёздные{} карты",
                    "появляются в {C:attention}#1#X{} чаще",
                },
            },
            v_aij_gold_medal ={
                name = "Золотая Медаль",
                text = {
                    "{C:money}Золотые{} теги появляются",
                    "в {C:attention}#1#X{} чаще",
                },
            },
            v_aij_trophy ={
                name = "Трофей",
                text = {
                    "{C:attention}Тег пропуска большого",
                    "блайнда{} с шансом {C:green}#1# из #2#",
                    "становится {C:money}Золотым"
                },
            },
            v_aij_sticker_sheet ={
                name = "Лист Стикеров",
                text = {
                    '{C:attention}Ослабляет{} эффект',
                    '{C:red}вредоносных',
                    '{C:attention}стикеров'
                },
            },
            v_aij_polkadot ={
                name = "Горошек",
                text = {
                    '{C:attention}Ослабляет{} эффект',
                    '{C:red}вредоносных',
                    '{C:attention}стикеров'
                },
            },
        },
        Edition = {
            e_aij_negative_playing_card = {
                name = "Негативный",
                text = {
                    "{C:dark_edition}+#1#{} размер руки",
                    "{C:inactive}(Удаляется при копировании)"
                },
            },
            e_aij_glimmer = {
                name = "Мерцание",
                text = {
                    "{C:aij_plasma}Балансирует{} {C:attention}#1#%{}",
                    "{C:chips}Фишек{} и {C:mult}Множителя{}"
                }
            },
            e_aij_silver = {
                name = "Серебро",
                text = {
                    "{C:attention}X#1#{} к эффектам",
                }
            },
            e_aij_stellar = {
                name = "Звёздный",
                text = {
                    "{C:chips}+#1#{} Фишек и",
                    "{C:mult}+#2#{} Множителя за {C:attention}уровень{}",
                    "разыгранной руки"
                }
            },
            e_aij_aureate = {
                name = "Златокованый",
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
            -- Кредиты (имена создателей)
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
                    '{C:inactive}"Без напряга"'
                },
            },
            j_aij_rattling_snow_credits_joker = {
                name = "RattlingSnow353",
                text = {
                    '{C:inactive}"Мастер на все руки, но ни одного',
                    '{C:inactive}настоящего, хотя часто лучше',
                    '{C:inactive}мастера одного дела."'
                },
            },
            j_aij_jumbocarrot_credits_joker = {
                name = "Jumbocarrot",
                text = {
                    '{C:inactive}"Привет, Алекс"'
                },
            },
            
            -- Обычные джокеры
            j_aij_flying_ace = {
                name = "Летучий Туз",
                text = {
                    "Зарабатывает {C:money}$#1#{} в конце раунда",
                    "за каждого {C:attention}Туза{} уникальной {C:attention}масти{}",
                    "разыгранного в этом раунде",
                    "{C:inactive}(Сейчас{} {C:money}$#2#{}{C:inactive})"
                },
            },
            j_aij_lucky_seven = {
                name = "Счастливая Семёрка",
                text = {
                    "Превращает всех разыгранных",
                    "неулучшенных {C:attention}7{} в",
                    "{C:attention}Счастливые Карты{}"
                },
            },
            j_aij_you_broke_it = {
                name = "Ты Сломал Это!",
                text = {
                    "Превращает каждую разыгранную неулучшенную {C:attention}#1#{}",
                    "в {C:attention}#2#{}",
                    "{s:0.8}Ранг и улучшение",
                    "{s:0.8}меняются в конце раунда"
                },
            },
            j_aij_birthday_clown = {
                name = "Клоун-Именинник",
                text = {
                    "{X:mult,C:white}X#1#{} Множитель на",
                    "{C:attention}1{} раунд каждую {C:attention}Анту{}",
                    "{C:inactive}#2#"
                },
            },
            j_aij_memory_card = { 
                name = "Карта Памяти", 
                text = { 
                    "Если первая рука раунда",
                    "состоит ровно из {C:attention}1{} карты,",
                    "{C:attention}вытягивает{} её {C:attention}первой{}",
                    "в будущих блайндах",
                    "{C:inactive}(Может хранить только одну карту)",
                    "{C:inactive}(Срабатывает только в крайней левой позиции)" 
                } 
            },
            j_aij_sleepy_joker = { 
                name = "Сонный Джокер", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множитель, если разыгранная рука", 
                    "содержит только {C:spades}Пики{} и {C:clubs}Трефы"
                } 
            },
            j_aij_invisible_man = { 
                name = "Невидимка", 
                text = { 
                    "Все {C:attention}лицевые карты{} считаются",
                    "{C:attention}Королями{}, {C:attention}Дамами{} и {C:attention}Валетами",
                    "{C:inactive}(Кроме составления покерных комбинаций)"
                } 
            },
            j_aij_handsome_joker = { 
                name = "Красавчик-Джокер", 
                text = { 
                    "Получает {X:mult,C:white}X#1#{} Множитель за",
                    "каждую {C:attention}#2#{}",
                    "в вашей {C:attention}полной колоде",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#3#{} {C:inactive}Множитель)",
                } 
            },
            j_aij_whiteface_grotesque = { 
                name = "Белолицый Гротеск", 
                text = { 
                    "Этот джокер получает {C:chips}+#1#{} Фишек",
                    "за каждую {C:attention}лицевую{} карту {C:attention}оставшуюся в",
                    "{C:attention}руке{} когда рука разыграна",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)"
                }
            },
            j_aij_the_clown_show = { 
                name = "Клоунское Шоу", 
                text = { 
                    "{C:chips}+#1#{} Фишек за каждого {C:attention}Джокера",
                    "купленного в этой игре",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)"
                } 
            },
            j_aij_little_devil = {
                name = "Чёртик",
                text = {
                    "При {C:attention}пропуске{} {C:attention}Блайнда{},",
                    "создаёт {C:attention}Обычный{}, {C:tarot}Шарм{}, {C:planet}Метеор{},",
                    "{C:spectral}Эфирный{} или {C:red}Буффон {C:attention}Тег{}"
                },
            },
            j_aij_pierrot = { 
                name = "Пьеро", 
                text = { 
                    "{C:attention}Числовые{} карты, оставшиеся в",
                    "руке, дают свою {C:chips}ценность Фишек{}" 
                } 
            },
            j_aij_hat_trick = { 
                name = "Фокус со Шляпой", 
                text = { 
                    "Если разыгранная рука —",
                    "{C:attention}Тройка{},",
                    "сыгранные карты дают {C:mult}Множитель{}",
                    "равный её {C:attention}уровню",
                    "{C:inactive}(Сейчас {C:mult}+#1#{} {C:inactive}Множитель)",
                } 
            },
            j_aij_squeezy_pete = {
                name = "Сжимающий Пит",
                text = {
                    "Получает {X:mult,C:white}X#1#{} Множителя за",
                    "{C:attention}последовательную{} разыгранную руку",
                    "содержащую {C:attention}Фулл-хаус{}",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{}{C:inactive} Множитель)",
                },
            },
            j_aij_infinite_jest = { 
                name = "Бесконечная Шутка", 
                text = { 
                    "Повышает уровень {C:attention}всех покерных",
                    "{C:attention}комбинаций{} когда {C:attention}Босс-блайнд",
                    "побеждён"
                } 
            },
            j_aij_bloody_mary = { 
                name = "Кровавая Мэри", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множитель. Когда карта",
                    "уничтожается, теряет {X:mult,C:white}X#2#{} Множителя",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#3#{C:inactive} Множитель)"
                } 
            },
            j_aij_trypophobia = {
                name = "Трипофобия",
                text = {
                    "{C:mult}+#1#{} Множитель, если разыгранная рука",
                    "содержит только {C:attention}8{}",
                },
            },
            j_aij_rummikub = { 
                name = "Руммикуб", 
                text = { 
                    "Все разыгранные карты считаются",
                    "на {C:attention}1 ранг{} выше для",
                    "составления {C:attention}Стритов{}"
                } 
            },
            j_aij_imperial_bower = { 
                name = "Имперский Козырь", 
                text = { 
                    "{C:attention}Первая карта{}, вытянутая",
                    "в каждом раунде, считается",
                    "{C:attention}любым{} рангом и мастью",
                    "{C:inactive}(Ранги не влияют на покерные комбинации)"
                } 
            },
            j_aij_ultrasound = {
                name = "Ультразвук",
                text = {
                    "Выбор {C:attention}Бустер-пака{} показывает",
                    "одно из его содержимого"
                }
            },
            j_aij_negative_nancy = {
                name = "Негативная Нэнси",
                text = {
                    "{C:dark_edition}Негативные{} джокеры появляются {C:attention}#1#X{}",
                    "чаще в {C:attention}Магазине{}"
                },
            },
            j_aij_old_joker = { 
                name = "Старый Джокер", 
                text = { 
                    "Этот джокер получает {C:chips}+#2#{} Фишек",
                    "и {C:mult}+#4#{} Множителя, когда {C:attention}Босс-блайнд{}",
                    "побеждён",
                    "{C:inactive,s:0.8}(Сейчас {C:chips,s:0.8}+#1#{}{C:inactive,s:0.8} Фишек, {C:mult,s:0.8}+#3#{}{C:inactive,s:0.8} Множителя)",
                    "{C:inactive,s:0.8}(Всегда Вечный)"
                } 
            },
            j_aij_imageboard = { 
                name = "Имиджборд", 
                text = { 
                    "Каждая {C:attention}разыгранная{} карта даёт {C:mult}+#1#{} Множителя",
                    "за каждый {C:attention}раз{}, когда её {C:attention}ранг{}",
                    "{C:attention}разыгрывался{} в этой руке",
                    "{C:inactive}(напр. {C:attention}2 2 2{C:inactive} -> {C:mult}+#1#{C:inactive}, {C:mult}+#2#{C:inactive}, {C:mult}+#3#{C:inactive})"
                } 
            },
            j_aij_carousel = { 
                name = "Карусель", 
                text = { 
                    "{C:attention}Вращает{} масть",
                    "{C:attention}разыгранных{} карт после набора очков",
                    "{C:inactive,s:0.8}(Пики -> Черви -> Трефы -> Бубны)"
                } 
            },
            j_aij_slippery_when_wet = { 
                name = "Скользко в Мокром", 
                text = { 
                    "{C:attention}Каменные карты{} имеют {C:green}#1# из #2#{} шанс",
                    "превратиться в случайную {C:attention}улучшенную{}",
                    "карту после набора очков"
                } 
            },
            j_aij_founding_father = { 
                name = "Отцы-Основатели", 
                text = { 
                    "{C:attention}Заряженные Карты{} в",
                    "{C:attention}два{} раза эффективнее"
                } 
            },
            j_aij_scary_story = {
                name = "Страшная История",
                text = {
                    "Обычные игровые карты",
                    "в {C:attention}Обычных паках{}",
                    "с шансом {C:green}#1# из #2#{}",
                    "становятся {C:dark_edition}Негативными{}"
                },
            },
            j_aij_doodle = {
                name = "Каракуля",
                text = {
                    "В начале каждого {C:attention}раунда{} с шансом {C:green}#1# из #2#{}",
                    "копирует {C:attention}обоих соседних{}",
                    "джокеров до конца",
                    "{C:attention}раунда",
                    "{C:inactive}#3#"
                },
            },
            j_aij_joqr = { 
                name = "JOQR", 
                text = { 
                    "Получает {C:mult}+#1#{} Множителя, когда",
                    "{C:attention}Король{}, {C:attention}Дама{} или {C:attention}Валет{}",
                    "уничтожены"
                } 
            },
            j_aij_greasepaint = { 
                name = "Грим", 
                text = {
                    {
                        "Ослабляет соседних {C:attention}Джокеров{}"
                    },
                    {
                        "Ослабленные {C:attention}Джокеры{} и",
                        "{C:attention}карты{} дают {X:mult,C:white}X#1#{} Множителя"
                    }  
                } 
            },
            j_aij_public_bathroom = {
                name = "Общественный Туалет",
                text = {
                    "Этот джокер получает {C:mult}+#1#{} Множителя",
                    "за каждую разыгранную {C:attention}2{} во {C:attention}Флеше{}",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множителя)"
                },
            },
            j_aij_diogenes = { 
                name = "Диоген", 
                text = { 
                    "{C:green}Перероллы{} в {C:attention}Магазине{}",
                    "стоят {C:money}$#1#{} каждый, но",
                    "{C:attention}не увеличивают{} стоимость"
                } 
            },
            j_aij_blank_card = {
                name = "Пустая Карта",
                text = {
                    "Каждый раз, когда {C:attention}игровая карта{}",
                    "выбрана из {C:attention}Обычного пака{},",
                    "создаётся её {C:attention}точная копия{}"
                },
            },
            j_aij_comedians_manifesto = { 
                name = "Манифест Комика", 
                text = { 
                    "{C:attention}Короли{} и {C:attention}Дамы{} в",
                    "{C:attention}Обычных паках{}",
                    "становятся {C:attention}Валетами{}" 
                } 
            },
            j_aij_circuit_board = { 
                name = "Печатная Плата", 
                text = { 
                    "Когда {C:attention}Заряженная карта{} набирает",
                    "очки, даёт {X:mult,C:white}X#1#{} Множителя за",
                    "каждую другую {C:attention}Заряженную карту{}",
                    "в руке"
                } 
            },
            j_aij_platinum_chip = { 
                name = "Платиновый Чип", 
                text = { 
                    "Разыгранные {C:attention}Тузы{} дают",
                    "{C:chips}+#1#{} Фишек и {C:mult}+#2#{} Множителя"
                } 
            },
            j_aij_cctv = { 
                name = "Видеонаблюдение", 
                text = { 
                    "Когда {C:attention}Стеклянная карта{} {C:attention}ломается{},",
                    "зарабатывает {C:money}$#1#{} и улучшает случайную",
                    "карту в руке",
                    "в {C:attention}Стеклянную{}"
                } 
            },
            j_aij_pell_mel = { 
                name = "Пель-Мель", 
                text = { 
                    "{X:mult,C:white}X1{} Множитель плюс {X:mult,C:white}X#1#{} Множителя",
                    "за каждую {C:attention}уникальную{} масть в",
                    "{C:attention}разыгранной руке",
                } 
            },
            j_aij_pput_together = { 
                name = "Собранный Воедино", 
                text = { 
                    "Если в разыгранной руке есть",
                    "{C:attention}#1#{} и {C:attention}#2#{},",
                    "уничтожить их и создать",
                    "{C:attention}#3#{}"
                } 
            },
            j_aij_krampus = {
                name = "Крампус",
                text = {
                    {
                        "Разыгранные {C:attention}Золотые карты{}",
                        "превращаются в {C:attention}Каменные карты{}",
                    },
                    {
                        "{C:attention}Каменные карты{} приносят",
                        "{C:money}$#1#{} когда набирают очки"
                    }
                },
            },
            j_aij_art_of_the_deal = { 
                name = "Искусство Сделки", 
                text = { 
                    "Получает {C:mult}+#2#{} Множителя, когда",
                    "{C:money}деньги{} заработаны",
                    "Сбрасывается, если у вас",
                    "{C:money}$#3#{} или меньше",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множителя)"
                } 
            },
            j_aij_word_art = { 
                name = "Словесное Искусство", 
                text = { 
                    "{X:mult,C:white}X1{} Множитель плюс {X:mult,C:white}X#1#{} Множителя",
                    " за каждого {C:attention}Туза{}, {C:attention}Короля{}, {C:attention}Даму{}",
                    "или {C:attention}Валета{} в разыгранной руке"
                } 
            },
            j_aij_atom = {
                name = "Атом",
                text = {
                    "Повышает уровень {C:attention}Старшей карты{}",
                    "если разыгранная рука —",
                    "один {C:attention}Туз{}"
                },
            },
            j_aij_plain_jane = {
                name = "Простушка Джейн",
                text = {
                    "Разыгранные {C:attention}неулучшенные{}",
                    "карты дают {C:mult}+#1#{} Множителя"
                },
            },
            j_aij_paper_bag = { 
                name = "Бумажный Пакет", 
                text = { 
                    "Этот джокер получает {C:chips}+#1#{} Фишек",
                    "за каждый {C:attention}уровень{} каждой",
                    "{C:red}сброшенной{} покерной комбинации",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)" 
                } 
            },
            j_aij_fruity_joker = { 
                name = "Фруктовый Джокер", 
                text = { 
                    "{C:attention}Полихромные{} карты и",
                    "джокеры дают {C:mult}+#1#{} Множителя",
                } 
            },
            j_aij_jokia = { 
                name = "Йокия", 
                text = { 
                    "Когда {C:attention}Счастливая карта{}",
                    "срабатывает, создаёт копию",
                    "случайной карты в руке"
                } 
            },
            j_aij_the_mycologists = {
                name = "Микологи",
                text = {
                    "Если разыгранная рука — точно {C:attention}#1#{},",
                    "{C:red}уничтожить{} правую карту и передать",
                    "её {C:chips}Фишки{}, {C:dark_edition}Улучшение{} и",
                    "{C:dark_edition}Издание{} левой карте"
                }
            },
            j_aij_cool_joker = { 
                name = "Крутой Джокер", 
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая Способность",
                    "{V:1}Активировать{} этого {C:attention}Джокера{}, когда он",
                    "{C:attention}обычно{} набирал бы очки, для",
                    "{X:mult,C:white}X#1#{} Множителя" 
                } 
            },
            j_aij_square_eyes = { 
                name = "Квадратные Глаза", 
                text = {
                    "Разыгранные {C:attention}4{} дают {C:mult}+#1#{} Множителя",
                    "за каждую {C:attention}4{} в разыгранной руке"
                } 
            },
            j_aij_punk_joker = {
                name = "Панк-Джокер",
                text = {
                    "Если рука набирает очки с",
                    "{C:attention}Дикой картой{}, превращает случайную",
                    "неулучшенную разыгранную карту",
                    "в {C:attention}Дикую карту{}"
                },
            },
            j_aij_slim_joker = { 
                name = "Стройный Джокер", 
                text = { 
                    "{C:mult}+#1#{} Множителя",
                    "{C:mult}-#2#{} Множителя за карту",
                    "в разыгранной руке",
                } 
            },
            j_aij_wireframe = { 
                name = "Каркас", 
                text = { 
                    "{C:attention}Первая{} разыгранная рука каждого",
                    "раунда {C:attention}возвращается{} в вашу {C:attention}руку",
                } 
            },
            j_aij_soviet = { 
                name = "Советский", 
                text = { 
                    "{C:mult}+#1#{} Множителя, если {C:attention}разыгранная рука{}",
                    "не содержит {C:attention}Королей{} или {C:attention}Дам{}"
                } 
            },
            j_aij_mustachio = { 
                name = "Усач", 
                text = { 
                    "Разыгранные {C:attention}лицевые карты{}",
                    "имеют {C:green}#1# из #2#{} шанс",
                    "добавить {C:mult}+#3#{} Множителя"
                } 
            },
            j_aij_penny = {
                name = "Пенни",
                text = {
                    "Карты с {C:money}Золотой печатью{} имеют",
                    "шанс {C:green}#1# из #2#{} {C:attention}перезапуститься"
                },
            },
            j_aij_doctors_note = { 
                name = "Докторская Записка", 
                text = { 
                    "Все {C:attention}числовые{} {C:hearts}Черви{} считаются",
                    "{C:attention}одним рангом",
                    "{C:inactive}(Кроме составления покерных комбинаций)"
                } 
            },
            j_aij_silly_sausage = { 
                name = "Глупая Сосиска", 
                text = { 
                    "{C:green}Перероллы{} стоят {C:money}$#1#{} меньше",
                    "{C:attention}Уменьшается{} на {C:money}$#2#{}",
                    "в конце раунда"
                } 
            },
            j_aij_joker_baby = { 
                name = "Джокер-Малыш", 
                text = { 
                    "В конце раунда добавляет",
                    "{C:dark_edition}Негативную{} копию случайной",
                    "карты в руку, если есть место"
                } 
            },
            j_aij_anchor = { 
                name = "Якорь", 
                text = { 
                    "Этот джокер и",
                    "соседние джокеры {C:attention}не могут{}",
                    "{C:attention}быть {C:red}уничтожены" 
                } 
            },
            j_aij_hei_tiki = { 
                name = "Хей-Тики", 
                text = { 
                    "Этот {C:attention}Джокер{} получает {X:mult,C:white}X#2#{} Множителя",
                    "если итоговые {C:chips}Фишки{} разыгранной руки",
                    "превышают {C:mult}Множитель{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множитель)"
                } 
            },
            j_aij_polybius = { 
                name = "Полибий", 
                text = { 
                    "Даёт {C:mult}Множитель{} и {C:chips}Фишки{}",
                    "всех типов рук, {C:attention}содержащихся{}",
                    "{C:attention}внутри{} разыгранной руки", 
                } 
            },
            j_aij_joker_sighting = { 
                name = "Наблюдение за Джокером", 
                text = { 
                    "Когда этот джокер {C:money}продан{},",
                    "повышает уровень случайной",
                    "покерной комбинации на #1#"
                } 
            },
            j_aij_pencil_drawing = { 
                name = "Рисунок Карандашом",
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая Способность",
                    "Заплатить {C:money}$#1#{}, чтобы добавить",
                    "{C:attention}случайную{} игровую карту в руку"
                } 
            },
            j_aij_holy_bible = { 
                name = "Святая Библия", 
                text = { 
                    "Разыгранные {C:attention}Тузы{} дают",
                    "{X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_great_white_north = { 
                name = "Великий Белый Север", 
                text = { 
                    "Разыгранные {C:attention}Карты со льдом{}",
                    "дают {C:mult}+#1#{} Множителя"
                } 
            },
            j_aij_right_angle = { 
                name = "Прямой Угол", 
                text = { 
                    "Набирает очки со всех {C:attention}10{},",
                    "оставшихся в руке, когда",
                    "{C:attention}9{} набирает очки"
                } 
            },
            j_aij_adoring_joker = {
                name = "Восхищённый Джокер",
                text = {
                    "{C:attention}После{} того, как {C:attention}Джокеры{} сработали,",
                    "устанавливает {C:mult}Множитель{} на {C:attention}наивысший",
                    "{C:mult}Множитель{}, достигнутый в этой {C:attention}Анте",
                    "{C:inactive}(Сейчас {C:mult}#1# {C:inactive}Множитель)"
                } 
            },
            j_aij_lucignolo = {
                name = "Лучиньоло",
                text = {
                    "Зарабатывает {C:money}$#1#{} когда любая",
                    "игровая карта {C:attention}уничтожена{}"
                },
            },
            j_aij_scorecard = { 
                name = "Карточка Учёта", 
                text = { 
                    "Когда {C:attention}Блайнд{} выбран,",
                    "повышает уровень {C:attention}случайной",
                    "{C:attention}покерной комбинации{} на {C:attention}#1#"
                } 
            },
            j_aij_punch_and_judy = { 
                name = "Панч и Джуди", 
                text = { 
                    {
                        "Если {C:attention}разыгранная рука{} содержит",
                        "ровно {C:attention}одного Короля{} и одну {C:attention}Даму{},",
                        "перезапускает все набирающие очки карты"
                    },
                    {
                        "{C:attention}Короли{} и {C:attention}Дамы{}",
                        "всегда набирают очки"
                    }
                } 
            },
            j_aij_nature_tapes = { 
                name = "Записи Природы", 
                text = { 
                    "Когда используется {C:mult}Множитель-типа {C:planet}Планета",
                    "карта, этот джокер",
                    "получает {C:mult}+#1#{} Множителя",
                    "{C:inactive}(Сейчас {C:mult}+#2# {C:inactive}Множитель)",
                } 
            },
            j_aij_low_priest = { 
                name = "Низший Жрец", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множитель,",
                    "{X:mult,C:white}-X#2#{} Множителя за {C:attention}уровень{}",
                    "разыгранной руки"
                } 
            },
            j_aij_oil_and_water = { 
                name = "Масло и Вода", 
                text = { 
                    "Все {C:attention}лицевые карты{} считаются",
                    "{C:attention}Пиками{} и {C:attention}Трефами",
                    "Все {C:attention}числовые{} карты считаются",
                    "{C:attention}Червами{} и {C:attention}Бубнами"
                } 
            },
            j_aij_big_ears = { 
                name = "Большие Уши", 
                text = { 
                    "Раскрывает {C:attention}случайную{} карту",
                    "в {C:attention}Бустер-паках{} перед выбором"
                } 
            },
            j_aij_causal_absent_paranoia = { 
                name = "Случайная Отсутствующая Паранойя", 
                text = { 
                    "Если вы {C:red}проиграли{} хотя бы",
                    "один {C:attention}Блайнд{} в этой Анте,",
                    "{X:mult,C:white}X#1#{} Множитель"
                } 
            },
            j_aij_hand_drawn = { 
                name = "Рисованный От Руки", 
                text = { 
                    "В {C:attention}начале{} раунда",
                    "продолжает вытягивать карты,",
                    "пока ваша рука {C:attention}не будет содержать{}",
                    "вашу самую разыгрываемую {C:attention}покерную комбинацию{}" 
                }
            },
            j_aij_haruspex = { 
                name = "Гаруспик", 
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая Способность",
                    "Потратить {C:attention}#1#{} {C:red}Сброс{}, чтобы выбрать {C:attention}#2#{}",
                    "карты из вашей {C:attention}колоды{}, чтобы",
                    "{C:attention}вытянуть{} в руку"
                } 
            },
            j_aij_bobblehead = { 
                name = "Бобблхед", 
                text = { 
                    "Если в разыгранной руке",
                    "есть хотя бы {C:attention}#1#{} одинаковых",
                    "рангов, даёт {C:mult}+#2#{} Множителя"
                } 
            },
            j_aij_topsy_the_clown = { 
                name = "Топси-Клоун", 
                text = { 
                    "Округляет {C:chips}Фишки{} и {C:mult}Множитель",
                    "вверх до ближайшего",
                    "{C:attention}палиндрома" 
                } 
            },
            j_aij_cloudwatching = { 
                name = "Наблюдение за Облаками", 
                text = { 
                    "Когда {C:attention}Блайнд{} выбран,",
                    "добавляет копию {C:attention}случайной{}",
                    "карты из вашей колоды в руку"
                } 
            },
            j_aij_line_in_the_sand = {
                name = "Черта на Песке",
                text = {
                    "{C:attention}Сброшенные{} карты не возвращаются",
                    "в {C:attention}колоду{} до конца Анты"
                }
            },
            j_aij_hairy_joker = { 
                name = "Волосатый Джокер", 
                text = { 
                    "{C:attention}Карты с печатями{} дают",
                    "{X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_realty_sign = {
                name = "Риэлторская Вывеска",
                text = {
                    "Розыгрыш {C:attention}Фулл-хауса{}",
                    "увеличивает {C:money}цену продажи{}",
                    "этого джокера на {C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = { 
                name = "Гнилое Яблоко", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#2#{} Множителя",
                    "если {C:attention}разыгранная рука{} содержит",
                    "{C:attention}#4#{} {C:spades}Тёмных{} мастей и {C:attention}#3#{} {C:hearts}Светлых{} мастей",
                    "{C:inactive,s:0.8}(Пропорция меняется в конце раунда)",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множитель)"
                } 
            },
            j_aij_dim_bulb = {
                name = "Тусклая Лампочка",
                text = {
                    "{X:mult,C:white}X#1#{} Множитель, если у вас нет",
                    "{C:uncommon}Необычных{} или {C:red}Редких{} {C:attention}Джокеров{}",
                },
            },
            j_aij_blood_artist = { 
                name = "Художник по Крови", 
                text = { 
                    "Когда любой джокер или карта",
                    "{C:money}проданы{} или {C:attention}уничтожены{},",
                    "уменьшает требуемое количество очков",
                    "текущего {C:attention}Блайнда{} на {C:attention}#1#%"
                } 
            },
            j_aij_null_joker = {
                name = "Нулевой Джокер",
                text = {
                    "Устанавливает все {C:green}вероятности{}",
                    "в {C:attention}ноль{}"
                },
            },
            j_aij_magick_joker = {
                name = "Магический Джокер",
                text = {
                    "Сыгранные {V:1}#1#{} дают свои",
                    "{C:chips}+Фишки{} как {C:mult}+Множитель{} вместо этого",
                    "{C:inactive,s:0.8}(Масть меняется в конце раунда){}"
                }
            },
            j_aij_jeff_the_joker = {
                name = "Джефф-Джокер",
                text = {
                    'Когда выбран {C:attention}Малый Блайнд{},',
                    '{C:red}уничтожает{} всех остальных джокеров и',
                    'этот джокер получает {X:mult,C:white}X#2#{} Множителя за каждого',
                    '{C:inactive}(Сейчас {X:mult,C:white}X#1#{C:inactive})'
                },
            },
            j_aij_zanni = { 
                name = "Дзанни", 
                text = { 
                    "{C:attention}Числовые{} карты с шансом {C:green}#1# из #2#{}",
                    "создают {C:tarot}Таро{} карту",
                    "когда {C:attention}набирают очки"
                } 
            },
            j_aij_furbo_e_stupido = { 
                name = "Furbo e Stupido", 
                text = { 
                    "{C:attention}Дизкалькулярные{} карты также",
                    "считаются {C:attention}Тузами и {C:attention}Валетами" 
                } 
            },
            j_aij_read_em_and_weep = {
                name = "Прочти их и Плачь", 
                text = { 
                    "Если рука содержит {C:attention}Стрит{},",
                    "превращает все {C:attention}сыгранные{} карты",
                    "в одну случайную {C:attention}масть",
                    "перед набором очков" 
                } 
            },
            j_aij_goblin_joker = { 
                name = "Гоблин-Джокер", 
                text = { 
                    "После {C:red}сброса{}, вытягивает {C:attention}#1#{}",
                    "дополнительных карт" 
                } 
            },
            j_aij_string_theory = { 
                name = "Теория Струн", 
                text = { 
                    "Рука всегда считается",
                    "содержащей {C:attention}Стрит{}" 
                } 
            },
            j_aij_jesters_privelege = {
                name = "Привилегия Шута",
                text = {
                    "{C:legendary}Легендарные{} джокеры могут",
                    "появляться в {C:attention}Магазине{}",
                },
            },
            j_aij_privelege_fabled = {
                name = "Привилегия Шута",
                text = {
                    "{C:legendary}Легендарные{} джокеры",
                    "{C:attention}чаще встречаются{}",
                },
            },
            j_aij_quark = {
                name = "Кварк",
                text = {
                    'Повышает уровень {C:attention}Тройки{}, если',
                    'разыгранная рука — ровно {C:attention}три{}',
                    'карты {C:attention}одного ранга',
                    'но {C:attention}разных мастей{}'
                },
            },
            j_aij_lucky_carder = { 
                name = "Счастливый Картёжник", 
                text = { 
                    "Когда {C:attention}Счастливая карта{}",
                    "срабатывает, даёт {X:mult,C:white}X#1#{} Множителя",
                    "в этом раунде"
                } 
            },
            j_aij_silver_screen = { 
                name = "Серебряный Экран", 
                text = { 
                    "Когда {C:attention}лицевая{} карта",
                    "{C:red}уничтожена{}, добавляет {C:aij_silver}Серебро{}",
                    "к случайной карте в {C:attention}руке" 
                } 
            },
            j_aij_pedrolino = { 
                name = "Педролино", 
                text = { 
                    "{C:money}Продать{} эту карту, чтобы уменьшить",
                    "{C:attention}требование к очкам{}",
                    "текущего {C:attention}Блайнда{} на {C:attention}#1#%"
                } 
            },
            j_aij_pierrette = { 
                name = "Пьеретта", 
                text = { 
                    "Перезапускает все эффекты",
                    "{C:attention}сброса{} карт" 
                } 
            },
            j_aij_scaramouche = { 
                name = "Скарамуш", 
                text = { 
                    "{C:attention}Перезапускает{} все набравшие",
                    "очки карты, если {C:attention}разыгранная рука{}",
                    "— это {C:attention}#1#{}",
                    "{C:inactive}(Рука меняется в",
                    "{C:inactive}конце раунда){}"
                } 
            },
            j_aij_clay_joker = { 
                name = "Глиняный Джокер", 
                text = { 
                    "Копирует эффект",
                    "последнего {C:red}уничтоженного{} джокера" 
                } 
            },
            j_aij_sunny_joker = { 
                name = "Солнечный Джокер", 
                text = { 
                    "Если разыгранная рука {C:attention}содержит{}",
                    "{C:attention}Королевский Флеш{}, все",
                    "набирающие очки карты получают {X:mult,C:white}X#1#{} Множителя" 
                } 
            },
            j_aij_red_wine = { 
                name = "Красное Вино", 
                text = { 
                    "Когда {C:attention}Стеклянная карта{} ломается,",
                    "даёт {X:mult,C:white}X#1#{} Множителя",
                    "в этом раунде"
                } 
            },
            j_aij_mute_joker = { 
                name = "Немой Джокер", 
                text = { 
                    "В этом раунде первые {C:attention}#1#{} сыгранные",
                    "{C:red}уничтожают{} все набравшие очки карты",
                    "{C:inactive}(Покерная комбинация меняется в конце раунда)"
                } 
            },
            j_aij_scapino = { 
                name = "Скапино", 
                text = { 
                    "{C:green}Перероллы{} в {C:money}Магазине{} стоят",
                    "{C:money}+$#1#{}, но также обновляют",
                    "{C:attention}Бустер-паки{}" 
                } 
            },
            j_aij_pinhead = {
                name = "Булавочная Головка",
                text = {
                    "Зарабатывает {C:money}$#1#{}, если {C:attention}Блайнд{}",
                    "пройден за {C:attention}одну руку{}"
                },
            },
            j_aij_saltimbanco = { 
                name = "Сальтимбанко", 
                text = { 
                    "Во время набора очков",
                    "успешные {C:green}вероятности{}",
                    "дают {X:mult,C:white}XMult{} равный {X:mult,C:white}X1{}",
                    "плюс их шанс {C:red}неудачи{}",
                    "{C:inactive}(Напр.: {C:green}1 из 4{} {C:inactive} -> {X:mult,C:white}X1.75{C:inactive})"
                } 
            },
            j_aij_pulcinella = { 
                name = "Пульчинелла", 
                text = { 
                    "Все {C:attention}лицевые карты{} дают",
                    "дополнительный {C:mult}+#1#{} Множителя,",
                    "но имеют шанс {C:green}#2# из #3#{}",
                    "быть {C:red}уничтоженными{} после набора очков"
                } 
            },
            j_aij_petrushka = {
                name = "Петрушка",
                text = {
                    "Даёт {C:mult}+Множитель{} равный",
                    "сумме {C:attention}рангов{}",
                    "всех {C:attention}набравших очки карт{}",
                    "{C:inactive,s:0.8}(Т=14, К=13, Д=12, В=11)"
                },
            },
            j_aij_void = { 
                name = "Пустота", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множитель, если {C:planet}Планет{} карты",
                    "не использовались в этой {C:attention}Анте",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_kasperle = { 
                name = "Касперле", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множитель, если вы",
                    "купили {C:attention}Ваучер{}",
                    "в этой {C:attention}Анте",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_tumbler = { 
                name = "Неваляшка", 
                text = { 
                    "Каждый раз, когда вы",
                    "{C:green}переролливаете{} магазин,",
                    "получает {C:mult}+#1#{} Множителя",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множителя)"
                } 
            },
            j_aij_plain_packaging = { 
                name = "Обычная Упаковка", 
                text = { 
                    "Все {C:attention}Бустер-паки{}",
                    "стоят на {C:money}$#1#{} меньше",
                    "{C:inactive}(Не менее {C:money}$0{C:inactive})"
                } 
            },
            j_aij_mixel_perfect = {
                name = "Идеальный Миксель",
                text = {
                    "{C:mult}+#1#{} Множителя, если {C:attention}разыгранная рука{}",
                    "содержит {C:attention}нечётное{}",
                    "количество карт"
                },
            },
            j_aij_columbina = { 
                name = "Колумбина",
                text = {
                    "{C:aij_plasma}Балансирует{} {C:attention}#1#%{} {C:chips}Фишек{} и",
                    "{C:mult}Множителя{}, увеличивается на {C:attention}#2#%{}",
                    "когда используется {C:spectral}Спектральная{} карта"
                }
            },
            j_aij_j_file = { 
                name = "J-Файл", 
                text = { 
                    "В начале {C:attention}раунда",
                    "ищет {C:attention}#1#{} карт из вашей",
                    "{C:attention}колоды{} в вашу руку" 
                } 
            },
            j_aij_bumper_sticker = { 
                name = "Наклейка на Бампер", 
                text = { 
                    "Сыгранные {C:attention}карты{}",
                    "навсегда получают",
                    "{C:mult}+#1#{} Множителя, когда набирают очки"
                } 
            },
            j_aij_vesti_la_guibba = { 
                name = "Vesti la Guibba", 
                text = { 
                    "Когда {C:attention}Босс-блайнд{} побеждён,",
                    "получает {X:mult,C:white}X#1#{} Множителя",
                    "за каждую сыгранную руку"
                } 
            },
            j_aij_dead_president = {
                name = "Мёртвый Президент",
                text = {
                    "Продать этого {C:attention}Джокера{}, чтобы",
                    "{C:attention}удвоить{} {C:money}цену продажи{}",
                    "соседних {C:attention}Джокеров",
                    "{C:inactive}(Максимум {C:money}$#1#{}{C:inactive})"
                },
            },
            j_aij_second_tier_meme = { 
                name = "Мем Второго Уровня", 
                text = { 
                    "Копирует эффект",
                    "случайного джокера",
                    "из вашей коллекции"
                } 
            },
            j_aij_teeny_joker = {
                name = "Крошечный Джокер",
                text = {
                    "{C:chips}+#1#{} Фишек, если разыгранная рука",
                    "содержит только {C:attention}2{}",
                },
            },
            j_aij_clowns_on_parade = {
                name = "Клоуны на Параде",
                text = {
                    "Этот {C:attention}Джокер{} получает {C:chips}+#2#{} Фишек",
                    "если разыгранная рука содержит",
                    "как минимум три {C:attention}2{}",
                    "{C:inactive}(Сейчас{} {C:chips}+#1#{} {C:inactive}Фишек){}"
                },
            },
            j_aij_rising_sun = { 
                name = "Восходящее Солнце", 
                text = { 
                    "Перезапускает {C:attention}первую{} и {C:attention}последнюю{}",
                    "набравшие очки карты на {C:attention}первой{} и",
                    "{C:attention}последней руке{} раунда",
                }
             },
            j_aij_red_sky = {
                name = "Красное Небо",
                text = {
                    "Набравшие очки карты в {C:attention}первой{} и",
                    "{C:attention}последней руке{} раунда дают",
                    "свои {C:chips}+Фишки{} как {C:mult}+Множитель{} вместо этого"
                }
            },
            j_aij_blind_drawn = {
                name = "Рисованный Вслепую",
                text = {
                    "{X:mult,C:white}X#1#{} Множитель",
                    "Не видит {C:attention}Босс-блайнд{} или",
                    "его эффекты, пока не выбран",
                }
            },
            j_aij_mp_blind_drawn = {
                name = "Рисованный Вслепую",
                text = {
                    "{X:mult,C:white}X#1#{} Множитель",
                    "Не видит очки вашего {X:purple,C:white}Немезиды{}",
                    "или оставшиеся руки",
                    "во время {C:attention}PvP Блайндов{}",
                }
            },
            j_aij_heidelberg_tun = {
                name = "Гейдельбергская Бочка",
                text = {
                    "Применяет {C:dark_edition}Негативное{} к",
                    "первому купленному {C:attention}расходнику{}",
                    "в каждом магазине",
                    "{C:inactive}#1#"
                },
            },
            j_aij_open_mind = {
                name = "Открытый Разум",
                text = {
                    "{C:attention}+#1#{} дополнительный",
                    "{C:attention}Бустер-пак{} доступен",
                    "для покупки в {C:attention}Магазине{}"
                },
            },
            j_aij_little_boy_blue = { 
                name = "Маленький Синий Мальчик", 
                text = { 
                    "{C:chips}+#1#{} Фишек",
                    "Появляются только {C:chips}Фишечные{} джокеры"
                } 
            },
            j_aij_big_red = { 
                name = "Большой Красный", 
                text = { 
                    "{C:mult}+#1#{} Множителя",
                    "Появляются только {C:mult}Множительные{} джокеры" 
                } 
            },
            j_aij_party_streamers = {
                name = "Праздничные Ленточки",
                text = {
                    "Если {C:attention}первая рука{} раунда",
                    "состоит ровно из {C:attention}1{} карты без",
                    "{C:attention}Печати{}, она получает {C:red}Красную{}, {C:blue}Синюю{}",
                    "или {C:money}Золотую{} {C:attention}Печать{}"
                },
            },
            j_aij_kilroy = { 
                name = "Килрой", 
                text = { 
                    "{C:attention}Удваивает{} ценность {C:chips}Фишек{}",
                    "этого джокера при {C:money}продаже",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)",
                } 
            },
            j_aij_janus = { 
                name = "Янус", 
                text = { 
                    "Эффекты {C:attention}изданий{},",
                    "{C:attention}улучшений{} и {C:attention}печатей{}",
                    "на {C:attention}лицевых картах{} {C:green}удвоены" 
                } 
            },
            j_aij_honker = { 
                name = "Гудок", 
                text = { 
                    "Этот джокер получает {C:red}+#1#{} Множителя",
                    "когда {C:attention}Множительная карта{} набирает очки",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множителя)",
                } 
            },
            j_aij_mummy = { 
                name = "Мумия", 
                text = { 
                    "Когда {C:attention}Блайнд{} выбран,",
                    "если у вас есть {C:attention}Вечный{} джокер,",
                    "получает {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_sitcom = { 
                name = "Ситком", 
                text = { 
                    "Если вы сыграли ту же",
                    "покерную комбинацию, что",
                    "и в прошлом раунде, {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_in_vino_veritas = { 
                name = "In vino Veritas", 
                text = { 
                    "Когда вы {C:money}покупаете{} {C:attention}Ваучер{},",
                    "получаете {C:tarot}Таро{} карту",
                    "за каждый купленный {C:attention}Ваучер{}"
                } 
            },
            j_aij_beefeater = { 
                name = "Бифитер", 
                text = { 
                    "Если в разыгранной руке",
                    "нет {C:hearts}Червей{}, все карты",
                    "считаются {C:hearts}Червами{}"
                } 
            },
            j_aij_tetraphobia = {
                name = "Тетрафобия",
                text = {
                    "Этот джокер получает {C:mult}+#2#{} Множителя",
                    "за каждую сброшенную {C:attention}4{}, сбрасывается,",
                    "когда {C:attention}4{} набирает очки",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множителя)",
                },
            },
            j_aij_jack_of_all_trades = {
                name = "Мастер на Все Руки",
                text = {
                    "{C:attention}Валеты{} считаются любой {C:attention}мастью",
                },
            },
            j_aij_jumbo_joker = { 
                name = "Огромный Джокер", 
                text = { 
                    "Могут появляться только {C:attention}Большие{} и {C:attention}Гигантские",
                    "{C:attention}Бустер-паки{}" 
                } 
            },
            j_aij_pellucid_joker = { 
                name = "Прозрачный Джокер", 
                text = { 
                    "Когда {C:attention}Джокер{} с {C:dark_edition}Изданием{}",
                    "{C:money}продан{} или {C:red}уничтожен{}, добавляет",
                    "случайную игровую карту с тем же",
                    "{C:dark_edition}Изданием{} в колоду"
                } 
            },
            j_aij_cosmological_constant = {
                name = "Космологическая Постоянная",
                text = {
                    "{C:aij_plasma}Балансирует{} {C:attention}базовые{} {C:chips}Фишки{} и {C:mult}Множитель{}",
                    "разыгранной {C:attention}покерной комбинации"
                },
            },
            j_aij_monster = { 
                name = "Монстр", 
                text = { 
                    "Когда любой {C:attention}Джокер{} или {C:attention}карта{}",
                    "{C:money}проданы{} или {C:red}уничтожены{}, получает",
                    "{X:mult,C:white}+X#1#{} Множителя до конца Анты"
                } 
            },
            j_aij_mistigri = {
                name = "Мистигри",
                text = {
                    "{C:attention}+1{} к размеру руки за каждые {C:attention}2",
                    "{C:attention}Валета{} в руке"
                },
            },
            j_aij_simple_simon = {
                name = "Простой Саймон",
                text = {
                    "{C:chips}+#1#{} Фишек",
                },
            },
            j_aij_giocoliere = {
                name = "Джокольере",
                text = {
                    "{C:attention}+#1#{} к размеру руки{} во время",
                    "каждого {C:attention}Босс-блайнда{}"
                },
            },
            j_aij_spectre = { 
                name = "Призрак", 
                text = { 
                    "Когда {C:attention}Босс-блайнд{}",
                    "побеждён, заменяет все",
                    "{C:attention}расходники{} на случайные",
                    "{C:spectral}Спектральные{} карты" 
                } 
            },
            j_aij_dapper_dan = { 
                name = "Щеголь Дэн", 
                text = { 
                    "Издания {C:dark_edition}Джокеров{}",
                    "{C:attention}в два{} раза эффективнее",
                    "{C:inactive}(Кроме Негативного)"
                } 
            },
            j_aij_average_joe = {
                 name = "Средний Джо", 
                 text = { 
                    "{C:aij_plasma}Балансирует{} {C:attention}#1#%{}",
                    "{C:chips}Фишек{} и {C:mult}Множителя{}"
                } 
            },
            j_aij_silent_sam = { 
                name = "Молчаливый Сэм", 
                text = { 
                    "Каждая {C:attention}карта{}, оставшаяся в",
                    "руке, даёт {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_pantomimus = { 
                name = "Пантомимус", 
                text = { 
                    "Этот джокер получает {C:chips}+#2#{}",
                    "Фишек за карту, {C:attention}оставшуюся в",
                    "{C:attention}руке{} в конце {C:attention}раунда",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)"
                } 
            },
            j_aij_sneaky_pete = {
                name = "Скрытный Пит",
                text = {
                    'Зарабатывает {C:money}$#2#{} в конце раунда',
                    'за каждую {C:money}Золотую печать{}',
                    'в вашей {C:attention}полной колоде',
                    '{C:inactive}(Сейчас {C:money}$#1#{C:inactive})'
                },
            },
            j_aij_peeping_tom = { 
                name = "Подглядывающий Том", 
                text = { 
                    "Раскрывает {C:attention}все карты{} в",
                    "{C:attention}Бустер-паках{}"
                } 
            },
            j_aij_la_commedia_e_finita = {
                name = "La Commedia è Finita",
                text = {
                    "Этот джокер получает {C:mult}+#1#{} Множителя",
                    "когда {C:attention}лицевая{} карта {C:attention}уничтожена",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множителя)"
                },
            },
            j_aij_straight_to_hell = {
                name = "Прямо в Ад",
                text = {
                    "Этот {C:attention}Джокер{} получает {X:mult,C:white}X#1#{} Множителя",
                    "когда сброс содержит {C:attention}Стрит{}",
                    '{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множитель)'
                },
            },
            j_aij_guiser = {
                name = "Гизер",
                text = {
                    "Получает {C:money}$#1#{} {C:attention}цены продажи{}",
                    "когда используется {C:tarot}Таро{} карта"
                },
            },
            j_aij_mummer = { 
                name = "Маммер", 
                text = { 
                    "Запускает все {C:aij_silver}Стальные{} карты,",
                    "{C:attention}оставшиеся в руке{}, когда {C:aij_silver}Стальная",
                    "карта {C:attention}набирает очки",
                } 
            },
            j_aij_tipteerer = {
                name = "Типтирер",
                text = {
                    "Зарабатывает {C:attention}#2#%{} от {C:money}цены продажи{}",
                    "других {C:attention}Джокеров{}, округлённое вверх,",
                    "в конце {C:attention}раунда{}",
                    "{C:inactive}(Сейчас{} {C:money}$#1#{}{C:inactive}){}"
                },
            },
            j_aij_honest_john = { 
                name = "Честный Джон", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "создаёт копию случайного",
                    "{C:attention}Тега{} из этого пропуска"
                } 
            },
            j_aij_dizzard = { 
                name = "Диззард", 
                text = { 
                    "После {C:attention}пропуска{} блайнда,",
                    "посещает {C:money}Магазин" 
                } 
            },
            j_aij_arlecchino = { 
                name = "Арлекино", 
                text = { 
                    "Может брать неограниченное количество",
                    "вариантов в {C:attention}Буффон-паках{} и",
                    "{C:attention}Обычных паках" 
                } 
            },
            j_aij_arlecchina = { 
                name = "Арлекина", 
                text = { 
                    "Все карты в {C:attention}Обычных паках{}",
                    "имеют {C:attention}случайную{} печать"
                } 
            },
            j_aij_taikomochi = { 
                name = "Тайкомоти", 
                text = { 
                    "{C:attention}Валеты{}, оставшиеся в руке,",
                    "дают {C:chips}+#1#{} Фишек"
                } 
            },
            j_aij_sudoku = { 
                name = "Судоку", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#1#{} Множителя",
                    "за каждую последовательную руку",
                    "содержащую {C:attention}Стрит{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множитель)"
                } 
            },
            j_aij_gnasher = { 
                name = "Грызун", 
                text = { 
                    "{B:1,C:white,s:0.8}Активируемая Способность",
                    "Раз в Анту, {C:attention}копирует{} и",
                    "{C:attention}немедленно{} использует случайный",
                    "{C:attention}расходник",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_executioner = {
                name = "Палач",
                text = {
                    "Этот джокер получает {C:chips}+#1#{} Фишек",
                    "когда {C:attention}лицевая{} карта {C:attention}уничтожена",
                    "{C:inactive}(Сейчас {C:chips}+#2#{C:inactive} Фишек)"
                },
            },
            j_aij_jongleur = {
                name = "Жонглёр",
                text = {
                    "{C:attention}-$#1#{} к стоимости {C:green}переролла{}",
                },
            },
            j_aij_event_horizon = { 
                name = "Горизонт Событий", 
                text = { 
                    "{C:dark_edition}Чёрная дыра{} имеет ту же",
                    "редкость, что и другие {C:planet}Планеты{}",
                } 
            },
            j_aij_the_jester = {
                name = "Шут",
                text = {
                    "Первый {C:attention}Джокер{},",
                    "проданный в каждом раунде,",
                    "создаёт {C:tarot}Шута{}",
                    "{C:inactive}#1#{}"
                },
            },
            j_aij_joka_lisa = { 
                name = "Джока Лиса", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множителя за каждый",
                    "{C:attention}размер руки{} выше {C:attention}7{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множитель)",
                    "{C:inactive}(Минимум {X:mult,C:white}X1{C:inactive} Множитель)"
                } 
            },
            j_aij_tonpraten = { 
                name = "Тонпратен", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} карту",
                    "с печатью, создаётся её копия",
                    "в вашей руке"
                } 
            },
            j_aij_rodeo_clown = { 
                name = "Родео-Клоун", 
                text = { 
                    "Этот джокер получает {C:mult}+#1#{} Множителя",
                    "если {C:attention}Блайнд{} пройден на",
                    "{C:attention}последней руке{} раунда",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множителя)"
                } 
            },
            j_aij_joculator = { 
                name = "Йокулятор", 
                text = { 
                    "Вытягивает до {C:attention}двойного{} вашего размера",
                    "руки, если у вас {C:attention}0{} {C:red}сбросов",
                    "и {C:attention}#1#{} {C:blue}рук{} осталось" 
                } 
            },
            j_aij_scurra = {
                name = "Скурра",
                text = {
                    'Перезапускает все сыгранные карты',
                    'с {C:red}Красной печатью{}',
                    '{C:attention}#1#{} дополнительный раз'
                },
            },
            j_aij_pigpen = { 
                name = "Пигпен", 
                text = { 
                    "Все {C:attention}Стеклянные карты{}",
                    "считаются {C:attention}Каменными картами{}",
                    "и наоборот"
                } 
            },
            j_aij_cyclops = { 
                name = "Циклоп", 
                text = { 
                    "Когда вы {C:attention}сбрасываете{} руку,",
                    "увеличивает уровень случайной",
                    "покерной комбинации на #1#"
                } 
            },
            j_aij_blarney_stone = { 
                name = "Камень Бларни", 
                text = { 
                    "Добавляет {C:mult}Множитель{} равный",
                    "{C:attention}тройной{} {C:attention}первой цифре{}",
                    "текущего {C:attention}счёта{}",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множитель)"
                } 
            },
            j_aij_sticker = { 
                name = "Стикер", 
                text = { 
                    "{C:mult}+#1#{} Множителя за каждый {C:attention}стикер{}",
                    "на ваших {C:attention}Джокерах{}",
                    "{C:inactive}(Сейчас{} {C:mult}+#2#{C:inactive} Множитель)",
                } 
            },
            j_aij_feedback_form = { 
                name = "Форма Обратной Связи", 
                text = { 
                    "Каждая {C:attention}набирающая очки{} карта даёт {C:mult}+#1#",
                    "Множителя, если все {C:attention}набирающие очки{} карты",
                    "имеют разные {C:attention}улучшения" 
                }
            },
            j_aij_stultor = { 
                name = "Стультор", 
                text = { 
                    "Переролливает {C:attention}Босс-блайнд{} {C:attention}#1#{} раз",
                    "в Анту, бесплатно" 
                } 
            },
            j_aij_david = {
                name = "Давид",
                text = {
                    "Этот джокер получает {C:chips}+#1#{}",
                    "Фишек, если {C:attention}разыгранная рука{}",
                    "состоит только из {C:spades}Пиковых{} {C:attention}Королей{}",
                    "{C:inactive}(Сейчас{} {C:chips}+#2#{C:inactive} Фишек)",
                },
            },
            j_aij_charles = {
                name = "Чарльз",
                text = {
                    "Этот джокер получает {X:mult,C:white}X#1#{}",
                    "Множителя, если {C:attention}разыгранная рука{}",
                    "состоит только из {C:hearts}Червовых{} {C:attention}Королей{}",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{C:inactive} Множитель)",
                },
            },
            j_aij_cesar = {
                name = "Цезарь",
                text = {
                    'Зарабатывает {C:money}$#1#{} за каждую руку.',
                    'Увеличивается на {C:money}$#2#{}',
                    'если {C:attention}разыгранная рука{} состоит только из',
                    '{C:diamonds}Бубновых {C:attention}Королей'
                },
            },
            j_aij_alexandre = {
                name = "Александр",
                text = {
                    "Этот джокер получает {C:mult}+#1#{}",
                    "Множителя, если {C:attention}разыгранная рука{}",
                    "состоит только из {C:clubs}Трефовых{} {C:attention}Королей{}",
                    "{C:inactive}(Сейчас{} {C:mult}+#2#{C:inactive} Множитель)",
                },
            },
            j_aij_sannio = { 
                name = "Саннио", 
                text = { 
                    "Все карты считаются",
                    "{C:attention}лицевыми{} картами"
                } 
            },
            j_aij_stock_photo = { 
                name = "Стоковое Фото", 
                text = { 
                    "Когда вы {C:money}покупаете{} {C:attention}Джокера{},",
                    "создаётся {C:money}Золотая{} копия",
                    "случайного {C:attention}Тега{}"
                } 
            },
            j_aij_fou_du_roi = {
                name = "Fou du Roi",
                text = {
                    'С шансом {C:green}#1# из #2#{} создаёт',
                    '{C:tarot}Таро{} карту, если разыгранная рука',
                    'содержит {C:attention}Короля{} или {C:attention}Даму',
                    '{C:inactive}(Должно быть место)'
                },
            },
            j_aij_fatuus = {
                name = "Фатуус",
                text = {
                    'Если первая рука раунда',
                    'содержит только {C:attention}Королей{} и',
                    '{C:attention}Дам{}, применяет {C:blue}Синюю печать{}',
                    'к случайной сыгранной карте',
                },
            },
            j_aij_enraging_photo = { 
                name = "Бесящее Фото", 
                text = { 
                    "Когда {C:attention}лицевая{} карта {C:red}уничтожена{},",
                    "даёт {X:mult,C:white}X#1#{} Множителя",
                    "до конца Анты"
                } 
            },
            j_aij_infuriating_note = { 
                name = "Бесящая Записка", 
                text = {{
                    "{X:mult,C:white}X#1#{} Множитель",
                    "{C:dark_edition}Негативные{} копии этого",
                    "джокера могут появляться в",
                    "{C:attention}Магазине{} и {C:attention}Буффон-паках{}", 
                },
                {
                    "{C:inactive}\"Я забрал твои вещи,",
                    "{C:inactive}но ты продолжаешь пробиваться;",
                    "{C:inactive}придётся попробовать посильнее,",
                    "{C:inactive}так что крысы прочь от тебя!\" -Р.Р.",
                }
            }
            },
            j_aij_magic_hat = { 
                name = "Волшебная Шляпа", 
                text = { 
                    "В конце раунда добавляет",
                    "случайную {C:spectral}Спектральную{}",
                    "карту в расходники"
                } 
            },
            j_aij_anagraph = { 
                name = "Анаграф", 
                text = { 
                    "Когда любой {C:attention}Джокер{} или {C:attention}Игровая",
                    "{C:attention}карта{} {C:money}проданы{} или {C:red}уничтожены{}",
                    "создаёт {C:attention}точную копию{} и",
                    "немедленно {C:red}уничтожает{} её",
                    "снова" 
                } 
            },
            j_aij_beanstalk = { 
                name = "Бобовый Стебель", 
                text = { 
                    "{C:attention}Валеты{} {C:attention}не могут{} быть {C:red}ослаблены",
                    "и {C:attention}всегда{} набирают очки" 
                } 
            },
            j_aij_phoney_baloney = { 
                name = "Фальшивая Болтовня", 
                text = { 
                    "Все {C:attention}лицевые карты{}",
                    "считаются {C:attention}Валетами"
                } 
            },
            j_aij_jerko = { 
                name = "Джерко", 
                text = { 
                    '{C:mult}+#1#{} Множителя. Перезапускает',
                    'каждую карту в руке {C:attention}#2#{}',
                    'раз, но карты {C:red}уничтожаются{}',
                    'после набора очков'
                } 
            },
            j_aij_design_document = { 
                name = "Документ Дизайна", 
                text = { 
                    "Зарабатывает {C:money}$#1#{} когда любая",
                    "{C:green}вероятность{} проваливается"
                } 
            },
            j_aij_animatronic = { 
                name = "Аниматроник", 
                text = {
                    "{C:attention}+#1#{} к размеру руки за каждую",
                    "последовательную руку, содержащую {C:attention}Стрит{}",
                    "{C:inactive}(Сейчас {C:attention}+#2#{C:inactive} к размеру руки)",
                    "{C:inactive}(Максимум {C:attention}+#3#{C:inactive})"
                } 
            },
            j_aij_arecibo_message = { 
                name = "Послание Аресибо", 
                text = { 
                    "В конце Анты получает",
                    "{X:mult,C:white}X#1#{} Множителя за каждую",
                    "уникальную масть, сыгранную в этой Анте"
                } 
            },
            j_aij_napkin = { 
                name = "Салфетка", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#1#{}",
                    "Множителя, когда {C:attention}2{} блайнда",
                    "пропущены {C:attention}подряд",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множитель)",
                }
            },
            j_aij_lost_carcosa = { 
                name = "Потерянная Каркоза", 
                text = { 
                    "Рандомизирует {C:chips}Фишки{} и {C:mult}Множитель{}",
                    "использованных {C:planet}Планет{} карт",
                    "от {C:attention}#1#%{} до {C:attention}#2#%{}",
                    "от их исходных значений"
                } 
            },
            j_aij_magic_mirror = { 
                name = "Волшебное Зеркало", 
                text = { 
                    "Применяет {C:dark_edition}Негативное{} к первой",
                    "набравшей очки {C:attention}лицевой{} карте в этой {C:attention}Анте",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_postcard_from_perdition_trail = { 
                name = "Открытка с Тропы Погибели", 
                text = { 
                    "Когда вы {C:red}проигрываете{} блайнд,",
                    "создаёт случайного {C:attention}Джокера{}",
                    "той же редкости, что и последний",
                    "проданный джокер"
                } 
            },
            j_aij_mr_lonely = {
                name = "Мистер Одиночество",
                text = {
                    "Этот джокер получает {C:chips}+#1#{} Фишек",
                    "за каждый пустой {C:attention}слот джокера{}",
                    "в конце {C:attention}раунда{}",
                    "{C:inactive}(Сейчас{} {C:chips}+#2#{C:inactive} Фишек)"
                },
            },
            j_aij_spiders_georg = { 
                name = "Паук Джордж", 
                text = { 
                    "Умножает {C:mult}Множитель{} на {C:attention}#2#{} плюс",
                    "{C:attention}среднее{} количество {C:attention}8{},",
                    "{C:attention}набранных{} за руку в этой игре",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множитель)",
                } 
            },
            j_aij_gille = { 
                name = "Гилле", 
                text = { 
                    "Все {C:attention}Тузы{} считаются",
                    "{C:attention}единицами{} для составления",
                    "{C:attention}Стритов{}"
                } 
            },
            j_aij_fulehung = { 
                name = "Фулехунг", 
                text = { 
                    "Когда {C:attention}Блайнд{} выбран,",
                    "с шансом {C:green}#1# из #2#{} получает",
                    "его {C:attention}Тег пропуска{}" 
                } 
            },
            j_aij_bearded_joker = { 
                name = "Бородатый Джокер", 
                text = { 
                    "{C:mult}+#1#{} Множителя за каждую {C:attention}Улучшенную{}",
                    "карту в вашей {C:attention}полной колоде",
                    "{C:inactive}(Сейчас {C:mult}+#2#{} {C:inactive}Множитель)"
                } 
            },
            j_aij_skomorokh = { 
                name = "Скоморох", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#1#{} Множителя", 
                    "за каждую {C:attention}Изданную{} карту в вашей",
                    "{C:attention}полной колоде",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{} {C:inactive}Множитель)"
                } 
            },
            j_aij_silly_billy = { 
                name = "Глупый Билли", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "повышает уровень случайной",
                    "покерной комбинации на #1#"
                } 
            },
            j_aij_ijoker_co = { 
                name = "iJoker.co", 
                text = { 
                    "{C:attention}#1#{} случайных {C:attention}Тегов{} доступны",
                    "для покупки в каждом {C:money}магазине" 
                } 
            },
            j_aij_corpse_paint = { 
                name = "Трупный Грим", 
                text = { 
                    "Удаляет {C:dark_edition}Негативное{} с",
                    "набравших очки карт. За каждую",
                    "с шансом {C:green}#1# из #2#{} этот джокер",
                    "получает {C:attention}+#3#{} к размеру руки",
                    "{C:inactive}(Сейчас {C:attention}+#4#{C:inactive} к размеру руки)"
                } 
            },
            j_aij_toothy_joker = { 
                name = "Зубастый Джокер", 
                text = { 
                    "{C:chips}+#1#{} Фишек за каждую {C:tarot}Таро{}",
                    "карту, использованную в этой {C:attention}Анте",
                    "{C:inactive}(Сейчас{} {C:chips}+#2#{C:inactive} Фишек)"
                } 
            },
            j_aij_mondrian_joker = {
                name = "Джокер Мондриана",
                text = {
                    "{C:mult}+#1#{} Множителя за каждую {C:attention}4",
                    "в вашей {C:attention}полной колоде",
                    "{C:inactive}(Сейчас{} {C:mult}+#2#{}{C:inactive} Множитель)"
                },
            },
            j_aij_orphic_joker = {
                name = "Орфический Джокер",
                text = {
                    "Создаёт {C:attention}#1#{} случайных",
                    "{C:uncommon}Необычных{} {C:attention}Джокеров{} при",
                    "{C:attention}пропуске{} блайнда",
                    "{C:inactive}(Должно быть место){}"
                },
            },
            j_aij_the_artist = { 
                name = "Художник", 
                text = { 
                    "{C:attention}+#1#{} к лимиту выбора для",
                    "{C:tarot}Таро{} Карт" 
                } 
            },
            j_aij_toynbee_joker = { 
                name = "Джокер Тойнби", 
                text = { 
                    "Когда вы используете {C:spectral}Спектральную{}",
                    "карту, применяет её эффект",
                    "к {C:attention}случайной{} карте в колоде"
                } 
            },
            j_aij_aluzinnu = {
                name = "Алузинну",
                text = {
                    "Ваучеры {C:attention}Иероглиф{} и {C:attention}Петроглиф{}",
                    "не имеют {C:red}недостатков{} и",
                    "могут появляться {C:attention}несколько{} раз"
                }
            },
            j_aij_great_kraken = { 
                name = "Великий Кракен", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множителя за каждую",
                    "{C:blue}руку{} в запасе",
                    "{C:inactive}(Даст {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
                    "{C:inactive}(Минимум {X:mult,C:white}X1{C:inactive} Множитель)"
                } 
            },
            j_aij_truhan = { 
                name = "Трухан", 
                text = { 
                    "Когда любой джокер {C:money}продан{} или",
                    "{C:red}уничтожен{}, этот джокер получает {X:mult,C:white}X#2#{}",
                    "Множителя за каждый {C:attention}раунд{}, который тот джокер",
                    "был удержан",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множитель)"
                } 
            },
            j_aij_chippy = { 
                name = "Чиппи", 
                text = { 
                    "Этот джокер получает {C:chips}Фишки{}",
                    "равные потраченным {C:money}деньгам{}",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)",
                } 
            },
            j_aij_hofnarr_the_barbarian = {
                name = "Хофнарр Варвар",
                text = {
                    "{C:mult}+#1#{} Множителя",
                    "На {C:attention}Финальных Босс-блайндах{} {C:attention}отключает{}",
                    "их и даёт {X:mult,C:white}X#2#{} Множителя"
                },
            },
            j_aij_histrio = { 
                name = "Гистрион", 
                text = { 
                    "Зарабатывает на {C:money}$#1#{} больше",
                    "за каждую {C:attention}неиспользованную руку{}",
                    "в конце раунда"
                } 
            },
            j_aij_loregg = { 
                name = "Лорегг", 
                text = { 
                    "Когда вы {C:money}продаёте{} {C:attention}Джокера{},",
                    "добавляет его {C:money}цену продажи{}",
                    "к этому джокеру как {C:chips}Фишки{}"
                } 
            },
            j_aij_egg_cc = {
                name = "\"egg\"",
                text = {
                    "Этот джокер получает {C:chips}+#2#{} Фишек",
                    "и {C:money}$#3#{} {C:attention}цены продажи{}",
                    "в конце раунда",
                    "{C:inactive}(Сейчас {C:chips}+#1#{C:inactive} Фишек)",
                    "{C:inactive}хей, это \"egg\""
                },
            },
            j_aij_sot = { 
                name = "Сот", 
                text = { 
                    "Получает {X:mult,C:white}X#1#{} Множителя за",
                    "каждый {C:attention}Тег{} в наличии",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{} {C:inactive}Множитель)"
                } 
            },
            j_aij_fat_ed = { 
                name = "Толстый Эд", 
                text = { 
                    "Все {C:attention}Вечные{} джокеры",
                    "получают {C:dark_edition}Серебро{}",
                    "при покупке"
                } 
            },
            j_aij_stained_glass_joker = {
                name = "Джокер Витража",
                text = {
                    "{C:attention}Стеклянные карты{} считаются",
                    "любой {C:attention}мастью{}",
                },
            },
            j_aij_mushroom_cloud = { 
                name = "Грибное Облако", 
                text = { 
                    "Когда карта {C:red}уничтожена{},",
                    "с шансом {C:green}#1# из #2#{} добавляет",
                    "{C:dark_edition}Полихром{} к случайной карте"
                } 
            },
            j_aij_overdesigned_joker = {
                name = "Переусложнённый Джокер",
                text = {
                    {
                        "Сыгранные {V:1}#1#{} #3# {B:3,V:2}#4##2##5#",
                    },
                    {
                        "Масть и эффект {C:attention}вращаются{}",
                        "когда карта {C:attention}набирает очки",
                        "{C:inactive}({V:4}Черви{C:inactive}->{V:5}Трефы{C:inactive}->{V:6}Бубны{C:inactive}->{V:7}Пики{C:inactive}){}"
                    }
                }
            },
            j_aij_morio = {
                name = "Морио",
                text = {
                    "Когда {C:attention}Босс-блайнд{}",
                    "побеждён, выбирает {C:attention}любую{}",
                    "{C:tarot}Таро{} карту для создания",
                    "{C:inactive}(Должно быть место)"
                }
            },
            j_aij_visage = { 
                name = "Личина", 
                text = { 
                    "Копирует эффект",
                    "последнего {C:money}проданного{} джокера" 
                } 
            },
            j_aij_goofball = { 
                name = "Чокнутый", 
                text = { 
                    "Сыгранные {C:attention}лицевые{} карты {C:aij_plasma}балансируют{}",
                    "{C:attention}#1#%{} {C:chips}Фишек{} и {C:mult}Множителя{}"
                } 
            },
            j_aij_heyokha = { 
                name = "Хейока", 
                text = { 
                    "Когда вы {C:red}проигрываете{} блайнд,",
                    "получаете {X:mult,C:white}X#1#{} Множителя",
                    "до конца Анты"
                } 
            },
            j_aij_casual_absent_paranoia = { 
                name = "Случайная Отсутствующая Паранойя", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#1#{} Множителя",
                    "когда вы пропускаете блайнд"
                } 
            },
            j_aij_mandrake = { 
                name = "Мандрагора", 
                text = { 
                    "Через {C:attention}#2#{} раунда {C:money}продаёт{}",
                    "этого джокера, чтобы {C:red}уничтожить{}",
                    "все карты {C:attention}в руке",
                    "{C:inactive}(Сейчас {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_jester_zombie = { 
                name = "Джокер-Зомби", 
                text = { 
                    "Перезапускает все {C:attention}набравшие очки{} карты,",
                    "если {C:attention}игровая карта{} была",
                    "{C:red}уничтожена{} в этом блайнде",
                    "{C:inactive}#1#{}"
                } 
            },
            j_aij_richie_rich = { 
                name = "Богач Ричи", 
                text = { 
                    "Если у вас {C:money}$#1#{} или больше,",
                    "даёт {X:mult,C:white}X#2#{} Множителя"
                } 
            },
            j_aij_devil_deal = { 
                name = "Дьявольская Сделка", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#1#{}",
                    "Множителя, когда {C:hearts}Черва{}",
                    "{C:attention}уничтожена",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
                } 
            },
            j_aij_totally_nuts = { 
                name = "Совершенно Безумный", 
                text = { 
                    "{C:attention}+#1#{} Слотов для расходников,",
                    "{C:attention}расходуются{}, когда",
                    "{C:attention}расходник{} {C:money}продан" 
                } 
            },
            j_aij_warhol = { 
                name = "Уорхол", 
                text = { 
                    "Все карты в {C:attention}Обычных паках{}",
                    "имеют случайное {C:dark_edition}Издание{}"
                } 
            },
            j_aij_mistake = {
                name = "Ошибка",
                text = {
                    "{C:attention}Вечных{} джокеров",
                    "можно {C:attention}продавать{}",
                }
            },
            j_aij_depth_of_delusion = { 
                name = "Глубина Заблуждения", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "создаётся {C:attention}Тег{}-копия",
                    "каждого {C:attention}Тега{} в этом пропуске"
                } 
            },
            j_aij_curse_of_scotland = { 
                name = "Проклятие Шотландии", 
                text = { 
                    "Все {C:attention}9{} считаются",
                    "{C:attention}лицевыми{} картами"
                } 
            },
            j_aij_banana_man = { 
                name = "Банановый Человек", 
                text = { 
                    {
                        "{C:attention}Перезапускает{} всех",
                        "остальных джокеров",
                    },
                    {
                        "У каждого джокера есть шанс {C:green}#1# из #2#{}",
                        "быть {C:red}уничтоженным{}",
                        "после каждой руки"
                    }
                } 
            },
            j_aij_corny_joker = { 
                name = "Пошлый Джокер", 
                text = { 
                    "Все карты считаются",
                    "{C:attention}улучшенными{} картами"
                } 
            },
            j_aij_entropy = { 
                name = "Энтропия", 
                text = { 
                    "Создаёт {C:attention}Тег Хаоса{}",
                    "когда блайнд {C:attention}пропущен"
                } 
            },
            j_aij_urchin = { 
                name = "Беспризорник", 
                text = { 
                    "Зарабатывает {C:money}$#2#{} в конце",
                    "раунда за каждый {C:attention}Блайнд{},",
                    "пропущенный в этой игре",
                    "{C:inactive}(Сейчас {C:money}$#1#{}{C:inactive}){}"
                } 
            },
            j_aij_machine_intelligence = { 
                name = "Машинный Интеллект", 
                text = { 
                    "Каждая {C:attention}Цифровая карта{}",
                    "даёт {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_grandma = { 
                name = "Бабушка", 
                text = { 
                    "В конце раунда добавляет",
                    "случайную {C:tarot}Таро{} карту",
                    "в расходники"
                } 
            },
            j_aij_funny_money = { 
                name = "Шуточные Деньги", 
                text = { 
                    "Зарабатывает {C:money}$#1#{} при",
                    "{C:attention}пропуске{} блайнда"
                } 
            },
            j_aij_witchfinder = { 
                name = "Ищейка Ведьм", 
                text = { 
                    "{C:attention}#1#{} дополнительный {C:tarot}Пака Арканы{}",
                    "доступен в {C:money}Магазине"
                } 
            },
            j_aij_trophy_kill = { 
                name = "Трофейное Убийство", 
                text = { 
                    "Когда {C:attention}Босс-блайнд{} побеждён,",
                    "получает {X:mult,C:white}X#1#{} Множителя",
                    "за каждого побеждённого босса"
                } 
            },
            j_aij_tract = { 
                name = "Трактат", 
                text = { 
                    "{C:chips}+#1#{} Фишек за каждый",
                    "{C:attention}Ваучер{} в наличии",
                    "{C:inactive}(Сейчас {C:chips}+#2#{} {C:inactive}Фишек){}"
                } 
            },
            j_aij_stock_broker = { 
                name = "Биржевой Брокер", 
                text = { 
                    "Умножает {C:money}проценты{} на",
                    "случайное число между",
                    "{C:attention}X#1#{} и {C:attention}X#2#" 
                } 
            },
            j_aij_omlette = { 
                name = "Омлет", 
                text = { 
                    "Получает {C:money}$#1#{} цены продажи, когда",
                    "{C:blue}рука{} или {C:red}сброс{} использованы",
                } 
            },
            j_aij_stave = { 
                name = "Посох", 
                text = { 
                    "Если у вас нет {C:attention}Негативных{}",
                    "джокеров, даёт {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_sunny_side = { 
                name = "Светлая Сторона", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "зарабатываете {C:money}$#1#{} за каждый",
                    "предыдущий пропуск в этой Анте"
                } 
            },
            j_aij_omelette = { 
                name = "Омлет", 
                text = { 
                    "{C:attention}Курицы{} не исчезают и",
                    "дают {C:mult}+#1#{} Множителя за каждую"
                } 
            },
            j_aij_theyre_looking_at_you = { 
                name = "Они Смотрят на Тебя...", 
                text = { 
                    "Все {C:attention}лицевые карты{} дают",
                    "{X:mult,C:white}X#1#{} Множителя, но",
                    "имеют шанс {C:green}#2# из #3#{}",
                    "быть {C:red}уничтоженными{} после набора очков"
                } 
            },
            j_aij_comedy_of_errors = { 
                name = "Комедия Ошибок", 
                text = { 
                    "Зарабатывает {C:money}$#1#{} всякий раз, когда",
                    "{C:hearts}Черва{} {C:red}сброшена",
                } 
            },
            j_aij_fuzzy_joker = { 
                name = "Нечёткий Джокер",
                text = { 
                    "Округляет {C:mult}Множитель{} до",
                    "следующей степени {C:attention}#1#{}" 
                } 
            },
            j_aij_saucy_jacky = { 
                name = "Дерзкая Джеки", 
                text = { 
                    "Если в разыгранной руке",
                    "есть {C:attention}Валет{}, все карты",
                    "считаются {C:attention}Валетами{}"
                } 
            },
            j_aij_funny_phone = { 
                name = "Смешной Телефон", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "создаётся случайный {C:attention}Тег{}",
                    "из тех, что были в этом пропуске"
                } 
            },
            j_aij_taggart = { 
                name = "Таггарт", 
                text = { 
                    "Создаёт {C:attention}#1# копию{}",
                    "каждого полученного {C:attention}Тега{}",
                    "{C:inactive}(Кроме Двойного Тега)"
                } 
            },
            j_aij_chitty = { 
                name = "Читти", 
                text = { 
                    "{C:attention}+#1#{} {C:attention}Ваучер{} доступен",
                    "для покупки в {C:attention}Магазине" 
                } 
            },
            j_aij_whatsisname = { 
                name = "Как-его-там", 
                text = { 
                    "Паки {C:attention}Угадай Шутку{}",
                    "встречаются чаще"
                } 
            },
            j_aij_downing_street = { 
                name = "Даунинг-стрит", 
                text = { 
                    "Набирающие очки {C:attention}10{} с шансом {C:green}#1# из #2#{}",
                    "создают случайный {C:attention}Тег{}"
                } 
            },
            j_aij_one_little_duck = { 
                name = "Один Маленький Утёнок", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} {C:attention}2{},",
                    "создаётся её копия в руке"
                } 
            },
            j_aij_four_leaf_clover = { 
                name = "Четырёхлистный Клевер", 
                text = { 
                    "Все {C:green}вероятности{}",
                    "увеличиваются на {C:attention}+#1#%{}"
                } 
            },
            j_aij_aphantasia = { 
                name = "Афантазия", 
                text = { 
                    "Все сыгранные {C:attention}улучшенные{} карты",
                    "становятся {C:red}Хаотичными{}" 
                } 
            },
            j_aij_tabula_rasa = { 
                name = "Tabula Rasa", 
                text = { 
                    "Когда {C:attention}Блайнд{} выбран,",
                    "{C:dark_edition}Издание{} этого джокера удаляется",
                    "и его эффекты становятся {C:jest_inherent}неотъемлемыми" 
                } 
            },
            j_aij_vitruvian_joker = {
                name = "Витрувианский Клоун",
                text = {
                    "{X:mult,C:white}X#1#{} Множитель, если ровно {C:attention}5{}",
                    "джокеров в наличии"
                }
            },
            j_aij_american_comic = { 
                name = "Американский Комикс", 
                text = { 
                    "Все {C:attention}лицевые карты{}",
                    "считаются {C:attention}супергероями{}",
                    "и дают {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_from_the_top_rope = { 
                name = "С Верхней Верёвки", 
                text = { 
                    "Если вы победили блайнд",
                    "с {C:attention}удвоенными{} очками,",
                    "создаётся случайный {C:attention}Тег{}"
                } 
            },
            j_aij_fortune_cookie = { 
                name = "Печенье Судьбы", 
                text = { 
                    "Создаёт случайную {C:tarot}Таро{}",
                    "карту, когда любой {C:attention}Бустер-пак{}",
                    "открыт, расходуется через {C:attention}#1#{} паков",
                    "{C:inactive}(Должно быть место){}",
                } 
            },
            j_aij_tilty_joker = { 
                name = "Наклонный Джокер", 
                text = { 
                    "{C:attention}Набирающие очки{} карты дают {C:attention}X#1#{}",
                    "своих базовых {C:chips}Фишек" 
                } 
            },
            j_aij_opening_move = { 
                name = "Начальный Ход", 
                text = { 
                    {
                        "Получает {X:mult,C:white}X#1#{} Множителя{} в этом раунде",
                        "за каждую карту, {C:attention}набравшую очки{} в",
                        "{C:attention}первой руке{} раунда",
                        "{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множитель)",
                    },
                    {
                        "{C:attention}Первая рука{} каждого раунда",
                        "{C:red}не{} добавляется к вашему счёту",
                    },
                } 
            },
            j_aij_bartender = { 
                name = "Бармен", 
                text = { 
                    "{C:attention}Расходные{} карты могут быть",
                    "{C:dark_edition}Фольга{}, {C:dark_edition}Голографическими{} или",
                    "{C:dark_edition}Полихромными{}" 
                } 
            },
            j_aij_mahoney = { 
                name = "Махони", 
                text = { 
                    "С шансом {C:green}#1# из #2#{}",
                    "создаёт {C:attention}Тег Ваучера{}",
                    "когда блайнд {C:attention}пропущен",
                } 
            },
            j_aij_le_fils_de_banane = { 
                name = "Le fils de Banane", 
                text = { 
                    "Сыгранные {C:attention}лицевые{} карты дают {C:mult}+#3#",
                    "Множителя, но с шансом {C:green}#1# из #2#{}",
                    "{C:red}уничтожить{} себя" 
                } 
            },
            j_aij_pygmalion = { 
                name = "Пигмалион", 
                text = { 
                    "Все {C:attention}Каменные{} карты считаются",
                    "{C:attention}Дамами{}",
                } 
            },
            j_aij_grue = { 
                name = "Грю", 
                text = { 
                    "Все {C:attention}Тузы{} и {C:attention}Валеты{}",
                    "считаются {C:attention}одним рангом{}"
                } 
            },
            j_aij_heavy_sixer = { 
                name = "Тяжёлая Шестёрка", 
                text = { 
                    "Если в разыгранной руке",
                    "есть {C:attention}6{}, все карты",
                    "считаются {C:attention}6{}"
                } 
            },
            j_aij_tetrominoker = { 
                name = "Тетромиокер", 
                text = { 
                    "Набирающие очки {C:attention}4{} с шансом {C:green}#1# из #2#{}",
                    "создают {C:attention}копию{} себя" 
                } 
            },
            j_aij_mr_catfish = { 
                name = "Мистер Сом", 
                text = { 
                    "Зарабатывает {C:money}$#1#{} каждые {C:attention}#2#{C:inactive} [#3#]{}",
                    "сброшенных карт"
                } 
            },
            j_aij_angel_number = { 
                name = "Число Ангела", 
                text = { 
                    "{C:attention}+#1#{} ко всем {C:green}указанным",
                    "{C:green}вероятностям{} за каждую",
                    "набравшую очки {C:attention}7{} в этой руке",
                } 
            },
            j_aij_doctors_orders = { 
                name = "Врачебные Предписания", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множителя за каждую {C:attention}9{} в разыгранной",
                    "руке, {C:red}самоуничтожается{}, если {C:attention}9{}",
                    "не было сыграно"
                } 
            },
            j_aij_blue_eyes_white_joker = { 
                name = "Синеглазый Белый Джокер", 
                text = { 
                    "Если {C:attention}последняя рука{} раунда",
                    "состоит ровно из {C:attention}1{} карты,",
                    "она навсегда получает",
                    "{C:attention}+#1#{} перезапуска"
                } 
            },
            j_aij_lucina = { 
                name = "Ликующий Шут", 
                text = { 
                    "Когда блайнд {C:attention}выбран{},",
                    "{C:red}уничтожает{} джокера {C:attention}слева",
                    "и применяет случайное {C:dark_edition}Издание{}",
                    "к джокеру {C:attention}справа",
                } 
            },
            j_aij_circuit_diagram = { 
                name = "Принципиальная Схема", 
                text = { 
                    "{C:attention}Заряженные{} карты всегда",
                    "перемещаются наверх колоды",
                } 
            },
            j_aij_paracosm = { 
                name = "Паракосм", 
                text = { 
                    "Повышает уровень",
                    "самой разыгрываемой {C:attention}покерной комбинации{}",
                    "когда {C:attention}Блайнд{} пропущен",
                    "{C:inactive}(Сейчас #1#)"
                } 
            },
            j_aij_mocap = { 
                name = "Мокап", 
                text = { 
                    {
                        "Когда {C:legendary}Легендарный{}, {C:rare}Редкий{}",
                        "или {C:uncommon}Необычный{} джокер {C:money}продан{},",
                        "создаёт {C:attention}случайного{} джокера",
                        "следующей меньшей редкости"
                    }, 
                    {
                        "{C:legendary}Легендарный{} -> {C:rare}Редкий{}",
                        "{C:rare}Редкий{} -> {C:uncommon}Необычный{}",
                        "{C:uncommon}Необычный{} -> {C:common}Обычный{}"
                    }
                } 
            },
            j_aij_stagehand = { 
                name = "Рабочий Сцены", 
                text = { 
                    "Получает {X:mult,C:white}X#1#{} Множителя",
                    'за каждого {C:attention}Джокера{} в наличии',
                    '{C:inactive}(Сейчас {X:mult,C:white}X#2#{C:inactive} Множитель)'
                } 
            },
            j_aij_the_mermaid = { 
                name = "Русалка", 
                text = { 
                    "Все {C:attention}Дамы{} считаются",
                    "{C:attention}Тузами{} для {C:attention}Флешей{}"
                } 
            },
            j_aij_colour_test = { 
                name = "Тест Цвета", 
                text = { 
                    "Применяет {C:attention}Полихром{} к первой",
                    "набравшей очки карте на {C:attention}последней",
                    "{C:attention}руке{} раунда"
                } 
            },
            j_aij_test_card = { 
                name = "Тестовая Карта", 
                text = { 
                    "{C:attention}Издания{} карт, оставшихся в руке,",
                    "запускают свои эффекты"
                } 
            },
            j_aij_interstate = { 
                name = "Межштатная", 
                text = { 
                    "{C:blue}+#1#{} Рук в этом раунде, если",
                    "{C:attention}первая{} рука раунда",
                    "содержит {C:attention}Стрит{}"
                } 
            },
            j_aij_bowls_of_joy = { 
                name = "Чаши Радости", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} карту,",
                    "с шансом {C:green}#1# из #2#{} создаёт",
                    "копию случайной карты в руке"
                } 
            },
            j_aij_chips_n_dip = {
                name = "Чипсы с Соусом",
                text = {
                    "{X:chips,C:white}X#1#{} Фишек, теряет {X:chips,C:white}X#2#{} Фишек",
                    "в конце {C:attention}раунда"
                }
            },
            j_aij_homemade_comic = { 
                name = "Самодельный Комикс", 
                text = { 
                    "Набравшие очки {C:attention}Заряженные Карты{}",
                    "дают {X:mult,C:white}X#1#{} Множителя",
                } 
            },
            j_aij_gematria = { 
                name = "Гематрия", 
                text = { 
                    "Добавляет {C:mult}Множитель{} равный",
                    "{C:attention}сумме{} рангов всех",
                    "карт в разыгранной руке",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множитель)"
                } 
            },
            j_aij_bingo_card = { 
                name = "Карта Бинго", 
                text = { 
                    "Набравшие очки {C:attention}Счастливые Карты{} имеют",
                    "шанс {C:green}#1# из #2#{} на {X:mult,C:white}X#5#{} Множителя",
                    "и шанс {C:green}#3# из #4#{} на {C:attention}перезапуск"
                } 
            },
            j_aij_fish_fingers = { 
                name = "Рыбные Пальчики", 
                text = { 
                    "{C:blue}+#1#{} Рук в раунде,",
                    "теряет {C:blue}-#2#{} Руки, когда блайнд",
                    "{C:attention}пройден"
                } 
            },
            j_aij_joker_png = { 
                name = "Joker.png", 
                text = { 
                    {
                    '{B:1,C:white,s:0.8}Активируемая Способность',
                    'Этот джокер {C:attention}копирует{}',
                    '{C:attention}эффект{} случайного {C:attention}Джокера',
                    },
                    {
                    'Платит {C:money}$#1#{} за переролл, увеличивается',
                    'на {C:money}$#1#{} за каждый переролл в этой анте'
                    }
                } 
            },
            j_aij_kuruko = { 
                name = "Куруко", 
                text = { 
                    "Все {C:attention}Тузы{} считаются",
                    "{C:attention}Королями{}, {C:attention}Дамами{}",
                    "и {C:attention}Валетами{}"
                } 
            },
            j_aij_candy_floss = { 
                name = "Сахарная Вата", 
                text = { 
                    "{C:aij_plasma}Балансирует{} {C:attention}#1#%{} {C:chips}Фишек{}",
                    "и {C:mult}Множителя{}, уменьшается",
                    "на {C:attention}#2#%{} в конце раунда"
                } 
            },
            j_aij_stargazy_pie = { 
                name = "Звёздный Пирог", 
                text = { 
                    "Перезапускает следующие {C:attention}#1#{}",
                    "{C:planet}Планет{} карты"
                } 
            },
            j_aij_electric_snow = { 
                name = "Электрический Снег", 
                text = { 
                    "Раунд заканчивается только {C:attention}после{}",
                    "{C:attention}последней руки{} раунда" 
                } 
            },
            j_aij_gameshow = { 
                name = "Игровое Шоу", 
                text = { 
                    {
                        "С шансом {C:green}#1# из #2#{} добавляет",
                        "{C:dark_edition}Фольгу{}, {C:dark_edition}Голографическую{} или",
                        "{C:dark_edition}Полихромную{}",
                        "к случайному {C:attention}Джокеру{}",
                        "когда {C:attention}блайнд{} выбран",
                    },
                    { 
                        "{C:money}-$#3#{} при срабатывании",
                        "независимо от результата"
                    } ,
                },
            },
            j_aij_bonus_pay = { 
                name = "Бонусная Оплата", 
                text = { 
                    "Зарабатывает {C:money}$#1#{} когда",
                    "{C:attention}Бонусная карта{} набирает очки"
                } 
            },
            j_aij_illuminated_joker = { 
                name = "Освещённый Джокер", 
                text = { 
                    "{C:money}Золотые{} Теги {C:attention}более{} вероятны"
                } 
            },
            j_aij_magazine_ad = { 
                name = "Реклама в Журнале", 
                text = { 
                    "Все {C:attention}Теги{} в пропусках",
                    "удваиваются"
                } 
            },
            j_aij_bonus_bob = { 
                name = "Бонусный Боб", 
                text = { 
                    "{C:attention}Бонусные карты{} дают",
                    "{X:chips,C:white}X#1#{} Фишек при наборе очков"
                } 
            },
            j_aij_bonus_round = { 
                name = "Бонусный Раунд", 
                text = { 
                    "{C:attention}Перезапускает{} все",
                    "набравшие очки {C:attention}Бонусные карты{}",
            } 
            },
            j_aij_jack_o_lantern = { 
                name = "Светильник Джека", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} {C:attention}лицевую{} карту,",
                    "создаёт копию случайной",
                    "карты в руке"
                } 
            },
            j_aij_astrologer = { 
                name = "Астролог", 
                text = { 
                    {
                        "{C:attention}+#1#{} выбор в {C:planet}Небесных паках" 
                    },
                    {
                        "{C:planet}Планеты{} заменяются",
                        "на {C:mult}Множительные{} варианты в {C:attention}нечётных",
                        "антах и на {C:chips}Фишечные{}",
                        "варианты в {C:attention}чётных{} антах"
                    },
                } 
            },
            j_aij_planetarium = { 
                name = "Планетарий", 
                text = { 
                    {
                        "{C:chips}Фишечные{}-типа {C:planet}Планеты{} в",
                        "вашей {C:attention}области расходников{} дают",
                        "{C:chips}+#1#{} Фишек для своей",
                        "указанной {C:attention}покерной комбинации" 
                    },
                    {
                        "{C:mult}Множительные{}-типа {C:planet}Планеты{} в",
                        "вашей {C:attention}области расходников{} дают",
                        "{C:mult}+#2#{} Множителя для своей",
                        "указанной {C:attention}покерной комбинации" 
                    },
                } 
            },
            j_aij_negative_space = { 
                name = "Негативное Пространство", 
                text = { 
                    "{C:attention}+#1#{} к Размеру руки за каждого",
                    "{C:dark_edition}Негативного{} джокера",
                    "{C:inactive}(Сейчас {C:attention}+#2#{} {C:inactive}Размер руки)",
                    "{C:inactive}(Максимум {C:attention}+#3#{}{C:inactive})"
                } 
            },
            j_aij_stargazer = { 
                name = "Звездочёт", 
                text = { 
                    "В начале раунда получает",
                    "случайную {C:planet}Планету{} для",
                    "вашей самой разыгрываемой комбинации"
                } 
            },
            j_aij_skald = { 
                name = "Скальд", 
                text = { 
                    "Когда вы используете {C:planet}Планету{},",
                    "с шансом {C:green}#1# из #2#{} создаёт",
                    "копию использованной карты"
                } 
            },
            j_aij_sky_trees = { 
                name = "Небесные Деревья", 
                text = { 
                    "{C:attention}Синие печати{} дают {C:mult}Множительные{}",
                    "и {C:chips}Фишечные{} {C:planet}Планеты{} вместо",
                    "{C:attention}базовых{}-типа {C:planet}Планет{}" 
                } 
            },
            j_aij_the_freezer = { 
                name = "Морозильник", 
                text = { 
                    "Все карты, {C:attention}замороженные{} в руке,",
                    "не могут быть {C:red}сброшены{} или",
                    "сыграны, но дают {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_twisted_pair = { 
                name = "Витая Пара", 
                text = { 
                    "Если рука — {C:attention}Пара{}, каждая карта",
                    "получает {C:attention}лоскут{} масти,",
                    "соответствующий масти {C:attention}другой карты" 
                } 
            },
            j_aij_the_grim_joker = { 
                name = "Мрачный Джокер", 
                text = { 
                    "{C:attention}Расходники{}, созданные",
                    "{C:planet}Синими{} или {C:tarot}Фиолетовыми{} печатями,",
                    "с шансом {C:green}#1# из #2#{}",
                    "{C:dark_edition}Негативны" 
                } 
            },
            j_aij_lexicon = { 
                name = "Лексикон", 
                text = { 
                    "Добавляет {C:mult}Множитель{} равный",
                    "{C:attention}сумме{} всех цифр в",
                    "{C:attention}описаниях способностей{}",
                    "всех других {C:attention}Джокеров{}",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множитель)"
                } 
            },
            j_aij_dendroglpyh = { 
                name = "Дендроглиф", 
                text = { 
                    "Все {C:attention}Деревянные карты{} дают",
                    "{C:mult}+#1#{} Множителя, когда",
                    "набирают очки"
                } 
            },
            j_aij_prank_caller = { 
                name = "Шутник", 
                text = { 
                    "Когда вы {C:money}покупаете{} {C:attention}Ваучер{},",
                    "создаётся случайный {C:attention}Тег{}"
                } 
            },
            j_aij_arngren = { 
                name = "Арнгрен", 
                text = { 
                    "{C:attention}+#1#{} Слот карты, {C:attention}+#1#{} Слот бустера",
                    "и {C:attention}+#1#{} Слот ваучера",
                    "в {C:money}магазине"
                } 
            },
            j_aij_blacklist = { 
                name = "Чёрный Список", 
                text = { 
                    "{C:money}Проданные{} джокеры больше",
                    "не могут появляться снова",
                    "Сейчас в Чёрном списке:",
                } 
            },
            j_aij_croupier = { 
                name = "Крупье", 
                text = { 
                    "Зарабатывает {C:money}$#1#{}, если итоговый счёт",
                    "более чем в {C:attention}два{} раза превышает",
                    "требование блайнда" 
                } 
            },
            j_aij_the_lucovico_technique = { 
                name = "Техника Лудовико", 
                text = { 
                    "Когда вы играете руку,",
                    "вы должны сыграть её снова",
                    "с удвоенным требованием"
                } 
            },
            j_aij_headstone = { 
                name = "Надгробие", 
                text = { 
                    "Все {C:attention}Лицевые карты{} перемещаются",
                    "на {C:red}дно{} вашей колоды" 
                } 
            },
            j_aij_full_monty = { 
                name = "Полный Монти", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} руку,",
                    "все карты в руке",
                    "получают случайную печать"
                } 
            },
            j_aij_chef = { 
                name = "Шеф-повар", 
                text = {
                    {
                        "Обычные {C:attention}Скоропортящиеся{}",
                        "джокеры становятся {C:dark_edition}Негативными",
                    },
                    {
                        "{C:attention}Издания{} на {C:attention}Скоропортящихся",
                        "джокерах больше не имеют",
                        "наценки в {C:money}магазине" 
                    }
                } 
            },
            j_aij_screamer = { 
                name = "Крикун", 
                text = { 
                    "Все {C:attention}Карты со льдом{}",
                    "имеют {C:green}удвоенный{} шанс",
                    "на {C:green}вероятности{}"
                } 
            },
            j_aij_evil_twin = { 
                name = "Злой Близнец", 
                text = { 
                    "Копирует эффект",
                    "случайного другого джокера",
                    "в начале раунда"
                } 
            },
            j_aij_cubic_joker = { 
                name = "Кубический Джокер", 
                text = { 
                    "Если вы сыграли",
                    "{C:attention}#1#{} руки в этом раунде,",
                    "следующая рука получает {X:mult,C:white}X#2#{} Множителя"
                } 
            },
            j_aij_remina = { 
                name = "Ремина", 
                text = { 
                    "Когда выбран {C:attention}Малый блайнд{} или {C:attention}Большой блайнд{},",
                    "этот джокер {C:red}уничтожает{} все {C:planet}Планеты{}",
                    "в вашей {C:attention}области расходников{} и",
                    "получает их {C:chips}Фишки{} и {C:mult}Множитель{}",
                    "{C:inactive,s:0.8}(Сейчас {C:chips,s:0.8}+#2#{} {C:inactive,s:0.8}Фишек, {C:mult,s:0.8}+#1#{C:inactive,s:0.8} Множитель)"
                } 
            },
            j_aij_jpeg = { 
                name = ".jpeg", 
                text = { 
                    "Все {C:attention}Пиксельные карты{}",
                    "имеют {C:green}удвоенную{} ценность"
                } 
            },
            j_aij_sherrif = { 
                name = "Шериф",
                text = { 
                    "Первая набравшая очки {C:attention}Дикая карта{}",
                    "в каждой руке приносит {C:money}$#1#{}"
                } 
            },
            j_aij_alien_joker = { 
                name = "Инопланетный Джокер", 
                text = { 
                    {
                        "{C:attention}Принудительно выбирает 1{} карту",
                        "для игры",
                    },
                    {
                        "{C:attention}Принудительно выбранные{} карты дают",
                        "{X:mult,C:white}X#1#{} Множителя при наборе очков" 
                    }
                } 
            },
            j_aij_nobody = { 
                name = "Никто", 
                text = { 
                    "{C:inactive}Ничего не делает...?" 
                } 
            },
            j_aij_broken_dreams = { 
                name = "Разбитые Мечты", 
                text = { 
                    "Когда вы {C:red}проигрываете{} блайнд,",
                    "следующий блайнд в этой Анте",
                    "имеет на {C:attention}#1#%{} меньше очков"
                } 
            },
            j_aij_elf = { 
                name = "Эльф", 
                text = { 
                    "После пропуска {C:attention}#2#{} Блайндов,",
                    "{C:money}продайте{} этого джокера, чтобы создать",
                    "{C:attention}#3#{} Инвестиционных тегов",
                    "{C:inactive}(Сейчас {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_fall_of_count_chaligny = {
                name = "Падение Графа Шалиньи",
                text = { 
                    "Устанавливает {C:attention}требуемый{} счёт",
                    "всех {C:attention}Блайндов{} в {C:attention}1X{} Базы"
                } 
            },
            j_aij_mp_fall_of_count_chaligny = {
                name = "Падение Графа Шалиньи",
                text = { 
                    "Устанавливает {C:attention}требуемый{} счёт",
                    "всех {C:attention}Блайндов{} в {C:attention}1X{} Базы",
                    "{C:inactive}(Не влияет на PvP блайнды){}"
                } 
            },
            j_aij_coulrorachne = { 
                name = "Кулрорахне", 
                text = { 
                    "Этот джокер получает {C:mult}+#1#{} Множителя",
                    "каждые {C:attention}#4# {C:inactive}[#3#]{} набравших очки {C:attention}8",
                    "{C:inactive}(Сейчас {C:mult}+#2#{C:inactive} Множитель)" 
                } 
            },
            j_aij_bad_sun = { 
                name = "Плохое Солнце", 
                text = { 
                    "Если {C:attention}сыгранная{} рука содержит {C:attention}#1#{}",
                    "или более {C:hearts}Червей{}, уничтожает",
                    "{C:attention}случайную{} сыгранную карту" 
                } 
            },
            j_aij_lemarchand_cube = { 
                name = "Куб Лемаршана", 
                text = { 
                    "Когда вы используете {C:spectral}Спектральную{}",
                    "карту, создаёт случайную",
                    "{C:spectral}Спектральную{} карту"
                } 
            },
            j_aij_duende = { 
                name = "Дуэнде", 
                text = { 
                    "Все карты, {C:attention}оставшиеся в руке{}",
                    "после набора очков, дают",
                    "{C:mult}+#1#{} Множителя"
                } 
            },
            j_aij_evil_joker = { 
                name = "Злой Джокер", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множитель, уничтожает",
                    "{C:attention}случайного{} джокера при",
                    "{C:attention}получении" 
                } 
            },
            j_aij_sanguine_joker = { 
                name = "Сангвинический Джокер", 
                text = { 
                    "Сыгранные карты масти {C:hearts}Черви",
                    "с шансом {C:green}#1# из #2#{}",
                    "создают случайный {C:attention}Тег{}",
                    "при наборе очков"
                } 
            },
            j_aij_choleric_joker = { 
                name = "Холерический Джокер", 
                text = { 
                    "Сыгранные карты масти {C:diamonds}Бубны",
                    "с шансом {C:green}#1# из #2#{}",
                    "создают случайную {C:tarot}Таро{}",
                    "карту при наборе очков",
                    "{C:inactive}(Должно быть место){}"
                } 
            },
            j_aij_phlegmatic_joker = { 
                name = "Флегматичный Джокер", 
                text = { 
                    "Сыгранные карты масти {C:clubs}Трефы",
                    "с шансом {C:green}#1# из #2#{}",
                    "создают {C:planet}Планету{}",
                    "для {C:attention}сыгранной руки{}",
                    "при наборе очков",
                    "{C:inactive}(Должно быть место){}"
                } 
            },
            j_aij_melancholic_joker = { 
                name = "Меланхолический Джокер", 
                text = { 
                    "Сыгранные карты масти {C:spades}Пики",
                    "с шансом {C:green}#1# из #2#{}",
                    "создают случайную",
                    "{C:spectral}Спектральную{} карту при наборе очков",
                    "{C:inactive}(Должно быть место){}"
                } 
            },
            j_aij_majordomo = { 
                name = "Мажордом", 
                text = { 
                    {
                        "Все {C:attention}Джокеры{} в {C:money}магазине,",
                        "которые стоят больше {C:money}$#1#{},",
                        "получают стикер {C:money}Аренда{}" 
                    },
                    {
                        "{C:attention}Аренда{} вычитает на {C:money}$2{} меньше"
                    }
                }
            },
            j_aij_skinsuit = { 
                name = "Костюм из Шкуры", 
                text = { 
                    "Когда карта {C:red}уничтожена{},",
                    "пришивает её {C:attention}масть{} к {C:attention}случайной",
                    "{C:attention}карте{} в руке" 
                } 
            },
            j_aij_shock_humor = { 
                name = "Шоковый Юмор", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} карту,",
                    "с шансом {C:green}#1# из #2#{} создаёт",
                    "копию {C:attention}Тега{} из пропуска"
                } 
            },
            j_aij_the_house_that_jack_built = { 
                name = "Дом, Который Построил Джек", 
                text = { 
                    "Каждый {C:attention}Валет{} в колоде",
                    "даёт {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_clownbug = { 
                name = "Клоун-жук", 
                text = { 
                    "Когда вы {C:money}покупаете{} {C:attention}Джокера{},",
                    "создаётся {C:dark_edition}Негативная{} копия",
                    "случайного {C:attention}Тега{}"
                } 
            },
            j_aij_infamous_machine = { 
                name = "Печально Известная Машина", 
                text = {
                    "В конце Анты добавляет",
                    "случайную {C:spectral}Спектральную{}",
                    "карту за каждые 2 сыгранные руки"
                } 
            },
            j_aij_weatherman = { 
                name = "Метеоролог", 
                text = {
                    "В начале раунда, если",
                    "на улице {C:attention}идёт дождь{},",
                    "даёт {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_headfooter = { 
                name = "Верхний Нижний", 
                text = {
                    "Копирует эффект",
                    "верхнего и нижнего",
                    "джокеров в вашей коллекции"
                } 
            },
            j_aij_rudolph = { 
                name = "Рудольф", 
                text = {
                    "Если у вас есть {C:attention}Красный нос{},",
                    "все {C:attention}лицевые карты{}",
                    "дают {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_cut_here = { 
                name = "Режь Здесь", 
                text = {
                    "Когда этот джокер",
                    "{C:red}уничтожен{}, создаёт",
                    "случайного {C:red}Редкого{} джокера"
                } 
            },
            j_aij_a_young_hamlet = { 
                name = "Юный Гамлет", 
                text = {
                    "Этот джокер получает {C:mult}+#2#{} Множителя",
                    "каждые {C:attention}#3#{C:inactive} [#4#]{} {C:red}сброшенных{} карт",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множитель)"
                } 
            },
            j_aij_mike_check = { 
                name = "Проверка Микрофона", 
                text = {
                    "Когда вы {C:red}сбрасываете{} карту,",
                    "с шансом {C:green}#1# из #2#{}",
                    "повышает уровень случайной комбинации"
                } 
            },
            j_aij_pure_baseball_card = { 
                name = "Чистая Бейсбольная Карточка", 
                text = {
                    "Все {C:uncommon}Необычные{} джокеры",
                    "дают {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_rock_n_roll_clown = { 
                name = "Рок-н-ролльный Клоун", 
                text = {
                    "Когда вы играете руку",
                    "с {C:attention}5{} картами,",
                    "даёт {X:mult,C:white}X#1#{} Множителя"
                } 
            },
            j_aij_vecchio_dolore = { 
                name = "Vecchio Dolore", 
                text = {
                    "Каждая {C:attention}лицевая{} карта",
                    "даёт {C:mult}+#1#{} Множителя,",
                    "но имеет шанс {C:green}#2# из #3#{}",
                    "быть {C:red}уничтоженной{}"
                } 
            },
            j_aij_firework = { 
                name = "Фейерверк", 
                text = {
                    "Первая сыгранная {C:attention}Множительная",
                    "карта даёт {X:mult,C:white}X#1#{} Множителя",
                    "при наборе очков",
                } 
            },
            j_aij_bad_guy = { 
                name = "Плохой Парень", 
                text = {
                    "Применяет {C:attention}Фольгу{} к случайной",
                    "карте {C:attention}в руке{}, когда",
                    "{C:attention}Босс-блайнд{} побеждён"
                } 
            },
            j_aij_tool = { 
                name = "Инструмент", 
                text = {
                    "Карты, которые меняют {C:attention}масть{},",
                    "навсегда получают {C:mult}+#1#{} Множителя"
                } 
            },
            j_aij_youve_got_mail = { 
                name = "У Вас Почта", 
                text = {
                    {
                        "Если {C:red}Не{} {C:dark_edition}Негативный{}, когда",
                        "{C:attention}Блайнд{} выбран, создаёт",
                        "{C:dark_edition}Негативную {C:attention}копию{} этого джокера",
                        "с {C:money}$0{} ценой продажи"
                    },
                    {
                        "{V:1}{B:3,V:2}#1##2#{}{V:1}#3#",
                    }
                } 
            },
            j_aij_fleshgait = { 
                name = "Плотоядный", 
                text = {
                    "{C:attention}Набирающие очки{} карты",
                    "без {C:red}{C:attention}лоскута масти{} получают",
                    "случайный {C:attention}лоскут масти"
                } 
            },
            j_aij_czar = { 
                name = "Царь", 
                text = {
                    "Копирует {C:attention}эффект{}",
                    "{C:attention}случайного{} открытого джокера",
                    "из вашей {C:attention}коллекции",
                    "{C:inactive}(Меняется, когда магазин",
                    "{C:inactive}переролливается)"
                } 
            },
            j_aij_stage_production = { 
                name = "Постановка", 
                text = {
                    "{B:1,C:white,s:0.8}Активируемая Способность",
                    "Раз в раунд, {C:attention}временно",
                    "{C:attention}переролливает{} джокера справа",
                    "до выбора следующего блайнда",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_pink_slip = { 
                name = "Розовое Увольнение", 
                text = {
                    "{C:attention}+#1#{} к Лимиту выбора{}",
                    "для {C:red}Сбросов"
                } 
            },
            j_aij_chromatist = { 
                name = "Хроматист", 
                text = {
                    "{X:mult,C:white}X#1#{} Множителя, когда",
                    "{C:attention}Полихромное{} издание",
                    "срабатывает"
                } 
            },
            j_aij_death_of_a_salesman = { 
                name = "Смерть Коммивояжёра", 
                text = {
                    "{C:attention}#1#{} {C:red}Хаоса{} или {C:red}Анархии {C:attention}Тег{}",
                    "доступен для покупки",
                    "в каждом {C:money}Магазине"
                } 
            },
            j_aij_parking_space = { 
                name = "Парковочное Место", 
                text = {
                    "{X:mult,C:white}X#1#{} Множителя, если этот джокер",
                    "в {C:attention}Слоте джокера #2#{}",
                    "{C:inactive}(Слот меняется в конце раунда)"
                } 
            },
            j_aij_graffiti = { 
                name = "Граффити", 
                text = {
                    {
                        '{B:1,C:white,s:0.8}Активируемая Способность',
                        'Платит {C:money}$#1#{} чтобы получить',
                        'случайный {C:attention}Тег{}'
                    },
                    {
                        '{C:money}Стоимость{} увеличивается в {C:red}X#2#',
                        'после использования. Сбрасывается после',
                        '{C:attention}Босс-блайнда{}'
                    }
                } 
            },
            j_aij_historian = {
                name = "Историк", 
                text = {
                    "Добавляет {C:mult}Множитель{} равный",
                    "{C:attention}тройной{} {C:money}Цене продажи{}",
                    "последнего проданного джокера",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множитель)"
                } 
            },
            j_aij_baddata = {
                name = "BAD_DATA", 
                text = {
                    "Всё {C:attention}случайно{}! Каждый",
                    "раз, когда что-то должно",
                    "произойти, происходит",
                    "что-то {C:red}совсем другое{}"
                } 
            },
            j_aij_office_assistant = {
                name = "Офисный Ассистент", 
                text = {
                    "{B:1,C:white,s:0.8}Активируемая Способность",
                    'Чинит {C:attention}Скоропортящегося{} или',
                    '{C:attention}Арендованного{} джокера {C:attention}справа'
                } 
            },
            j_aij_cavalier = {
                name = "Кавалер", 
                text = {
                    "{C:mult}+#2#{} Множителя за каждую {C:attention}руку",
                    "сыгранную ранее в этом {C:attention}раунде",
                    "{C:inactive}(Сейчас {C:mult}+#1#{C:inactive} Множитель)"
                } 
            },
            j_aij_elder = {
                name = "Старейшина", 
                text = {
                    'Копирует эффект',
                    'другого {C:attention}Джокера{}, которого вы',
                    'держали {C:attention}дольше{} всех',
                    "{C:inactive}(Сейчас #1#)"
                } 
            },
            -- Кредитные джокеры-заглушки
            j_aij_prototype = { name = "Прототип", text = {
                "{C:inactive}\"Лол, я не знаю, есть ли",
            "{C:inactive}у меня какие-то цитаты\""} },
            j_aij_spoofy = { name = "Спуфи", text = {
                "{C:inactive}\"Тебе стоит сыграть в Braptro\""} },
            j_aij_toyrapple = { name = "Тойрэппл", text = {""} },
            j_aij_grass = { name = "Трава", text = {
                "\"игра\""} },
            j_aij_mythie = { name = "Мифи", text = {
                "{C:inactive}\"Есть тосты в постели —",
            "{C:inactive}моя способность\""} },
            j_aij_zan = { name = "Зан", text = {""} },
            j_aij_metrollen = { name = "Метроллен", text = {""} },
            j_aij_clay = { name = "Глина", text = {""} },
            j_aij_generic = { name = "Ген-Эрик", text = {
                "{C:inactive}\"Остальное было замазано",
                "{C:inactive}ради баланса игры\""
            } },
            j_aij_cheddar = { name = "Чеддер", text = {""} },

                        -- Легендарные джокеры
            j_aij_nybbas = { 
                name = "Ниббас", 
                text = { 
                    "{X:mult,C:white}X#1#{} Множитель. Все {C:attention}вероятности{}",
                    "срабатывают {C:attention}на 1{} раньше",
                    "{C:inactive}(1 из 6 -> 1 из 5, и т.д.)"
                }, 
                unlock = { "?????" } 
            },
            j_aij_doink = { 
                name = "Дойнк", 
                text = { 
                    "Все карты считаются",
                    "{C:attention}одной мастью{} и {C:attention}рангом{}",
                    "{C:inactive}(Не влияет на составление покерных комбинаций)"
                }, 
                unlock = { "?????" } 
            },
            j_aij_monarcho = { 
                name = "Монархо", 
                text = { 
                    "{C:attention}Все лицевые карты{} в колоде",
                    "превращаются в {C:attention}Королей{}, {C:attention}Дам{}",
                    "и {C:attention}Валетов{} с {C:money}Золотыми{} печатями"
                }, 
                unlock = { "?????" } 
            },
            j_aij_pompey = {
                name = "Помпей",
                text = {
                    "{X:mult,C:white}X#1#{} Множителя за каждого {C:attention}Джокера{}",
                    "{C:attention}справа{}, включая",
                    "самого Помпея",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{}{C:inactive} Множитель)"
                },
                unlock = { "?????" }
            },
            j_aij_touchstone = {
                name = "Пробный Камень",
                text = {
                    "{C:attention}+#1#{} к размеру руки",
                    "Раскрывает следующие {C:attention}#2#{}",
                    "карты в вашей колоде",
                },
                unlock = { "?????" }
            },
            j_aij_fortunato = {
                name = "Фортунато",
                text = {
                    {
                        "Превращает все {C:attention}сыгранные{} но {C:attention}не набравшие очки{}",
                        "карты в {C:attention}Каменные карты{}",
                    },
                    {
                        "Этот {C:attention}Джокер{} получает {X:mult,C:white}X#2#{} Множителя",
                        "когда {C:attention}Каменная карта{} набирает очки",
                        "{C:inactive}(Сейчас{} {X:mult,C:white}X#1#{} {C:inactive}Множитель)",
                    }
                },
                unlock = { "?????" }
            },
            j_aij_pellesini = { 
                name = "Пелезини", 
                text = { 
                    "Когда любой джокер",
                    "{C:red}уничтожен{}, создаёт",
                    "{C:attention}точную{} копию",
                    "{C:inactive}(Включая себя)"
                },
                unlock = { "?????" } 
            },
            j_aij_nedda = {
                name = "Недда",
                text = {
                    "{C:attention}Дамы{}, оставшиеся в руке,",
                    "дают {X:mult,C:white}X#1#{} Множителя"
                },
                unlock = { "?????" }
            },
            j_aij_silvio = {
                name = "Сильвио",
                text = {
                    "Перезапускает всех {C:attention}Королей{}",
                    "один раз за каждую {C:attention}Даму{}",
                    "в руке",
                },
                unlock = { "?????" }
            },
            j_aij_biancolelli = { 
                name = "Бьянколелли", 
                text = { 
                    "{C:aij_plasma}Балансирует{} {C:chips}Фишки{} и {C:mult}Множитель{}", 
                    "после срабатывания джокеров"
                }, 
                unlock = { "?????" } 
            },
            j_aij_toto = { 
                name = "Тото", 
                text = { 
                    "Создаёт {C:attention}#1#{} копий",
                    "каждого полученного {C:attention}Тега{}",
                    "{C:inactive}(Кроме Двойного Тега)" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_grock = { 
                name = "Грок", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "создаётся {C:attention}удвоенная{} копия",
                    "каждого {C:attention}Тега{} в этом пропуске"
                }, 
                unlock = { "?????" } 
            },
            j_aij_eulenspiegel = { 
                name = "Ойленшпигель", 
                text = { 
                    {
                        "Когда {C:attention}Босс-блайнд{} побеждён,",
                        "{C:attention}-#1#{} Анты и этот джокер",
                        "теряет {X:mult,C:white}X#2#{} Множителя",
                        "{C:inactive}(Сейчас {X:mult,C:white}X#3#{C:inactive} Множитель)"
                    },
                    {
                        "{C:red}Ослабляет себя{}",
                        "при {X:mult,C:white}X0{} Множителя"
                    }

                }, 
                unlock = { "?????" } 
            },
            j_aij_deburau = { 
                name = "Дебуро", 
                text = { 
                    "Все {C:attention}Тузы{} и {C:attention}Валеты{}",
                    "считаются {C:attention}Королями{} и {C:attention}Дамами{}",
                    "и наоборот"
                }, 
                unlock = { "?????" } 
            },
            j_aij_dacosta = { 
                name = "Дакоста", 
                text = { 
                    "Когда вы {C:money}покупаете{} {C:attention}Джокера{},",
                    "все остальные джокеры",
                    "получают {C:dark_edition}+#1#{} Множителя"
                }, 
                unlock = { "?????" } 
            },
            j_aij_durie = { 
                name = "Дьюри", 
                text = { 
                    "Все {C:attention}карты{} дают",
                    "свои {C:chips}Фишки{} как {C:mult}Множитель{}",
                    "и наоборот"
                }, 
                unlock = { "?????" } 
            },
            j_aij_nichola = {
                name = "Никола",
                text = {
                    'Когда раунд начинается, добавляет',
                    'одну случайную {C:attention}Даму',
                    'в вашу руку со случайным',
                    '{C:attention}Улучшением{},',
                    '{C:dark_edition}Изданием{} и {C:attention}Печатью{}'
                },
                unlock = { "?????" }
            },
            j_aij_fleeman = { 
                name = "Флиман", 
                text = { 
                    "Копирует эффект",
                    "каждого другого легендарного",
                    "джокера в вашей коллекции"
                }, 
                unlock = { "?????" } 
            },
            j_aij_colquhoun = { 
                name = "Колкухун", 
                text = { 
                    "Все карты приносят {C:money}$#1#{}",
                    "когда {C:attention}набирают очки{}, увеличивается",
                    "на {C:money}$#2#{} когда {C:attention}Босс-блайнд{}",
                    "побеждён"
                }, 
                unlock = { "?????" }
            },
            j_aij_dor = { 
                name = "Д'ор", 
                text = { 
                    "{X:dark_edition,C:white}#1#{} Множителя на {C:attention}последней{}",
                    "руке {C:attention}раунда" 
                },
                unlock = { "?????" } 
            },
            j_aij_archy = { 
                name = "Арчи", 
                text = { 
                    "Все начальные {C:attention}карты{} и",
                    "{C:attention}Бустер-паки{} в",
                    "{C:money}Магазине{} бесплатны" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_sommers = { 
                name = "Соммерс", 
                text = { 
                    "{C:attention}Повышает уровень{} всех",
                    "сыгранных рук на {C:attention}#1#{}",
                    "в конце раунда" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_pace = {
                name = "Пейс",
                text = {
                    {
                        "Все {C:red}Редкости{} джокеров",
                        "имеют {C:green}равный{} шанс",
                        "появления в {C:money}Магазине",
                        "{C:inactive}(кроме Легендарных)"
                    },
                    {
                        "Все джокеры стоят {C:money}$#1#"
                    }
                },
                unlock = { "?????" }
            },
            j_aij_thomazina = {
                 name = "Томазина",
                 text = {
                    "Сыгранные {C:attention}числовые{} карты",
                    "дают {C:chips}+#1#{} Фишек. Увеличивается",
                    "на {C:chips}+#2#{} Фишек, когда {C:attention}числовая{}",
                    "карта набирает очки"
                },
                unlock = { "?????" } 
            },
            j_aij_mathurine = { 
                name = "Матурина", 
                text = { 
                    "Когда вы {C:money}продаёте{} {C:attention}Джокера{},",
                    "его эффект сохраняется",
                    "до конца Анты"
                }, 
                unlock = { "?????" } 
            },
            j_aij_guillaume = { 
                name = "Гийом", 
                text = { 
                    "Если {C:attention}Босс-блайнд{}",
                    "побеждён с менее чем",
                    "{C:attention}5{} джокерами, этот джокер",
                    "получает {C:dark_edition}+#2#{} Слота джокера",
                    "{C:inactive}(Сейчас {C:dark_edition}+#1#{C:inactive} Слотов джокера)",
                },
                unlock = { "?????" } 
            },
            j_aij_tarlton = { 
                name = "Тарлтон", 
                text = { 
                    "Даёт {C:chips}+Фишки{} равные",
                    "{C:attention}суммарным{} {C:chips}Фишкам{} {C:attention}предыдущей{}",
                    "сыгранной {C:attention}руки{} в этом раунде",
                    "{C:inactive}(Сейчас {C:chips}+#1#{} {C:inactive}Фишек)",
                }, 
                unlock = { "?????" }
            },
            j_aij_roland = { 
                name = "Роланд", 
                text = { 
                    "Все {C:attention}лицевые карты{}",
                    "имеют {C:green}удвоенный{} шанс",
                    "на {C:green}вероятности{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_borra = { 
                name = "Борра", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} карту,",
                    "создаётся её {C:attention}копия{}",
                    "в случайном месте колоды"
                }, 
                unlock = { "?????" } 
            },
            j_aij_taillefer = { 
                name = "Тайефер", 
                text = { 
                    "Этот джокер получает {X:mult,C:white}X#2#{} Множителя",
                    "за каждую сыгранную руку,",
                    "{C:red}самоуничтожается{} после",
                    "победы над {C:attention}#3#{} {C:attention}Босс-блайндами{}",
                    "{C:inactive}(Сейчас {X:mult,C:white}X#1#{} {C:inactive}Множитель, {C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive})",
                }, 
                unlock = { "?????" } 
            },
            j_aij_killigrew = {
                name = "Киллигрю",
                text = {
                    "{X:mult,C:white}X#1#{} Множителя за каждый",
                    "{C:attention}Ваучер{} в наличии",
                    "{C:inactive}(Сейчас{} {X:mult,C:white}X#2#{} {C:inactive}Множитель)",
                },
                unlock = { "?????" }
            },
            j_aij_dongfang = { 
                name = "Донфан", 
                text = { 
                    "Все {C:attention}числовые{} карты",
                    "имеют {C:green}удвоенную{} ценность",
                    "для {C:attention}Стритов{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_zerco = {
                name = "Зерко",
                text = {
                    "Применяет {C:dark_edition}Негативное{} к {C:attention}первой{}",
                    "набравшей очки {C:attention}карте{} каждого {C:attention}раунда{}",
                    "{C:inactive}(если у неё нет издания)"
                },
                unlock = { "?????" } 
            },
            j_aij_yu_sze = { 
                name = "Ю Сзе", 
                text = { 
                    "Джокеры без {C:dark_edition}Изданий{}",
                    "дают {X:mult,C:white}X#1#{} Множителя" 
                },
                unlock = { "?????" } 
            },
            j_aij_brusquet = { 
                name = "Бруске", 
                text = { 
                    "Все {C:attention}Карты со льдом{}",
                    "и {C:attention}Деревянные карты{}",
                    "считаются {C:attention}Каменными картами{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_rahere = { 
                name = "Рахир", 
                text = { 
                    "Когда вы {C:money}покупаете{} {C:attention}Ваучер{},",
                    "создаётся случайный",
                    "{C:legendary}Легендарный{} джокер"
                }, 
                unlock = { "?????" } 
            },
            j_aij_gonnella = { 
                name = "Гоннелла", 
                text = { 
                    "Все {C:attention}Стеклянные карты{}",
                    "имеют {C:green}нулевой{} шанс разбиться"
                }, 
                unlock = { "?????" } 
            },
            j_aij_gong_gil = { 
                name = "Гонг-Гил", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "создаётся случайный",
                    "{C:legendary}Легендарный{} джокер"
                }, 
                unlock = { "?????" } 
            },
            j_aij_angoulevent = { 
                name = "Ангулеван", 
                text = { 
                    "Перезапускает все сыгранные карты",
                    "{C:attention}#1#{} дополнительных раз" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_coryat = { 
                name = "Корьят", 
                text = { 
                    "Все {C:attention}Бонусные карты{}",
                    "и {C:attention}Множительные карты{}",
                    "дают {X:mult,C:white}X#1#{} Множителя"
                }, 
                unlock = { "?????" } 
            },
            j_aij_bluet = { 
                name = "Блю", 
                text = { 
                    "Когда {C:attention}Блайнд{} выбран,",
                    "создаёт {C:dark_edition}Негативную{}",
                    "{C:spectral}Спектральную{} карту"
                }, 
                unlock = { "?????" } 
            },
            j_aij_bebe = {
                 name = "Бебе",
                 text = {
                    "{C:blue}+#1#{} Рук в раунде",
                },
                 unlock = { "?????" } 
            },
            j_aij_pipine = { 
                name = "Пипин", 
                text = { 
                    "{C:red}+#1#{} сбросов в раунде" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_golitsyn = { 
                name = "Голицын", 
                text = { 
                    "Все {C:attention}лицевые карты{}",
                    "считаются {C:attention}Тузами{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_buzheninova = { 
                name = "Буженинова", 
                text = { 
                    "Когда вы {C:attention}пропускаете{} блайнд,",
                    "все {C:attention}Теги{} в этом пропуске",
                    "становятся {C:money}Золотыми{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_yakov = { 
                name = "Яков", 
                text = { 
                    "Все {C:attention}числовые{} карты",
                    "считаются {C:attention}лицевыми{} картами"
                }, 
                unlock = { "?????" } 
            },
            j_aij_komar = { 
                name = "Комар", 
                text = { 
                    "Все {C:attention}набравшие очки{} карты получают {C:chips}Фишки",
                    "равные базовой {C:chips}ценности Фишек{}",
                    "всех {C:attention}других{} сыгранных карт" 
                }, 
                unlock = { "?????" } 
            },
            j_aij_lavatch = {
                 name = "Лаватч",
                 text = {
                    "Сыгранные {C:clubs}Трефы{} дают {X:mult,C:white}X#1#{} Множителя,",
                    "увеличивается на {X:mult,C:white}X#2#{} Множителя",
                    "когда {C:clubs}Трефа{} набирает очки",
                },
                 unlock = { "?????" } 
            },
            j_aij_Ffwllier = { 
                name = "Ффуллир", 
                text = { 
                    "Все {C:attention}Карты со льдом{}",
                    "имеют {C:green}удвоенные{} эффекты"
                }, 
                unlock = { "?????" } 
            },
            j_aij_martellino = {
                name = "Мартеллино",
                text = {
                    "Через {C:attention}#2#{} раунда {C:money}продаёт{} этого",
                    "джокера, чтобы создать {C:attention}любого джокера{}",
                    "из вашей {C:attention}коллекции",
                    "{C:inactive}(Сейчас {C:attention}#1#{}{C:inactive}/#2#)"
                },
                unlock = { "?????" }
            },
            j_aij_shir_ei = { 
                name = "Шир'эй", 
                text = { 
                    "Все карты считаются",
                    "{C:attention}улучшенными{} и {C:attention}изданными{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_xinmo = { 
                name = "Синьмо", 
                text = { 
                    "Когда вы {C:red}сбрасываете{} карту,",
                    "создаётся {C:attention}копия{}",
                    "случайного {C:attention}Тега{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_chunyu = { 
                name = "Чуньюй", 
                text = { 
                    "Все {C:attention}Джокеры{} считаются",
                    "{C:attention}Вечными{} и не могут",
                    "быть {C:red}уничтожены{}"
                }, 
                unlock = { "?????" } 
            },
            j_aij_fantasio = { 
                name = "Фантазио", 
                text = { 
                    "Все карты считаются",
                    "{C:attention}каждой мастью{}",
                }, 
                unlock = { "?????" } 
            },
            j_aij_sexton = { 
                name = "Секстон", 
                text = { 
                    "Все {C:attention}лицевые карты{}",
                    "имеют {C:green}удвоенные{} печати"
                }, 
                unlock = { "?????" } 
            },
            j_aij_dongtong = {
                name = "Донгтонг",
                text = {
                    {
                    "{C:green}Удваивает{} большинство",
                    "{C:attention}значений{} джокеров",
                    },
                    {
                        "Удваивает {C:attention}Требования{}",
                        "{C:attention}Блайндов{}"
                    }
            },
                unlock = { "?????" }
            },
            j_aij_naiteh = {
                name = "Най-Тех",
                text = {
                    "Получает {C:attention}+#2#{} к размеру руки, когда",
                    "{C:attention}Босс-блайнд{} побеждён",
                    "{C:inactive}(Сейчас {C:attention}+#1#{C:inactive} к размеру руки)"
                },
                unlock = { "?????" }
            },
            j_aij_talhak = {
                name = "Талхак",
                text = {
                    "Когда {C:attention}Босс-блайнд{} побеждён,",
                    "выбирает {C:attention}любую{} несекретную",
                    "{C:spectral}Спектральную{} карту для создания",
                    "{C:inactive}(Должно быть место)"
                },
                unlock = { "?????" }
            },
            j_aij_bozo = {
                name = "Бозо",
                text = {
                    "Когда {C:attention}Босс-блайнд{}",
                    "побеждён, создаёт {C:attention}#1#{}",
                    "случайных {C:dark_edition}Негативных{} джокеров",
                },
                unlock = { "?????" }
            },
            j_aij_thalia = {
                name = "Талия",
                text = {
                    "Если {C:attention}первый сброс{} раунда",
                    "содержит ровно {C:attention}1{} карту, она",
                    "навсегда получает {C:attention}+#1#{} перезапуска"
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
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_zoozve = {
                name = "Зуузве",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_luna = {
                name = "Луна",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_phobos = {
                name = "Фобос",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_europa = {
                name = "Европа",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_titan = {
                name = "Титан",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_umbriel = {
                name = "Умбриэль",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_triton = {
                name = "Тритон",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_nix = {
                name = "Никс",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_planet_nine = {
                name = "Планета Девять",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_pallas = {
                name = "Паллада",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_dysnomia = {
                name = "Дисномия",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
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
                name = "Планета-Сирота",
                text = {
                    'Повышает уровень {C:attention}всех',
                    '{C:attention}рук{}, упомянутых',
                    'вашими {C:attention}Джокерами'
                }
            },
            c_aij_dark_star = {
                name = "Тёмная Звезда",
                text = {
                    'Повышает уровень {C:attention}всех',
                    "{C:attention}рук{}, которые ещё",
                    "не были {C:attention}сыграны{}"
                }
            },
            c_aij_sol = {
                name = "Солнце",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#4#{} Множителя и",
                    "{C:chips}+#3#{} Фишек",
                }
            },
            c_aij_paper_weywot = {
                name = "Вейвот",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_paper_namaka = {
                name = "Намака",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_paper_ilmare = {
                name = "Ильмаре",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
                }
            },
            c_aij_paper_salacia = {
                name = "Салация",
                text = {
                    "{S:0.8}({S:0.8,V:1}ур.#1#{S:0.8}){} Повышает уровень",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} Множителя",
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
                    '{C:mult}Множителя{} всех',
                    '{C:legendary,E:1}покерных комбинаций'
                }
            },
            c_aij_shade = {
                name = 'Тень',
                text = {
                    'Добавляет {C:dark_edition}Негативное{} издание',
                    'к {C:attention}#1#{} случайным',
                    'картам в руке'
                }
            },
            c_aij_trefle = {
                name = 'Трефль',
                text = {
                    '{C:attention}Переролливает{} одного',
                    'выбранного {C:attention}Джокера',
                    "{C:inactive}(Не может быть{}",
                    "{C:inactive}Вечным){}"
                }
            },
            c_aij_trefle_controller = {
                name = 'Трефль',
                text = {
                    '{C:attention}Переролливает{}',
                    '{C:attention}крайнего правого{} Джокера',
                    "{C:inactive}(Не может быть{}",
                    "{C:inactive}Вечным){}"
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
                name = 'Изменение Формы',
                text = {
                    'Превращает всех {C:attention}Джокеров{} в копии',
                    'случайного {C:attention}Джокера{} в наличии',
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
                    '{C:red}-#1#{} к размеру руки'
                }
            },
            c_aij_gegenschein = {
                name = "Гегеншайн",
                text = {
                    'Устанавливает уровень всех',
                    '{C:attention}сыгранных{} {C:dark_edition}секретных комбинаций{}',
                    'равным {C:attention}количеству{}',
                    'раз, которое они',
                    'были {C:attention}сыграны{}'
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
                name = 'Тег Мерцания',
                text = {
                    'Следующий обычный джокер',
                    'в магазине бесплатен и',
                    'становится {C:aij_plasma}Мерцающим'
                }
            },
            tag_aij_silver = {
                name = 'Серебряный Тег',
                text = {
                    'Следующий обычный джокер',
                    'в магазине бесплатен и',
                    'становится {C:aij_silver}Серебряным'
                }
            },
            tag_aij_stellar = {
                name = 'Звёздный Тег',
                text = {
                    'Следующий обычный джокер',
                    'в магазине бесплатен и',
                    'становится {C:aij_stellar}Звёздным'
                }
            },
            tag_aij_aureate = {
                name = 'Златокованый Тег',
                text = {
                    'Следующий обычный джокер',
                    'в магазине бесплатен и',
                    'становится {C:money}Златокованым'
                }
            },
            tag_aij_soulbound = {
                name = 'Тег Связанной Души',
                text = {
                    'Создаёт случайного {C:attention}Скоропортящегося{}',
                    '{C:legendary}Легендарного{} джокера',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_fortunate = {
                name = 'Счастливый Тег',
                text = {
                    'Выбирает {C:attention}любую{} {C:tarot}Таро{}',
                    'карту для создания',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_overstuffed = {
                name = 'Переполненный Тег',
                text = {
                    "Следующий открытый {C:attention}Бустер-пак{}",
                    "содержит {C:attention}вдвое{} больше",
                    "вариантов и выборов"
                }
            },
            tag_aij_chaos = {
                name = 'Тег Хаоса',
                text = {
                    "Имеет {C:red}случайный{} эффект"
                }
            },
            -- Золотые теги
            tag_aij_windfall = {
                name = 'Тег Нежданных Денег',
                text = {
                    "{C:money}Утраивает{} ваши деньги",
                    "{C:inactive}(Максимум {C:money}$300{}{C:inactive})"
                }
            },
            tag_aij_unusual = {
                name = 'Необычный Тег',
                text = {
                    "В магазине бесплатный",
                    "{C:uncommon}Необычный джокер{} с",
                    "{C:attention}удвоенными{} значениями"
                }
            },
            tag_aij_recherche = {
                name = 'Изысканный Тег',
                text = {
                    "В магазине бесплатный",
                    "{C:rare}Редкий джокер{} с",
                    "{C:attention}удвоенными{} значениями"
                }
            },
            tag_aij_hermetic = {
                name = 'Герметический Тег',
                text = {
                    'Выбирает {C:attention}несекретную{}',
                    '{C:spectral}Спектральную{} карту для создания',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_dark_matter = {
                name = 'Тег Тёмной Материи',
                text = {
                    'Применяет {C:dark_edition}Негативное{} к',
                    '{C:attention}случайному{} Джокеру',
                    'без издания'
                }
            },
            tag_aij_crystal = {
                name = 'Хрустальный Тег',
                text = {
                    'Применяет {C:dark_edition}Фольгу{} к',
                    '{C:attention}случайному{} Джокеру и',
                    '{C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_iridescent = {
                name = 'Переливающийся Тег',
                text = {
                    'Применяет {C:dark_edition}Голографическое{}',
                    'к {C:attention}случайному{} Джокеру',
                    'и {C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_omnichrome = {
                name = 'Омнихромный Тег',
                text = {
                    'Применяет {C:dark_edition}Полихром{} к',
                    '{C:attention}крайнему правому{} обычному',
                    'джокеру без издания'
                }
            },
            tag_aij_circumplanetary = {
                name = 'Околопланетный Тег',
                text = {
                    'Повышает уровень {C:attention}самой разыгрываемой',
                    '{C:attention}покерной комбинации{} на',
                    '{C:attention}#1#{} уровней',
                    '{C:inactive}(Сейчас #2#)'
                }
            },
            tag_aij_velocity = {
                name = 'Тег Скорости',
                text = {
                    'Даёт {C:money}$#1#{}, минус {C:money}$#2#',
                    'за {C:attention}раунд{}',
                    '{C:inactive}(Даст {C:money}$#3#{C:inactive})'
                }
            },
            tag_aij_capital = {
                name = 'Тег Капитала',
                text = {
                    'После победы над',
                    'Босс-блайндом,',
                    'получает {C:money}$#1#'
                }
            },
            tag_aij_bierstiefel = {
                name = 'Тег Пивной Кружки',
                text = {
                    'Заполняет все пустые',
                    '{C:attention}Слоты джокеров{}',
                    'случайными {C:common}Обычными{} или',
                    '{C:uncommon}Необычными{} джокерами'
                }
            },
            tag_aij_ticket = {
                name = 'Тег Билета',
                text = {
                    '{C:attention}Активирует{} случайный',
                    'Ваучер и его',
                    '{C:attention}улучшенную{} версию'
                }
            },
            tag_aij_galloping_domino = {
                name = 'Тег Скачущего Домино',
                text = {
                    '{C:attention}Все{} перероллы стоят',
                    '{C:money}$#1#{} в следующем магазине'
                }
            },
            tag_aij_gioco = {
                name = 'Тег Джоко',
                text = {
                    '{C:attention}Удваивает{} размер руки',
                    'в следующем раунде',
                }
            },
            tag_aij_stereoscopic = {
                name = 'Стереоскопический Тег',
                text = {
                    'Даёт {C:money}Золотую{} копию',
                    'следующего выбранного {C:attention}Тега',
                    '{s:0.8,C:attention}Двойной Тег{s:0.8} исключён',
                }
            },
            tag_aij_frugal = {
                name = 'Экономный Тег',
                text = {
                    '{C:attention}Все{} карты и',
                    'бустер-паки в следующем',
                    'магазине бесплатны',
                }
            },
            tag_aij_dominus = {
                name = 'Тег Доминус',
                text = {
                    'Выбирает {C:attention}любого Босс-блайнда{} для',
                    'замены текущего'
                }
            },
            tag_aij_nonstandard = {
                name = 'Нестандартный Тег',
                text = {
                    'Создаёт {C:attention}пользовательскую карту{} и',
                    'добавляет 2 её копии в колоду',
                }
            },
            tag_aij_ignoramus = {
                name = 'Тег Невежды',
                text = {
                    'Выбирает {C:attention}любого{} {C:common}Обычного',
                    'или {C:uncommon}Необычного{} джокера',
                    'для создания',
                    '{C:inactive}(Должно быть место)'
                }
            },
            tag_aij_occult = {
                name = 'Оккультный Тег',
                text = {
                    'Создаёт {C:attention}3 {C:tarot}Таро{} карты',
                    'и {C:attention}2 {C:spectral}Спектральные{} карты', 
                    '{s:0.8}Они {s:0.8,C:dark_edition}Негативные',
                }
            },
            tag_aij_asteroid = {
                name = 'Астероидный Тег',
                text = {
                    'Даёт бесплатный',
                    '{C:planet}Небесный пак{}', 
                    'с {C:dark_edition}Чёрной дырой{},',
                    '{C:dark_edition}Пульсаром{} и {C:dark_edition}Гравастаром{}',
                }
            },
            tag_aij_polydactyly = {
                name = 'Тег Полидактилии',
                text = {
                    'Даёт {C:blue}+1 руку{} в следующем раунде',
                    'за каждую неиспользованную {C:blue}руку{} в этой игре', 
                    '{C:inactive}(Даст {C:blue}+#1#{C:inactive} рук)',
                    '{C:inactive}(Максимум {C:blue}+40{C:inactive} рук)'
                }
            },
            tag_aij_landfill = {
                name = 'Мусорный Тег',
                text = {
                    'Даёт {C:money}$1{} за каждую карту,',
                    '{C:red}сброшенную{} в этой игре', 
                    '{C:inactive}(Даст {C:money}$#1#{C:inactive})',
                }
            },
            tag_aij_cinema = {
                name = 'Кинотеатральный Тег',
                text = {
                    'Применяет {C:aij_silver}Серебро{} к',
                    '{C:attention}крайнему левому{} обычному',
                    'джокеру без издания',
                }
            },
            tag_aij_ventripotent = {
                name = 'Тег Прожорливости',
                text = {
                    "Следующий {C:attention}Бустер-пак{}",
                    "содержит {C:attention}вдвое{} больше",
                    "вариантов и {C:attention}неограниченный{} выбор"
                }
            },
            tag_aij_timelost = {
                name = 'Затерянный во Времени Тег',
                text = {
                    'Даёт бесплатный {C:purple}Пак',
                    '{C:purple}Угадай Шутку{} с',
                    '{C:attention}5{} скоропортящимися вариантами',
                }
            },
            tag_aij_auspicious = {
                name = 'Благоприятный Тег',
                text = {
                    'Создаёт {C:attention}3{} {C:dark_edition}Негативные копии',
                    '{C:tarot}Таро{} карты',
                    '{C:attention}по вашему выбору'
                }
            },
            tag_aij_glamour = {
                name = 'Тег Обаяния',
                text = {
                    'Применяет {C:aij_plasma}Мерцание{} к',
                    '{C:attention}2 случайным{} Джокерам',
                    'без издания'
                }
            },
            tag_aij_superlunary = {
                name = 'Надлунный Тег',
                text = {
                    'Применяет {C:aij_stellar}Звёздное{}',
                    'к {C:attention}случайному{} Джокеру',
                    'и {C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_gold_dust = {
                name = 'Тег Золотой Пыли',
                text = {
                    'Применяет {C:money}Златокованое{} к',
                    '{C:attention}#1#{} картам в колоде',
                    'без издания'
                }
            },
            tag_aij_anarchy = {
                name = 'Тег Анархии',
                text = {
                    'Имеет {C:red}СЛУЧАЙНЫЙ{} эффект{C:red}!!!'
                }
            },
        },

                Tarot = {
            c_aij_magus = {
                name = 'Магус',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту в",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sanctuary_gate = {
                name = 'Врата Святилища',
                text = {
                    "Улучшает {C:attention}#1#{}",
                    "выбранных карт в",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_isis_urania = {
                name = 'Исида-Урания',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту в",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_cubic_stone = {
                name = 'Кубический Камень',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту в",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_master_arcanes = { 
                name = 'Повелитель Арканов',
                text = {
                    "С шансом {C:green}#1# из #2#{}",
                    "создаёт случайную",
                    "{C:spectral}Спектральную{} карту",
                    '{C:inactive}(Должно быть место)'
                }
            },
            c_aij_two_ways = {
                name = 'Два Пути',
                text = {
                    "Разделяет {C:attention}#1#{} выбранную карту",
                    "на {C:attention}2{} копии с",
                    "{C:attention}половинным{} {C:attention}рангом{}",
                    "{C:inactive}(Нечётные карты делятся максимально поровну)",
                    "{C:inactive}(Т=14, К=13, Д=12, В=11)"
                }
            },
            c_aij_osiris = {
                name = 'Осирис',
                text = {
                    "{C:red}Уничтожает{} {C:attention}1{} выбранного",
                    "Джокера и получает тройную",
                    "его {C:money}цену продажи",
                    "{C:inactive}(Сейчас{} {C:money}$#1#{}{C:inactive})"
                }
            },
            c_aij_osiris_controller = {
                name = 'Осирис',
                text = {
                    "{C:red}Уничтожает{} {C:attention}крайнего правого{}",
                    "Джокера и получает тройную",
                    "его {C:money}цену продажи",
                    "{C:inactive}(Сейчас{} {C:money}$#1#{}{C:inactive})"
                }
            },
            c_aij_balance_and_blade = {
                name = 'Весы и Клинок',
                text = {
                    "{C:attention}Пришивает{} случайную масть",
                    "к {C:attention}#1#{} выбранным картам"
                }
            },
            c_aij_veiled_lamp = {
                name = 'Завуалированная Лампа',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту в",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sphinx = {
                name = 'Сфинкс',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту в",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_tamed_lion = {
                name = 'Приручённый Лев',
                text = {
                    "Улучшает {C:attention}#1#{} выбранную",
                    "карту в",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_broken_fate = {
                name = 'Сломанная Судьба',
                text = {
                    "Рандомизирует значения",
                    "{C:attention}крайнего левого расходника",
                    "между {C:attention}X0.75{} и {C:attention}X2.5{}",
                    "от их {C:attention}стандартных{} значений"
                }
            },
        },

                Other = {
            aij_patches_suit = {
                name = "Лоскуты",
                text = {
                    "Считается как {V:1}#1#"
                }
            },
            aij_jest_mark_of_the_spear = {
                name = "Отметина Копья",
                text = {
                    'Эта {C:attention}карта{} была',
                    'навсегда {C:red}ослаблена',
                    '{C:attention}Копьём'
                }
            },
            card_extra_retriggers = {
                text={
                    "Перезапускает эту карту {C:attention}#1#{} дополнительных раз",
                },
            },
            showdown_blind = {
                name = "Финальный Блайнд",
                text = {
                    "{C:attention}Босс-блайнд{},",
                    "который появляется",
                    "каждую {C:attention}#1#{} Анту",
                }
            },
            reroll_joker = {
                name = "Переролл",
                text = {
                    'Заменяет джокера на',
                    'случайного джокера',
                    'той же редкости'
                }
            },
            office_assistant_perishable = {
                name = "Скоропортящийся",
                text = {
                    '{C:attention}Сбрасывает{} счётчик',
                    '{C:attention}Скоропортящихся{} джокеров',
                    'за {C:money}$3'
                }
            },
            office_assistant_rental = {
                name = "Аренда",
                text = {
                    'Удаляет {C:attention}стикер Аренды{}',
                    'с джокера за его',
                    '{C:money}базовую цену'
                }
            },
            overdesigned_club = {
                name = "Трефы",
                text = {
                    "Сыгранные {C:clubs}Трефы{}",
                    "дают {C:mult}+#1#{} Множителя",
                }
            },
            overdesigned_spade = {
                name = "Пики",
                text = {
                    "Сыгранные {C:spades}Пики{}",
                    "дают {C:chips}+#1#{} Фишек",
                }
            },
            overdesigned_diamond = {
                name = "Бубны",
                text = {
                    "Сыгранные {C:diamonds}Бубны{}",
                    "приносят {C:money}$#1#{}",
                }
            },
            overdesigned_heart = {
                name = "Черви",
                text = {
                    "Сыгранные {C:hearts}Черви{}",
                    "дают {X:mult,C:white}X#1#{} Множителя",
                }
            },
            p_aij_guess_the_jest = {
                name = "Пак Угадай Шутку",
                text = {
                    'Выбирает {C:attention}#1#{} из {C:attention}#2#{} скрытых',
                    '{C:legendary,E:2}Легендарных{} джокеров'
                }
            },
            m_aij_dyscalcular_numbered_rank = {
                name = "Числовые Ранги",
                text = {
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, {C:attention}5{}, {C:attention}6{},",
                    "{C:attention}7{}, {C:attention}8{}, {C:attention}9{} и {C:attention}10{}",
                }
            },
            palindrome = {
                name = "Палиндром",
                text = {
                    "Многозначное число, которое",
                    "{C:attention}не меняется{} при переворачивании",
                    "{C:inactive}напр. 33, 151, 3003{}"
                }
            },
            -- Стикеры
            aij_marked = {
                name = "Меченая",
                text = {
                    'Нельзя {C:blue}сыграть',
                    'или {C:red}сбросить'
                }
            },
            aij_unusual_doubled = {
                name = "Удвоена",
                text = {
                    '{C:attention}X2{} к эффектам',
                    '{C:inactive,s:0.8}(Дано Необычным тегом){}'
                }
            },
            aij_recherche_doubled = {
                name = "Удвоена",
                text = {
                    '{C:attention}X2{} к эффектам',
                    '{C:inactive,s:0.8}(Дано Изысканным тегом){}'
                }
            },
            aij_jest_chaotic_card = {
                name = "Хаотичная",
                text = {
                    "{X:mult,C:white} X#1# {} Множителя",
                    "{C:edition}Улучшение{}",
                    "{C:attention}рандомизируется{} после",
                    "розыгрыша",
                }
            },
            -- Печати
            aij_smiley_seal = {
                name = "Печать Улыбки",
                text = {
                    'При {C:red}уничтожении{} применяет',
                    'издание к {C:attention}#1#{}',
                    'случайным {C:attention}Джокерам'
                }
            },
            aij_melted_seal = {
                name = "Печать Таяния",
                text = {
                    'Когда остаётся в {C:attention}руке{},',
                    '{C:attention}превращается{} в первую',
                    'не-{V:1}Тающую{} {C:attention}печать{}',
                    'которая набрала очки'
                }
            },
            -- Информация о создателях
            nevernamed_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Сделал весь арт", 
                    "{s:0.8}-Придумал около половины эффектов",
                    "{s:0.8}-Начал заниматься артом для Balatro в декабре 2024"
                }
            },
            survivalaren_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Написал около половины кода", 
                    "{s:0.8}-Придумал около половины эффектов",
                    "{s:0.8}-Изначально создал мод",
                    "{s:0.8}-Начал мод в начале апреля 2025"
                }
            },
            rattling_snow_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Написал бóльшую часть сложного кода",
                    "{s:0.8}-Написал почти весь UI",
                    "{s:0.8}-Написал все шейдеры",
                    "{s:0.8}-Присоединился к команде в конце апреля 2025"
                }
            },
            jumbocarrot_credits_info = {
                name = "Инфо",
                text = {
                    "{s:0.8}-Очень помогает с исправлением багов и полировкой",
                    "{s:0.8}-Серьёзно, так много исправлений багов",
                    "{s:0.8}-Основной тестировщик",
                    "{s:0.8}-Присоединился к команде в сентябре 2025"
                }
            },
        }
    }
}