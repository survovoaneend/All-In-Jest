return {
    misc = {
        dictionary = {
            k_coder_badge = "代码作者",
            k_artist_badge = "美术",
            k_moon = "卫星",
            k_moon_q = "卫星？",
            k_star = "恒星",
            k_tag = "标签",
            k_star_q = "恒星？",
            k_asteroid = "小行星",
            k_tarot_q = "塔罗牌？",
            k_active = "激活",
            k_inactive = "未激活",
            aij_requires_restart = "需要重启",
            aij_doesnt_requires_restart = "无需重启",
            aij_upgraded_tags = "黄金标签",
            aij_enable_moons = "启用卫星卡",
            aij_enable_moons_tooltip = {
                '会出现{C:chips}筹码{}和{C:mult}倍率{}型{C:planet}星球牌'
            },
            aij_alter_trypophobia = "替换“密集恐惧症”卡面",
            aij_alter_trypophobia_tooltip = {
                '{C:attention}替换{C:attention}密集恐惧症{}的卡面',
                '为{C:attention}没那么恶心{}的版本'
            },
            aij_no_copy_neg = "复制负片游戏牌",
            aij_no_copy_neg_tooltip = {
                '复制{C:dark_edition}负片{C:attention}游戏牌{}会保留其版本',
                '若为{C:attention}关闭{}（默认）',
                '{C:dark_edition}负片{}牌被复制时会{C:red}去除{}版本'
            },
            aij_blue_stake_rework = '蓝注重制',
            aij_blue_stake_rework_tooltip = {
                '{C:attention}重制{}蓝注限制',
                '使其使用新的{C:attention}坑洞盲注',
                '而非弃牌次数{C:red}-1'
            },
            aij_lite = 'All in Jest 极速版',
            aij_lite_tooltip = {
                '仅启用一众精心挑选的',
                '最{C:attention}贴合原版{}的内容',
                '{s:0.8,C:inactive}（当前为76个项目）'

            },
            aij_red_destroy_text = "修改小丑牌描述",
            aij_red_destroy_text_tooltip = {
                '将所有{C:attention}原版{}及',
                '{C:attention}模组{}卡牌描述中的',
                '“摧毁”字样改为{C:red}红色',
                '{s:0.8,C:inactive}（可能会对其他模组的',
                '{s:0.8,C:inactive}提示文本造成负面影响）'
            },
            aij_random_deck_skins = '随机牌组皮肤',
            aij_random_deck_skins_tooltip = {
                '加入牌组的{C:attention}游戏牌',
                '会带有随机{C:attention}牌组皮肤'
            },
            aij_guess_names = '笑语猜谜包显示名称',
            aij_guess_names_tooltip = {
                '{C:purple}笑语猜谜包{}内的小丑牌',
                '会揭示其名称',
                '{s:0.8,C:inactive}（描述文本仍不会显示）'
            },
            k_aij_guess_the_jest = "笑语猜谜",
            k_aij_memory_card = "Memorized!", -- Memory Card, currently unused
            aij_plus_tag = "标签+1", -- Various jokers
            aij_refreshed = '焕然一新', -- Office Assistant (When fixing a perishable sticker)
            aij_paid_off = '租金结清', -- Office Assistant (When fixing a rental sticker)
            k_aij_polychrome_ex = '多彩！', -- Colour Test
            k_aij_foiled_again = '闪箔！', -- Bad Guy
            k_aij_p_arcana = "秘术包+1", -- Witchfinder
            k_aij_merry_christmas = "圣诞快乐！", -- Elf
            k_aij_change_ex = '变色！', -- Read 'em and Weep (when cards change suit)
            k_aij_blood_spilt_ex = '抛洒热血！', -- Blood Artist
            k_aij_double_ex = '双倍！', -- Taggart
            k_aij_triple_ex = '三倍！', -- Toto Legendary
            k_aij_chaos_ex = '混沌！', -- Chaotic modifier
            k_aij_two_into_one_ex = '合二为一！', -- Mycologists
            k_aij_plus_two_moons = "卫星牌+2", -- Sky Trees
            k_aij_does_not_score_ex = "不计分！", -- Opening Move
            k_aij_create = "生成" -- Nonstandard tag

        },
        v_dictionary = {
            a_aij_exp_mult = "^#1#倍率",

            a_aij_mult_equal = "=#1#倍率",

            a_aij_ante_minus = "-#1#底注",

            a_aij_win_ante_plus = "获胜需求底注+#1#",

            a_aij_percent_balance = "+%#1#",
            a_aij_percent_balance_minus = "-%#1#",

            a_aij_hands_minus = "-#1#出牌次数",

            a_aij_joker_slots = '+#1#小丑牌槽位',
            a_aij_joker_slots_minus = '-#1#小丑牌槽位',

            a_aij_odds = "+#1#几率",

            a_aij_jokers = "+#1#小丑",
        },
        challenge_names = {
            c_aij_bananarama = "Bananarama",
            c_aij_sharpest_tool = "至利之器",
            c_aij_the_pit = "天坑",
        },
        v_text = {
            -- Challenges
            ch_c_aij_sharpest_tool_1 = {
                '{C:attention}商店{}及{C:attention}小丑包{}中',
            },
            ch_c_aij_sharpest_tool_2 = {
                '仅会出现{C:common}普通{}小丑牌'
            },
            ch_c_aij_all_pit_blinds = {
                '底注1后的所有常规Boss盲注均为{C:attention}坑洞盲注'
            },
        },
        extra_joker_dictionary = {
            -- You've got Mail (also reused in overdesigned)
            k_aij_youve_got_mail = "您有一封新邮件！",
            k_aij_youve_got_mail_goodbye = "再见",
            k_aij_youve_got_mail_none = "啥用也没有……",
            k_aij_youve_got_mail_plus_prefix = "+",
            k_aij_youve_got_mail_dollar_prefix = "$",
            k_aij_youve_got_mail_xmult_prefix = "X",
            k_aij_youve_got_mail_mult_text = "倍率",
            k_aij_youve_got_mail_chip_text = "筹码",
            k_aij_youve_got_mail_dollars_text = "每次出牌",
            -- Overdesigned
            k_aij_overdesigned_give_prefix = "给予",
            k_aij_overdesigned_earn_prefix = "赚取",
            k_aij_overdesigned_heart = "红桃",
            k_aij_overdesigned_club = "梅花",
            k_aij_overdesigned_spade = "黑桃",
            k_aij_overdesigned_diamond = "方片",
            -- Jerko
            k_aij_jerko_retrigger = "重新触发",
            k_aij_jerko_times = "次",
            -- Blacklist
            k_aij_blacklist_empty = '暂无',
            k_aij_blacklist_and = '还有',
            k_aij_blacklist_more = '项未显示',
        },
        labels = {
            -- Editions
            aij_glimmer = "闪粉",
            aij_silver = "银幕",
            aij_stellar = "星辰",
            aij_aureate = "鎏金",
            aij_torn = "撕损",
            -- Stickers
            aij_marked = "标记",
            aij_unusual_doubled = "翻倍",
            aij_recherche_doubled = "翻倍",
            -- Seals
            aij_smiley_seal = "微笑蜡封",
            aij_melted_seal = "融化蜡封",
            -- Other
            aij_jest_chaotic_card = "混沌", -- Treated internally as a sticker
        },
        poker_hands = {
            ['aij_Royal Flush'] = "皇家同花顺",
        },
        poker_hand_descriptions = {
            ['aij_Royal Flush'] = {
                "点数连续，花色相同",
                "且最小牌为10的5张牌"
            },
        },
        tutorial = {
            k_aij_line1 = { "嘿。" },
            k_aij_line2 = { "你已经玩了", "有一会儿了，", "我寻思……" },
            k_aij_line3 = { "要不咱们", "梭哈了得了？" },
        }
    },
    descriptions = {
        Back = {
            b_aij_fabled = {
                name = '传说牌组',
                text = {
                    '{C:attention}商店{}内可能出现',
                    '{C:legendary,E:1}传奇{}小丑牌',
                    '小丑牌槽位{C:attention}-1'
                },
                unlock = {
                    '解锁一张{C:legendary,E:1}传奇{}小丑牌',
                }
            },
            b_aij_fabled_hidden = {
                name = '传说牌组',
                text = {},
                unlock = {
                    '解锁一张{C:legendary,E:1}传奇{}小丑牌',
                }
            },
            b_aij_branching = {
                name = '岔路牌组',
                text = {
                    '跳过盲注奖励为',
                    '标签{C:attention}三选一',
                },
                unlock = {
                    '单赛局中',
                    '跳过至少{C:attention}5{}个盲注'
                }
            },
            b_aij_branching_hidden = {
                name = '岔路牌组',
                text = {},
                unlock = {
                    '单赛局中',
                    '跳过至少{C:attention}5{}个盲注'
                }
            },
            b_aij_patchwork = {
                name = '拼布牌组',
                text = {
                    '所有游戏牌将{C:attention}自带',
                    '{C:attention}随机{}的花色补丁'
                },
                unlock = {
                    '同时拥有至少{C:attention}13{}张',
                    '带有{C:attention}花色补丁{}的牌'
                }
            },
            b_aij_patchwork_hidden = {
                name = '拼布牌组',
                text = {},
                unlock = {
                    '同时拥有至少{C:attention}13{}张',
                    '带有{C:attention}花色补丁{}的牌'
                }
            }
        },
        Stake = All_in_Jest.config.blue_stake_rework and {
            stake_blue = {
                name = "蓝注",
                text = {
                    '底注{C:attention}4{}或{C:attention}5{}的',
                    'Boss盲注将为坑洞盲注',
                    '{s:0.8}前序所有赌注的限制也都起效'
                }
            },
        } or {},
        Partner = {
            pnr_aij_simply = {
                name = "凡凡",
                text = {
                    "回合结束时",
                    "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
                },
                unlock = {
                    "携带{C:attention}平平凡凡",
                    "赢下{C:attention}金注",
                },
            },
            pnr_aij_fourwarning = {
                name = "警四",
                text = {
                    "若弃牌包含{C:attention}4",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
                },
                unlock = {
                    "携带{C:attention}恐四症",
                    "赢下{C:attention}金注",
                },
            },
            pnr_aij_nellie = {
                name = "负人",
                text = {
                    "{C:dark_edition}负片{}小丑牌",
                    "出现频率{C:attention}X#1#",
                },
                unlock = {
                    "携带{C:attention}负片妇人",
                    "赢下{C:attention}金注",
                },
            },
            pnr_aij_scratch = {
                name = "Scratch",
                text = {
                    '{C:attention}Retriggers{} leftmost',
                    '{C:attention}#1#{} rightmost Joker',
                    'on {C:blue}odd{} {C:attention}rounds'
                },
                unlock = {
                    "Win a run with",
                    "{C:attention}Doodle{} on",
                    "{C:attention}Gold Stake{} difficulty",
                },
            },
            pnr_aij_banger = {
                name = "烤肠",
                text = {
                    '{C:green}重掷{}费用减少{C:money}$#1#',
                    '{C:inactive}（最低为{C:money}$0{C:inactive}）'
                },
                unlock = {
                    "携带{C:attention}呆呆肠",
                    "赢下{C:attention}金注",
                },
            },
            pnr_aij_flub = {
                name = "完犊子",
                text = {
                    '{C:attention}永恒{}小丑牌',
                    '均为{C:money}#1#'
                },
                unlock = {
                    "携带{C:attention}错",
                    "赢下{C:attention}金注",
                },
            },
        },
        Sleeve = {
            sleeve_aij_fabled = {
                name = "传说牌套",
                text = {
                    '{C:attention}商店{}内可能出现',
                    '{C:legendary,E:1}传奇{}小丑牌',
                    '小丑牌槽位{C:attention}-1'
                }
            },
            sleeve_aij_fabled_alt = {
                name = "传说牌套",
                text = {
                    '{C:legendary,E:1}传奇{}小丑牌',
                    '将{C:attention}更加常见'
                },
            },
            sleeve_aij_branching = {
                name = "岔路牌套",
                text = {
                    '跳过盲注奖励为',
                    '标签{C:attention}三选一',
                }
            },
            sleeve_aij_branching_alt = {
                name = "岔路牌套",
                text = {
                    '跳过盲注奖励标签',
                    '额外提供{C:attention}2{}个选项'
                },
            },
            sleeve_aij_patchwork = {
                name = "拼布牌套",
                text = {
                    '所有游戏牌将{C:attention}自带',
                    '{C:attention}随机{}的花色补丁'
                }
            },
            sleeve_aij_patchwork_alt = {
                name = "拼布牌套",
                text = {
                    '所有游戏牌将{C:attention}自带',
                    '{C:attention}随机两个{}花色补丁'
                },
            },
        },
        Blind = {
            --Normal Blinds
            bl_aij_the_beith = {
                name = "檴",
                text = {
                    '所有方片牌最后抽取'
                },
            },
            bl_aij_the_elm = {
                name = "榆",
                text = {
                    '所有梅花牌最后抽取'
                },
            },
            bl_aij_the_alder = {
                name = "桤",
                text = {
                    '所有红桃牌最后抽取'
                },
            },
            bl_aij_the_willow = {
                name = "柳",
                text = {
                    '所有黑桃牌最后抽取'
                },
            },
            bl_aij_the_branch = {
                name = "枝",
                text = {
                    '所有人头牌最后抽取'
                },
            },
            bl_aij_the_horror = {
                name = "恐惧",
                text = {
                    '消耗最后一次出牌时',
                    "对随机一张小丑牌施加易腐"
                },
            },
            bl_aij_the_oak = {
                name = "橡",
                text = {
                    '削弱最右侧的小丑牌',
                },
            },
            bl_aij_the_ingot = {
                name = "锭",
                text = {
                    '消耗最后一次出牌后',
                    '对所有小丑牌施加永恒'
                },
            },
            bl_aij_the_hazel = {
                name = "榛",
                text = {
                    "击败盲注后",
                    "对随机一张小丑牌施加租用", -- Can be simplified to just "Apply Rental"
                },
            },
            bl_aij_the_apple = {
                name = "苹果",
                text = {
                    '若首次出牌即击败盲注',
                    '摧毁最左侧的小丑牌'
                },
            },
            bl_aij_the_neck = {
                name = "脖颈",
                text = {
                    '每次仅能弃置1张牌'
                },
            },
            bl_aij_the_groan = {
                name = "哀嚎",
                text = {
                    '出牌后得分要求+1X基础分值',
                },
            },
            bl_aij_the_ash = {
                name = "尘埃",
                text = {
                    '完整牌组中每有一张牌点数小于#1#',
                    '得分要求+0.2X基础分值',
                },
            },
            bl_aij_the_clay = {
                name = "黏土",
                text = {
                    '得分要求随机增大的盲注',
                },
            },
            bl_aij_the_aspen = {
                name = "山杨",
                text = {
                    '当前底注内每击败一个盲注',
                    '基础得分要求+2X'
                },
            },
            bl_aij_the_evergreen = {
                name = "常青",
                text = {
                    '完整牌组每超过#1#一张',
                    '基础得分要求+0.2X',
                },
            },
            bl_aij_the_enigma = {
                name = "谜",
                text = {
                    '增强牌最后抽取',
                },
            },
            bl_aij_the_bullion = {
                name = "金条",
                text = {
                    '每出一张增强牌-$5'
                },
            },
            bl_aij_the_elbow = {
                name = "肘",
                text = {
                    '随机变更所出增强牌的增强',
                },
            },
            bl_aij_the_thorn = {
                name = "棘",
                text = {
                    '削弱所有增强牌'
                },
            },
            bl_aij_the_twin = {
                name = "双子",
                text = {
                    '所抽的增强牌背面朝上'
                },
            },
            bl_aij_the_giant = {
                name = "巨人",
                text = {
                    '超级巨大盲注',
                    '出牌次数+2'
                },
            },
            bl_aij_the_auroch = {
                name = "原牛",
                text = {
                    '所有#1#及#2#',
                    '背面朝上抽取'
                },
            },
            bl_aij_the_journey = {
                name = "远游",
                text = {
                    '本回合若有#1#牌计分',
                    '获胜底注+1'
                },
            },
            bl_aij_the_gift = {
                name = "馈赠",
                text = {
                    "资金归零",
                    "每出或弃一张牌赚取$1"
                },
            },
            bl_aij_the_ancestor = {
                name = "先祖",
                text = {
                    '无法打出本回合弃过的牌型'
                },
            },
            bl_aij_the_god = {
                name = "神祗",
                text = {
                    '所有牌必须计分'
                },
            },
            bl_aij_the_beast = {
                name = "饕餮",
                text = {
                    '击败本盲注后',
                    '摧毁所有食物小丑'
                },
            },
            bl_aij_the_ulcer = {
                name = "溃疡",
                text = {
                    "出牌及弃牌次数各-1"
                },
            },
            bl_aij_the_need = {
                name = "渴求",
                text = {
                    "资金低于$20时出牌无法计分"
                },
            },
            bl_aij_the_day = {
                name = "天日",
                text = {
                    '出牌必须包含红桃或方片'
                },
            },
            bl_aij_the_celebration = {
                name = "庆典",
                text = {
                    '当前底注内每有一次出/弃牌未使用',
                    '基础得分要求+0.2X'
                },
            },
            bl_aij_the_storm = {
                name = "风暴",
                text = {
                    '若出牌大于2张',
                    '摧毁所有出牌'
                },
            },
            bl_aij_the_frost = {
                name = "霜",
                text = {
                    '出牌后随机摧毁一张手牌'
                },
            },
            bl_aij_the_yew = {
                name = "紫杉",
                text = {
                    '削弱所有奇数点卡牌'
                },
            },
            bl_aij_the_hoard = {
                name = "冗积",
                text = {
                    '本底注的溢出得分',
                    '叠加至本盲注的得分要求',
                },
            },
            bl_aij_the_pear = {
                name = "梨",
                text = {
                    '出牌计分后',
                    '随机变动手牌的花色和点数'
                },
            },
            bl_aij_the_elk = {
                name = "驼鹿",
                text = {
                    '无法打出当前底注已出过的牌型'
                },
            },
            bl_aij_the_birch = {
                name = "桦",
                text = {
                    '削弱所有偶数点卡牌'
                },
            },
            bl_aij_the_sun = {
                name = "太阳",
                text = {
                    '黑桃和梅花牌',
                    '抽取时背面朝上'
                },
            },
            bl_aij_the_spear = {
                name = "长矛",
                text = {
                    '永久削弱每张致胜出牌'
                },
            },
            bl_aij_the_steed = {
                name = "骏马",
                text = {
                    '出牌后削弱手牌'
                },
            },
            bl_aij_the_figure = {
                name = "塑像",
                text = {
                    '出牌不可包含大于2张人头牌'
                },
            },
            bl_aij_the_lake = {
                name = "湖泊",
                text = {
                    '本底注打出过的牌最后抽取'
                },
            },
            bl_aij_the_field = {
                name = "田野",
                text = {
                    '弃掉#1#张牌前',
                    '削弱所有牌'
                },
            },
            bl_aij_the_wound = {
                name = "创口",
                text = {
                    '耗尽弃牌次数前',
                    '出牌无法计分'
                },
            },
            bl_aij_the_brimstone = {
                name = "硫磺",
                text = {
                    '每弃牌一次，资金减半'
                },
            },
            bl_aij_the_blush = {
                name = "红晕",
                text = {
                    '单次弃牌必须满5张'
                },
            },
            --Pit Blinds
            bl_aij_the_heart = {
                name = "心",
                text = {
                    '打出一手#1#前',
                    '出牌无法计分'
                },
            },
            bl_aij_the_rains = {
                name = "雨",
                text = {
                    '赢下盲注的出牌',
                    '失去所有增强、版本及蜡封'
                },
            },
            bl_aij_the_child = {
                name = "子",
                text = {
                    '所有计分牌的点数降低1'
                },
            },
            bl_aij_the_moon = {
                name = "月",
                text = {
                    '削弱奇数次出牌中的所有牌'
                },
            },
            bl_aij_the_shell = {
                name = "贝",
                text = {
                    '#1#/#2#几率，削弱卡牌',
                    '#3#/#4#几率，卡牌背面朝上抽取'
                },
            },
            bl_aij_the_earth = {
                name = "土",
                text = {
                    '计分后',
                    '将所有手牌增强为石头牌'
                },
            },
            bl_aij_the_dragon = {
                name = "龙",
                text = {
                    '手牌耗尽前无法抽牌',
                },
            },
            bl_aij_the_mountain = {
                name = "山",
                text = {
                    '极大盲注',
                    '手牌上限+1'
                },
            },
            bl_aij_the_conflagration = {
                name = "焚",
                text = {
                    '击败盲注后',
                    '摧毁当次出牌及所有手牌'
                },
            },
            bl_aij_the_umbilical = {
                name = "巳",
                text = {
                    '每次出牌随机标记一张牌',
                    '使其无法打出或弃掉'
                },
            },
            bl_aij_the_divine = {
                name = "天",
                text = {
                    '出牌必须包含增强牌'
                },
            },
            bl_aij_the_bird = {
                name = "鸟",
                text = {
                    '计分前随机移动1张小丑牌'
                },
            },
            bl_aij_the_arrow = {
                name = "矢",
                text = {
                    '每次出牌得分',
                    '必须超过前序出牌得分'
                },
            },
            bl_aij_the_brilliance = {
                name = "斤",
                text = {
                    '必须达到得分需求两次',
                    '出牌次数+2',
                },
            },
            -- Finisher Blinds
            bl_aij_obsidian_blade = {
                name = "黑曜剑刃",
                text = {
                    '出牌次数-1',
                    '弃牌次数-1',
                    '手牌上限-1',
                    '超大盲注'
                },
            },
            bl_aij_aureate_coin = {
                name = "鎏金硬币",
                text = {
                    '当前底注中每花费$1',
                    '基础得分要求+0.1X'
                },
            },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "热忱牌",
                text = {
                    "计分时，{C:chips}+#2#{}筹码"
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
                name = "充能牌",
                text = {
                    "与此牌一同{C:attention}打出",
                    "或{C:attention}留手{}的卡牌",
                    "{C:attention}增强{}效果{C:attention}+#1#%"
                }
            },
            m_aij_ice = {
                name = "寒冰牌",
                text = {
                    "{C:attention}强制{}计分",
                    "{C:red}无视{}选牌张数限制",
                    "{C:inactive}溢出的寒冰牌不影响牌型"
                }
                -- Hope this works a little better
            },
            m_aij_wood = {
                name = "木头牌",
                text = {
                    '在手牌中时，{C:chips}+#3#{}筹码',
                    '手牌中每另有一张{C:attention}木头{}牌',
                    '额外{C:chips}+#2#{}',
                    '{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）'
                }
            },
            m_aij_simulated = {
                name = "模拟牌",
                text = {
                    '每回合{C:attention}首次{}打出后',
                    '{C:attention}退回{}手牌'
                }
            },
            m_aij_canvas = {
                name = "画布牌",
                text = {
                    '{C:attention}复制右侧{}卡牌的',
                    '点数和花色'
                }
            },
        },
        Voucher = {
            v_aij_fairy_dust = {
                name = "魔仙粉尘",
                text = {
                    "{C:dark_edition}闪粉{}、{C:dark_edition}银幕{}和{C:dark_edition}星辰{}牌",
                    "出现频率{C:attention}X#1#",
                },
            },
            v_aij_live_pixie = {
                name = "精灵现世",
                text = {
                    "{C:dark_edition}闪粉{}、{C:dark_edition}银幕{}和{C:dark_edition}星辰{}牌",
                    "出现频率{C:attention}X#1#",
                },
            },
            v_aij_gold_medal = {
                name = "金牌",
                text = {
                    "{C:money}黄金{}标签的",
                    "出现频率{C:attention}X#1#",
                },
            },
            v_aij_trophy = {
                name = "纯金奖杯",
                text = {
                    "{C:attention}大盲注{}的跳过奖励标签",
                    "有{C:green}#1#/#2#{}的几率为{C:money}黄金"
                },
            },
            v_aij_sticker_sheet = {
                name = "贴纸集",
                text = {
                    '{C:attention}削减{C:red}负面{C:attention}贴纸',
                    '的效果'
                },
            },
            v_aij_polkadot = {
                name = "波点艺术",
                text = {
                    '{C:attention}削减{C:red}负面{C:attention}贴纸',
                    '的效果'
                },
            },
        },
        Edition = {
            e_aij_negative_playing_card = {
                name = "负片",
                text = {
                    "手牌上限{C:dark_edition}+#1#",
                    "{C:inactive}（若复制，失去版本）"
                },
            },
            e_aij_glimmer = {
                name = "闪粉",
                text = {
                    "{C:aij_plasma}平衡{C:chips}筹码{}和",
                    "{C:mult}倍率{}的{C:attention}#1#%"
                }
            },
            e_aij_silver = {
                name = "银幕",
                text = {
                    "效果{C:attention}X#1#"
                }
            },
            e_aij_stellar = {
                name = "星辰",
                text = {
                    "出牌牌型每有1{C:attention}级",
                    "{C:chips}+#1#{}筹码，{C:mult}+#2#{}倍率"
                }
            },
            e_aij_aureate = {
                name = "鎏金",
                text = {
                    "{X:money,C:white}X#1# {C:money}$",
                    "{C:inactive}（至多{C:money}$#2#{C:inactive}）"
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
                    '{C:inactive}"This space intentionally',
                    '{C:inactive}left blank"',
                },
            },
            j_aij_survivalaren_credits_joker = {
                name = "Survivalaren",
                text = {
                    '{C:inactive}"Take it sleazy"'
                },
            },
            j_aij_rattling_snow_credits_joker = {
                name = "RattlingSnow353",
                text = {
                    '{C:inactive}"Jack of all trades, master of',
                    '{C:inactive}none, though oftentimes better',
                    '{C:inactive}than a master of one."'
                },
            },
            j_aij_jumbocarrot_credits_joker = {
                name = "Jumbocarrot",
                text = {
                    '{C:inactive}"Hi Alex"'
                },
            },
            j_aij_heavenbrand_credits_joker = {
                name = "HEAVENBRAND",
                text = {
                    '{C:inactive}"As they say in France,',
                    '{C:inactive}\'I\'ll take two.\'"'
                },
            },
            -- Jokers
            j_aij_flying_ace = {
                name = "王牌飞行员",
                text = {
                    "单回合内计分的{C:attention}A",
                    "每有一种{C:attention}花色",
                    "回合结束时获得{C:money}$#1#",
                    "{C:inactive}（当前为{C:money}$#2#{C:inactive}）"
                },
            },
            j_aij_lucky_seven = {
                name = "幸运七号",
                text = {
                    "将所有计分的无增强{C:attention}7",
                    "增强为{C:attention}幸运牌"
                },
            },
            j_aij_you_broke_it = {
                name = "你把它搞坏了！",
                text = {
                    "将每张计分且无增强的{C:attention}#1#",
                    "增强为{C:attention}#2#{}",
                    "{s:0.8}每回合结束时",
                    "{s:0.8}改变点数和增强"
                },
            },
            j_aij_birthday_clown = {
                name = "生日小丑",
                text = {
                    "{X:mult,C:white}X#1#{}倍率，持续{C:attention}1{}回合",
                    "每{C:attention}底注{}激活一次",
                    "{C:inactive}#2#"
                },
            },
            j_aij_memory_card = {
                name = "Memory Card",
                text = {
                    "If first hand of round",
                    "is exactly {C:attention}1{} card,",
                    "{C:attention}draw{} it {C:attention}first{}",
                    "in future Blinds",
                    "{C:inactive}(Can only store one card)",
                    "{C:inactive}(Only triggers in leftmost position)"
                    -- Joker's description still a bit too long;
                    -- also, TODO leftmost limitation looks removable with work
                }
            },
            j_aij_sleepy_joker = {
                name = "瞌睡小丑",
                text = {
                    "若出牌花色仅包含",
                    "{C:spades}黑桃{}和{C:clubs}梅花",
                    "{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_invisible_man = {
                name = "隐形人",
                text = {
                    "所有{C:attention}人头牌{}同时视作",
                    "{C:attention}K{}、{C:attention}Q{}和{C:attention}J",
                    "{C:inactive}（对牌型判定无效）"
                }
            },
            j_aij_handsome_joker = {
                name = "帅小丑",
                text = {
                    "{C:attention}完整牌组{}中",
                    "每有一张{C:attention}#2#",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）",
                    -- BUG: Fails to mention how it changes
                }
            },
            j_aij_whiteface_grotesque = {
                name = "白面怪诞",
                text = {
                    "出牌时，{C:attention}手牌中{}每有一张{C:attention}人头{}牌",
                    "本牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                }
            },
            j_aij_the_clown_show = {
                name = "老丑记",
                text = {
                    "本赛局内每购买过一张{C:attention}小丑牌",
                    "本牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
                }
            },
            j_aij_little_devil = {
                name = "小恶魔",
                text = {
                    "{C:attention}跳过盲注{}后",
                    "生成一个{C:attention}标准{}，{C:tarot}吊饰{}，",
                    "{C:planet}流星{}，{C:spectral}空灵{}或{C:red}小丑{C:attention}标签"
                },
            },
            j_aij_pierrot = {
                name = "皮埃罗",
                text = {
                    "手牌中的{C:attention}数字{}牌",
                    "给予与数字相等的{C:chips}筹码"
                }
            },
            j_aij_hat_trick = {
                name = "帽子戏法",
                text = {
                    "若打出{C:attention}三条",
                    "每张计分牌给予",
                    "等同于牌型{C:attention}等级{}的{C:mult}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_aij_squeezy_pete = {
                name = "捏捏皮皮",
                text = {
                    "每次{C:attention}连续{}打出{C:attention}葫芦{}时",
                    "本牌获得{X:mult,C:white}X#1#{}倍率",
                    "若中断则重置",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                },
            },
            j_aij_infinite_jest = {
                name = "博稽长空",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "升级{C:attention}所有牌型"
                }
            },
            j_aij_bloody_mary = { name = "血腥玛丽", text = { "" } },
            j_aij_trypophobia = {
                name = "密集恐惧症",
                text = {
                    "若出牌仅包含{C:attention}8",
                    "{C:mult}+#1#{}倍率"
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
                name = "负片妇人",
                text = {
                    "{C:attention}商店{}内{C:dark_edition}负片{}小丑牌的",
                    "出现频率{C:attention}X#1#"
                },
            },
            j_aij_old_joker = {
                name = "老丑",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "本牌获得{C:chips}+#2#{}筹码和{C:mult}+#4#{}倍率",
                    "{C:inactive,s:0.8}（当前为{C:chips,s:0.8}+#1#{C:inactive,s:0.8}筹码，{C:mult,s:0.8}+#3#{C:inactive,s:0.8}倍率）",
                    "{C:inactive,s:0.8}（恒为永恒）"
                }
            },
            j_aij_imageboard = {
                name = "贴图讨论版",
                text = {
                    "每张牌{C:attention}计分{}时",
                    "每有一张已在同次出牌中",
                    "被{C:attention}计分{}的同{C:attention}点数{}牌",
                    "给予{C:mult}+#1#{}倍率",
                    "{C:inactive}（例如{C:attention}2 2 2{C:inactive} -> {C:mult}+#1#{C:inactive}，{C:mult}+#2#{C:inactive}，{C:mult}+#3#{C:inactive}）"
                }
            },
            j_aij_carousel = {
                name = "旋转木马",
                text = {
                    "出牌{C:attention}计分{}后",
                    "{C:attention}轮转{}其花色",
                    "{C:inactive,s:0.8}（黑桃 -> 红桃 -> 梅花 -> 方片）"
                }
            },
            j_aij_slippery_when_wet = { name = "Slippery When wet", text = { "" } },
            j_aij_founding_father = {
                name = "天雷即电",
                text = {
                    "{C:attention}充能牌{}效果{C:attention}翻倍"
                }
            },
            j_aij_scary_story = {
                name = "恐怖故事",
                text = {
                    "{C:attention}标准包{}中的",
                    "基础版本游戏牌",
                    "有{C:green}#1#/#2#{}的几率",
                    "变为{C:dark_edition}负片"
                },
            },
            j_aij_doodle = {
                name = "信手涂鸦",
                text = {
                    "每{C:attention}回合{}开始时，有{C:green}#1#/#2#{}的几率",
                    "复制{C:attention}左右紧邻{}的两张小丑牌",
                    "直至{C:attention}回合{}结束",
                    "{C:inactive}#3#"
                },
            },
            j_aij_joqr = { name = "Joqr", text = { "" } },
            j_aij_greasepaint = {
                name = "化装油彩",
                text = {
                    {
                        "削弱相邻{C:attention}小丑牌"
                    },
                    {
                        "被削弱的{C:attention}小丑牌",
                        "和{C:attention}游戏牌{}给予{X:mult,C:white}X#1#{}倍率"
                    }
                }
            },
            j_aij_public_bathroom = {
                name = "公共厕所",
                text = {
                    "打出的{C:attention}同花{}中",
                    "每有一张计分的{C:attention}2",
                    "本牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                },
            },
            j_aij_diogenes = { name = "Diogenes", text = { "" } },
            j_aij_blank_card = {
                name = "空白牌",
                text = {
                    "每次从{C:attention}标准包{}中",
                    "选得{C:attention}游戏牌{}时",
                    "生成一张完全{C:attention}复制"
                },
            },
            j_aij_comedians_manifesto = {
                name = "同乐党宣言",
                text = {
                    "{C:attention}标准包{}中的{C:attention}K{}和{C:attention}Q{}",
                    "均变为{C:attention}J"
                }
            },
            j_aij_circuit_board = { name = "Circuit Board", text = { "" } },
            j_aij_platinum_chip = { name = "Platinum Chip", text = { "" } },
            j_aij_cctv = {
                name = "闭路电视",
                text = {
                    "{C:attention}玻璃牌破碎{}时获得{C:money}$#1#",
                    "并将随机一张手牌",
                    "增强为{C:attention}玻璃牌"
                }
            },
            j_aij_pell_mel = {
                name = "花里胡哨",
                text = {
                    "{X:mult,C:white}X1{}倍率",
                    "{C:attention}出牌{}中每有{C:attention}一种{}花色",
                    "额外给予{X:mult,C:white}X#1#{}倍率",
                    -- TODO add "Currently"
                }
            },
            j_aij_pput_together = { name = "Put Together", text = { "" } },
            j_aij_krampus = {
                name = "坎卜斯",
                text = {
                    {
                        "{C:attention}黄金牌{}计分后",
                        "变为{C:attention}石头牌",
                    },
                    {
                        "{C:attention}石头牌{}计分后",
                        "赚取{C:money}$#1#"
                    }
                },
            },
            j_aij_art_of_the_deal = {
                name = "交易的艺术",
                text = {
                    "赚取{C:money}资金{}时，获得{C:mult}+#2#{}倍率",
                    "资金为{C:money}$#3#{}或更少时重置",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
                }
            },
            j_aij_word_art = {
                name = "文字艺术",
                text = {
                    "{X:mult,C:white}X1{}倍率",
                    "出牌中每有一张",
                    "{C:attention}A{}，{C:attention}K{}，{C:attention}Q{}或{C:attention}J",
                    "额外累加{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_atom = {
                name = "原子",
                text = {
                    "若出牌仅包含一张{C:attention}A",
                    "升级{C:attention}高牌"
                },
            },
            j_aij_plain_jane = {
                name = "泯然众人",
                text = {
                    "{C:attention}无增强{}牌计分时",
                    "给予{C:mult}+#1#{}倍率"
                },
            },
            j_aij_paper_bag = {
                name = "套头纸袋",
                text = {
                    "{C:red}弃掉{}的牌型每有1{C:attention}级",
                    "本牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                }
            },
            j_aij_fruity_joker = {
                name = "硕果小丑",
                text = {
                    "每张带有{C:attention}多彩{}的",
                    "游戏牌和小丑牌",
                    "给予{C:mult}+#1#{}倍率"
                }
            },
            j_aij_jokia = { name = "丑基亚", text = { "" } },
            j_aij_the_mycologists = {
                name = "真菌学家",
                text = {
                    "若出牌恰为{C:attention}#1#",
                    "{C:red}摧毁{}右侧的牌，并将其",
                    "{C:chips}筹码{}、{C:dark_edition}增强{}和{C:dark_edition}版本",
                    "给予左侧的牌"
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
                name = "四眼仔",
                text = {
                    "出牌中每有一张{C:attention}4",
                    "计分的{C:attention}4{}给予{C:mult}+#1#{}倍率"
                }
            },
            j_aij_punk_joker = {
                name = "朋克小丑",
                text = {
                    "若出牌中有计分的{C:attention}万能牌",
                    "将一张无增强的计分牌",
                    "增强为{C:attention}万能牌"
                },
            },
            j_aij_slim_joker = {
                name = "瘦长小丑",
                text = {
                    "{C:mult}+#1#{}倍率",
                    "出牌每有一张，{C:mult}-#2#{}倍率"
                }
            },
            j_aij_wireframe = {
                name = "线框图",
                text = {
                    "每回合打出的{C:attention}第一手{}牌",
                    "{C:attention}退回手牌",
                }
            },
            j_aij_soviet = {
                name = "苏维埃",
                text = {
                    "若{C:attention}出牌{}没有",
                    "{C:attention}皇帝{}或{C:attention}皇后",
                    "{C:mult}+#1#{}倍率"
                }
            },
            j_aij_mustachio = { name = "Mustachio", text = { "" } },
            j_aij_penny = {
                name = "一便士",
                text = {
                    "带有{C:money}金色蜡封{}的牌",
                    "有{C:green}#1#/#2#{}的几率{C:attention}重新触发"
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
                name = "呆呆肠",
                text = {
                    "{C:green}重掷{}花费{C:money}-$#1#",
                    "回合结束时{C:attention}减少{C:money}$#2#"
                }
            },
            j_aij_joker_baby = { name = "Joker Baby", text = { "" } },
            j_aij_anchor = {
                name = "船锚",
                text = {
                    "本牌和相邻的小丑牌",
                    "{C:attention}无法{}被{C:red}摧毁"
                }
            },
            j_aij_hei_tiki = {
                name = "绿玉符",
                text = {
                    "若出牌的最终{C:chips}筹码{}数大于{C:mult}倍率",
                    "{C:attention}本牌{}获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）"
                }
            },
            j_aij_polybius = {
                name = "Polybius",
                text = {
                    "给予所出牌{C:attention}包含{}的所有牌型",
                    "对应的{C:mult}倍率{}和{C:chips}筹码",
                    -- TODO Needs "Currently"; tough to calculate
                }
            },
            j_aij_joker_sighting = { name = "Joker Sighting", text = { "" } },
            j_aij_pencil_drawing = {
                name = {
                    "铅笔画",
                },
                text = {
                    "{B:1,C:white,s:0.8}可激活能力",
                    "花费{C:money}$#1#{}，随机将一张",
                    "{C:attention}游戏牌{}加入手牌"
                }
            },
            j_aij_holy_bible = { name = "圣经", text = { "" } },
            j_aij_great_white_north = { name = "大白北", text = { "" } },
            j_aij_right_angle = {
                name = "直角",
                text = {
                    "有{C:attention}9{}计分时",
                    "对手牌中所有{C:attention}10{}计分"
                }
            },
            j_aij_adoring_joker = {
                name = "多情小丑",
                text = {
                    "{C:attention}小丑牌{}触发{C:attention}后",
                    "将{C:mult}倍率{}设为当前{C:attention}底注{}内",
                    "达到的{C:attention}最高{C:mult}倍率",
                    "{C:inactive}（当前为{C:mult}#1#{C:inactive}倍率）"
                }
            },
            j_aij_lucignolo = {
                name = "烛芯",
                text = {
                    "游戏牌被{C:attention}摧毁{}时",
                    "获得{C:money}$#1#",
                },
            },
            j_aij_scorecard = {
                name = "记分卡",
                text = {
                    "选择{C:attention}盲注{}时",
                    "将{C:attention}随机牌型{}提升{C:attention}#1#{}级"
                }
            },
            j_aij_punch_and_judy = {
                name = "潘趣与朱迪",
                text = {
                    {
                        "若{C:attention}出牌{}仅包含",
                        "{C:attention}K{}和{C:attention}Q{}各{C:attention}一张",
                        "所有计分牌均会重新触发"
                    },
                    {
                        "{C:attention}K{}和{C:attention}Q{}强制计分"
                    }
                }
            },
            j_aij_nature_tapes = {
                name = "Nature Tapes",
                text = {
                    "使用{C:mult}倍率{}型{C:planet}星球牌{}后",
                    "本牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                }
            },
            j_aij_low_priest = {
                name = "小祭司",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "出牌牌型每有一{C:attention}级",
                    "{X:mult,C:white}-X#2#{}倍率"
                }
            },
            j_aij_oil_and_water = { name = "Oil and Water", text = { "" } },
            j_aij_big_ears = { name = "Big-Ears", text = { "" } },
            j_aij_causal_absent_paranoia = { name = "Causal Absent Paranoia", text = { "" } },
            j_aij_hand_drawn = {
                name = "绘心一抽",
                text = {
                    "回合{C:attention}开始{}时，持续抽牌",
                    "直至手牌{C:attention}包含{}最常出{C:attention}牌型"
                }
            },
            j_aij_haruspex = {
                name = "内脏占卜",
                text = {
                    "{B:1,C:white,s:0.8}可激活能力",
                    "花费{C:attention}#1#{}次{C:red}弃牌",
                    "从{C:attention}牌组{}中任选{C:attention}#2#{}张牌",
                    "{C:attention}抽{}至手中"
                }
            },
            j_aij_bobblehead = { name = "Bobblehead", text = { "" } },
            j_aij_topsy_the_clown = {
                name = "小丑托普西",
                text = {
                    "将{C:chips}筹码{}和{C:mult}倍率",
                    "向上取至最近的{C:attention}回文数"
                }
            },
            j_aij_cloudwatching = { name = "Cloudwatching", text = { "" } },
            j_aij_line_in_the_sand = {
                name = "沙中画",
                text = {
                    "{C:attention}弃掉{}的牌不会洗回{C:attention}牌组",
                    "直至底注结束"
                }
            },
            j_aij_hairy_joker = { name = "Hairy Joker", text = { "" } },
            j_aij_realty_sign = {
                name = "卖房招牌",
                text = {
                    "打出{C:attention}葫芦{}后",
                    "本牌{C:money}售价{}上涨{C:money}$#1#"
                },
            },
            j_aij_bad_apple = {
                name = "Bad Apple",
                text = {
                    "若{C:attention}计分牌{}包含",
                    "{C:attention}#4#{}张{C:spades}暗{}花色牌和{C:attention}#3#{}张{C:hearts}亮{}花色牌",
                    "本牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive,s:0.8}（回合结束时变更需求数量）",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）"
                }
            },
            j_aij_dim_bulb = {
                name = "昏暗灯泡",
                text = {
                    "没有{C:uncommon}罕见{}或",
                    "{C:red}稀有{C:attention}小丑牌{}时",
                    "{X:mult,C:white}X#1#{}倍率"
                },
            },
            j_aij_blood_artist = {
                name = "以血献艺",
                text = {
                    "任何小丑牌被{C:money}售出{}或{C:attention}摧毁{}时",
                    "将当前{C:attention}盲注{}的得分要求削减{C:attention}#1#%"
                }
            },
            j_aij_null_joker = {
                name = "空无小丑",
                text = {
                    "将所有{C:green}几率{}设为{C:attention}零"
                },
            },
            j_aij_magick_joker = {
                name = "万智小丑",
                text = {
                    "打出的{V:1}#1#{}牌",
                    "给予{C:mult}+倍率{}而非{C:chips}+筹码",
                    "{C:inactive,s:0.8}（回合结束时变更花色）"
                }
            },
            j_aij_jeff_the_joker = {
                name = "小丑杰夫",
                text = {
                    '选择{C:attention}小盲注{}后',
                    '{C:red}摧毁{}其他所有小丑牌',
                    '每摧毁一张，本牌获得{X:mult,C:white}X#2#{}倍率',
                    '{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}）'
                },
            },
            j_aij_zanni = {
                name = "赞尼",
                text = {
                    "{C:attention}数字{}牌在{C:attention}计分{}时",
                    "有{C:green}#1#/#2#{}的几率",
                    "生成一张{C:tarot}塔罗{}牌"
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
                name = "看看牌，哭去吧",
                text = {
                    "若出牌包含{C:attention}顺子",
                    "计分前将所有{C:attention}出牌",
                    "转换为随机单种{C:attention}花色",
                }
            },
            j_aij_goblin_joker = {
                name = "哥布林小丑",
                text = {
                    "{C:red}弃牌{}后",
                    "额外抽{C:attention}#1#{}张牌"
                }
            },
            j_aij_string_theory = {
                name = "弦理论",
                text = {
                    "出牌对于小丑牌效果",
                    "恒视为包含{C:attention}顺子"
                }
            },
            j_aij_jesters_privelege = {
                name = "弄臣特权",
                text = {
                    "{C:attention}商店{}内可能会出现",
                    "{C:legendary}传奇{}小丑牌"
                },
            },
            j_aij_privelege_fabled = {
                name = "弄臣特权",
                text = {
                    "{C:legendary}传奇{}小丑牌",
                    "将{C:attention}更加常见",
                },
            },
            j_aij_quark = {
                name = "夸克",
                text = {
                    '若出牌仅包含{C:attention}三张点数相同',
                    '但{C:attention}花色不同{}的牌',
                    '升级{C:attention}三条'
                },
            },
            j_aij_lucky_carder = { name = "Lucky Carder", text = { "" } },
            j_aij_silver_screen = {
                name = "大银幕",
                text = {
                    "{C:attention}人头{}牌被{C:red}摧毁{}时",
                    "为随机一张{C:attention}手牌",
                    "添加{C:aij_silver}银幕"
                }
            },
            j_aij_pedrolino = {
                name = "佩德罗利诺",
                text = {
                    "{C:money}售出{}本牌以使",
                    "当前{C:attention}盲注{}的{C:attention}得分要求",
                    "削减{C:attention}#1#%"
                }
            },
            j_aij_pierrette = {
                name = "皮埃蕾特",
                text = {
                    "重新触发所有",
                    "{C:attention}卡牌弃置{}效果"
                }
            },
            j_aij_scaramouche = {
                name = "胆小丑",
                text = {
                    "若{C:attention}出牌牌型{}为{C:attention}#1#{}",
                    "{C:attention}重新触发{}所有计分牌",
                    "{C:inactive}（回合结束时变更牌型）"
                }
            },
            j_aij_clay_joker = {
                name = "陶土小丑",
                text = {
                    "复制最后被{C:red}摧毁的",
                    "小丑牌的效果"
                }
            },
            j_aij_sunny_joker = {
                name = "阳光小丑",
                text = {
                    "若出牌{C:attention}包含皇家同花顺",
                    "所有计分牌获得{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_red_wine = { name = "Red Wine", text = { "" } },
            j_aij_mute_joker = {
                name = "无言小丑",
                text = {
                    "本回合首次打出{C:attention}#1#{}后",
                    "{C:red}摧毁{}所有计分牌",
                    "{C:inactive}（回合结束时变更牌型）"
                }
            },
            j_aij_scapino = {
                name = "斯卡皮诺",
                text = {
                    "{C:money}商店{}内{C:green}重掷{}花费{C:money}+$#1#",
                    "但也会填满{C:attention}补充包"
                }
            },
            j_aij_pinhead = {
                name = "钉子头",
                text = {
                    "若{C:attention}首次出牌",
                    "即击败{C:attention}盲注",
                    "获得{C:money}$#1#"
                },
            },
            j_aij_saltimbanco = {
                name = "椅上艺生",
                text = {
                    "计分过程中",
                    "成功的{C:green}几率判定{}",
                    "给予{X:mult,C:white}X(1+n){}倍率",
                    "n为其{C:red}失败{}几率",
                    "{C:inactive}（例如：{C:green}1/4{C:inactive} -> {X:mult,C:white}X1.75{C:inactive}）"
                }
                -- Lots of "X1, plus XA Mult" wording, which feels awkward.
                -- Maybe "+XA" is shorter?
            },
            j_aij_pulcinella = { name = "Pulcinella", text = { "" } },
            j_aij_petrushka = {
                name = "木偶的命运",
                text = {
                    "给予等同于",
                    "所有{C:attention}计分牌",
                    "点数总和的{C:mult}+倍率",
                    "{C:inactive,s:0.8}（A=14，K=13，Q=12，J=11）"
                },
            },
            j_aij_void = {
                name = "空无之界",
                text = {
                    "当前{C:attention}底注{}内",
                    "若未使用{C:planet}星球{}牌",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}#2#"
                }
            },
            j_aij_kasperle = {
                name = "卡斯珀尔",
                text = {
                    "本{C:attention}底注{}中",
                    "若购买过{C:attention}优惠券",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}#2#"
                }
            },
            j_aij_tumbler = { name = "Tumbler", text = { "" } },
            j_aij_plain_packaging = { name = "Plain Packaging", text = { "" } },
            j_aij_mixel_perfect = {
                name = "半码遮面",
                text = {
                    "{C:attention}计分牌{}为{C:attention}奇数{}张时",
                    "{C:mult}+#1#{}倍率",
                },
            },
            j_aij_columbina = {
                name = "科伦比娜",
                text = {
                    "{C:aij_plasma}平衡{C:chips}筹码{}和{C:mult}倍率{}的{C:attention}#1#%",
                    "每使用一张{C:spectral}幻灵{}牌",
                    "提升{C:attention}#2#%",
                }
            },
            j_aij_j_file = {
                name = "J-File",
                text = {
                    "{C:attention}回合{}开始时，从{C:attention}牌组{}中",
                    "搜索出{C:attention}#1#{}张牌并加入手牌"
                }
            },
            j_aij_bumper_sticker = {
                name = "保险杠小丑",
                text = {
                    "打出的{C:attention}牌{}在计分时",
                    "永久获得{C:mult}+#1#{}倍率"
                }
            },
            j_aij_vesti_la_guibba = { name = "Vesti la Guibba", text = { "" } },
            j_aij_dead_president = {
                name = "先总统",
                text = {
                    "售出{C:attention}本牌{}后",
                    "相邻{C:attention}小丑牌{}的{C:money}售价{C:attention}翻倍",
                    "{C:inactive}（至多{C:money}$#1#{C:inactive}）"
                },
            },
            j_aij_second_tier_meme = { name = "Second tier Meme", text = { "" } },
            j_aij_teeny_joker = {
                name = "小小小丑",
                text = {
                    "若出牌仅包含{C:attention}2",
                    "{C:chips}+#1#{}筹码"
                },
            },
            j_aij_clowns_on_parade = {
                name = "小丑游行",
                text = {
                    "若出牌至少包含三张{C:attention}2",
                    "本牌获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）"
                },
            },
            j_aij_rising_sun = {
                name = "旭日高升",
                text = { 
                    "重新触发每回合",
                    "{C:attention}首末两次出牌{}中的",
                    "{C:attention}首末两张{}计分牌"
                }
            },
            j_aij_red_sky = {
                name = "红霞漫天",
                text = {
                    "每回合{C:attention}首末{}两次出牌",
                    "计得的{C:chips}+筹码{}算作{C:mult}+倍率"
                }
            },
            j_aij_blind_drawn = {
                name = "蒙眼瞎画",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "进入{C:attention}Boss盲注{}前",
                    "无法知晓其详情",
                }
            },
            j_aij_mp_blind_drawn = {
                name = "蒙眼瞎画",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "在{C:attention}PvP盲注{}期间",
                    "无法知晓你{X:purple,C:white}对手{}的",
                    "得分及剩余出牌次数"
                }
            },
            j_aij_heidelberg_tun = {
                name = "海德堡大酒桶",
                text = {
                    "为每个商店内购买的",
                    "首张{C:attention}消耗牌{}添加{C:dark_edition}负片",
                    "{C:inactive}#1#"
                },
            },
            j_aij_open_mind = {
                name = "脑洞大开",
                text = {
                    "{C:attention}商店{}提供的",
                    "{C:attention}补充包{}数量{C:attention}+#1#"
                },
            },
            j_aij_little_boy_blue = {
                name = "天真小蓝孩",
                text = {
                    "{C:chips}+#1#{}筹码",
                    "仅会出现{C:chips}筹码{}小丑牌"
                }
            },
            j_aij_big_red = {
                name = "大红",
                text = {
                    "{C:mult}+#1#{}倍率",
                    "仅会出现{C:mult}倍率{}小丑牌"
                }
            },
            j_aij_party_streamers = {
                name = "派对彩带",
                text = {
                    "若回合{C:attention}首次出牌",
                    "仅{C:attention}1{}张且无{C:attention}蜡封",
                    "则其获得{C:red}红色{}，{C:blue}蓝色{}",
                    "或{C:money}金色{C:attention}蜡封"
                },
            },
            j_aij_kilroy = {
                name = "到此一游",
                text = {
                    "{C:money}售出{}时，使本牌的",
                    "{C:chips}筹码{}数{C:attention}翻倍",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
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
                    "when a {C:attention}Mult Card{} is scored",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_aij_mummy = { name = "Mummy", text = { "" } },
            j_aij_sitcom = { name = "Sitcom", text = { "" } },
            j_aij_in_vino_veritas = { name = "In vino Veritas", text = { "" } },
            j_aij_beefeater = { name = "Beefeater", text = { "" } },
            j_aij_tetraphobia = {
                name = "恐四症",
                text = {
                    "每弃掉一张{C:attention}4{}",
                    "本牌获得{C:mult}+#2#{}倍率",
                    "有{C:attention}4{}计分时重置",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）",
                },
            },
            j_aij_jack_of_all_trades = {
                name = "万事排老三",
                text = {
                    "{C:attention}J{}视作任何{C:attention}花色",
                },
            },
            j_aij_jumbo_joker = {
                name = "巨型小丑",
                text = {
                    "仅会出现{C:attention}巨型{}和",
                    "{C:attention}超级补充包"
                }
            },
            j_aij_pellucid_joker = {
                name = "透形小丑",
                text = {
                    "带有{C:dark_edition}版本{}的{C:attention}小丑牌",
                    "被{C:money}售出{}或{C:red}摧毁{}时",
                    "将随机一张带有相同{C:dark_edition}版本{}的",
                    "游戏牌加入牌组"
                }
            },
            j_aij_cosmological_constant = {
                name = "宇宙学常数",
                text = {
                    "{C:aij_plasma}平衡{}所出{C:attention}牌型{}的",
                    "{C:attention}基础{C:chips}筹码{}和{C:mult}倍率"
                },
            },
            j_aij_monster = { name = "Monster", text = { "" } },
            j_aij_mistigri = {
                name = "Mistigri",
                text = {
                    "手牌中每有{C:attention}2{}张{C:attention}J",
                    "手牌上限{C:attention}+1"
                },
            },
            j_aij_simple_simon = {
                name = "平平凡凡",
                text = {
                    "{C:chips}+#1#{}筹码",
                },
            },
            j_aij_giocoliere = {
                name = "杂耍演员",
                text = {
                    "{C:attention}Boss盲注{}内",
                    "{C:attention}+#1#{}手牌上限"
                },
            },
            j_aij_spectre = {
                name = "幻灵",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "将所持{C:attention}消耗牌",
                    "全部替换为随机{C:spectral}幻灵{}牌"
                }
            },
            j_aij_dapper_dan = {
                name = "潇洒小丹",
                text = {
                    "小丑牌的{C:dark_edition}版本",
                    "效果{C:attention}翻倍",
                    "{C:inactive}（负片除外）"
                }
            },
            j_aij_average_joe = {
                name = "平均平君",
                text = {
                    "{C:aij_plasma}平衡{C:chips}筹码{}和{C:mult}倍率{}的{C:attention}#1#%"
                }
            },
            j_aij_silent_sam = {
                name = "沉默陈墨",
                text = {
                    "每张{C:attention}手牌",
                    "给予{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_pantomimus = {
                name = "哑剧独角",
                text = {
                    "{C:attention}回合{}结束时",
                    "每有一张{C:attention}手牌",
                    "本牌获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）"
                }
            },
            j_aij_sneaky_pete = {
                name = "鬼祟皮皮",
                text = {
                    "完整牌组中每有一张牌",
                    "带有{C:money}金色蜡封",
                    "回合结束时赚取{C:money}$#2#",
                    "{C:inactive}（当前为{C:money}$#1#{C:inactive}）"
                },
            },
            j_aij_peeping_tom = { name = "Peeping tom", text = { "" } },
            j_aij_la_commedia_e_finita = {
                name = "La Commedia è Finita",
                text = {
                    "{C:attention}人头{}牌被{C:attention}摧毁{}时",
                    "本牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                },
            },
            j_aij_straight_to_hell = {
                name = "顺势直下",
                text = {
                    "若弃牌包含{C:attention}顺子{}",
                    "{C:attention}本牌{}获得{X:mult,C:white}X#1#{}倍率",
                    '{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）'
                },
            },
            j_aij_guiser = {
                name = "怪老头",
                text = {
                    "使用{C:tarot}塔罗牌{}后",
                    "{C:attention}售价{}上涨{C:money}$#1#"
                },
            },
            j_aij_mummer = {
                name = "默剧伶人",
                text = {
                    "{C:aij_silver}钢铁牌{C:attention}计分{}时",
                    "触发所有{C:attention}留手{}的{C:aij_silver}钢铁牌"
                }
            },
            j_aij_tipteerer = {
                name = "圣诞艺角",
                text = {
                    "{C:attention}回合{}结束时",
                    "获得等同于其他{C:attention}小丑牌",
                    "{C:money}售价{C:attention}#2#%{}的资金",
                    "向上取整",
                    "{C:inactive}（当前为{C:money}$#1#{}{C:inactive}）"
                },
            },
            j_aij_honest_john = { name = "Honest John", text = { "" } },
            j_aij_dizzard = {
                name = "愚子",
                text = {
                    "跳过{C:attention}盲注{}后",
                    "进入{C:money}商店"
                }
            },
            j_aij_arlecchino = {
                name = "喜剧仆角",
                text = {
                    "{C:attention}小丑包{}和{C:attention}标准包",
                    "的可选数量不设上限"
                }
            },
            j_aij_arlecchina = { name = "Arlecchina", text = { "" } },
            j_aij_taikomochi = {
                name = "太鼓持",
                text = {
                    "留手的{C:attention}J",
                    "给予{C:chips}+#1#{}筹码"
                }
            },
            j_aij_sudoku = {
                name = "数独",
                text = {
                    "每次包含{C:attention}顺子{}的连续出牌",
                    "使本牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_aij_gnasher = {
                name = "咬咬",
                text = {
                    "{B:1,C:white,s:0.8}可激活能力",
                    "每底注一次",
                    "从持有的{C:attention}消耗牌{}中",
                    "随机{C:attention}复制{}一张",
                    "并{C:attention}立即{}使用",
                    "{C:inactive}#1#"
                }
            },
            j_aij_executioner = {
                name = "刽子手",
                text = {
                    "{C:attention}人头{}牌被{C:attention}摧毁{}时",
                    "本牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                },
            },
            j_aij_jongleur = {
                name = "行吟艺人",
                text = {
                    "{C:green}重掷{}花费{C:attention}-$#1#",
                },
            },
            j_aij_event_horizon = {
                name = "事件视界",
                text = {
                    "{C:dark_edition}黑洞{}的稀有度",
                    "与其他{C:planet}星球{}牌相当",
                }
            },
            j_aij_the_jester = {
                name = "弄臣",
                text = {
                    "每回合首次售出{C:attention}小丑牌{}时",
                    "生成一张{C:tarot}愚者",
                    "{C:inactive}#1#"
                },
            },
            j_aij_joka_lisa = {
                name = "懵娜丽傻",
                text = {
                    "{C:attention}手牌上限",
                    "每比{C:attention}7{}多{C:attention}1",
                    "具有{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    "{C:inactive}（不低于{X:mult,C:white}X1{C:inactive}倍率）"
                }
            },
            j_aij_tonpraten = { name = "Tonpraten", text = { "" } },
            j_aij_rodeo_clown = {
                name = "斗牛小丑",
                text = {
                    "若以每回合的",
                    "{C:attention}最后一手出牌{}击败{C:attention}盲注",
                    "本牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                }
            },
            j_aij_joculator = {
                name = "稽算机",
                text = {
                    "{C:attention}无{C:red}弃牌次数",
                    "且剩余{C:attention}#1#{}次{C:blue}出牌{}时",
                    "抽牌至手牌上限的{C:attention}两倍"
                }
            },
            j_aij_scurra = {
                name = "街溜子",
                text = {
                    '所有带{C:red}红色蜡封{}的出牌',
                    '重新触发{C:attention}#1#{}次'
                },
            },
            j_aij_pigpen = { name = "Pigpen", text = { "" } },
            j_aij_cyclops = { name = "Cyclops", text = { "" } },
            j_aij_blarney_stone = {
                name = "巧言石",
                text = {
                    "给予{C:attention}三倍{}于当前{C:attention}得分{}的",
                    "{C:attention}首位数字{}的{C:mult}倍率{}",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
                }
            },
            j_aij_sticker = {
                name = "贴纸",
                text = {
                    "所持有的{C:attention}小丑牌{}上",
                    "每有一个{C:attention}贴纸",
                    "{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）",
                }
            },
            j_aij_feedback_form = {
                name = "反馈表",
                text = {
                    "{C:attention}出牌{}中的每{C:attention}种{}增强",
                    "在计分时给予{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_stultor = {
                name = "谑客",
                text = {
                    "每个底注可免费",
                    "重掷{C:attention}Boss盲注#1#{}次"
                }
            },
            j_aij_david = {
                name = "大卫",
                text = {
                    "若{C:attention}打出的牌{}中",
                    "仅包含{C:spades}黑桃{C:attention}K{}",
                    "本牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）",
                },
            },
            j_aij_charles = {
                name = "查理",
                text = {
                    "若{C:attention}出牌{}仅包含{C:hearts}红桃{C:attention}K",
                    "本牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                },
            },
            j_aij_cesar = {
                name = "恺撒",
                text = {
                    '每出一次牌，赚取{C:money}$#1#',
                    '若{C:attention}出牌{}仅包含{C:diamonds}方片{C:attention}K',
                    '提升{C:money}$#2#'
                },
            },
            j_aij_alexandre = {
                name = "亚历山大",
                text = {
                    "若{C:attention}出牌{}仅包含{C:clubs}梅花{C:attention}K",
                    "本牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                },
            },
            j_aij_sannio = { name = "Sannio", text = { "" } },
            j_aij_stock_photo = { name = "Stock Photo", text = { "" } },
            j_aij_fou_du_roi = {
                name = "国王弄臣",
                text = {
                    '若出牌包含{C:attention}K{}或{C:attention}Q',
                    '有{C:green}#1#/#2#{}的几率',
                    '生成一张{C:tarot}塔罗牌',
                    '{C:inactive}（必须有空间）'
                },
                -- possible error: scored/played
            },
            j_aij_fatuus = {
                name = "瞽愚之徒",
                text = {
                    '若回合首次出牌仅包含{C:attention}K{}和{C:attention}Q',
                    '为随机一张出牌打上{C:blue}蓝色蜡封'
                },
            },
            j_aij_enraging_photo = { name = "Enraging Photo", text = { "" } },
            j_aij_infuriating_note = {
                name = "令人气愤的纸条",
                text = {
                    {
                        "{X:mult,C:white}X#1#{}倍率",
                        "本牌的{C:dark_edition}负片{}复制",
                        "可能会出现于",
                        "{C:attention}商店{}及{C:attention}小丑包{}内",
                    },
                    {
                        "{C:inactive}我拿走了你的货，",
                        "{C:inactive}你却奈何不了我；",
                        "{C:inactive}下回我再努把力，",
                        "{C:inactive}向你致敬我的哥！",
                        "{C:inactive,s:0.8}——机智·大鼠",
                    }
                }
            },
            j_aij_infuriating_note_2 = {
                name = "令人气愤的纸条",
                text = {
                    {
                        "{X:mult,C:white}X#1#{}倍率",
                        "本牌的{C:dark_edition}负片{}复制",
                        "可能会出现于",
                        "{C:attention}商店{}及{C:attention}小丑包{}内",
                    },
                    {
                        "{C:inactive}有些个箱子是红的",
                        "{C:inactive}没一个箱子是蓝的；",
                        "{C:inactive}我从你身上随便偷，",
                        "{C:inactive}反正也没啥困难的！",
                        "",
                        "{C:inactive,s:0.8}谢谢你又给我送快递啊，小丑！",
                        "{C:inactive,s:0.8}——机智·大鼠",
                    }
                }
            },
            j_aij_infuriating_note_3 = {
                name = "令人气愤的纸条",
                text = {
                    {
                        "{X:mult,C:white}X#1#{}倍率",
                        "本牌的{C:dark_edition}负片{}复制",
                        "可能会出现于",
                        "{C:attention}商店{}及{C:attention}小丑包{}内",
                    },
                    {
                        "{C:inactive}我愿涉尽千万险，",
                        "{C:inactive}只为看看你的脸。",
                        "{C:inactive}看你开心开箱子，",
                        "{C:inactive}发现啥都没得捡！",
                        "",
                        "{C:inactive,s:0.8}谢谢您长期以来的支持",
                        "{C:inactive,s:0.8}嘻嘻嘻嘻嘻……！",
                        "{C:inactive,s:0.8}——机智·大鼠",
                    }
                }
            },
            j_aij_infuriating_note_4 = {
                name = "令人气愤的纸条",
                text = {
                    {
                        "{X:mult,C:white}X#1#{}倍率",
                        "本牌的{C:dark_edition}负片{}复制",
                        "可能会出现于",
                        "{C:attention}商店{}及{C:attention}小丑包{}内",
                    },
                    {
                        "{C:inactive}其实早该崩掉你，",
                        "{C:inactive}但那样做太流氓；",
                        "{C:inactive}所以为了搞个笑，",
                        "{C:inactive}我拿走了你的枪！",
                        "",
                        "{C:inactive,s:0.8}祝您好运哦，蠢蛋！",
                        "{C:inactive,s:0.8}——机智·大鼠",
                    }
                }
            },
            j_aij_infuriating_note_5 = {
                name = "令人气愤的纸条",
                text = {
                    {
                        "{X:mult,C:white}X#1#{}倍率",
                        "本牌的{C:dark_edition}负片{}复制",
                        "可能会出现于",
                        "{C:attention}商店{}及{C:attention}小丑包{}内",
                    },
                    {
                        "{C:inactive}要想睹得我尊容，",
                        "{C:inactive}你先下跪拜三拜。",
                        "{C:inactive}好似鼠辈见奶酪，",
                        "{C:inactive}溜你溜到九霄外！",
                        "{C:inactive,s:0.8}——机智·大鼠",
                    }
                }
            },
            j_aij_magic_hat = { name = "魔法帽", text = { "" } },
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
                name = "魔豆茎",
                text = {
                    "{C:attention}J{C:attention}免疫{C:red}削弱",
                    "且{C:attention}强制{}计分"
                }
            },
            j_aij_phoney_baloney = { name = "Phoney Baloney", text = { "" } },
            j_aij_jerko = {
                name = "小扭",
                text = {
                    '{C:mult}+#1#{}倍率'
                }
            },
            j_aij_design_document = {
                name = "设计文档",
                text = {
                    "任何{C:green}几率判定{}失败时",
                    "获得{C:money}$#1#",
                }
            },
            j_aij_animatronic = {
                name = "机械人偶",
                text = {
                    "连续打出包含{C:attention}顺子{}的出牌时",
                    "手牌上限{C:attention}+#1#",
                    "{C:inactive}（当前为{C:attention}+#2#{C:inactive}手牌上限）",
                    "{C:inactive}（至多{C:attention}+#3#{C:inactive}）"
                }
            },
            j_aij_arecibo_message = { name = "Arecibo Message", text = { "" } },
            j_aij_napkin = {
                name = "随记餐巾纸",
                text = {
                    "{C:attention}连续{}跳过{C:attention}2{}个盲注后",
                    "本牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                }
            },
            j_aij_lost_carcosa = {
                name = "失落的卡尔科萨",
                text = {
                    "所用{C:planet}星球牌{}的{C:chips}筹码{}和{C:mult}倍率",
                    "在{C:attention}#1#%{}到{C:attention}#2#%{}之间随机变动"
                }
            },
            j_aij_magic_mirror = {
                name = "魔镜",
                text = {
                    "对当前{C:attention}底注{}中",
                    "首张计分的{C:attention}人头{}牌",
                    "添加{C:dark_edition}负片",
                    "{C:inactive}#1#"
                }
            },
            j_aij_postcard_from_perdition_trail = { name = "Postcard from Perdition Trail", text = { "" } },
            j_aij_mr_lonely = {
                name = "孤独先生",
                text = {
                    "{C:attention}回合{}结束时",
                    "每有一个空的{C:attention}小丑牌槽位{}",
                    "本牌获得{C:chips}+#1#筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                },
            },
            j_aij_spiders_georg = {
                name = "Spiders Georg",
                text = {
                    "将{C:mult}倍率{X:mult,C:white}乘以{C:attention}#2#{}+{C:attention}n",
                    "{C:attention}n{}为本赛局内{C:attention}平均{}每次出牌",
                    "所含{C:attention}计分8{}的张数",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                }
                -- BUG: "Number of 8s scored" implies retriggers count,
                -- but they don't
            },
            j_aij_gille = { name = "Gille", text = { "" } },
            j_aij_fulehung = {
                name = "富勒洪",
                text = {
                    "选择{C:attention}盲注{}后",
                    "有{C:green}#1#/#2#{}的几率",
                    "获得其{C:attention}跳过奖励标签"
                }
            },
            j_aij_bearded_joker = {
                name = "大胡子小丑",
                text = {
                    "{C:attention}完整牌组{}中",
                    "每有一张{C:attention}增强{}牌",
                    "{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                }
            },
            j_aij_skomorokh = {
                name = "斯科莫罗赫",
                text = {
                    "{C:attention}完整牌组{}中",
                    "每有一张牌带有{C:attention}版本",
                    "本牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_aij_silly_billy = { name = "Silly Billy", text = { "" } },
            j_aij_ijoker_co = {
                name = "iJoker.co",
                text = {
                    "每个{C:money}商店{}",
                    "随机提供",
                    "{C:attention}#1#{}个{C:attention}标签"
                }
            },
            j_aij_corpse_paint = {
                name = "尸妆",
                text = {
                    "移除计分牌的{C:dark_edition}负片",
                    "每移除一张，本牌皆有",
                    "{C:green}#1#/#2#{}的几率",
                    "使手牌上限{C:attention}+#3#",
                    "{C:inactive}（当前为{C:attention}+#4#{C:inactive}手牌上限）"
                }
            },
            j_aij_toothy_joker = {
                name = "龇牙小丑",
                text = {
                    "当前{C:attention}底注{}中",
                    "每使用过一张{C:tarot}塔罗牌",
                    "{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                }
            },
            j_aij_mondrian_joker = {
                name = "蒙德里安小丑",
                text = {
                    "{C:attention}完整牌组{}中",
                    "每有一张{C:attention}4",
                    "{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{}{C:inactive}倍率）"
                },
            },
            j_aij_orphic_joker = {
                name = "奥费小丑",
                text = {
                    "跳过{C:attention}盲注{}后，随机生成",
                    "{C:attention}#1#{}张{C:uncommon}罕见{C:attention}小丑牌",
                    "{C:inactive}（必须有空间）"
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
                name = "阿鲁齐努",
                text = {
                    "{C:attention}象形文字{}和{C:attention}岩画{}优惠券",
                    "{C:attention}无{C:red}负面效果",
                    "且可{C:attention}重复{}出现"
                    -- QOL description of all similar effects
                    -- should mention any raised appearance chances
                }
            },
            j_aij_great_kraken = {
                name = "大海怪",
                text = {
                    "每剩余一次{C:blue}出牌",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（将给予{X:mult,C:white}X#2#{C:inactive}倍率）",
                    "{C:inactive}（最低为{X:mult,C:white}X1{C:inactive}倍率）"
                    -- QOL seeing lots of "Minimum X1", could make those really small and short
                    -- to be less intrusive
                }
            },
            j_aij_truhan = {
                name = "奸猾诡丑",
                text = {
                    "任何小丑牌被{C:money}售出{}或{C:red}摧毁{}时",
                    "其每已被持有一{C:attention}回合",
                    "本牌获得{X:mult,C:white}X#2#{}",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）"
                    -- TODO This description's confusing, not sure when
                    -- Jokers increment their "rounds held". I would assume at
                    -- end of round but who knows what's intended
                }
            },
            j_aij_chippy = {
                name = "筹财加码",
                text = {
                    "获得等价于",
                    "所花费{C:money}资金{}的{C:chips}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_aij_hofnarr_the_barbarian = {
                name = "小丑野蛮人",
                text = {
                    "{C:mult}+#1#{}倍率",
                    "迎战{C:attention}决胜盲注{}时",
                    "{C:attention}禁用{}之并给予{X:mult,C:white}X#2#{}倍率"
                },
            },
            j_aij_histrio = {
                name = "俳优",
                text = {
                    "回合结束时",
                    "每{C:attention}剩余{}一次{C:attention}出牌",
                    "额外获得{C:money}$#1#"
                }
            },
            j_aij_loregg = { name = "Loregg", text = { "" } },
            j_aij_egg_cc = {
                name = "“鸡蛋”",
                text = {
                    "回合结束时",
                    "本牌获得{C:chips}+#2#{}筹码",
                    "且{C:attention}售价{}提升{C:money}$#3#",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    "{C:inactive}嘿，这里是“鸡蛋”"
                },
            },
            j_aij_sot = {
                name = "酒蒙子",
                text = {
                    "每拥有一个{C:attention}标签",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_aij_fat_ed = { name = "Fat 'Ed", text = { "" } },
            j_aij_stained_glass_joker = {
                name = "染色玻璃小丑",
                text = {
                    "{C:attention}玻璃牌{}视作任何{C:attention}花色",
                },
            },
            j_aij_mushroom_cloud = { name = "蘑菇云", text = { "" } },
            j_aij_overdesigned_joker = {
                name = "过度设计小丑",
                text = {
                    {
                        "打出的{V:1}#1#{}牌",
                        "在计分时#3#{B:3,V:2}#4##2#{}#5#"
                    },
                    {
                        "卡牌{C:attention}计分{}时",
                        "{C:attention}轮换{}上述花色和效果",
                        "{C:inactive}（{V:4}红桃{C:inactive}->{V:5}梅花{C:inactive}->{V:6}方片{C:inactive}->{V:7}黑桃{C:inactive}）{}"
                    }
                }
            },
            j_aij_morio = {
                name = "痴愚弄臣",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "{C:attention}任选{}并生成",
                    "一张{C:tarot}塔罗{}牌",
                    "{C:inactive}（必须有空间）"
                }
            },
            j_aij_visage = {
                name = "面容",
                text = {
                    "复制最近{C:money}售出{}的",
                    "小丑牌的效果"
                }
            },
            j_aij_goofball = {
                name = "蠢蛋",
                text = {
                    "{C:attention}人头{}牌在计分时",
                    "{C:aij_plasma}平衡{C:chips}筹码{}和{C:mult}倍率{}的{C:attention}#1#%"
                }
            },
            j_aij_heyokha = { name = "Heyókȟa", text = { "" } },
            j_aij_casual_absent_paranoia = { name = "Casual-Absent Paranoia", text = { "" } },
            j_aij_mandrake = {
                name = "曼德拉草",
                text = {
                    "{C:attention}#2#{}回合后{C:money}售出本牌",
                    "则{C:red}摧毁{}所有{C:attention}手牌",
                    "{C:inactive}（当前为{C:attention}#1#{C:inactive}/#2#回合）"
                }
            },
            j_aij_jester_zombie = {
                name = "小丑僵尸",
                text = {
                    "本回合内若有{C:attention}游戏牌{}被{C:red}摧毁",
                    "所有{C:attention}计分{}牌均会重新触发",
                    "{C:inactive}#1#"
                }
            },
            j_aij_richie_rich = { name = "Richie Rich", text = { "" } },
            j_aij_devil_deal = {
                name = "魔鬼的交易",
                text = {
                    "{C:hearts}红桃{}牌被{C:attention}摧毁{}时",
                    "本牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_aij_totally_nuts = {
                name = "喂我花生",
                text = {
                    "{C:attention}+#1#{}消耗牌槽位",
                    "{C:money}售出{C:attention}消耗牌{}时{C:attention}销毁"
                }
            },
            j_aij_warhol = { name = "Warhol", text = { "" } },
            j_aij_mistake = {
                name = "错",
                text = {
                    "{C:attention}永恒{}小丑牌",
                    "可被{C:attention}售出"
                }
            },
            j_aij_depth_of_delusion = { name = "Depth of Delusion", text = { "" } },
            j_aij_curse_of_scotland = { name = "Curse of Scotland", text = { "" } },
            j_aij_banana_man = {
                name = "香蕉人",
                text = {
                    {
                        "{C:attention}重新触发",
                        "所有其他小丑牌",
                    },
                    {
                        "每次出牌后，每个小丑",
                        "均有{C:green}#1#/#2#{}的几率",
                        "被{C:red}摧毁"
                    }
                }
            },
            j_aij_corny_joker = { name = "Corny Joker", text = { "" } },
            j_aij_entropy = {
                name = "熵",
                text = {
                    "{C:attention}跳过{}盲注时",
                    "生成一个{C:attention}混沌标签"
                }
            },
            j_aij_urchin = {
                name = "小邋遢",
                text = {
                    "本赛局内每跳过一次{C:attention}盲注",
                    "回合结束时获得{C:money}$#2#",
                    "{C:inactive}（当前为{C:money}$#1#{C:inactive}）"
                }
            },
            j_aij_machine_intelligence = { name = "Machine Intelligence", text = { "" } },
            j_aij_grandma = { name = "Grandma", text = { "" } },
            j_aij_funny_money = {
                name = "游戏纸币",
                text = {
                    "{C:attention}跳过{}盲注时",
                    "获得{C:money}$#1#"
                }
            },
            j_aij_witchfinder = {
                name = "女巫猎人",
                text = {
                    "{C:money}商店{}内额外提供",
                    "{C:attention}#1#{}个{C:tarot}秘术包"
                }
            },
            j_aij_trophy_kill = { name = "Trophy Kill", text = { "" } },
            j_aij_tract = {
                name = "传单",
                text = {
                    "每拥有一张{C:attention}优惠券",
                    "{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                }
            },
            j_aij_stock_broker = {
                name = "股票经纪人",
                text = {
                    "所获{C:money}利息{}会在",
                    "{C:attention}X#1#{}至{C:attention}X#2#{}之间",
                    "随机变动"
                }
            },
            j_aij_omlette = {
                name = "煎蛋卷",
                text = {
                    "每{C:blue}出{}或{C:red}弃{}牌一次",
                    "售价{C:money}+$#1#"
                }
            },
            j_aij_stave = { name = "Stave", text = { "" } },
            j_aij_sunny_side = { name = "Sunny Side", text = { "" } },
            j_aij_omelette = { name = "Omelette", text = { "" } },
            j_aij_theyre_looking_at_you = { name = "They're Looking at You...", text = { "" } },
            j_aij_comedy_of_errors = {
                name = "错中错",
                text = {
                    "{C:red}弃掉{C:hearts}红桃{}牌时",
                    "获得{C:money}$#1#"
                }
            },
            j_aij_fuzzy_joker = {
                name = "糊画小丑",
                text = {
                    "将{C:mult}倍率{}取至",
                    "其下一个{C:attention}#1#{}次幂"
                    -- QOL, discuss, TODO
                    -- "next" would mean the following power of 2 if
                    -- Mult happens to be a power of 2.
                    -- Should rounding jokers go to "next" or "nearest"?
                }
            },
            j_aij_saucy_jacky = { name = "Saucy Jacky", text = { "" } },
            j_aij_funny_phone = { name = "Funny Phone", text = { "" } },
            j_aij_taggart = {
                name = "Taggart",
                text = {
                    "获得任何{C:attention}标签{}时",
                    "均生成一个{C:attention}复制",
                    "{C:inactive}（除双倍标签）"
                }
            },
            j_aij_chitty = {
                name = "小票",
                text = {
                    "{C:attention}商店{}提供的",
                    "{C:attention}优惠券{}数量{C:attention}+#1#"
                }
            },
            j_aij_whatsisname = {
                name = "叫啥来着",
                text = {
                    "{C:attention}笑语猜谜包{}更加常见"
                }
            },
            j_aij_downing_street = {
                name = "唐宁街",
                text = {
                    "计分的{C:attention}10",
                    "有{C:green}#1#/#2#{}的几率",
                    "随机生成一个{C:attention}标签"
                }
            },
            j_aij_one_little_duck = { name = "One Little Duck", text = { "" } },
            j_aij_four_leaf_clover = { name = "四叶幸运草", text = { "" } },
            j_aij_aphantasia = {
                name = "心盲症",
                text = {
                    "所有打出的{C:attention}增强{}牌",
                    "变为{C:red}混沌"
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
                name = "维特鲁威小丑",
                text = {
                    "恰拥有{C:attention}5{}张小丑牌时",
                    "{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_american_comic = { name = "美式漫画", text = { "" } },
            j_aij_from_the_top_rope = { name = "From the Top Rope", text = { "" } },
            j_aij_fortune_cookie = {
                name = "签语饼",
                text = {
                    "打开任意{C:attention}补充包{}时",
                    "随机生成一张{C:tarot}塔罗牌",
                    "{C:inactive}（必须有空间）",
                    "开包{C:attention}#2#{}次后耗尽",
                    "{C:inactive}（{C:attention}#1#{C:inactive}/{C:attention}#2#{C:inactive}）"
                }
            },
            j_aij_tilty_joker = {
                name = "斜读小丑",
                text = {
                    "{C:attention}计分{}牌给予",
                    "{C:attention}#1#倍{}于其点数的{C:chips}筹码"
                }
            },
            j_aij_opening_move = {
                name = "制胜先机",
                text = {
                    {
                        "每回合{C:attention}首次出牌{}中",
                        "每有一张{C:attention}计分{}牌",
                        "当前回合内获得{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                    },
                    {
                        "每回合{C:attention}首次出牌{}",
                        "{C:red}不{}计入实际得分",
                    },
                }
            },
            j_aij_bartender = {
                name = "酒保",
                text = {
                    "{C:attention}消耗牌{}可能为",
                    "{C:dark_edition}闪箔{}，{C:dark_edition}镭射{}或{C:dark_edition}多彩"
                }
            },
            j_aij_mahoney = {
                name = "马奥尼",
                text = {
                    "{C:attention}跳过{}盲注时",
                    "有{C:green}#1#/#2#{}的几率",
                    "生成一个{C:attention}优惠券标签"
                }
            },
            j_aij_le_fils_de_banane = {
                name = "香蕉之子",
                text = {
                    "{C:attention}人头{}牌在计分时",
                    "给予{C:mult}+#3#{}倍率",
                    "但有{C:green}#1#/#2#{}的几率被{C:red}摧毁"
                }
            },
            j_aij_pygmalion = {
                name = "皮格马利翁",
                text = {
                    "所有{C:attention}石头{}牌",
                    "视作{C:attention}Q",
                }
            },
            j_aij_grue = { name = "Grue", text = { "" } },
            j_aij_heavy_sixer = { name = "Heavy Sixer", text = { "" } },
            j_aij_tetrominoker = {
                name = "四格骨牌小丑",
                text = {
                    "计分的{C:attention}4{}有{C:green}#1#/#2#{}的几率",
                    "生成一张自身的{C:attention}复制"
                }
            },
            j_aij_mr_catfish = {
                name = "鲶鱼先生",
                text = {
                    "每弃掉{C:attention}#2#{C:inactive} [#3#]{}张牌",
                    "赚取{C:money}$#1#"
                }
            },
            j_aij_angel_number = {
                name = "天使数字",
                text = {
                    "出牌每一张计分的{C:attention}7",
                    "在当次出牌内",
                    "使所有{C:green}列出{}的{C:green}几率{C:attention}+#1#",
                    -- TODO currently?
                }
            },
            j_aij_doctors_orders = {
                name = "谨遵医嘱",
                text = {
                    "出牌中每有一张{C:attention}9",
                    "给予{X:mult,C:white}X#1#{}倍率",
                    "若不包含{C:attention}9{}，{C:red}自毁"
                }
            },
            j_aij_blue_eyes_white_joker = {
                name = "蓝眼白丑",
                text = {
                    "若回合{C:attention}最后一手出牌",
                    "恰为{C:attention}1{}张",
                    "其{C:attention}触发次数{}永久{C:attention}+#1#"
                }
            },
            j_aij_lucina = {
                name = "狂欢小丑",
                text = {
                    "{C:attention}选择{}盲注后",
                    "{C:red}摧毁{C:attention}左侧{}的小丑牌",
                    "并为{C:attention}右侧{}的小丑牌",
                    "添加随机{C:dark_edition}版本",
                }
            },
            j_aij_circuit_diagram = {
                name = "电路图",
                text = {
                    "{C:attention}充能{}牌",
                    "强制出现于牌堆顶",
                }
            },
            j_aij_paracosm = {
                name = "童真异想",
                text = {
                    "跳过{C:attention}盲注{}后",
                    "升级最常出的{C:attention}牌型",
                    "{C:inactive}（当前为#1#）"
                }
            },
            j_aij_mocap = {
                name = "动捕",
                text = {
                    {
                        "{C:money}售出{C:legendary}传奇{}、{C:rare}稀有、{C:uncommon}罕见{}小丑牌时",
                        "{C:attention}随机{}生成一张低一级的小丑牌"
                    },
                    {
                        "{C:legendary}传奇{} -> {C:rare}稀有",
                        "{C:rare}稀有{} -> {C:uncommon}罕见",
                        "{C:uncommon}罕见{} -> {C:common}普通"
                    }
                }
            },
            j_aij_stagehand = {
                name = "场务",
                text = {
                    "每持有一张{C:attention}小丑牌",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_aij_the_mermaid = { name = "The Mermaid", text = { "" } },
            j_aij_colour_test = {
                name = "验色彩条",
                text = {
                    "为回合{C:attention}最后一手出牌",
                    "的首张计分牌添加{C:attention}多彩"
                }
            },
            j_aij_test_card = {
                name = "检验图",
                text = {
                    "手牌的{C:attention}版本",
                    "也会触发其效果"
                }
            },
            j_aij_interstate = {
                name = "州际公路",
                text = {
                    "若回合{C:attention}首次{}出牌为{C:attention}顺子",
                    "本回合出牌次数{C:blue}+#1#"
                }
            },
            j_aij_bowls_of_joy = { name = "Bowls of Joy", text = { "" } },
            j_aij_chips_n_dip = {
                name = "薯片蘸酱",
                text = {
                    "{X:chips,C:white}X#1#{}筹码",
                    "{C:attention}回合{}结束时",
                    "失去{X:chips,C:white}X#2#"
                }
            },
            j_aij_homemade_comic = {
                name = "自制漫画",
                text = {
                    "{C:attention}充能牌{}在计分时",
                    "给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_aij_gematria = { name = "Gematria", text = { "" } },
            j_aij_bingo_card = {
                name = "宾果卡",
                text = {
                    "计分的{C:attention}幸运{}牌",
                    "有{C:green}#1#/#2#{}的几率给予{X:mult,C:white}X#5#{}倍率",
                    "且有{C:green}#3#/#4#{}的几率重新触发"
                }
            },
            j_aij_fish_fingers = {
                name = "手指炸鱼条",
                text = {
                    "每回合出牌次数{C:blue}+#1#",
                    "{C:attention}击败{}盲注后{C:blue}-#2#"
                }
            },
            j_aij_joker_png = {
                name = "Joker.png",
                text = {
                    {
                        '{B:1,C:white,s:0.8}可激活能力',
                        '本牌{C:attention}复制{}随机一张',
                        '{C:attention}小丑牌{}的{C:attention}效果',
                    },
                    {
                        '花费{C:money}$#1#{}以重掷',
                        '单底注内每重掷一次',
                        '花费上涨{C:money}$#1#'
                    }
                }
            },
            j_aij_kuruko = { name = "Kuruko", text = { "" } },
            j_aij_candy_floss = {
                name = "棉花糖",
                text = {
                    "{C:aij_plasma}平衡{C:chips}筹码{}和{C:mult}倍率{}的{C:attention}#1#%",
                    "回合结束时减少{C:attention}#2#%"
                }
            },
            j_aij_stargazy_pie = {
                name = "仰望星空派",
                text = {
                    "重新触发下{C:attention}#1#{}张",
                    "使用的{C:planet}星球牌"
                }
            },
            j_aij_electric_snow = {
                name = "雪花屏",
                text = {
                    "回合仅在",
                    "{C:attention}最后一手出牌后",
                    "结束"
                }
            },
            j_aij_gameshow = {
                name = "游戏节目",
                text = {
                    {
                        "选择{C:attention}盲注{}后，有{C:green}#1#/#2#{}的几率",
                        "为随机一张{C:attention}小丑牌{}添加",
                        "{C:dark_edition}闪箔{}，{C:dark_edition}镭射{}或{C:dark_edition}多彩{}版本"
                    },
                    {
                        "触发时无条件{C:money}-$#3#"
                    },
                },
            },
            j_aij_bonus_pay = {
                name = "奖励酬金",
                text = {
                    "{C:attention}奖励牌{}计分时",
                    "赚取{C:money}$#1#"
                }
            },
            j_aij_illuminated_joker = {
                name = "泥金小丑",
                text = {
                    "{C:money}黄金{}标签{C:attention}更易{}出现"
                }
            },
            j_aij_magazine_ad = { name = "Magazine Ad", text = { "" } },
            j_aij_bonus_bob = {
                name = "奖励蒋力",
                text = {
                    "{C:attention}奖励牌{}计分时",
                    "给予{X:chips,C:white}X#1#{}倍率"
                }
            },
            j_aij_bonus_round = {
                name = "奖励回合",
                text = {
                    "{C:attention}重新触发{}所有",
                    "计分的{C:attention}奖励牌",
                }
            },
            j_aij_jack_o_lantern = { name = "Jack o' Lantern", text = { "" } },
            j_aij_astrologer = {
                name = "占星家",
                text = {
                    {
                        "{C:planet}天体包{}可选张数{C:attention}+#1#"
                    },
                    {
                        "{C:attention}奇数{}底注中的{C:planet}星球{}牌",
                        "均替换为其{C:mult}倍率{}变体",
                        "{C:attention}偶数{}底注中则为{C:chips}筹码{}变体"
                    },
                }
            },
            j_aij_planetarium = {
                name = "夜观天象",
                text = {
                    {
                        "{C:attention}消耗牌{}槽位中的",
                        "{C:chips}筹码{}型{C:planet}星球{}牌",
                        "对其相应{C:attention}牌型",
                        "给予{C:chips}+#1#{}筹码"
                    },
                    {
                        "{C:attention}消耗牌{}槽位中的",
                        "{C:mult}倍率{}型{C:planet}星球{}牌",
                        "对其相应{C:attention}牌型",
                        "给予{C:mult}+#2#{}倍率"
                    },
                }
            },
            j_aij_negative_space = {
                name = "负空间",
                text = {
                    "每拥有一张{C:dark_edition}负片{}小丑牌",
                    "手牌上限{C:attention}+#1#",
                    "{C:inactive}（当前为{C:attention}+#2#{C:inactive}）",
                    "{C:inactive}（至多{C:attention}+#3#{C:inactive}）"
                }
            },
            j_aij_stargazer = { name = "Stargazer", text = { "" } },
            j_aij_skald = { name = "Skald", text = { "" } },
            j_aij_sky_trees = {
                name = "参天大树",
                text = {
                    "{C:attention}蓝色蜡封{}同时给予",
                    "{C:mult}倍率{}和{C:chips}筹码{}型{C:planet}星球{}牌",
                    "而非仅{C:attention}基础{}型{C:planet}星球{}牌"
                }
            },
            j_aij_the_freezer = { name = "The Freezer", text = { "" } },
            j_aij_twisted_pair = {
                name = "双绞牌",
                text = {
                    "若出牌包含{C:attention}对子",
                    "两张牌皆获得",
                    "{C:attention}彼此{}花色的{C:attention}补丁"
                }
            },
            j_aij_the_grim_joker = {
                name = "丑无常",
                text = {
                    "由{C:planet}蓝色{}或{C:tarot}紫色{}蜡封",
                    "生成的{C:attention}消耗牌",
                    "有{C:green}#1#/#2#{}的几率为{C:dark_edition}负片"
                }
            },
            j_aij_lexicon = {
                name = "古老词典",
                text = {
                    "将持有的其他{C:attention}小丑牌{}的",
                    "{C:attention}能力描述{}中数字之{C:attention}总和{}",
                    "添加为{C:mult}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
                }
            },
            j_aij_dendroglpyh = { name = "Dendroglyph", text = { "" } },
            j_aij_prank_caller = { name = "Prank Caller", text = { "" } },
            j_aij_arngren = {
                name = "Arngren",
                text = {
                    "{C:money}商店{}提供的",
                    "卡牌、补充包",
                    "和优惠券数量各{C:attention}+#1#"
                }
            },
            j_aij_blacklist = {
                name = "黑名单",
                text = {
                    "{C:money}售出{}的小丑牌",
                    "无法再次出现",
                    "已拉黑小丑：",
                }
            },
            j_aij_croupier = {
                name = "荷官",
                text = {
                    "得分超过",
                    "盲注要求的{C:attention}两倍{}时",
                    "获得{C:money}$#1#"
                }
            },
            j_aij_the_lucovico_technique = { name = "The Ludovico Technique", text = { "" } },
            j_aij_headstone = {
                name = "墓石",
                text = {
                    "所有{C:attention}人头牌",
                    "均洗入牌组{C:red}底部"
                }
            },
            j_aij_full_monty = { name = "Full Monty", text = { "" } },
            j_aij_chef = {
                name = "大厨",
                text = {
                    {
                        "基础版本的",
                        "{C:attention}易腐{}小丑牌",
                        "变为{C:dark_edition}负片",
                    },
                    {
                        "{C:money}商店{}内{C:attention}易腐{}小丑牌",
                        "的{C:attention}版本{}不再使该牌提价"
                    }
                }
            },
            j_aij_screamer = { name = "Screamer", text = { "" } },
            j_aij_evil_twin = { name = "邪恶双子", text = { "" } },
            j_aij_cubic_joker = { name = "Cubic Joker", text = { "" } },
            j_aij_remina = {
                name = "地狱星",
                text = {
                    "选择{C:attention}小盲注{}或{C:attention}大盲注{}后",
                    "{C:red}摧毁{}所{C:attention}持有{}的每张{C:planet}星球牌",
                    "并获得其{C:chips}筹码{}和{C:mult}倍率",
                    "{C:inactive,s:0.8}（当前为{C:chips,s:0.8}+#2#{C:inactive,s:0.8}筹码，{C:mult,s:0.8}+#1#{C:inactive,s:0.8}倍率）"
                }
            },
            j_aij_jpeg = { name = ".jpeg", text = { "" } },
            j_aij_sherrif = {
                name = "警长",
                text = {
                    "每次出牌中",
                    "首张计分的{C:attention}万能牌",
                    "给予{C:money}$#1#"
                }
            },
            j_aij_alien_joker = {
                name = "天外揪客",
                text = {
                    {
                        "{C:attention}强制{}选中{C:attention}1{}张牌"
                    },
                    {
                        "{C:attention}强制选中{}的牌",
                        "计分时给予{X:mult,C:white}X#1#{}倍率"
                    }
                }
            },
            j_aij_nobody = {
                name = "谁也不是",
                text = {
                    "{C:inactive}啥用也没有……吗？"
                }
            },
            j_aij_broken_dreams = { name = "Broken Dreams", text = { "" } },
            j_aij_elf = {
                name = "小妖精",
                text = {
                    "跳过{C:attention}#2#{}个盲注后",
                    "{C:money}售出{}本牌以生成",
                    "{C:attention}#3#{}个{C:attention}投资标签",
                    "{C:inactive}（已跳过{C:attention}#1#{C:inactive}/#2#）"
                }
            },
            j_aij_fall_of_count_chaligny = {
                name = "沙利尼伯爵之死",
                text = {
                    "将所有{C:attention}盲注{}的得分{C:attention}要求",
                    "设为基础值的{C:attention}1倍"
                }
            },
            j_aij_mp_fall_of_count_chaligny = {
                name = "沙利尼伯爵之死",
                text = {
                    "将所有{C:attention}盲注{}的得分{C:attention}要求",
                    "设为基础值的{C:attention}1倍",
                    "{C:inactive}（对PvP盲注无效）"
                }
            },
            j_aij_coulrorachne = {
                name = "八足丑蛛仙",
                text = {
                    "每有{C:attention}#4# {C:inactive}[#3#]{}张计分的{C:attention}8",
                    "本牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                }
            },
            j_aij_bad_sun = {
                name = "恶日凌空",
                text = {
                    "{C:attention}出牌{}包含至少{C:attention}#1#{}张{C:hearts}红桃{}时",
                    "{C:attention}随机{}摧毁一张打出的牌"
                }
            },
            j_aij_lemarchand_cube = { name = "LeMarchand Cube", text = { "" } },
            j_aij_duende = { name = "Duende", text = { "" } },
            j_aij_evil_joker = {
                name = "邪恶小丑",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:attention}获得{}后，{C:attention}随机{}摧毁",
                    "一张小丑牌"
                }
            },
            j_aij_sanguine_joker = {
                name = "喜乐小丑",
                text = {
                    "打出的{C:hearts}红桃{}牌在计分时",
                    "有{C:green}#1#/#2#{}的几率",
                    "随机生成一个{C:attention}标签"
                }
            },
            j_aij_choleric_joker = {
                name = "暴躁小丑",
                text = {
                    "打出的{C:diamonds}方片{}牌在计分时",
                    "有{C:green}#1#/#2#{}的几率",
                    "随机生成一张{C:tarot}塔罗{}牌",
                    "{C:inactive}（必须有空间）"
                }
            },
            j_aij_phlegmatic_joker = {
                name = "镇静小丑",
                text = {
                    "打出的{C:clubs}梅花{}牌在计分时",
                    "有{C:green}#1#/#2#{}的几率生成一张",
                    "对应{C:attention}所出牌型{}的{C:planet}星球{}牌",
                    "{C:inactive}（必须有空间）"
                }
            },
            j_aij_melancholic_joker = {
                name = "忧郁小丑",
                text = {
                    "打出的{C:spades}黑桃{}牌",
                    "在计分时有{C:green}#1#/#2#{}的几率",
                    "随机生成一张{C:spectral}幻灵牌",
                    "{C:inactive}（必须有空间）"
                }
            },
            j_aij_majordomo = {
                name = "大管家",
                text = {
                    {
                        "{C:money}商店{}内所有售价",
                        "高于{C:money}$#1#{}的小丑牌",
                        "均带有{C:money}租用{}贴纸"
                    },
                    {
                        "{C:attention}租用{}扣费减少{C:money}$2"
                    }
                }
            },
            j_aij_skinsuit = {
                name = "人皮头套",
                text = {
                    "游戏牌被{C:red}摧毁{}时",
                    "为{C:attention}随机{}一张{C:attention}手牌",
                    "打上其花色的补丁"
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
                name = "从此处裁剪",
                text = {
                    "本牌被{C:red}摧毁{}后",
                    "随机生成一张",
                    "{C:red}稀有{}小丑牌"
                }
            },
            j_aij_a_young_hamlet = {
                name = "青年哈姆雷特",
                text = {
                    "每{C:red}弃掉{C:attention}#3#{C:inactive} [#4#]{}张牌",
                    "本牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
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
                name = "摇滚小丑",
                text = {

                }
            },
            j_aij_vecchio_dolore = {
                name = "Vecchio Dolore",
                text = {

                }
            },
            j_aij_firework = {
                name = "火树银花",
                text = {
                    "打出的首张{C:attention}倍率{}牌",
                    "在计分时给予{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_bad_guy = {
                name = "坏家伙",
                text = {
                    "击败{C:attention}盲注{}后",
                    "为随机一张{C:attention}手牌",
                    "添加{C:attention}闪箔"
                }
            },

            j_aij_tool = {
                name = "工具",
                text = {
                    "改变{C:attention}花色{}的牌",
                    "永久获得{C:mult}+#1#{}倍率"
                }
            },
            j_aij_youve_got_mail = {
                name = "您有一封新邮件",
                text = {
                    {
                        "若{C:red}不为{C:dark_edition}负片，选择{C:attention}盲注{}后",
                        "生成一张售价为{C:money}$0{}的{C:dark_edition}负片{C:attention}复制",
                    },
                    {
                        "{V:1}#3#{B:3,V:2}#1##2#",
                    }
                }
            },
            j_aij_fleshgait = {
                name = "蹒行血肉",
                text = {
                    "{C:red}无{C:attention}花色补丁{}的{C:attention}计分{}牌",
                    "随机获得一个{C:attention}花色补丁"
                }
            },
            j_aij_czar = {
                name = "沙皇",
                text = {
                    "复制{C:attention}收藏{}中{C:attention}随机{}一张",
                    "已发现的小丑牌的{C:attention}效果",
                    "{C:inactive}（重掷商店时",
                    "{C:inactive}变更效果）"
                }
            },
            j_aij_stage_production = {
                name = "你方唱罢",
                text = {
                    "{B:1,C:white,s:0.8}可激活能力",
                    "每回合一次",
                    "{C:attention}重掷{}右侧小丑牌",
                    "直至选择下一个盲注",
                    "{C:inactive}#1#"
                }
            },
            j_aij_pink_slip = {
                name = "解雇通知",
                text = {
                    "{C:red}弃牌{C:attention}可选张数+#1#"
                }
            },
            j_aij_chromatist = {
                name = "色彩学家",
                text = {
                    "触发{C:attention}多彩{}版本效果时",
                    "{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_death_of_a_salesman = {
                name = "推销员之死",
                text = {
                    "每个{C:money}商店{}提供{C:attention}#1#{}个",
                    "{C:red}混乱{}或{C:red}无序{C:attention}标签"
                }
            },
            j_aij_parking_space = {
                name = "停车位",
                text = {
                    "本牌位列第{C:attention}#2#{}时，{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（每回合结束时变更次序要求）"
                }
            },
            j_aij_graffiti = {
                name = "街头涂鸦",
                text = {
                    {
                        '{B:1,C:white,s:0.8}可激活能力',
                        '花费{C:money}$#1#',
                        '随机获得一个{C:attention}标签'
                    },
                    {
                        '每次使用后，{C:money}花费{C:red}X#2#',
                        '击败{C:attention}Boss盲注{}后重置'
                    }
                }
            },
            j_aij_historian = {
                name = "历史学家",
                text = {
                    "给予等同于{C:attention}#1#倍{}于",
                    "最近售出的小丑牌",
                    "之{C:money}售价{}的{C:mult}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                }
            },
            j_aij_baddata = {
                name = "BAD_DATA",
                text = {
                }
            },
            j_aij_office_assistant = {
                name = "Office助手",
                text = {
                    "{B:1,C:white,s:0.8}可激活能力",
                    '修复{C:attention}右侧{}小丑牌的',
                    '{C:attention}易腐{}或{C:attention}租用'
                }
            },
            j_aij_cavalier = {
                name = "骑士",
                text = {
                    "当前{C:attention}回合{}内",
                    "每{C:attention}出牌{}一次",
                    "{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
                }
            },
            j_aij_elder = {
                name = "古神",
                text = {
                    '复制拥有时间{C:attention}最长{}的',
                    '另一个{C:attention}小丑牌{}的能力',
                    "{C:inactive}（当前为[#1#]）"
                }
            },


            j_aij_prototype = {
                name = "Prototype",
                text = {
                    "{C:inactive}\"Lol I don't know if I",
                    "{C:inactive}have any quotes in me\"" }
            },
            j_aij_spoofy = {
                name = "Spoofy",
                text = {
                    "{C:inactive}\"You should play Braptro\"" }
            },
            j_aij_toyrapple = { name = "Toyrapple", text = { "" } },
            j_aij_grass = {
                name = "Grass",
                text = {
                    "\"the game\"" }
            },
            j_aij_mythie = {
                name = "Mythie",
                text = {
                    "{C:inactive}\"Eating toast in bed is",
                    "{C:inactive}my ability\"" }
            },
            j_aij_zan = { name = "Zan", text = { "" } },
            j_aij_metrollen = { name = "Metrollen", text = { "" } },
            j_aij_clay = { name = "Clay", text = { "" } },
            j_aij_generic = {
                name = "Gen-Eric",
                text = {
                    "{C:inactive}\"The rest was blanked out",
                    "{C:inactive}for the sake of game balance\""
                }
            },
            j_aij_cheddar = { name = "Cheddar", text = { "" } },




            j_aij_nybbas = { name = "Nybbas", text = { "" }, unlock = { "?????" } },
            j_aij_doink = { name = "Doink", text = { "" }, unlock = { "?????" } },
            j_aij_monarcho = { name = "Monarcho", text = { "" }, unlock = { "?????" } },
            j_aij_pompey = {
                name = "庞培",
                text = {
                    "{C:attention}右侧{}每有一张{C:attention}小丑牌",
                    "{C:inactive,s:0.8}（包括本身）",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_touchstone = {
                name = "试金石",
                text = {
                    "手牌上限{C:attention}+#1#",
                    "揭示牌组顶的{C:attention}#2#{}张牌"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fortunato = {
                name = "福尔图纳托",
                text = {
                    {
                        "将所有{C:attention}打出{}但{C:attention}未计分",
                        "的牌增强为{C:attention}石头牌",
                    },
                    {
                        "{C:attention}石头牌{}计分时",
                        "本牌获得{X:mult,C:white}X#2#{}倍率",
                        "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）",
                    }
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pellesini = {
                name = "佩莱西尼",
                text = {
                    "任何小丑牌被{C:red}摧毁{}后",
                    "生成一张{C:attention}一比一{}复制",
                    "{C:inactive}（包括自身）"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_nedda = {
                name = "内达",
                text = {
                    "留手的每张{C:attention}Q",
                    "给予{X:mult,C:white}X#1#{}倍率"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_silvio = {
                name = "西尔维奥",
                text = {
                    "手牌中每有一张{C:attention}Q{}",
                    "所有{C:attention}K{}可重新触发1次"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_biancolelli = {
                name = "比安科莱莉",
                text = {
                    "小丑牌触发后",
                    "{C:aij_plasma}平衡{C:chips}筹码{}和{C:mult}倍率"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_toto = {
                name = "托托",
                text = {
                    "为获得的每个{C:attention}标签",
                    "生成{C:attention}#1#{}个复制",
                    "{C:inactive}（双倍标签除外）"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_grock = { name = "Grock", text = { "" }, unlock = { "?????" } },
            j_aij_eulenspiegel = {
                name = "捣蛋鬼提尔",
                text = {
                    {
                        "击败{C:attention}Boss盲注{}后",
                        "本牌失去{X:mult,C:white}X#2#{}倍率",
                        "并使底注{C:attention}-#1#",
                        "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）"
                    },
                    {
                        "倍率为{X:mult,C:white}X0{}时",
                        "{C:red}削弱自身"
                    }

                },
                unlock = {
                    "?????"
                }
            },
            j_aij_deburau = { name = "Deburau", text = { "" }, unlock = { "?????" } },
            j_aij_dacosta = { name = "D'acosta", text = { "" }, unlock = { "?????" } },
            j_aij_durie = { name = "Durie", text = { "" }, unlock = { "?????" } },
            j_aij_nichola = {
                name = "尼古拉",
                text = {
                    '回合开始时，将一张',
                    '带有随机{C:attention}增强{}、{C:dark_edition}版本',
                    '和{C:attention}蜡封{}的{C:attention}Q{}加入手牌'
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fleeman = { name = "Fleeman", text = { "" }, unlock = { "?????" } },
            j_aij_colquhoun = {
                name = "科洪",
                text = {
                    "所有牌{C:attention}计分{}时",
                    "赚取{C:money}$#1#{}",
                    "击败{C:attention}Boss盲注{}后",
                    "提升{C:money}$#2#"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_dor = {
                name = "金夫人",
                text = {
                    "每{C:attention}回合{}的",
                    "{C:attention}最后{}一手出牌",
                    "{X:dark_edition,C:white}#1#{}倍率",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_archy = {
                name = "阿奇",
                text = {
                    "每个{C:money}商店{}内的",
                    "首批{C:attention}卡牌{}和{C:attention}补充包",
                    "均为免费"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_sommers = {
                name = "索莫斯",
                text = {
                    "{C:attention}升级{}打出的",
                    "所有牌型"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pace = {
                name = "佩斯",
                text = {
                    {
                        "将小丑牌出现于{C:money}商店{}的",
                        "{C:red}稀有度{}权重设为{C:green}相等",
                        "{C:inactive}（传奇除外）"
                    },
                    {
                        "所有小丑牌售价均为{C:money}$#1#"
                    }
                },
                unlock = { "?????" }
                -- TODO discuss: are these rarities inclusive,
                -- so e.g. an Uncommon would count as Common and still be Uncommon
                -- for a Baseball Card
            },
            j_aij_thomazina = {
                name = "托玛辛娜",
                text = {
                    "计分的{C:attention}数字{}牌给予{C:chips}+#1#{}筹码",
                    "{C:attention}数字{}牌计分时，该筹码加成{C:chips}+#2#"
                },
                unlock = { "?????" }
            },
            j_aij_mathurine = { name = "Mathurine", text = { "" }, unlock = { "?????" } },
            j_aij_guillaume = {
                name = "纪尧姆",
                text = {
                    "以少于{C:attention}5{}张小丑牌",
                    "击败{C:attention}Boss盲注{}后",
                    "本牌获得{C:dark_edition}+#2#{}小丑牌槽位",
                    "{C:inactive}（当前为{C:dark_edition}+#1#{C:inactive}小丑牌槽位）",
                },
                unlock = { "?????" }
            },
            j_aij_tarlton = {
                name = "塔尔顿",
                text = {
                    "给予与本回合{C:attention}上一手出牌{}的",
                    "{C:attention}总{C:chips}筹码{}数相等的{C:chips}筹码",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                },
                unlock = { "?????" }
            },
            j_aij_roland = { name = "Roland", text = { "" }, unlock = { "?????" } },
            j_aij_borra = { name = "Borra", text = { "" }, unlock = { "?????" } },
            j_aij_taillefer = {
                name = "塔耶费尔",
                text = {
                    "每次出牌，本牌获得{X:mult,C:white}X#2#{}倍率",
                    "击败{C:attention}#3#{}个{C:attention}Boss盲注{}后{C:red}自毁",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率，{C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive}）",
                },
                unlock = { "?????" }
            },
            j_aij_killigrew = {
                name = "基利格鲁",
                text = {
                    "每拥有一张{C:attention}优惠券",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）",
                },
                -- TODO Should start at X1 as a legendary
                unlock = { "?????" }
            },
            j_aij_dongfang = { name = "Dongfang", text = { "" }, unlock = { "?????" } },
            j_aij_zerco = {
                name = "泽尔科",
                text = {
                    "为每{C:attention}回合",
                    "{C:attention}首{}张计分{C:attention}牌",
                    "添加{C:dark_edition}负片",
                    "{C:inactive}（若其无版本）"
                },
                unlock = { "?????" }
            },
            j_aij_yu_sze = {
                name = "优旃",
                text = {
                    "每张{C:dark_edition}无版本{}小丑牌",
                    "给予{X:mult,C:white}X#1#{}倍率"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_brusquet = { name = "Brusquet", text = { "" }, unlock = { "?????" } },
            j_aij_rahere = { name = "Rahere", text = { "" }, unlock = { "?????" } },
            j_aij_gonnella = { name = "Gonnella", text = { "" }, unlock = { "?????" } },
            j_aij_gong_gil = { name = "孔吉", text = { "" }, unlock = { "?????" } },
            j_aij_angoulevent = {
                name = "昂古勒旺",
                text = {
                    "打出的所有牌",
                    "重新触发{C:attention}#1#{}次"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_coryat = { name = "Coryat", text = { "" }, unlock = { "?????" } },
            j_aij_bluet = {
                name = "布卢伊特",
                text = {
                    "选择{C:attention}盲注{}后",
                    "生成一张{C:dark_edition}负片{C:spectral}幻灵{}牌"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_bebe = {
                name = "贝贝",
                text = {
                    "每一回合",
                    "出牌次数{C:blue}+#1#",
                },
                unlock = { "?????" }
            },
            j_aij_pipine = {
                name = "皮平",
                text = {
                    "每回合{C:red}+#1#{}次弃牌"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_golitsyn = { name = "Golitsyn", text = { "" }, unlock = { "?????" } },
            j_aij_buzheninova = { name = "Buzheninova", text = { "" }, unlock = { "?????" } },
            j_aij_yakov = { name = "Yakov", text = { "" }, unlock = { "?????" } },
            j_aij_komar = {
                name = "柯玛尔",
                text = {
                    "所有{C:attention}计分{}牌获得",
                    "等同于{C:attention}其他{}所有出牌",
                    "之基础{C:chips}筹码数{}的{C:chips}筹码"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_lavatch = {
                name = "拉瓦什",
                text = {
                    "计分的{V:1}#3#{}牌",
                    "给予{X:mult,C:white}X#1#{}倍率",
                    "{V:1}梅花{}牌计分后",
                    "增加{X:mult,C:white}X#2#{}倍率",
                    "{s:0.8,C:inactive}（回合结束时变更花色）"
                },
                unlock = { "?????" }
            },
            j_aij_Ffwllier = { name = "Ffwllier", text = { "" }, unlock = { "?????" } },
            j_aij_martellino = {
                name = "马尔泰利诺",
                text = {
                    "{C:attention}#2#{}回合后{C:money}售出{}本牌",
                    "即可生成{C:attention}收藏{}中的",
                    "{C:attention}任意{}一张{C:attention}小丑牌",
                    "{C:inactive}（当前为{C:attention}#1#{C:inactive}/#2#回合）"
                },
                unlock = { "?????" }
            },
            j_aij_shir_ei = { name = "希尔伊", text = { "" }, unlock = { "?????" } },
            j_aij_xinmo = { name = "敬新磨", text = { "" }, unlock = { "?????" } },
            j_aij_chunyu = { name = "淳于髡", text = { "" }, unlock = { "?????" } },
            j_aij_fantasio = {
                name = "范塔西奥",
                text = {
                    "所有卡牌",
                    "均视作{C:attention}任何花色",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_sexton = { name = "Sexton", text = { "" }, unlock = { "?????" } },
            j_aij_dongtong = {
                name = "石动筩",
                text = {
                    {
                        "使大多数{C:attention}小丑牌{}的数值{C:green}翻倍",
                    },
                    {
                        "使{C:attention}盲注得分要求{}翻倍"
                    }
                },
                unlock = { "?????" }
            },
            j_aij_naiteh = {
                name = "小先生",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "手牌上限{C:attention}+#2#",
                    "{C:inactive}（当前为{C:attention}+#1#{C:inactive}手牌上限）"
                },
                unlock = { "?????" }
            },
            j_aij_talhak = {
                name = "塔尔哈克",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "{C:attention}任选{}并生成一张",
                    "非隐秘{C:spectral}幻灵{}牌",
                    "{C:inactive}（必须有空间）"
                },
                unlock = { "?????" }
            },
            j_aij_bozo = {
                name = "波佐",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "随机生成{C:attention}#1#{}张",
                    "{C:dark_edition}负片{}小丑牌",
                },
                unlock = { "?????" }
            },
            j_aij_thalia = {
                name = "塔莉娅",
                text = {
                    "若回合{C:attention}首次弃牌{}仅有{C:attention}1{}张",
                    "使其触发次数永久{C:attention}+#1#"

                },
                unlock = { "?????" }
            },
        },
        Planet = {
            c_aij_vulcanoid = {
                name = "祝融型小行星",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_zoozve = {
                name = "Zoozve",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_luna = {
                name = "月球",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_phobos = {
                name = "火卫一",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_europa = {
                name = "木卫二",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_titan = {
                name = "土卫六",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_umbriel = {
                name = "天卫二",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_triton = {
                name = "海卫一",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_nix = {
                name = "冥卫二",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_planet_nine = {
                name = "第九行星",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_pallas = {
                name = "智神星",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_dysnomia = {
                name = "阋卫一",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_phaethon = {
                name = "法厄松",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_kamooalewa = {
                name = "振荡天星",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_deimos = {
                name = "火卫二",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_callisto = {
                name = "木卫四",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_iapetus = {
                name = "土卫八",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_oberon = {
                name = "天卫四",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_proteus = {
                name = "海卫八",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_charon = {
                name = "冥卫一",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_nibiru = {
                name = "尼比鲁",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_kuiper = {
                name = "柯伊伯带小行星",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_rogue = {
                name = "流浪行星",
                text = {
                    '升级所持有{C:attention}小丑牌{}的',
                    '卡面描述中提及的',
                    '{C:attention}所有牌型'
                }
            },
            c_aij_dark_star = {
                name = "暗星",
                text = {
                    '升级{C:attention}所有',
                    "尚未{C:attention}打出{}的{C:attention}牌型"
                }
            },
            c_aij_sol = {
                name = "太阳",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#4#{}倍率，{C:chips}+#3#{}筹码",
                }
            },
            c_aij_paper_weywot = {
                name = "创卫一",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_paper_namaka = {
                name = "妊卫二",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_paper_ilmare = {
                name = "伊尔玛瑞",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_paper_salacia = {
                name = "潫神星",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:mult}+#3#{}倍率",
                }
            },
            c_aij_paper_ixion = {
                name = "伊克西翁",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_paper_hiiaka = {
                name = "妊卫一",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_paper_varda = {
                name = "瓦尔达",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            },
            c_aij_paper_mk2 = {
                name = "鸟卫一",
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）",
                    "升级{C:attention}#2#",
                    "{C:chips}+#3#{}筹码",
                }
            }
        },
        Spectral = {
            c_aij_gravastar = {
                name = '重力真空星',
                text = {
                    '{C:attention}升级{}所有{C:legendary,E:1}牌型{}的',
                    '{C:chips}筹码数'
                }
            },
            c_aij_pulsar = {
                name = '脉冲星',
                text = {
                    '{C:attention}升级{}所有{C:legendary,E:1}牌型{}的',
                    '{C:mult}倍率'
                }
            },
            c_aij_shade = {
                name = '阴翳',
                text = {
                    '为随机{C:attention}#1#{}张手牌',
                    '添加{C:dark_edition}负片'
                }
            },
            c_aij_trefle = {
                name = '苜蓿',
                text = {
                    '{C:attention}重掷{}选定的{C:attention}小丑牌',
                    "{C:inactive}（不可为永恒）"
                }
            },
            c_aij_trefle_controller = {
                name = '苜蓿',
                text = {
                    '{C:attention}重掷最右侧{}的{C:attention}小丑牌',
                    "{C:inactive}（不可为永恒）"
                }
            },
            c_aij_maw = {
                name = '血口',
                text = {
                    '随机{C:red}摧毁{}一张{C:attention}小丑牌',
                    '及{C:attention}所有手牌',
                }
            },
            c_aij_reshape = {
                name = '重塑',
                text = {
                    '将持有的全部{C:attention}小丑牌',
                    '随机转换为所持的同种{C:attention}小丑牌',
                    '{C:inactive}（保留原有贴纸和版本）'
                }
                -- must rework
            },
            c_aij_palmistry = {
                name = '手相',
                text = {
                    '为所有手牌',
                    '添加随机{C:attention}增强',
                    '手牌上限{C:red}-#1#'
                }
            },
            c_aij_gegenschein = {
                name = "反辉",
                text = {
                    '将已{C:attention}打出过{}的',
                    '{C:dark_edition}隐秘{}牌型的等级',
                    '设为其{C:attention}打出次数'
                }
            },
            c_aij_mirth = {
                name = '笑靥',
                text = {
                    "为选定的{C:attention}#1#{}张手牌",
                    "打上{V:1}#2#"
                }
            },
        },
        Tag = {
            tag_aij_glimmer = {
                name = '闪粉标签',
                text = {
                    "商店内的下一张",
                    "无版本小丑牌",
                    "将变为{C:aij_plasma}闪粉{}且售价为{C:money}$0"
                }
            },
            tag_aij_silver = {
                name = '银幕标签',
                text = {
                    "商店内的下一张",
                    "无版本小丑牌",
                    "将变为{C:aij_silver}银幕{}且售价为{C:money}$0"
                }
            },
            tag_aij_stellar = {
                name = '星辰标签',
                text = {
                    "商店内的下一张",
                    "无版本小丑牌",
                    "将变为{C:aij_stellar}星辰{}且售价为{C:money}$0"
                }
            },
            tag_aij_aureate = {
                name = '鎏金标签',
                text = {
                    "商店内的下一张",
                    "无版本小丑牌",
                    "将变为{C:money}鎏金{}且售价为{C:money}$0"
                }
            },
            tag_aij_soulbound = {
                name = '魂缚标签',
                text = {
                    '随机生成一张',
                    '{C:attention}易腐{C:legendary}传奇{}小丑牌',
                    '{C:inactive}（必须有空间）'
                }
            },
            tag_aij_fortunate = {
                name = '幸运标签',
                text = {
                    '从所有{C:tarot}塔罗牌{}中',
                    '{C:attention}任选{}一张生成',
                    '{C:inactive}（必须有空间）'
                }
            },
            tag_aij_overstuffed = {
                name = '填塞标签',
                text = {
                    "打开的下一个{C:attention}补充包",
                    "提供的可选项和选择次数{C:attention}翻倍"
                }
            },
            tag_aij_chaos = {
                name = '混乱标签',
                text = {
                    "具有{C:red}随机{}效果"
                }
            },
            -- Gold Tags
            tag_aij_windfall = {
                name = '横财标签',
                text = {
                    "资金{C:money}X3",
                    "{C:inactive}（最高{C:money}$300{C:inactive}）"
                }
            },
            tag_aij_unusual = {
                name = '非常标签',
                text = {
                    "商店内将出现一张",
                    "免费且数值{C:attention}翻倍{}的",
                    "{C:uncommon}罕见{}小丑牌"
                }
            },
            tag_aij_recherche = {
                name = '珍稀标签',
                text = {
                    "商店内将出现一张",
                    "免费且数值{C:attention}翻倍{}的",
                    "{C:rare}稀有{}小丑牌"
                }
            },
            tag_aij_hermetic = {
                name = '炼金标签',
                text = {
                    '选择并生成一张',
                    '{C:attention}非隐秘{C:spectral}幻灵{}牌',
                    '{C:inactive}（必须有空间）'
                }
            },
            tag_aij_dark_matter = {
                name = '暗物质标签',
                text = {
                    '为{C:attention}随机{}一张',
                    '基础版本小丑牌',
                    '添加{C:dark_edition}负片'
                }
            },
            tag_aij_crystal = {
                name = '晶光标签',
                text = {
                    '为{C:attention}随机{}一张无版本的小丑牌',
                    '及牌组中的{C:attention}#1#{}张牌添加{C:dark_edition}闪箔'
                }
            },
            tag_aij_iridescent = {
                name = '虹彩标签',
                text = {
                    '为{C:attention}随机{}一张无版本的小丑牌',
                    '及牌组中的{C:attention}#1#{}张牌添加{C:dark_edition}镭射'
                }
            },
            tag_aij_omnichrome = {
                name = '焕彩标签',
                text = {
                    '为{C:attention}最右侧{}的',
                    '基础版本小丑牌',
                    '添加{C:dark_edition}多彩'
                }
            },
            tag_aij_circumplanetary = {
                name = '环星标签',
                text = {
                    '将{C:attention}最常出牌型',
                    '{C:attention}提升#1#级',
                    '{C:inactive}（当前为#2#）'
                }
            },
            tag_aij_velocity = {
                name = '疾速标签',
                text = {
                    '给予{C:money}$#1#',
                    '每经过一{C:attention}回合',
                    '减少{C:money}$#2#',
                    '{C:inactive}（将得到{C:money}$#3#{C:inactive}）'
                }
            },
            tag_aij_capital = {
                name = '资本标签',
                text = {
                    '击败Boss盲注后',
                    '获得{C:money}$#1#'
                }
            },
            tag_aij_bierstiefel = {
                name = '酒靴标签',
                text = {
                    '以随机{C:common}普通{}或{C:uncommon}罕见{}小丑牌',
                    '填满{C:attention}小丑牌槽位'
                }
            },
            tag_aij_ticket = {
                name = '票券标签',
                text = {
                    '随机{C:attention}兑换{}一张优惠券',
                    '及其{C:attention}升级{}版本'
                }
            },
            tag_aij_galloping_domino = {
                name = '投琼标签',
                text = {
                    '下个商店内',
                    '重掷{C:attention}均价{C:money}$#1#'
                    -- TODO Needs a limit due to effectively quadratic
                    -- money scaling
                }
            },
            tag_aij_gioco = {
                name = '把戏标签',
                text = {
                    '下回合手牌上限{C:attention}翻倍'
                }
            },
            tag_aij_stereoscopic = {
                name = '三维标签',
                text = {
                    '为下一个获得的{C:attention}标签',
                    '生成一个{C:money}黄金{}复制',
                    '{s:0.8,C:attention}双倍标签{s:0.8}除外',
                }
            },
            tag_aij_frugal = {
                name = '节俭标签',
                text = {
                    "下个商店内的",
                    "{C:attention}所有{}卡牌和补充包",
                    "均为免费",
                }
            },
            tag_aij_dominus = {
                name = '头领标签',
                text = {
                    '{C:attention}任选Boss盲注',
                    '以替换当前Boss盲注'
                }
            },
            tag_aij_nonstandard = {
                name = '非标准标签',
                text = {
                    '{C:attention}自定义{}一张{C:attention}游戏牌',
                    '并将其2张复制加入牌组',
                }
            },
            tag_aij_ignoramus = {
                name = '蠢汉标签',
                text = {
                    '{C:attention}任选{}并生成一张',
                    '{C:common}普通{}或{C:uncommon}罕见{}小丑牌',
                    '{C:inactive}（必须有空间）'
                }
            },
            tag_aij_occult = {
                name = '玄机标签',
                text = {
                    '生成{C:attention}3{}张{C:tarot}塔罗{}牌',
                    '和{C:attention}2{}张{C:spectral}幻灵{}牌',
                    '{s:0.8}均为{s:0.8,C:dark_edition}负片',
                }
            },
            tag_aij_asteroid = {
                name = '星陨标签',
                text = {
                    '免费给予一个',
                    '含有{C:dark_edition}黑洞{}、{C:dark_edition}脉冲星',
                    '和{C:dark_edition}重力真空星{}的{C:planet}天体包',
                }
            },
            tag_aij_polydactyly = {
                name = '多指标签',
                text = {
                    '本赛局每有一次{C:blue}出牌{}未使用',
                    '下回合{C:blue}出牌次数+1',
                    '{C:inactive}（将给予{C:blue}#1#{C:inactive}次出牌）',
                    '{C:inactive}（至多给予{C:blue}40{C:inactive}次出牌）'
                }
            },
            tag_aij_landfill = {
                name = '填埋标签',
                text = {
                    '本赛局内',
                    '每{C:red}弃{}过一张牌',
                    '给予{C:money}$1',
                    '{C:inactive}（将给予{C:money}$#1#{C:inactive}）',
                }
            },
            tag_aij_cinema = {
                name = '影院标签',
                text = {
                    '为{C:attention}最左侧{}的',
                    '基础版本小丑牌',
                    '添加{C:aij_silver}银幕'
                }
            },
            tag_aij_ventripotent = {
                name = '鼓胀标签',
                text = {
                    "打开的下一个{C:attention}补充包",
                    "提供的可选项{C:attention}翻倍",
                    "且{C:attention}不限{}选择次数"
                }
            },
            tag_aij_timelost = {
                name = '时殇标签',
                text = {
                    '免费获得一个',
                    '内含{C:attention}5{}个易腐选项的',
                    '{C:purple}笑语猜谜包'
                }
            },
            tag_aij_auspicious = {
                name = '吉庆标签',
                text = {
                    '任选一张{C:tarot}塔罗{}牌',
                    '生成其{C:attention}3{}张{C:dark_edition}负片{}复制'
                }
            },
            tag_aij_glamour = {
                name = '魅力标签',
                text = {
                    '为{C:attention}随机2{}张',
                    '无版本小丑牌',
                    '添加{C:aij_plasma}闪粉'
                }
            },
            tag_aij_superlunary = {
                name = '天外标签',
                text = {
                    '为{C:attention}随机{}一张无版本的小丑牌',
                    '及牌组中的{C:attention}#1#{}张牌添加{C:aij_stellar}星辰'
                }
            },
            tag_aij_gold_dust = {
                name = '金粉标签',
                text = {
                    '为牌组中的{C:attention}#1#{}张无版本牌',
                    '添加{C:money}鎏金',
                }
            },
            tag_aij_anarchy = {
                name = '无序标签',
                text = {
                    '具有{C:red}随！机！{}效果{C:red}！！！'
                }
            },
        },
        Tarot = {
            c_aij_magus = {
                name = '魔术师',
                text = {
                    "将{C:attention}#1#{}张选定卡牌",
                    "增强为{C:attention}#2#"
                }
            },
            c_aij_sanctuary_gate = {
                name = '圣所之门',
                text = {
                    "将{C:attention}#1#{}张选定卡牌",
                    "增强为{C:attention}#2#"
                }
            },
            c_aij_isis_urania = {
                name = '伊西斯-乌拉尼亚',
                text = {
                    "将{C:attention}#1#{}张选定卡牌",
                    "增强为{C:attention}#2#"
                }
            },
            c_aij_cubic_stone = {
                name = 'The Cubic Stone',
                text = {
                    "将{C:attention}#1#{}张选定卡牌",
                    "增强为{C:attention}#2#"
                }
            },
            c_aij_master_arcanes = {
                name = '秘术大师',
                text = {
                    "有{C:green}#1#/#2#{}的几率",
                    "随机生成一张{C:spectral}幻灵牌",
                    '{C:inactive}（必须有空间）'
                }
            },
            c_aij_two_ways = {
                name = '双格',
                text = {
                    "拆分{C:attention}#1#{}张选定卡牌",
                    "生成{C:attention}点数为其{C:attention}一半{}的{C:attention}2{}张牌",
                    "{C:inactive}（奇数牌将尽可能均分）",
                    "{C:inactive}（A=14，K=13，Q=12，J=11）"
                }
            },
            c_aij_osiris = {
                name = '奥西里斯',
                text = {
                    "{C:red}摧毁{C:attention}1{}张选定小丑牌",
                    "获得三倍于其{C:money}售价{}的资金",
                    "{C:inactive}（当前为{C:money}$#1#{C:inactive}）"
                }
            },
            c_aij_osiris_controller = {
                name = '奥西里斯',
                text = {
                    "{C:red}摧毁{C:attention}最右侧{}的小丑牌",
                    "获得三倍于其{C:money}售价{}的资金",
                    "{C:inactive}（当前为{C:money}$#1#{C:inactive}）"
                }
            },
            c_aij_balance_and_blade = {
                name = '衡与刃',
                text = {
                    "为{C:attention}#1#{}张选定卡牌",
                    "{C:attention}补上{}一个随机花色"
                }
            },
            c_aij_veiled_lamp = {
                name = '蒙罩灯',
                text = {
                    "将{C:attention}#1#{}张选定卡牌",
                    "增强为{C:attention}#2#"
                }
            },
            c_aij_sphinx = {
                name = '斯芬克斯',
                text = {
                    "将{C:attention}#1#{}张选定卡牌",
                    "增强为{C:attention}#2#"
                }
            },
            c_aij_tamed_lion = {
                name = '驯化狮',
                text = {
                    "将{C:attention}#1#{}张选定卡牌",
                    "增强为{C:attention}#2#"
                }
            },
            c_aij_broken_fate = {
                name = '颓混势',
                text = {
                    "将{C:attention}最左侧消耗牌{}的{C:attention}默认{}数值",
                    "随机{C:attention}X0.75{}-{C:attention}X2.5"
                }
            },
        },
        Other = {
            -- Other
            aij_patches_suit = {
                name = "补丁",
                text = {
                    "也视作{V:1}#1#"
                }
            },
            aij_jest_mark_of_the_spear = {
                name = "长矛标记",
                text = {
                    '本{C:attention}牌{}已因{C:attention}长矛',
                    '而永久{C:red}削弱',
                }
            },
            card_extra_retriggers = {
                text = {
                    "重新触发此牌{C:attention}#1#{}次"
                },
            },
            showdown_blind = {
                name = "决胜盲注",
                text = {
                    "每{C:attention}#1#{}个底注的末尾",
                    "出现的{C:attention}特殊Boss盲注"
                }
            },
            reroll_joker = {
                name = "重掷",
                text = {
                    '替换为相同稀有度的',
                    '随机小丑牌'
                }
            },
            office_assistant_perishable = {
                name = "易腐",
                text = {
                    '花费{C:money}$3',
                    '{C:attention}重置{C:attention}易腐{}小丑牌',
                    '的剩余回合数'
                }
            },
            office_assistant_rental = {
                name = "租用",
                text = {
                    '花费小丑牌的{C:money}基础价格',
                    '为其移除{C:attention}租用贴纸'
                }
            },
            overdesigned_club = {
                name = "梅花",
                text = {
                    "打出的{C:clubs}梅花{}牌",
                    "在计分时给予{C:mult}+#1#{}倍率",
                }
            },
            overdesigned_spade = {
                name = "黑桃",
                text = {
                    "打出的{C:spades}黑桃{}牌",
                    "在计分时给予{C:chips}+#1#{}筹码",
                }
            },
            overdesigned_diamond = {
                name = "方片",
                text = {
                    "打出的{C:diamonds}方片{}牌",
                    "在计分时给予{C:money}$#1#",
                }
            },
            overdesigned_heart = {
                name = "红桃",
                text = {
                    "打出的{C:hearts}红桃{}牌",
                    "在计分时给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            p_aij_guess_the_jest = {
                name = "笑语猜谜包",
                text = {
                    '从{C:attention}#2#{}张隐秘的',
                    '{C:legendary,E:2}传奇{}小丑牌中',
                    '选择{C:attention}#1#{}张'
                }
            },
            m_aij_dyscalcular_numbered_rank = {
                name = "数字点",
                text = {
                    "{C:attention}2{}、{C:attention}3{}、{C:attention}4{}、{C:attention}5{}、{C:attention}6{}、",
                    "{C:attention}7{}、{C:attention}8{}、{C:attention}9{}、{C:attention}10",
                }
            },
            palindrome = {
                name = "回文数",
                text = {
                    "正倒序读数{C:attention}一致{}的多位数",
                    "{C:inactive}例如33、151、3003等"
                }
            },
            guess_the_jest_hidden={
                name="???",
                text={
                    "{C:inactive,E:1,s:1.5}???{}",
                },
            },
            -- Stickers
            aij_marked = {
                name = "标记",
                text = {
                    '无法{C:blue}打出{}或{C:red}弃掉'
                }
            },
            aij_unusual_doubled = {
                name = "翻倍",
                text = {
                    '效果{C:attention}X2',
                    '{C:inactive,s:0.8}（由非常标签提供）'
                }
            },
            aij_recherche_doubled = {
                name = "翻倍",
                text = {
                    '效果{C:attention}X2',
                    '{C:inactive,s:0.8}（由珍稀标签提供）'
                }
            },
            -- (not a sticker but treated as such)
            aij_jest_chaotic_card = {
                name = "混沌",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "打出后，{C:attention}随机变化{C:edition}增强"
                }
            },
            -- Seals
            aij_smiley_seal = {
                name = "微笑蜡封",
                text = {
                    '被{C:red}摧毁{}时',
                    '为随机{C:attention}#1#{}张{C:attention}小丑牌',
                    '添加随机版本'
                }
            },
            aij_melted_seal = {
                name = "融化蜡封",
                text = {
                    '在{C:attention}手牌{}中时',
                    '{C:attention}变化{}为首个计分的',
                    '非{V:1}融化{C:attention}蜡封'
                }
            },
            nevernamed_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-创作了所有绘画内容",
                    "{s:0.8}-提出了约一半的效果概念",
                    "{s:0.8}-于2024年十二月开始进行小丑牌艺术创作"

                }
            },
            survivalaren_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-编写了约一半的内容",
                    "{s:0.8}-提出了约一半的效果概念",
                    "{s:0.8}-模组创始人",
                    "{s:0.8}-进行了巨量游玩测试",
                    "{s:0.8}-于2025年四月上旬创造了该模组"
                }
            },
            rattling_snow_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-编写了绝大部分高级内容",
                    "{s:0.8}-编写了几乎所有界面内容",
                    "{s:0.8}-编写了所有着色器",
                    "{s:0.8}-于2025年四月下旬加入团队"
                }
            },
            jumbocarrot_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-在修复漏洞及润色方面帮了大忙",
                    "{s:0.8}-不开玩笑，真的测出了一大堆漏洞",
                    "{s:0.8}-于2025年九月加入团队"
                }
            },
            heavenbrand_credits_info = {
                name = "Info",
                text = {
                    "{s:0.8}-制作了All in Jest预告片及其音轨",
                    "{s:0.8}-为银幕和鎏金制作了效果音效",
                    "{s:0.8}-很多有所帮助的游玩测试及反馈",
                    "{s:0.8}-于2026年二月开始制作All in Jest相关内容"
                }
            },
        }
    }
}
