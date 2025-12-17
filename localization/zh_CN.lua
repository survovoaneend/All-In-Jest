--ALOPHRINE的个人汉化修正！如遇到问题请联系我。QQ与B站同名
--vergenti Q群：奇小苦、:)，对部分汉化进行了修正，包括需要代码修改的丑
--SulfuricAcid 将目前的原文本基本同步翻译完毕，包括：汉化缺失 text 的小丑牌，新增小丑牌，汉化缺失的blind，misc，Back，Stake，Partner，Sleeve，Enhanced，Voucher，Edition，Planet，Spectral，Tag，Tarot，Other 
return {
    misc = {
        dictionary = {
            k_coder_badge = "程序员",
            k_artist_badge = "艺术家",
            k_moon = "卫星牌",
            k_moon_q = "卫星牌？",
            k_star = "恒星牌",
            k_star_q = "恒星牌？",
            k_asteroid = "小行星牌",
            k_tag = "标签",
            k_tarot_q = "塔罗牌？",
            k_active = "激活",
            k_inactive = "未激活",
            aij_requires_restart = "需要重启",
            aij_doesnt_requires_restart = "无需重启",
            aij_upgraded_tags = "黄金标签",
            aij_enable_moons = "启用卫星牌",
            aij_enable_moons_tooltip = {
                '允许 {C:chips}筹码{}和 {C:mult}倍率{}类的',
                '{C:planet}星球牌{}出现',
            },
            aij_alter_trypophobia = "更改密集恐惧症贴图",
            aij_alter_trypophobia_tooltip = {
                '{C:attention}更改{}“密集恐惧症”的贴图',
                '使其{C:attention}不那么令人不安'
            },
            aij_no_copy_neg = "允许复制负片卡牌",
            aij_no_copy_neg_tooltip = {
                '允许{C:attention}游戏牌{}上的',
                '{C:dark_edition}负片{}版本被复制。',
                '如果{C:attention}关闭{}（默认），复制的',
                '{C:dark_edition}负片{}牌会{C:red}失去{}该版本'
            },
            aij_blue_stake_rework = '蓝注重制',
            aij_blue_stake_rework_tooltip = {
                '将蓝注效果{C:attention}更改{}为',
                '使用新的{C:attention}深渊盲注{}',
                '而非 {C:red}-1{} 弃牌次数'
            },
            aij_random_deck_skins = '随机牌组皮肤',
            aij_random_deck_skins_tooltip = {
                '添加到牌组中的',
                '{C:attention}游戏牌{}拥有随机的',
                '{C:attention}牌背皮肤'
            },
            k_aij_guess_the_jest = "笑语猜谜",
            k_aij_memory_card = "已铭记！", 
            aij_plus_tag = "+1 标签",
            aij_refreshed = '已刷新', 
            aij_paid_off = '已还清', 
            k_aij_polychrome_ex = '多彩！', 
            k_aij_foiled_again = '再次闪箔！', 
            k_aij_p_arcana = "+1 幻灵包", 
            k_aij_merry_christmas = "圣诞快乐！", 
            k_aij_change_ex = '变形！', 
            k_aij_blood_spilt_ex = '鲜血飞溅！', 
            k_aij_double_ex = '翻倍！', 
            k_aij_triple_ex = '三倍！', 
            k_aij_chaos_ex = '混沌！', 
            k_aij_two_into_one_ex = '合二为一！', 
            k_aij_plus_two_moons = "+2 卫星牌", 
        },
        v_dictionary = {
            a_aij_exp_mult="^#1#倍率",
            a_aij_mult_equal="=#1#倍率",
            a_aij_ante_minus="-#1#底注",
            a_aij_win_ante_plus="+#1#通关底注",
            a_aij_percent_balance = "+%#1#",
            a_aij_percent_balance_minus = "-%#1#",
            a_aij_hands_minus = "-#1#出牌次数",
            a_aij_joker_slots = '+#1#小丑牌槽位',
            a_aij_joker_slots_minus = '-#1#小丑牌槽位',
            a_aij_odds = "+#1#概率",
            a_aij_jokers = "+#1#小丑牌",
        },
        challenge_names = {
            c_aij_bananarama = "香蕉狂热",
            c_aij_sharpest_tool = "最锋利的工具",
            c_aij_the_pit = "深渊",
        },
        v_text = {
            -- Challenges
            ch_c_aij_sharpest_tool_1 = {
                '只有 {C:common}普通{} 小丑牌会出现在',
            },
            ch_c_aij_sharpest_tool_2 = {
                '{C:attention}商店{}或{C:attention}小丑包{}中'
            },
            ch_c_aij_all_pit_blinds = {
                '底注1之后的所有常规Boss盲注都是{C:attention}深渊盲注{}'
            },
        },
        extra_joker_dictionary = {
            -- You've got Mail
            k_aij_youve_got_mail = "收到邮件！",
            k_aij_youve_got_mail_goodbye = "再见",
            k_aij_youve_got_mail_none = "邮箱为空...", 
            k_aij_youve_got_mail_plus_prefix = "+",
            k_aij_youve_got_mail_dollar_prefix = "$",
            k_aij_youve_got_mail_xmult_prefix = "X",
            k_aij_youve_got_mail_mult_text = " 倍率",
            k_aij_youve_got_mail_chip_text = " 筹码",
            k_aij_youve_got_mail_dollars_text = " 每次出牌",
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
            k_aij_blacklist_empty = '无',
            k_aij_blacklist_and = '和',
            k_aij_blacklist_more = '更多',
        },
        labels = {
            -- Editions
            aij_glimmer = "微光",
            aij_silver = "白银",
            aij_stellar = "星辰",
            aij_aureate = "鎏金", 
            aij_torn = "撕裂",
            -- Stickers
            aij_marked = "标记",
            -- Seals
            aij_smiley_seal = "笑脸蜡封",
            aij_melted_seal = "熔化蜡封",
            -- Other
            aij_jest_chaotic_card = "混沌", 
        },
        poker_hands = {
            ['aij_Royal Flush'] = "皇家同花顺",
        },
        poker_hand_descriptions = {
            ['aij_Royal Flush'] = {
                "5张同花色的",
                "A、K、Q、J、10"
            },
        },
    },
    descriptions = {
        Back = {
            b_aij_fabled = {
                name = '传说牌组',
                text = {
                    '{C:legendary}传奇{}小丑牌可能',
                    '出现在{C:attention}商店{}',
                    '{C:attention}-1{}小丑牌槽位'
                },
                unlock = {
                    '解锁一张',
                    '{C:legendary,E:1}传奇{}小丑牌',
                }
            },
            b_aij_fabled_hidden = {
                name = '传说牌组',
                text = {},
                unlock = {
                    '解锁一张{C:legendary}传奇{}',
                    '小丑牌',
                }
            },
            b_aij_branching = {
                name = '分叉牌组',
                text = {
                    '跳过盲注时提供',
                    '{C:attention}3{}个标签供选择',
                },
                unlock = {
                    '在一次游戏中',
                    '跳过至少{C:attention}5{}个盲注',
                }
            },
            b_aij_branching_hidden = {
                name = '分叉牌组',
                text = {},
                unlock = {
                    '在一次游戏中',
                    '跳过至少{C:attention}5{}个盲注',
                }
            },
            b_aij_patchwork = {
                name = '拼布牌组',
                text = {
                    '所有游戏牌出现时',
                    '带有{C:attention}随机{}花色补丁'
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
                    'Boss盲注变为{C:attention}深渊盲注{}',
                    '{s:0.8}应用所有之前的赌注规则'
                }
            },
        } or {},
        Partner = {
            pnr_aij_simply = {
                name = "简单",
                text = {
                    "回合结束时",
                    "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)",
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}简单西蒙{}获胜",
                },
            },
            pnr_aij_fourwarning = {
                name = "四重警告",
                text = {
                    "如果弃牌包含{C:attention}4{}",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)",
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}恐四症{}获胜",
                },
            },
            pnr_aij_nellie = {
                name = "内莉",
                text = {
                    "{C:dark_edition}负片{}小丑牌出现频率",
                    "变为{C:attention}#1#X{}",
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}消极南希{}获胜",
                },
            },
            pnr_aij_scratch = {
                name = "涂鸦",
                text = {
                    '在{C:blue}奇数{C:attention}回合{}重新触发',
                    '最左侧和最右侧的',
                    '{C:attention}#1#{}张小丑牌'
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}涂鸦{}获胜",
                },
            },
            pnr_aij_banger = {
                name = "香肠",
                text = {
                    '{C:green}重掷{}费用降低{C:money}$#1#{}',
                    '{C:inactive}(最低为{C:money}$0{C:inactive}){}'
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}傻香肠{}获胜",
                },
            },
            pnr_aij_flub = {
                name = "失误",
                text = {
                    '{C:attention}永恒{}小丑牌',
                    '为{C:money}#1#{}'
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}失误{}获胜",
                },
            },
        },
        Sleeve = {
            sleeve_aij_fabled = {
                name = "传说牌套",
                text = {
                    '{C:legendary,E:1}传奇{}小丑牌可能',
                    '出现在{C:attention}商店{}',
                    '{C:attention}-1{}小丑牌槽位'
                }
            },
            sleeve_aij_fabled_alt = {
                name = "传说牌套",
                text = {
                    '{C:legendary,E:1}传奇{}小丑牌',
                    '出现频率{C:attention}更高{}'
                },
            },
            sleeve_aij_patchwork = {
                name = "拼布牌套",
                text = {
                    '所有游戏牌出现时',
                    '带有{C:attention}随机{}花色补丁'
                }
            },
            sleeve_aij_patchwork_alt = {
                name = "拼布牌套",
                text = {
                    '所有游戏牌出现时',
                    '带有{C:attention}2个随机{}花色补丁'
                },
            },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "炽热牌",
                text = {
                    "计分时获得",
                    "{C:chips}+#2#{}筹码"
                }
            },
            m_aij_dyscalcular = {
                name = "失算牌",
                text = {
                    "视为所有{C:attention}数字{}点数",
                    "{C:inactive}(组成牌型除外)"
                }
            },
            m_aij_charged = {
                name = "充能牌",
                text = {
                    "若与此牌一同{C:attention}打出{}",
                    "或{C:attention}手牌{}中包含此牌",
                    "{C:attention}增强效果{}获得{C:attention}#1#％{}加成"
                }
            },
            m_aij_ice = {
                name = "冰牌",
                text = {
                    "{C:attention}总是{}计分且",
                    "{C:red}无视{}出牌选择上限",
                    "{C:inactive}多余的冰牌",
                    "{C:inactive}不会影响牌型"
                }
            },
            m_aij_wood = {
                name = "木牌",
                text = {
                    '手持时，{C:chips}+#3#{}筹码，',
                    '每手持一张其他',
                    '{C:attention}木牌{}额外{C:chips}+#2#{}',
                    '{C:inactive}(当前为{C:chips}+#1#{C:inactive}筹码)'
                }
            },
            m_aij_simulated = {
                name = "模拟牌",
                text = {
                    '每回合{C:attention}首次{}打出时',
                    '{C:attention}返回{}手牌'
                }
            },
            m_aij_canvas = {
                name = "画布牌",
                text = {
                    '{C:attention}复制{}右侧卡牌的',
                    '点数和花色'
                }
            },
        },
        Voucher = {
            v_aij_fairy_dust ={
                name = "仙尘",
                text = {
                    "{C:dark_edition}微光{}、{C:dark_edition}白银{}和",
                    "{C:dark_edition}星辰{}牌出现频率",
                    "变为{C:attention}#1#X{}",
                },
            },
            v_aij_live_pixie ={
                name = "活体小精灵",
                text = {
                    "{C:dark_edition}微光{}、{C:dark_edition}白银{}和",
                    "{C:dark_edition}星辰{}牌出现频率",
                    "变为{C:attention}#1#X{}",
                },
            },
            v_aij_gold_medal ={
                name = "金牌",
                text = {
                    "{C:money}黄金{}标签出现频率",
                    "变为{C:attention}#1#X{}",
                },
            },
            v_aij_trophy ={
                name = "奖杯",
                text = {
                    "跳过{C:attention}大型盲注{}的标签",
                    "有{C:green}#1#/#2#{}几率",
                    "变为{C:money}黄金{}标签"
                },
            },
            v_aij_sticker_sheet ={
                name = "贴纸页",
                text = {
                    '{C:attention}减轻{}{C:red}负面',
                    '{C:attention}贴纸{}的效果'
                },
            },
            v_aij_polkadot ={
                name = "波尔卡圆点",
                text = {
                    '{C:attention}减轻{}{C:red}负面',
                    '{C:attention}贴纸{}的效果'
                },
            },
        },
        Edition = {
            e_aij_negative_playing_card = {
                name = "负片",
                text = {
                    "{C:dark_edition}+#1#{}手牌上限",
                    "{C:inactive}(复制品移除此效果)"
                },
            },
            e_aij_glimmer = {
                name = "微光",
                text = {
                    "{C:aij_plasma}平衡{}{C:attention}#1#%{}的",
                    "{C:chips}筹码{}和{C:mult}倍率{}"
                }
            },
            e_aij_silver = {
                name = "白银",
                text = {
                    "{C:attention}X#1#{}效果",
                }
            },
            e_aij_stellar = {
                name = "星辰",
                text = {
                    "打出的牌型每有{C:attention}1级{}",
                    "{C:chips}+#1#{}筹码和",
                    "{C:mult}+#2#{}倍率"
                }
            },
            e_aij_aureate = {
                name = "鎏金",
                text = {
                    "{X:money,C:white}X#1#{} {C:money}${}",
                    "{C:inactive}(上限{C:money}$#2#{}{C:inactive})"
                }
            },
            e_aij_torn = {
                name = "撕裂",
                text = {
                    
                }
            },
        },
        Blind = {
            -- Normal Blinds (常规盲注)
            bl_aij_the_beith = {
                name = "贝图",
                text = {
                    "所有{C:diamonds}方片{}",
                    "最后抽取"
                },
            },
            bl_aij_the_elm = {
                name = "榆树",
                text = {
                    "所有{C:clubs}梅花{}",
                    "最后抽取"
                },
            },
            bl_aij_the_alder = {
                name = "赤杨",
                text = {
                    "所有{C:hearts}红桃{}",
                    "最后抽取"
                },
            },
            bl_aij_the_willow = {
                name = "柳树",
                text = {
                    "所有{C:spades}黑桃{}",
                    "最后抽取"
                },
            },
            bl_aij_the_branch = {
                name = "树枝",
                text = {
                    "所有{C:attention}人头牌{}",
                    "最后抽取"
                },
            },
            bl_aij_the_horror = {
                name = "恐惧",
                text = {
                    "在回合的{C:attention}最后一手牌{}时",
                    "给予一张随机小丑牌",
                    "{C:attention}易腐{}贴纸",
                },
            },
            bl_aij_the_oak = {
                name = "橡树",
                text = {
                    "削弱{C:attention}最右侧{}的",
                    "小丑牌",
                },
            },
            bl_aij_the_ingot = {
                name = "铸锭",
                text = {
                    "在回合的{C:attention}最后一手牌{}时",
                    "给予所有小丑牌",
                    "{C:attention}永恒{}贴纸",
                },
            },
            bl_aij_the_hazel = {
                name = "榛树",
                text = {
                    "击败盲注后，给予",
                    "一张随机小丑牌",
                    "{C:attention}租赁{}贴纸",
                },
            },
            bl_aij_the_apple = {
                name = "苹果",
                text = {
                    "如果{C:attention}一击获胜{}",
                    "（仅用一手牌），",
                    "摧毁{C:attention}最左侧{}的小丑牌",
                },
            },
            bl_aij_the_neck = {
                name = "瓶颈",
                text = {
                    "每次只能",
                    "弃掉 {C:attention}1{} 张牌"
                },
            },
            bl_aij_the_groan = {
                name = "呻吟",
                text = {
                    "出牌后",
                    "{C:attention}+1X{} 基础倍率",
                },
            },
            bl_aij_the_ash = {
                name = "白蜡树",
                text = {
                    "完整牌组中每有一张",
                    "点数低于 {C:attention}#1#{} 的牌，",
                    "{C:attention}+0.2X{} 基础倍率",
                },
            },
            bl_aij_the_clay = {
                name = "黏土",
                text = {
                    "分数要求",
                    "{C:attention}随机增大{}的盲注",
                },
            },
            bl_aij_the_aspen = {
                name = "白杨",
                text = {
                    "本底注内每击败",
                    "一个盲注，",
                    "{C:attention}+2X{} 基础倍率",
                },
            },
            bl_aij_the_evergreen = {
                name = "常青树",
                text = {
                    "完整牌组中每有一张",
                    "点数高于 {C:attention}#1#{} 的牌，",
                    "{C:attention}+0.2X{} 基础倍率",
                },
            },
            bl_aij_the_enigma = {
                name = "谜团",
                text = {
                    "{C:attention}增强牌{}",
                    "最后抽取",
                },
            },
            bl_aij_the_bullion = {
                name = "金条",
                text = {
                    "每打出一张",
                    "{C:attention}增强牌{} {C:money}-$5{}",
                },
            },
            bl_aij_the_elbow = {
                name = "肘部",
                text = {
                    "打出的牌的",
                    "{C:attention}增强效果{}被随机化",
                },
            },
            bl_aij_the_thorn = {
                name = "荆棘",
                text = {
                    "削弱所有",
                    "{C:attention}增强牌{}",
                },
            },
            bl_aij_the_twin = {
                name = "双子",
                text = {
                    "{C:attention}增强牌{}以",
                    "面朝下抽取",
                },
            },
            bl_aij_the_giant = {
                name = "巨人",
                text = {
                    "巨型盲注",
                    "{C:blue}+2{} 出牌次数"
                },
            },
            bl_aij_the_auroch = {
                name = "原牛",
                text = {
                    "所有 {C:attention}#1#{} 和 {C:attention}#2#{}",
                    "以面朝下抽取"
                },
            },
            bl_aij_the_journey = {
                name = "旅途",
                text = {
                    "如果本回合有 {C:attention}#1#{}",
                    "花色的牌计分，",
                    "{C:attention}通关所需底注数 +1{}",
                },
            },
            bl_aij_the_gift = {
                name = "礼物",
                text = {
                    "将金钱设为 {C:money}$0{}",
                    "每打出或弃掉一张牌",
                    "赚取 {C:money}$1{}"
                },
            },
            bl_aij_the_ancestor = {
                name = "祖先",
                text = {
                    "本回合你{C:attention}弃过{}的牌型",
                    "不能被{C:attention}打出{}"  
                },
            },
            bl_aij_the_god = {
                name = "神明",
                text = {
                    "打出的所有牌",
                    "必须都能{C:attention}计分{}"
                },
            },
            bl_aij_the_beast = {
                name = "野兽",
                text = {
                    "击败此盲注后，",
                    "摧毁所有{C:attention}食物类{}小丑牌"
                },
            },
            bl_aij_the_ulcer = {
                name = "溃疡",
                text = {
                    "{C:blue}-1{} 出牌次数",
                    "{C:red}-1{} 弃牌次数"
                },
            },
            bl_aij_the_need = {
                name = "匮乏",
                text = {
                    "至少持有 {C:money}$20{}",
                    "才能使手牌计分"
                },
            },
            bl_aij_the_day = {
                name = "白昼",
                text = {
                    "出牌必须包含",
                    "{C:hearts}红桃{}或{C:diamonds}方片{}"
                },
            },
            bl_aij_the_celebration = {
                name = "庆典",
                text = {
                    "本底注每有一次未使用的",
                    "出牌或弃牌机会，",
                    "{C:attention}+0.2X{} 基础倍率"
                },
            },
            bl_aij_the_storm = {
                name = "风暴",
                text = {
                    "摧毁所有",
                    "{C:attention}打出但未计分{}的牌"
                },
            },
            bl_aij_the_frost = {
                name = "霜冻",
                text = {
                    "每次出牌后，",
                    "摧毁手牌中一张{C:attention}随机牌{}"
                },
            },
            bl_aij_the_yew = {
                name = "紫杉",
                text = {
                    "所有{C:attention}奇数{}点数的牌",
                    "被削弱"
                },
            },
            bl_aij_the_hoard = {
                name = "囤积",
                text = {
                    "选择此盲注时，本底注内",
                    "{C:attention}溢出的分数{}会",
                    "加到此盲注上"
                },
            },
            bl_aij_the_pear = {
                name = "梨子",
                text = {
                    "计分后，{C:attention}随机化{}",
                    "手持牌的花色和点数"
                },
            },
            bl_aij_the_elk = {
                name = "麋鹿",
                text = {
                    "不能打出本底注内",
                    "已经{C:attention}打过{}的牌型"
                },
            },
            bl_aij_the_birch = {
                name = "桦树",
                text = {
                    "所有{C:attention}偶数{}点数的牌",
                    "被削弱"
                },
            },
            bl_aij_the_sun = {
                name = "太阳",
                text = {
                    "{C:spades}黑桃{}和{C:clubs}梅花{}",
                    "以面朝下抽取"
                },
            },
            bl_aij_the_spear = {
                name = "矛",
                text = {
                    "获胜一手牌中打出的",
                    "所有卡牌将被",
                    "{C:attention}永久削弱{}"
                },
            },
            bl_aij_the_steed = {
                name = "骏马",
                text = {
                    "出牌时，",
                    "削弱所有{C:attention}手持{}的卡牌"
                },
            },
            bl_aij_the_figure = {
                name = "人像",
                text = {
                    "出牌不能包含",
                    "{C:attention}3{} 张或更多人头牌",
                },
            },
            bl_aij_the_lake = {
                name = "湖泊",
                text = {
                    "本底注{C:attention}打出过{}的牌",
                    "最后抽取"
                },
            },
            bl_aij_the_field = {
                name = "原野",
                text = {
                    "所有牌被削弱，",
                    "直到弃掉 {C:attention}#1#{} 张牌"
                },
            },
            bl_aij_the_wound = {
                name = "伤口",
                text = {
                    "直到{C:red}弃牌次数{}为 0 前",
                    "手牌不计分"
                },
            },
            bl_aij_the_brimstone = {
                name = "硫磺",
                text = {
                    "每次{C:red}弃牌{}",
                    "失去一半金钱"
                },
            },
            bl_aij_the_blush = {
                name = "羞赧",
                text = {
                    "每次必须",
                    "弃掉 {C:attention}5{} 张牌"
                },
            },
            -- Pit Blinds (深渊盲注)
            bl_aij_the_heart = {
                name = "心脏",
                text = {
                    "必须先打出一手",
                    "包含 {C:attention}#1#{} 的牌",
                    "后续手牌才能计分"
                },
            },
            bl_aij_the_rains = {
                name = "暴雨",
                text = {
                    "如果打出的牌{C:attention}击败{}了盲注，",
                    "计分牌将失去所有",
                    "{C:attention}增强{}、{C:attention}版本{}和{C:attention}蜡封{}"
                },
            },
            bl_aij_the_child = {
                name = "孩童",
                text = {
                    "所有计分牌的",
                    "{C:attention}点数{}降低 1 点"
                },
            },
            bl_aij_the_moon = {
                name = "月亮",
                text = {
                    "所有{C:attention}奇数次{}出牌时",
                    "卡牌被削弱"
                },
            },
            bl_aij_the_shell = {
                name = "贝壳",
                text = {
                    "{C:attention}#2#{} 张牌中有 {C:attention}#1#{} 张被削弱",
                    "{C:attention}#4#{} 张牌中有 {C:attention}#3#{} 张",
                    "以面朝下抽取"
                },
            },
            bl_aij_the_earth = {
                name = "大地",
                text = {
                    "计分后，将所有",
                    "{C:attention}手持牌{}变为{C:attention}石头牌{}"
                },
            },
            bl_aij_the_dragon = {
                name = "巨龙",
                text = {
                    "直到{C:attention}手牌为空{}前",
                    "无法抽牌",
                },
            },
            bl_aij_the_mountain = {
                name = "山脉",
                text = {
                    "巨型盲注",
                    "{C:blue}+1{} 手牌上限"
                },
            },
            bl_aij_the_conflagration = {
                name = "烈火",
                text = {
                    "如果打出的牌{C:attention}击败{}了盲注，",
                    "摧毁所有{C:attention}打出的牌{}和",
                    "{C:attention}手持牌{}"
                },
            },
            bl_aij_the_umbilical = {
                name = "脐带",
                text = {
                    "每次出牌{C:attention}标记{}一张随机手牌",
                    "被标记的牌",
                    "无法{C:attention}打出{}或{C:red}弃掉{}"
                },
            },
            bl_aij_the_divine = {
                name = "神圣",
                text = {
                    "出牌必须包含",
                    "一张{C:attention}增强牌{}"
                },
            },
            bl_aij_the_bird = {
                name = "飞鸟",
                text = {
                    "计分前{C:attention}洗切{}一张",
                    "随机小丑牌的位置"
                },
            },
            bl_aij_the_arrow = {
                name = "箭矢",
                text = {
                    "本次出牌分数必须",
                    "超过之前所有",
                    "出牌的分数"
                },
            },
            bl_aij_the_brilliance = {
                name = "光辉",
                text = {
                    "必须满足分数要求{C:attention}两次{}",
                    "{C:blue}+2{} 出牌次数",
                },
            },
            -- Finisher Blinds (终结盲注)
            bl_aij_obsidian_blade = {
                name = "黑曜石之刃",
                text = {
                    "{C:blue}-1{} 出牌，{C:red}-1{} 弃牌",
                    "{C:attention}-1{} 手牌上限",
                    "大型盲注"
                },
            },
            bl_aij_aureate_coin = {
                name = "辉金硬币",
                text = {
                    "本底注每消费 {C:money}$1{}",
                    "盲注基础倍率 {C:attention}+0.1X{}",
                },
            },
        },
        Joker = {
            j_aij_flying_ace = {
                name = "空中王牌",
                text = {
                    "本回合中，每打出一张",
                    "独特{C:attention}花色{}的{C:attention}A{}",
                    "回合结束时获得{C:money}$#1#{}",
                    "{C:inactive}（当前为{}{C:money}$#2#{}{C:inactive}）"
                },
            },
            j_aij_lucky_seven = {
                name = "幸运七",
                text = {
                    "将所有打出的未增强",
                    "{C:attention}7{}变为{C:attention}幸运牌{}"
                },
            },
            j_aij_you_broke_it = {
                name = "你搞砸了！",
                text = {
                    "将所有打出的{C:attention}#1#{}",
                    "变为{C:attention}#2#{}牌",
                    "{s:0.8}牌面和增强效果",
                    "{s:0.8}在回合结束时改变"
                },
            },
            j_aij_birthday_clown = {
                name = "生日小丑",
                text = {
                    "每进入一个{C:attention}底注{}",
                    "{X:mult,C:white}X#1#{}倍率",
                    "持续{C:attention}1{}回合",
                    "{C:inactive}（#2#）",
                },
            },
            j_aij_memory_card = {
                name = "记忆卡",
                text = {
                    "如果本回合第一手牌仅包含{C:attention}一张{}牌",
                    "该牌在未来盲注中总是",
                    "{C:attention}最先{}被{C:attention}抽到{}",
                    "{C:inactive}（只能存储一张牌）",
                    "{C:inactive}（仅在最左侧位置触发）"
                }
            },j_aij_sleepy_joker = {
                name = "瞌睡小丑",
                text = {
                    "如果打出的牌中只含",
                    "{C:spades}黑桃{}和{C:clubs}梅花{}",
                    "则{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_invisible_man = {
                name = "隐形人",
                text = {
                    "所有{C:attention}人头牌{}均视为",
                    "{C:attention}K{}、{C:attention}Q{}和{C:attention}J",
                    "{C:inactive}（不用于组成牌型）"
                }
            },
            j_aij_handsome_joker = { 
                name = "帅气小丑", 
                text = { 
                    "你{C:attention}完整牌组{}中",
                    "每包含一张{C:attention}#2#{}",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#3#{}{C:inactive}倍率)"
                } 
            },
            j_aij_whiteface_grotesque = { 
                name = "白面怪诞", 
                text = { 
                    "此小丑牌获得{C:chips}+#1#{}筹码",
                    "出牌时每有一张{C:attention}人头牌{}被",
                    "{C:attention}手持{}",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)"
                }
            },
            j_aij_the_clown_show = {
                name = "小丑秀",
                text = {
                    "本轮每购买一张{C:attention}小丑牌",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)"
                }
            },
            j_aij_little_devil = {
                name = "小恶魔",
                text = {
                    "当跳过一个{C:attention}盲注{}时",
                    "生成一个{C:attention}标准{}、{C:tarot}吊饰{}、",
                    "{C:planet}流星{}、{C:spectral}空灵{}或{C:red}小丑{}标签"
                },
            },
            j_aij_pierrot = { 
                name = "皮耶罗", 
                text = { 
                    "{C:attention}手持{}的{C:attention}数字牌{}",
                    "提供其自身的{C:chips}筹码{}值" 
                } 
            },
            j_aij_hat_trick = {
                name = "帽子戏法",
                text = {
                    "打出的{C:attention}3{}计分时",
                    "获得等同于{C:attention}三条{}牌型等级的{C:mult}倍率{}"
                }
            },
            j_aij_squeezy_pete = {
                name = "皮特捏捏",
                text = {
                    "每次连续打出包含{C:attention}葫芦{}的牌型",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{}{X:mult,C:white}X#2#{}{C:inactive}倍率）",
                },
            },
            j_aij_bloody_mary = { name = "血腥玛丽", text = { "" } },
            j_aij_trypophobia = {
                name = "密集恐惧症",
                text = {
                    "如果打出的牌仅含{C:attention}8{}",
                    "{C:mult}+#1#{}倍率",
                },
            },
            j_aij_rummikub = { name = "拉密", text = { "" } },
            j_aij_imperial_bower = {
                name = "帝国花园",
                text = {
                    "每回合{C:attention}首张{}抽到的牌",
                    "视为{C:attention}任意{}牌面和花色",
                    "{C:inactive}（牌面不用于组成牌型）"
                }
            },
            j_aij_ultrasound = {
                name = "超声波",
                text = {
                    "选择一个{C:attention}补充包{}时",
                    "显示其一张内容"
                }
            },
            j_aij_negative_nancy = {
                name = "负面南希",
                text = {
                    "{C:dark_edition}负片{}小丑牌在{C:attention}商店{}中",
                    "出现几率提高{C:attention}3倍{}"
                },
            },
            j_aij_negative_space = {
                name = "负空间",
                text = {
                    "每拥有{C:dark_edition}负片{}小丑",
                    "{C:attention}+#1#{}手牌上限",
                    "{C:inactive}(当前为{C:attention}+#2#{C:inactive}手牌上限){}",
                    "{C:inactive}(上限为{C:attention}+#3#{C:inactive}手牌上限){}"
                }
            },
            j_aij_infinite_jest = {
                name = "无限玩笑",
                text = {
                    "击败{C:attention}Boss盲注{}时",
                    "升级{C:attention}所有牌型{}等级"
                }
            },
            j_aij_old_joker = { 
                name = "老小丑", 
                text = { 
                    "击败{C:attention}Boss盲注{}时，此小丑牌",
                    "获得{C:chips}+#2#{}筹码和{C:mult}+#4#{}倍率",
                    "{C:inactive,s:0.8}(当前为{C:chips,s:0.8}+#1#{}{C:inactive,s:0.8}筹码,{C:mult,s:0.8}+#3#{}{C:inactive,s:0.8}倍率)"
                } 
            },
            j_aij_imageboard = { 
                name = "图版", 
                text = { 
                    "每张{C:attention}计分{}牌给予{C:mult}+1{}倍率",
                    "依据其{C:attention}点数{}在本手牌中",
                    "{C:attention}计分{}的次数",
                    "{C:inactive}(例如：{C:attention}2 2 2{C:inactive} ->{C:mult}+1{C:inactive},{C:mult}+2{C:inactive},{C:mult}+3{C:inactive})"
                } 
            },
            j_aij_carousel = {
                name = "旋转木马",
                text = {
                    "当计分结束后",
                    "将所有{C:attention}计分牌{}的花色",
                    "转换为循环中的{C:attention}下一花色{}",
                    "{C:inactive,s:0.8}(红桃→梅花→方片→黑桃)"
                }
            },
            j_aij_slippery_when_wet = { name = "湿滑警告", text = { "" } },
            j_aij_founding_father = {
                name = "开国元勋",
                text = {
                    "{C:attention}充能牌{}的",
                    "{C:attention}增强效果{}翻倍"
                }
            },
            j_aij_scary_story = {
                name = "恐怖故事",
                text = {
                    "{C:attention}标准包{}中的基础游戏牌",
                    "有{C:green}#1#/#2#{}的几率变为{C:dark_edition}负片{}"
                },
            },
            j_aij_doodle = {
                name = "涂鸦",
                text = {
                    "有{C:green}#1#/#2#{}的几率复制",
                    "相邻两个{C:attention}小丑牌{}的{C:attention}能力{}"
                },
            },
            j_aij_joqr = { name = "小丑牌（音译）", text = { "" } },
            j_aij_greasepaint = { 
                name = "油彩", 
                text = {
                    {
                        "禁用相邻的{C:attention}小丑牌{}"
                    },
                    {
                        "被禁用的{C:attention}小丑牌{}和",
                        "{C:attention}卡牌{}提供{X:mult,C:white}X#1#{}倍率"
                    }  
                } 
            },
            j_aij_public_bathroom = {
                name = "公共厕所",
                text = {
                    "每张在{C:attention}同花{}中打出的{C:attention}2{}",
                    "使此小丑获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                },
            },
            j_aij_diogenes = { name = "第欧根尼", text = { "" } },
            j_aij_blank_card = {
                name = "空白牌",
                text = {
                    "每当从{C:attention}标准包{}中",
                    "选择一张{C:attention}游戏牌{}时",
                    "生成一张完全相同的{C:attention}复制品{}"
                },
            },
            j_aij_comedians_manifesto = {
                name = "小丑宣言",
                text = {
                    "使{C:attention}标准包{}中的{C:attention}K{}和{C:attention}Q{}",
                    "变为{C:attention}J{}"
                }
            },
            j_aij_cctv = {
                name = "闭路电视",
                text = {
                    "每张{C:enhanced}玻璃牌{}摧毁时获得{C:money}$#1#{}",
                    "并将{C:attention}手牌{}中的",
                    "另一张牌转化为{C:enhanced}玻璃牌{}"
                }
            },
            j_aij_circuit_board = { name = "电路板", text = { "" } },
            j_aij_platinum_chip = { name = "白金筹码", text = { "" } },
            j_aij_pell_mel = { 
                name = "杂乱", 
                text = { 
                    "{X:mult,C:white}X1{}倍率，{C:attention}打出的手牌{}中",
                    "每有一种{C:attention}独特{}花色",
                    "额外增加{X:mult,C:white}X#1#{}倍率"
                } 
            },
            j_aij_pput_together = { name = "组合", text = { "" } },
            j_aij_krampus = {
                name = "坎卜斯",
                text = {
                    "打出的{C:attention}黄金牌{}",
                    "会变为{C:attention}石头牌{}",
                    "{C:attention}石头牌{}打出时",
                    "获得{C:money}$#1#{}"
                },
            },
            j_aij_art_of_the_deal = {
                name = "交易艺术",
                text = {
                    "每当获得{C:money}金钱{}时",
                    "{C:mult}+#2#{}倍率",
                    "如果{C:money}金钱{}为{C:money}$0{}或更少",
                    "效果重置",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
                }
            },
            j_aij_word_art = {
                name = "文字艺术",
                text = {
                    "打出的牌型中每包含一张",
                    "{C:attention}A{}、{C:attention}K{}、{C:attention}Q{}或{C:attention}J{}",
                    "{C:mult}+#1#{}倍率"
                }
            },
            j_aij_atom = {
                name = "原子",
                text = {
                    "如果打出的牌型只含一张{C:attention}A{}",
                    "提升{C:attention}高牌{}等级"
                },
            },
            j_aij_plain_jane = {
                name = "朴素婕恩",
                text = {
                    "每张打出的{C:attention}未增强{}牌",
                    "给予{C:mult}+#1#{}倍率"
                },
            },
            j_aij_paper_bag = { 
                name = "纸袋", 
                text = { 
                    "每{C:red}弃掉{}一手{C:attention}牌型{}",
                    "根据其{C:attention}等级{}获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)" 
                } 
            },
            j_aij_fruity_joker = { 
                name = "水果小丑", 
                text = { 
                    "{C:attention}多彩{}卡牌和",
                    "小丑牌提供{C:mult}+#1#{}倍率"
                } 
            },
            j_aij_jokia = { name = "小丑（挪威语）", text = { "" } },
            j_aij_the_mycologists = {
                name = "真菌学家",
                text = {
                    "若打出的牌型为{C:attention}#1#{}",
                    "摧毁右侧的牌",
                    "将其{C:chips}筹码{}、{C:dark_edition}增强{}和{C:dark_edition}版本{}",
                    "赋予左侧的牌"
                }
            },
            j_aij_cool_joker = { 
                name = "酷小丑", 
                text = { 
                    "{B:1,C:white,s:0.8}启动式能力",
                    "{V:1}启动{}此{C:attention}小丑牌{}，当它",
                    "{C:attention}正常{}计分时提供",
                    "{X:mult,C:white}X#1#{}倍率" 
                } 
            },
            j_aij_square_eyes = {
                name = "方眼小丑",
                text = {
                    "打出的牌型中每包含一张{C:attention}4{}",
                    "每张打出的{C:attention}4{}给予{C:mult}+#1#{}倍率"
                }
            },
            j_aij_punk_joker = {
                name = "朋克小丑",
                text = {
                    "如果打出的牌型包含一张{C:attention}万能牌{}",
                    "将一张随机的未增强打出牌",
                    "变为一张{C:attention}万能牌{}"
                },
            },
            j_aij_slim_joker = {
                name = "纤细小丑",
                text = {
                    "{C:mult}+#1#{}倍率",
                    "打出的牌型中每张牌",
                    "减少{C:mult}-#2#{}倍率",
                }
            },
            j_aij_wireframe = { 
                name = "线框图", 
                text = { 
                    "每回合{C:attention}首次{}打出的手牌",
                    "会{C:attention}返回{}你的{C:attention}手牌{}"
                } 
            },
            j_aij_soviet = {
                name = "苏联同志",
                text = {
                    "如果打出的牌型不包含",
                    "{C:attention}K{}或{C:attention}Q{}则{C:mult}+#1#{}倍率"
                }
            },
            j_aij_mustachio = { name = "小胡子", text = { "" } },
            j_aij_penny = {
                name = "一便士",
                text = {
                    "带有{C:money}金色蜡封{}的牌有",
                    "{C:green}#1#/#2#{}的几率{C:attention}再次触发{}"
                },
            },
            j_aij_doctors_note = {
                name = "医生证明",
                text = {
                    "所有{C:attention}数字{}的{C:hearts}红桃{}",
                    "均视为{C:attention}相同点数",
                    "{C:inactive}（不用于组成牌型）"
                }
            },
            j_aij_silly_sausage = {
                name = "蠢蠢香肠",
                text = {
                    "{C:green}重掷{}费用减少{C:money}$#1#{}",
                    "每回合结束时减少{C:money}$1{}"
                }
            },
            j_aij_joker_baby = { name = "小丑宝宝", text = { "" } },
            j_aij_anchor = {
                name = "船锚",
                text = {
                    "此小丑牌及相邻小丑牌",
                    "{C:attention}无法{}被摧毁"
                }
            },
            j_aij_hei_tiki = {
                name = "毛利玉饰",
                text = {
                    "若打出的牌型最终{C:chips}筹码{}",
                    "超过{C:mult}倍率{}",
                    "此小丑牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{}{C:inactive}倍率）"
                }
            },
            j_aij_polybius = { 
                name = "波利比乌斯", 
                text = { 
                    "提供{C:attention}打出的手牌{}中",
                    "包含的所有牌型的",
                    "{C:mult}倍率{}和{C:chips}筹码{}",
                } 
            },
            j_aij_joker_sighting = { name = "小丑目击", text = { "" } },
            j_aij_pencil_drawing = { 
                name = {
                    "铅笔画",
                },
                text = { 
                    "{B:1,C:white,s:0.8}启动式能力",
                    "支付{C:money}$#1#{}以将一张{C:attention}随机",
                    "{C:attention}游戏牌{}加入你的手牌"
                } 
            },
            j_aij_holy_bible = { name = "圣经", text = { "" } },
            j_aij_great_white_north = { name = "大白北方", text = { "" } },
            j_aij_right_angle = { 
                name = "直角", 
                text = { 
                    "当一张{C:attention}9{}计分时",
                    "触发手牌中所有的{C:attention}10{}" 
                } 
            },
            j_aij_adoring_joker = {
                name = "崇拜小丑",
                text = {
                    "{C:attention}小丑牌{}触发后",
                    "将{C:mult}倍率{}设为你在当前{C:attention}底注{}中",
                    "达到过的最高{C:mult}倍率{}",
                    "{C:inactive}（当前为{C:mult}#1#{C:inactive}倍率）"
                }
            },
            j_aij_lucignolo = {
                name = "小灯芯",
                text = {
                    "当任何游戏牌被摧毁时",
                    "获得{C:money}$#1#{}"
                },
            },
            j_aij_scorecard = {
                name = "记分卡",
                text = {
                    "当选择{C:attention}盲注{}时",
                    "{C:attention}随机牌型{}等级{C:attention}+#1#{}"
                }
            },
            j_aij_punch_and_judy = { 
                name = "潘趣与朱迪", 
                text = { 
                    {
                        "如果{C:attention}打出的手牌{}包含",
                        "正好{C:attention}#1# 张 K{}和{C:attention}#1# 张 Q{}，",
                        "重新触发所有计分牌"
                    },
                    {
                        "{C:attention}K{}和{C:attention}Q{}",
                        "总是计分"
                    }
                } 
            },
            j_aij_nature_tapes = { 
                name = "自然磁带", 
                text = { 
                    "当使用一张{C:mult}倍率{}类{C:planet}星球牌{}时",
                    "此小丑牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                } 
            },
            j_aij_low_priest = { 
                name = "低级牧师", 
                text = { 
                    "{X:mult,C:white}X#1#{}倍率，",
                    "打出的牌型每有1{C:attention}级{}",
                    "{X:mult,C:white}-X#2#{}倍率"
                } 
            },
            j_aij_oil_and_water = { name = "水火不容", text = { "" } },
            j_aij_big_ears = { name = "大耳朵", text = { "" } },
            j_aij_causal_absent_paranoia = { name = "因果缺席妄想", text = { "" } },
            j_aij_hand_drawn = { 
                name = "手绘", 
                text = { 
                    "在回合{C:attention}开始{}时，",
                    "持续抽牌直到你的手牌{C:attention}包含{}",
                    "你使用次数最多的{C:attention}牌型{}" 
                }
            },
            j_aij_haruspex = { 
                name = "预言家", 
                text = { 
                    "{B:1,C:white,s:0.8}启动式能力",
                    "消耗{C:attention}#1#{}次{C:red}弃牌{}机会，从你的",
                    "{C:attention}牌组{}中选择{C:attention}#2#{}张牌",
                    "{C:attention}抽取{}到手牌"
                } 
            },
            j_aij_bobblehead = { name = "摇摆头", text = { "" } },
            j_aij_topsy_the_clown = {
                name = "颠转小丑",
                text = {
                    "将{C:chips}筹码{}与{C:mult}倍率{}",
                    "向上取整至最接近的",
                    "{C:attention}回文数"
                }
            },
            j_aij_cloudwatching = { name = "观云", text = { "" } },
            j_aij_line_in_the_sand = {
                name = "沙中画",
                text = {
                    "{C:red}弃掉{}的牌直到底注结束",
                    "才返回{C:attention}牌堆{}"
                }
            },j_aij_hairy_joker = { name = "毛茸小丑", text = { "" } },
            j_aij_realty_sign = {
                name = "房产招牌",
                text = {
                    "每次打出{C:attention}葫芦{}",
                    "此小丑牌的{C:money}出售价值{}增加{C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = { 
                name = "坏苹果", 
                text = { 
                    "如果{C:attention}计分手牌{}包含",
                    "{C:attention}#4#{}张{C:spades}暗色{}花色和{C:attention}#3#{}张{C:hearts}亮色{}花色，",
                    "此小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive,s:0.8}(比例在回合结束时改变)",
                    "{C:inactive}(当前为{X:mult,C:white}X#1#{}{C:inactive}倍率)"
                } 
            },
            j_aij_dim_bulb = {
                name = "昏暗灯泡",
                text = {
                    "如果只拥有{C:common}普通{}小丑",
                    "这张小丑给予{X:mult,C:white}X#1#{}倍率"
                },
            },
            j_aij_blood_artist = {
                name = "血腥艺术家",
                text = {
                    "当任意小丑牌或卡牌被{C:money}出售{}或摧毁时",
                    "降低当前为{C:attention}盲注{}的分数需求{C:attention}#1#%"
                }
            },
            j_aij_null_joker = {
                name = "空值小丑",
                text = {
                    "将所有{C:green}概率{}设为{C:attention}0{}"
                },
            },
            j_aij_magick_joker = {
                name = "魔法小丑",
                text = {
                    "打出{V:1}#1#{}牌时",
                    "其{C:chips}筹码{}转换为{C:mult}倍率{}",
                    "{s:0.8}花色每回合结束时改变{}"
                }
            },
            j_aij_jeff_the_joker = {
                name = "小丑杰夫",
                text = {
                    "选择{C:attention}小盲注{}时",
                    "摧毁所有其他{C:attention}小丑牌",
                    "此小丑牌每摧毁一张其他小丑",
                    "获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}）"
                },
            },
            j_aij_zanni = { 
                name = "赞尼", 
                text = { 
                    "{C:attention}数字牌{}在{C:attention}计分{}时",
                    "有{C:green}#1# / #2#{}的几率",
                    "生成一张{C:tarot}塔罗{}牌"
                } 
            },
            j_aij_furbo_e_stupido = {
                name = "黠与愚",
                text = {
                    "{C:attention}失算牌{}同时视为",
                    "{C:attention}A{}和{C:attention}J{}"
                }
            },
            j_aij_read_em_and_weep = {
                name = "看牌哭泣", 
                text = { 
                    "如果手牌包含{C:attention}顺子{}，",
                    "计分前将所有{C:attention}打出的{}牌",
                    "转换为相同的随机{C:attention}花色{}" 
                } 
            },
            j_aij_goblin_joker = {
                name = "哥布林小丑",
                text = {
                    "{C:red}弃牌{}后，额外抽取{C:attention}#1#{}张牌"
                }
            },
            j_aij_string_theory = {
                name = "弦理论",
                text = {
                    "牌型总是视为包含",
                    "一个{C:attention}顺子{}"
                }
            },
            j_aij_jesters_privelege = {
                name = "弄臣特权",
                text = {
                    "{C:legendary}传奇{}小丑牌可能",
                    "出现在{C:attention}商店{}"
                },
            },
            j_aij_quark = {
                name = "夸克",
                text = {
                    "如果打出的牌型正好是",
                    "三张不同{C:attention}花色{}但",
                    "{C:attention}相同点数{}的牌",
                    "{C:attention}三条{}等级提升"
                },
            },
            j_aij_lucky_carder = { name = "幸运牌手", text = { "" } },
            j_aij_silver_screen = { 
                name = "银幕", 
                text = { 
                    "当一张{C:attention}人头牌{}被",
                    "{C:red}摧毁{}时，为{C:attention}手牌{}中的",
                    "一张随机牌添加{C:aij_silver}银色{}版本" 
                } 
            },
            j_aij_pedrolino = { 
                name = "佩德罗利诺", 
                text = { 
                    "{C:money}出售{}此牌以降低",
                    "当前{C:attention}盲注{}的",
                    "{C:attention}分数需求{}{C:attention}#1#%"
                } 
            },
            j_aij_pierrette = { 
                name = "皮耶雷特", 
                text = { 
                    "重新触发所有{C:attention}卡牌",
                    "{C:attention}弃牌{}时的效果" 
                } 
            },
            j_aij_scaramouche = {
                name = "胆小丑",
                text = {
                    "如果{C:attention}所出牌型{}为{C:attention}#1#{}",
                    "{C:attention}重新触发{}所有计分牌",
                    "{C:inactive}(每回合结束牌型改变){}"
                }
            },
            j_aij_clay_joker = {
                name = "黏土小丑",
                text = {
                    "复制最后一张被摧毁的",
                    "{C:attention}小丑{}牌效果"
                }
            },
            j_aij_sunny_joker = { 
                name = "阳光小丑", 
                text = { 
                    "如果打出的手牌{C:attention}包含{}一",
                    "手{C:attention}皇家同花顺{}，所有计分",
                    "牌获得{X:mult,C:white}X#1#{}倍率" 
                } 
            },
            j_aij_red_wine = { name = "红酒", text = { "" } },
            j_aij_mute_joker = { 
                name = "沉默小丑", 
                text = { 
                    "本回合，打出的前{C:attention}#1#{}手牌",
                    "会{C:red}摧毁{}所有计分牌",
                    "{C:inactive}(牌型在回合结束时改变)"
                } 
            },
            j_aij_scapino = { 
                name = "斯卡皮诺", 
                text = { 
                    "在{C:money}商店{}中{C:green}重掷{}费用",
                    "{C:money}+$#1#{}，但同时会补货",
                    "{C:attention}补充包{}" 
                } 
            },
            j_aij_pinhead = {
                name = "针头",
                text = {
                    "如果{C:attention}单手牌{}击败{C:attention}盲注{}",
                    "获得{C:money}$#1#{}"
                },
            },
            j_aij_saltimbanco = {
                name = "杂技艺人",
                text = {
                    "当任何{C:green}概率效果{}触发时",
                    "将{C:mult}倍率{}乘以其未触发的几率"
                }
            },
            j_aij_pulcinella = { name = "普尔奇内拉", text = { "" } },
            j_aij_petrushka = {
                name = "彼得鲁什卡",
                text = {
                    "获得与所有{C:attention}打出的牌{}",
                    "总{C:attention}点数{}相等的{C:mult}倍率{}",
                    "{C:inactive}(A=14, K=13, Q=12, J=11)"
                },
            },
            j_aij_void = {
                name = "虚空",
                text = {
                    "若{C:attention}本回合{}未使用任何{C:planet}星球牌{}",
                    "则{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}#2#"
                }
            },
            j_aij_kasperle = {
                name = "卡斯佩尔",
                text = {
                    "若{C:attention}本回合{}购买了{C:attention}优惠卷",
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}#2#"
                }
            },
            j_aij_tumbler = { name = "不倒翁", text = { "" } },
            j_aij_plain_packaging = { name = "简朴包装", text = { "" } },
            j_aij_mixel_perfect = {
                name = "完美混合",
                text = {
                    "如果打出的牌型包含",
                    "{C:attention}奇数{}张牌",
                    "则{C:mult}+#1#{}倍率"
                },
            },
            j_aij_columbina = {
                name = "科伦比娜",
                text = {
                    "使用{C:spectral}幻灵牌{}时",
                    "{C:aij_plasma}平衡{}{C:attention}#1#%{}的{C:mult}倍率{}和{C:chips}筹码{}",
                    "数值增加{C:attention}#2#%{}"
                }
            },
            j_aij_j_file = { 
                name = "J档案", 
                text = { 
                    "在{C:attention}回合{}开始时，",
                    "从你的{C:attention}牌组{}中检索",
                    "{C:attention}#1#{}张牌加入手牌" 
                } 
            },
            j_aij_bumper_sticker = {
                name = "汽车贴纸",
                text = {
                    "打出的{C:attention}牌{}在计分时",
                    "永久获得{C:mult}+#1#{}倍率"
                }
            },
            j_aij_vesti_la_guibba = { name = "穿上戏服", text = { "" } },
            j_aij_dead_president = {
                name = "死人总统",
                text = {
                    "出售此小丑牌时",
                    "相邻小丑牌的{C:money}出售价值{}翻倍"
                },
            },
            j_aij_second_tier_meme = { name = "二线迷因", text = { "" } },
            j_aij_teeny_joker = {
                name = "微小丑",
                text = {
                    "如果打出的牌型中只含{C:attention}2{}",
                    "则{C:chips}+#1#{}筹码"
                },
            },j_aij_clowns_on_parade = {
                name = "游行小丑",
                text = {
                    "如果打出的牌型中包含至少三张{C:attention}2{}",
                    "此{C:attention}小丑牌{}获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{}{C:chips}+#1#{}{C:inactive}筹码）"
                },
            },
            j_aij_rising_sun = {
                name = "旭日东升",
                text = {
                    "在回合的{C:attention}第一手{}牌和{C:attention}最后一手{}牌中",
                    "重新触发{C:attention}第一张{}和{C:attention}最后一张{}打出的牌",
                }
            },
            j_aij_red_sky = {
                name = "红天",
                text = {
                    "回合的{C:attention}第一手{}和{C:attention}最后一手{}牌中打出的牌",
                    "其{C:chips}+筹码{}改为提供{C:mult}+倍率{}"
                }
            },
            j_aij_blind_drawn = {
                name = "盲抽",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "无法查看{C:attention}Boss盲注{}或其效果",
                },
            },
            j_aij_heidelberg_tun = {
                name = "海德堡酒桶",
                text = {
                    "购买的{C:attention}消耗品{}有{C:green}1/2{}的几率",
                    "变为{C:dark_edition}负片{}"
                },
            },
            j_aij_open_mind = {
                name = "开放思维",
                text = {
                    "{C:attention}商店{}中额外提供{C:attention}+#1#{}个",
                    "{C:attention}补充包{}可供购买"
                },
            },
            j_aij_little_boy_blue = { 
                name = "小蓝孩", 
                text = { 
                    "{C:chips}+#1#{}筹码",
                    "只出现{C:chips}筹码{}类小丑牌"
                } 
            },
            j_aij_big_red = { 
                name = "大红", 
                text = { 
                    "{C:mult}+#1#{}倍率",
                    "只出现{C:mult}倍率{}类小丑牌" 
                } 
            },
            j_aij_party_streamers = {
                name = "派对彩带",
                text = {
                    "如果每回合{C:attention}第一次{}出牌",
                    "仅含{C:attention}1张{}无{C:attention}蜡封{}牌",
                    "此小丑牌随机获得一个",
                    "{C:red}红色{}、{C:blue}蓝色{}或{C:money}金色{}的{C:attention}蜡封{}"
                },
            },
            j_aij_kilroy = {
                name = "基尔罗伊",
                text = {
                    "当它被{C:money}出售{}时",
                    "此小丑牌永久获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)"
                }
            },
            j_aij_janus = {
                name = "雅努斯",
                text = {
                    "{C:attention}版本{}、{C:attention}强化{}与{C:attention}蜡封",
                    "对{C:attention}人头牌{}的效果{C:green}翻倍"
                }
            },
            j_aij_honker = { 
                name = "响鼻", 
                text = { 
                    "当一张{C:attention}倍率牌{}计分时",
                    "此小丑牌获得{C:red}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                } 
            },
            j_aij_mummy = { name = "木乃伊", text = { "" } },
            j_aij_sitcom = { name = "情景喜剧", text = { "" } },
            j_aij_in_vino_veritas = { name = "酒后吐真言", text = { "" } },
            j_aij_beefeater = { name = "伦敦塔守卫", text = { "" } },
            j_aij_tetraphobia = {
                name = "惧四症",
                text = {
                    "每{C:red}弃掉{}一张{C:attention}4{}",
                    "此小丑牌获得{C:mult}+#2#{}倍率",
                    "打出的{C:attention}4{}计分时重置",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
                },
            },
            j_aij_jack_of_all_trades = {
                name = "多面手",
                text = {
                    "{C:attention}J{}可视为任意{C:attention}花色{}",
                },
            },
            j_aij_jumbo_joker = {
                name = "巨型小丑",
                text = {
                    "只会出现{C:attention}大型{}",
                    "和{C:attention}超级{}补充包",
                }
            },
            j_aij_pellucid_joker = {
                name = "透明小丑",
                text = {
                    "当一张拥有{C:dark_edition}版本{}的{C:attention}小丑牌{}被售出或摧毁时",
                    "添加一张相同{C:dark_edition}版本{}的随机游戏牌到牌组"
                }
            },
            j_aij_cosmological_constant = {
                name = "宇宙常数",
                text = {
                    "{C:aij_plasma}平衡{}打出{C:attention}牌型{}的{C:attention}基础{}{C:chips}筹码{}和{C:mult}倍率{}"
                },
            },
            j_aij_monster = { name = "怪物", text = { "" } },
            j_aij_mistigri = {
                name = "米斯蒂里格",
                text = {
                    "手牌中每有2张{C:attention}J{}",
                    "手牌上限{C:attention}+1{}"
                },
            },
            j_aij_simple_simon = {
                name = "傻蛋西蒙",
                text = {
                    "{C:chips}+#1#{}筹码",
                },
            },
            j_aij_giocoliere = {
                name = "手技艺人",
                text = {
                    "在每个{C:attention}Boss盲注{}期间",
                    "手牌上限{C:attention}+3{}"
                },
            },
            j_aij_spectre = { 
                name = "幽灵", 
                text = { 
                    "当{C:attention}Boss盲注{}被",
                    "击败时，将所有持有的",
                    "{C:attention}消耗牌{}替换为随机",
                    "{C:spectral}幻灵{}牌" 
                } 
            },
            j_aij_dapper_dan = {
                name = "矫作的丹",
                text = {
                    "将小丑牌的{C:dark_edition}版本{}效果",
                    "提升到{C:attention}2倍{}"
                }
            },
            j_aij_average_joe = {
                name = "普通的乔",
                text = {
                    "{C:aij_plasma}平衡{}{C:chips}筹码{}和{C:mult}倍率{}的",
                    "{C:attention}20%{}",
                }
            },
            j_aij_silent_sam = {
                name = "沉默山姆",
                text = {
                    "留在手中的每一张{C:attention}牌{}",
                    "会给予{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_pantomimus = {
                name = "哑剧",
                text = {
                    "回合结束时中每持有1张{C:attention}手牌{}",
                    "此小丑牌获得{C:chips}+#2#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#1#{C:inactive}筹码)"
                }
            },
            j_aij_sneaky_pete = {
                name = "鬼祟皮特",
                text = {
                    "回合结束时，牌组中每有一张",
                    "{C:money}金色蜡封{}，获得{C:money}$#2#{}",
                    "{C:inactive}（当前为{C:money}$#1#{C:inactive}）"
                },
            },
            j_aij_peeping_tom = { name = "偷窥狂汤姆", text = { "" } },
            j_aij_la_commedia_e_finita = {
                name = "喜剧终章",
                text = {
                    "当一张{C:attention}人头牌{}被摧毁时",
                    "此小丑牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）"
                },
            },
            j_aij_straight_to_hell = {
                name = "直奔地狱",
                text = {
                    "当一个{C:attention}顺子{}被{C:attention}弃掉{}时",
                    "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                },
            },
            j_aij_guiser = {
                name = "假面伶人",
                text = {
                    "每使用一张{C:tarot}塔罗牌{}",
                    "这张小丑牌{C:attention}出售价值{}增加{C:money}$#1#{}"
                },
            },
            j_aij_mummer = {
                name = "哑剧演员",
                text = {
                    "当手牌中所有{C:attention}钢铁牌{}被打出时",
                    "触发手牌中所有{C:attention}钢铁牌{}"
                }
            },
            j_aij_tipteerer = {
                name = "踮脚贼",
                text = {
                    "回合结束时",
                    "获得其他{C:attention}小丑牌{}",
                    "{C:money}出售价值{}的{C:attention}20%{}",
                    "向上取整",
                    "{C:inactive}（当前为{}{C:money}$#1#{}{C:inactive}）"
                },
            },
            j_aij_honest_john = { name = "诚实约翰", text = { "" } },
            j_aij_dizzard = {
                name = "痴伶",
                text = {
                    "跳过{C:attention}盲注{}后",
                    "可再次访问{C:money}商店{}"
                }
            },
            j_aij_arlecchino = { 
                name = "阿莱基诺", 
                text = { 
                    "在{C:attention}小丑包{}和",
                    "{C:attention}标准包{}中",
                    "可以选取无限次选项" 
                } 
            },
            j_aij_arlecchina = { name = "阿莱基娜", text = { "" } },
            j_aij_taikomochi = {
                name = "太鼓持",
                text = {
                    "每张手牌中持有的{C:attention}J{}",
                    "给予{C:chips}+#1#{}筹码"
                }
            },
            j_aij_sudoku = {
                name = "数独",
                text = {
                    "每次连续打出包含",
                    "{C:attention}顺子{}的牌型",
                    "此小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "打出其他牌型时重置",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_aij_gnasher = { 
                name = "磨牙者", 
                text = { 
                    "{B:1,C:white,s:0.8}启动式能力",
                    "每个底注限一次，{C:attention}复制{}并",
                    "{C:attention}立即{}使用一个持有的",
                    "随机{C:attention}消耗牌{}",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_executioner = {
                name = "刽子手",
                text = {
                    "每当一张{C:attention}人头牌{}被摧毁时",
                    "此小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                },
            },
            j_aij_jongleur = {
                name = "行吟艺人",
                text = {
                    "{C:attention}重掷{}费用减少{C:money}$#1#{}"
                },
            },
            j_aij_event_horizon = {
                name = "事件视界",
                text = {
                    "使{C:dark_edition}黑洞{}的稀有度",
                    "与其它{C:planet}星球{}牌相同"
                }
            },
            j_aij_the_jester = {
                name = "弄臣",
                text = {
                    "每出售一张{C:attention}小丑牌{}",
                    "生成一张{C:tarot}愚者{}",
                    "{C:inactive}（每回合触发一次）",
                    "{C:inactive}#1#{}"
                },
            },
            j_aij_joka_lisa = {
                name = "乔卡丽莎",
                text = {
                    "当手牌上限超过{C:attention}7张{}时",
                    "每多1张获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率){}",
                    "{C:inactive}(最低为{X:mult,C:white}X1{C:inactive}倍率){}"
                }
            },
            j_aij_tonpraten = { name = "言语玩笑", text = { "" } },
            j_aij_rodeo_clown = { 
                name = "牛仔小丑", 
                text = { 
                    "如果在回合的{C:attention}最后一手牌{}",
                    "击败{C:attention}盲注{}，",
                    "此小丑牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                } 
            },
            j_aij_joculator = { 
                name = "小丑(Joculator)", 
                text = { 
                    "如果你有{C:attention}0{}次{C:red}弃牌{}机会",
                    "且剩余{C:attention}#1#{}次{C:blue}出牌{}机会，",
                    "抽牌至手牌上限的{C:attention}两倍{}" 
                } 
            },
            j_aij_scurra = {
                name = "嘲弄者",
                text = {
                    "所有打出并带有{C:red}红色蜡封{}的牌",
                    "额外触发{C:attention}#1#{}次"
                },
            },
            j_aij_pigpen = { name = "猪圈", text = { "" } },
            j_aij_cyclops = { name = "独眼巨人", text = { "" } },
            j_aij_blarney_stone = { 
                name = "布拉尼石", 
                text = { 
                    "增加等同于当前{C:attention}分数{}",
                    "{C:attention}首位数字{}三倍的{C:mult}倍率{}",
                    "{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率){}" 
                } 
            },
            j_aij_sticker = {
                name = "贴纸",
                text = {
                    "每张特殊{C:attention}贴纸{}",
                    "提供{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                }
            },
            j_aij_feedback_form = { 
                name = "反馈表", 
                text = { 
                    "如果所有{C:attention}计分{}牌",
                    "拥有不同的{C:attention}增强效果{}，",
                    "每张{C:attention}计分{}牌提供{C:mult}+#1#{}倍率" 
                }
            },
            j_aij_stultor = {
                name = "愚蠢之人",
                text = {
                    "每击败{C:attention}盲注{}可以",
                    "免费重掷{C:attention}#1#{}次{C:attention}Boss盲注{}"
                }
            },
            j_aij_david = {
                name = "大卫王",
                text = {
                    "若打出的牌仅有{C:spades}黑桃{}{C:attention}K{}",
                    "则这张小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{}{C:chips}+#2#{C:inactive}筹码）",
                },
            },
            j_aij_charles = {
                name = "查理大帝",
                text = {
                    "若打出的牌仅有{C:hearts}红桃{}{C:attention}K{}",
                    "此小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{}{X:mult,C:white}X#2#{C:inactive}倍率）",
                },
            },
            j_aij_cesar = {
                name = "凯撒大帝",
                text = {
                    "回合结束时获得{C:money}$#1#{}",
                    "如果打出的牌仅有{C:diamonds}方片{}{C:attention}K{}",
                    "额外增加{C:money}$#2#{}"
                },
            },
            j_aij_alexandre = {
                name = "亚历山大大帝",
                text = {
                    "若打出的牌仅有{C:clubs}梅花{}{C:attention}K{}",
                    "此小丑牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{}{C:mult}+#2#{C:inactive}倍率）",
                },
            },
            j_aij_sannio = { name = "萨尼奥", text = { "" } },
            j_aij_stock_photo = { name = "图库照片", text = { "" } },
            j_aij_fou_du_roi = {
                name = "宫廷弄臣",
                text = {
                    "若打出的牌型包含一张{C:attention}K{}或{C:attention}Q{}",
                    "有{C:green}#2# 分之 #1#{}的几率生成一张{C:tarot}塔罗牌{}",
                    "{C:inactive}（必须有空位）"
                },
            },
            j_aij_fatuus = {
                name = "瞽愚之徒",
                text = {
                    "如果本回合打出的第一手牌",
                    "仅包含{C:attention}K{}和{C:attention}Q{}",
                    "则随机给一张打出的牌",
                    "添加{C:blue}蓝色蜡封{}"
                },
            },
            j_aij_enraging_photo = { name = "激怒照片", text = { "" } },
            j_aij_infuriating_note = { 
                name = "恼人纸条", 
                text = {{ 
                    "{X:mult,C:white}X#1#{}倍率",
                    "{C:attention}商店{}和{C:attention}小丑包{}中",
                    "可能出现此小丑牌的",
                    "{C:dark_edition}负片{}复制品" 
                },
                {
                    "{C:inactive}\"我拿走了你的东西，但",
                    "{C:inactive}你还在坚持；",
                    "{C:inactive}我得加把劲了，所以",
                    "{C:inactive}这些老鼠送给你！\" -R. R."
                }
            }
            },
            j_aij_magic_hat = { name = "魔术帽", text = { "" } },
            j_aij_anagraph = {
                name = "回文构词",
                text = {
                    "当任何{C:attention}小丑牌{}被出售或",
                    "摧毁时",
                    "生成一个完全相同的{C:attention}复制品{}并立即",
                    "再次摧毁它"
                }
            },
            j_aij_beanstalk = {
                name = "魔豆",
                text = {
                    "{C:attention}J{}{C:attention}无法{}被{C:red}削弱{}",
                    "且{C:attention}总是{}能计分"
                }
            },
            j_aij_phoney_baloney = { name = "虚假废话", text = { "" } },
            j_aij_jerko = { 
                name = "混蛋", 
                text = { 
                    '{C:mult}+#1#{}倍率'
                } 
            },
            j_aij_design_document = {
                name = "设计文档",
                text = {
                    "当任何{C:green}概率{}效果未触发",
                    "这张小丑牌给予{C:money}$#1#{}"
                }
            },
            j_aij_animatronic = {
                name = "机械玩偶",
                text = {
                    "当打出包含{C:attention}顺子{}牌型时",
                    "获得{C:attention}+#1#{}手牌上限",
                    "{C:inactive}(当前为{C:attention}+#2#{C:inactive}手牌上限)",
                    "{C:inactive}(击败盲注后重置)"
                }
            },
            j_aij_arecibo_message = { name = "阿雷西博信息", text = { "" } },
            j_aij_napkin = {
                name = "餐巾纸",
                text = {
                    "连续跳过2个{C:attention}盲注{}时",
                    "此小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)",
                }
            },
            j_aij_lost_carcosa = { 
                name = "失落的卡尔科萨", 
                text = { 
                    "将已使用的{C:planet}星球{}牌的",
                    "{C:chips}筹码{}和{C:mult}倍率{}数值随机化，",
                    "变为原始值的{C:attention}50%{}到{C:attention}200%{}之间"
                } 
            },
            j_aij_magic_mirror = {
                name = "魔镜",
                text = {
                    "本{C:attention}回合{}打出的首张计分人头牌",
                    "获得{C:dark_edition}负片{}版本",
                    "{C:inactive}#1#"
                }
            },
            j_aij_postcard_from_perdition_trail = { name = "来自毁灭之路的明信片", text = { "" } },
            j_aij_mr_lonely = {
                name = "孤独先生",
                text = {
                    "回合结束时",
                    "每有一个空置的{C:attention}小丑牌槽位{}",
                    "这张小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{}{C:chips}+#2#{C:inactive}筹码）"
                },
            },
            j_aij_spiders_georg = { 
                name = "蜘蛛乔治", 
                text = { 
                    "将{C:mult}倍率{}乘以{C:attention}#2#{}加上",
                    "本局游戏每手牌{C:attention}计分{}的{C:attention}8{}",
                    "的{C:attention}平均{}数量",
                    "{C:inactive}(当前为{X:mult,C:white}X#1#{}{C:inactive}倍率)"
                } 
            },
            j_aij_gille = { name = "吉尔", text = { "" } },
            j_aij_fulehung = { 
                name = "福勒洪", 
                text = { 
                    "当选择{C:attention}盲注{}时，",
                    "有{C:green}#1# / #2#{}的几率获得",
                    "其{C:attention}跳过标签{}" 
                } 
            },
            j_aij_bearded_joker = {
                name = "胡子小丑",
                text = {
                    "牌组中每有一张{C:attention}增强{}牌",
                    "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{}{C:inactive}倍率）"
                }
            },
            j_aij_skomorokh = { 
                name = "斯科莫罗赫", 
                text = { 
                    "你{C:attention}完整牌组{}中每有一张",
                    "{C:attention}版本{}牌，",
                    "此小丑牌获得{X:mult,C:white}X#1#{}倍率", 
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{}{C:inactive}倍率)"
                } 
            },
            j_aij_silly_billy = { name = "傻比利", text = { "" } },
            j_aij_ijoker_co = { 
                name = "i小丑公司", 
                text = { 
                    "每次{C:money}商店{}进货时",
                    "有{C:attention}#1#{}个随机{C:attention}标签{}可供购买" 
                } 
            },
            j_aij_corpse_paint = {
                name = "尸脸彩绘",
                text = {
                    "移除计分的牌的{C:dark_edition}负片{}效果",
                    "每移除一张，此小丑牌有{C:green}#2#/#1#{}的几率",
                    "使手牌上限{C:attention}+#3#",
                    "{C:inactive}（当前为{C:attention}+#4#{C:inactive} 手牌上限）"
                }
            },
            j_aij_toothy_joker = {
                name = "龅牙小丑",
                text = {
                    "{C:attention}本回合{}每使用{C:tarot}1张塔罗牌{}",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{}{C:chips}+#2#{C:inactive}筹码)"
                }
            },
            j_aij_mondrian_joker = {
                name = "蒙德里安小丑",
                text = {
                    "牌组中每有一张{C:attention}4{}",
                    "则{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{}{C:mult}+#2#{}{C:inactive}倍率）"
                },
            },
            j_aij_orphic_joker = {
                name = "俄耳甫斯小丑",
                text = {
                    "跳过{C:attention}盲注{}时",
                    "生成{C:attention}1{}张随机的{C:uncommon}罕见{C:attention}小丑牌{}",
                    "{C:inactive}（必须有空位）{}"
                },
            },
            j_aij_the_artist = { 
                name = "艺术家", 
                text = { 
                    "{C:tarot}塔罗{}牌的",
                    "选择上限{C:attention}+#1#{}" 
                } 
            },
            j_aij_toynbee_joker = { name = "汤因比小丑", text = { "" } },
            j_aij_aluzinnu = {
                name = "阿卢津努",
                text = {
                    "{C:attention}象形文字{}和{C:attention}岩画{}优惠券",
                    "{C:attention}没有{}{C:red}负面效果{}",
                    "且可以出现{C:attention}多次{}"
                }
            },
            j_aij_great_kraken = {
                name = "巨型克拉肯",
                text = {
                    "根据{C:blue}剩余出牌次数{}",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{}{C:inactive}倍率)",
                    "{C:inactive}(最低为{X:mult,C:white}X1{C:inactive}倍率)"
                }
            },
            j_aij_truhan = {
                name = "特鲁汉",
                text = {
                    "每当一张持有回合数不小于一回合的{C:attention}小丑牌{}被出售时",
                    "此小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{}{C:inactive}倍率）"
                }
            },
            j_aij_chippy = {
                name = "碎屑小筹",
                text = {
                    "此小丑牌获得与",
                    "所花费过{C:money}金钱{}的总额数相等的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                }
            },
            j_aij_hofnarr_the_barbarian = {
                name = "野蛮人霍夫纳尔",
                text = {
                    "{C:mult}+#1#{}倍率",
                    "在{C:attention}决胜盲注{}中禁用",
                    "并提供{X:mult,C:white}X#2#{}倍率"
                },
            },
            j_aij_histrio = {
                name = "罗马演员",
                text = {
                    "回合结束时根据{C:attention}剩余出牌数{}",
                    "获得{C:money}$#1#{}金钱",
                }
            },
            j_aij_loregg = { name = "洛雷格", text = { "" } },
            j_aij_egg_cc = {
                name = "“蛋”",
                text = {
                    "回合结束时，此小丑牌获得{C:chips}+#2#{}筹码",
                    "和{C:money}$#3#{}的{C:attention}出售价值{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                    "{C:inactive}嘿，是“蛋”"
                },
            },
            j_aij_sot = {
                name = "酒鬼",
                text = {
                    "根据持有的{C:attention}标签数量{}",
                    "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                }
            },
            j_aij_fat_ed = { name = "胖艾德", text = { "" } },
            j_aij_stained_glass_joker = {
                name = "玻璃画小丑",
                text = {
                    "{C:attention}玻璃牌{}可视为任意{C:attention}花色{}牌",
                },
            },
            j_aij_mushroom_cloud = { name = "蘑菇云", text = { "" } },
            j_aij_overdesigned_joker = {
                name = "繁琐小丑",
                text = {
                    "打出带有{V:1}#1#{}花色的牌",
                    "计分时#3# {B:3,V:2}#4##2#{}#5#",
                    "当一张牌{C:attention}计分{}时",
                    "花色和效果{C:attention}轮换{}",
                    "{C:inactive}（红桃→梅花→方片→黑桃）"
                }
            },
            j_aij_morio = {
                name = "莫里奥",
                text = {
                    "击败{C:attention}Boss盲注{}时",
                    "可选择生成一张任意{C:tarot}塔罗牌{}",
                    "{C:inactive}（必须有空位）"
                }
            },
            j_aij_visage = {
                name = "面容",
                text = {
                    "复制最后被{C:money}售出{}的",
                    "小丑牌效果"
                }
            },
            j_aij_goofball = {
                name = "呆球",
                text = {
                    "每当任意{C:attention}人头牌{}被{C:attention}打出{}时",
                    "{C:aij_plasma}平衡{}{C:mult}倍率{}和{C:chips}筹码{}的{C:attention}#1#%{}",
                }
            },
            j_aij_heyokha = { name = "赫由卡", text = { "" } },
            j_aij_casual_absent_paranoia = { name = "随意缺席妄想", text = { "" } },
            j_aij_mandrake = { 
                name = "曼德拉草", 
                text = { 
                    "{C:attention}#2#{}回合后，{C:money}出售{}",
                    "此小丑牌以{C:red}摧毁{}",
                    "所有{C:attention}手持{}卡牌",
                    "{C:inactive}(当前为{C:attention}#1#{C:inactive}/#2#)" 
                } 
            },
            j_aij_jester_zombie = {
                name = "小丑僵尸",
                text = {
                    "当本回合有{C:attention}游戏牌{}被摧毁时",
                    "重新触发所有{C:attention}计分{}牌",
                    "{C:inactive}小心你的脑子！{}",
                    "{C:inactive}#1#{}"
                }
            },
            j_aij_richie_rich = { name = "里奇·里奇", text = { "" } },
            j_aij_devil_deal = {
                name = "恶魔交易",
                text = {
                    "每张{C:hearts}红桃{}被摧毁时",
                    "此小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)",
                    "{C:inactive}“饿啊”{}"
                }
            },
            j_aij_totally_nuts = {
                name = "彻底疯狂",
                text = {
                    "获得{C:attention}+#1#{}消耗牌槽位",
                    "每{C:money}售出{}1个{C:attention}消耗牌{}",
                    "则{C:attention}-1{}槽位"
                }
            },
            j_aij_warhol = { name = "沃霍尔", text = { "" } },
            j_aij_mistake = {
                name = "错误",
                text = {
                    "{C:attention}永恒{}小丑牌现在可以{C:attention}出售{}"
                }
            },
            j_aij_depth_of_delusion = { name = "妄想之深", text = { "" } },
            j_aij_curse_of_scotland = { name = "苏格兰诅咒", text = { "" } },
            j_aij_banana_man = {
                name = "香蕉人",
                text = {
                    "{C:attention}重新触发{}所有小丑牌",
                    "每张{C:attention}小丑牌{}有{C:green}#1#/#2#{}概率摧毁"
                }
            },
            j_aij_corny_joker = { name = "老套小丑", text = { "" } },
            j_aij_entropy = {
                name = "熵",
                text = {
                    "跳过{C:attention}盲注{}时",
                    "生成一个{C:attention}混沌标签{}"
                }
            },
            j_aij_urchin = {
                name = "顽童",
                text = {
                    "回合结束时获得{C:money}$#1#{}",
                    "跳过{C:attention}盲注{}时额外增加{C:money}$#2#{}",
                }
            },
            j_aij_machine_intelligence = { name = "机器智能", text = { "" } },
            j_aij_grandma = { name = "奶奶", text = { "" } },
            j_aij_funny_money = { 
                name = "假钞", 
                text = { 
                    "当{C:attention}跳过{}盲注时",
                    "获得{C:money}$#1#{}"
                } 
            },
            j_aij_witchfinder = { 
                name = "巫师猎人", 
                text = { 
                    "{C:money}商店{}中额外提供",
                    "{C:attention}1{}个{C:tarot}幻灵包{}"
                } 
            },
            j_aij_trophy_kill = { name = "战利品击杀", text = { "" } },
            j_aij_tract = {
                name = "传单",
                text = {
                    "根据持有的{C:attention}优惠券数量{}",
                    "获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)"
                }
            },
            j_aij_omlette = {
                name = "煎蛋卷",
                text = {
                    "当{C:blue}出牌{}或{C:red}弃牌{}时",
                    "此小丑牌售出价格{C:money}+$#1#{}"
                }
            },
            j_aij_stock_broker = {
                name = "股票经纪人",
                text = {
                    "每回合的{C:money}利息{}提升一个范围内的{C:attention}随机值{}",
                    "范围：{C:money}X#1#-X#2#{}"
                }
            },
            j_aij_stave = { name = "五线谱", text = { "" } },
            j_aij_sunny_side = { name = "阳光面", text = { "" } },
            j_aij_omelette = { name = "煎蛋卷", text = { "" } },
            j_aij_theyre_looking_at_you = { name = "它们正在看着你...", text = { "" } },
            j_aij_comedy_of_errors = {
                name = "错误喜剧",
                text = {
                    "每次{C:hearts}红桃{}被{C:red}弃掉{}时",
                    "获得{C:money}$#1#{}"
                }
            },
            j_aij_fuzzy_joker = {
                name = "含糊小丑",
                text = {
                    "每回合将{C:mult}倍率{}向上取整",
                    "至{C:attention}#1#的整数次幂"
                }
            },
            j_aij_saucy_jacky = { name = "风骚杰基", text = { "" } },
            j_aij_funny_phone = { name = "搞怪电话", text = { "" } },
            j_aij_taggart = {
                name = "标签小丑",
                text = {
                    "每获得一个{C:attention}标签{}时",
                    "生成其{C:attention}复制品{}",
                    "{C:inactive}（双倍标签除外）"
                }
            },
            j_aij_chitty = {
                name = "小钞",
                text = {
                    "商店中额外提供{C:attention}+#1#{}个",
                    "{C:attention}优惠券{}可供购买"
                }
            },
            j_aij_whatsisname = {
                name = "那个谁",
                text = {
                    "{C:attention}笑语猜谜包{}更容易出现"
                }
            },
            j_aij_downing_street = { 
                name = "唐宁街", 
                text = { 
                    "计分的{C:attention}10{}有{C:green}#1# / #2#{}的几率",
                    "生成一个随机{C:attention}标签{}"
                } 
            },
            j_aij_one_little_duck = { name = "小鸭子", text = { "" } },
            j_aij_four_leaf_clover = { name = "四叶草", text = { "" } },
            j_aij_aphantasia = {
                name = "心盲症",
                text = {
                    "所有打出的{C:attention}增强牌{}变为{C:red}混沌状态{}"
                }
            },
            j_aij_tabula_rasa = {
                name = "白板",
                text = {
                    "选择{C:attention}盲注{}时",
                    "移除这张小丑牌的{C:dark_edition}版本{}",
                    "并使该版本效果变为",
                    "这张小丑的{C:jest_inherent}固有效果{}"
                }
            },
            j_aij_vitruvian_joker = {
                name = "维特鲁威小丑",
                text = {
                    "如果正好拥有{C:attention}5{}张小丑牌",
                    "则{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_american_comic = { name = "美国漫画", text = { "" } },
            j_aij_from_the_top_rope = { name = "飞身压制", text = { "" } },
            j_aij_fortune_cookie = {
                name = "幸运曲奇",
                text = {
                    "打开任意{C:attention}补充包{}时",
                    "生成随机{C:tarot}塔罗牌{}",
                    "{C:inactive}(必须有空位)",
                    "{C:inactive}(可用次数：{C:attention}#1#{C:inactive}/{C:attention}#2#{C:inactive}){}"
                }
            },
            j_aij_tilty_joker = { 
                name = "倾斜小丑", 
                text = { 
                    "{C:attention}计分{}牌提供{C:attention}X#1#{}",
                    "倍的基础{C:chips}筹码{}" 
                } 
            },
            j_aij_opening_move = { 
                name = "开局", 
                text = { 
                    {
                        "回合{C:attention}首次出牌{}中",
                        "每有一张{C:attention}计分{}牌，",
                        "本回合获得{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)"
                    },
                    {
                        "每回合的{C:attention}首次出牌{}",
                        "不会计分"
                    },
                } 
            },
            j_aij_bartender = { 
                name = "酒保", 
                text = { 
                    "{C:attention}消耗牌{}可能带有",
                    "{C:dark_edition}闪箔{}、{C:dark_edition}全息{}或",
                    "{C:dark_edition}多彩{}版本" 
                } 
            },
            j_aij_mahoney = {
                name = "马奥尼",
                text = {
                    "跳过{C:attention}盲注{}时有{C:green}#1#/#2#{}概率",
                    "生成{C:attention}优惠券标签{}",
                }
            },
            j_aij_le_fils_de_banane = {
                name = "香蕉之子",
                text = {
                    "所有{C:attention}人头牌{}提供{C:mult}+#3#{}倍率",
                    "但有{C:green}#1#/#2#{}概率被摧毁",
                }
            },
            j_aij_pygmalion = {
                name = "皮格马利翁",
                text = {
                    "所有{C:attention}石头牌{}均视为{C:attention}Q{}"
                }
            },
            j_aij_grue = { name = "格鲁", text = { "" } },
            j_aij_heavy_sixer = { name = "重型六轮", text = { "" } },
            j_aij_tetrominoker = {
                name = "俄罗斯方块小丑",
                text = {
                    "{C:attention}4{}计分时",
                    "有{C:green}#1#/#2#{}概率",
                    "生成那张牌的{C:attention}复制品{}"
                }
            },
            j_aij_mr_catfish = { 
                name = "鲶鱼先生", 
                text = { 
                    "每{C:red}弃掉{}{C:attention}#2#{C:inactive} [#3#]{}张牌，",
                    "获得{C:money}$#1#{}"
                } 
            },
            j_aij_angel_number = {
                name = "天使数字",
                text = {
                    "本回合每张计分的{C:attention}7{}",
                    "所有{C:green}概率{}{C:attention}+#1#{}",
                    "每回合重置"
                }
            },
            j_aij_doctors_orders = { 
                name = "医嘱", 
                text = { 
                    "打出的手牌中每有一张{C:attention}9{}，",
                    "{X:mult,C:white}X#1#{}倍率，",
                    "如果没有打出{C:attention}9{}则{C:red}自毁{}"
                } 
            },
            j_aij_blue_eyes_white_joker = {
                name = "青眼白丑",
                text = {
                    "当回合{C:attention}最后出牌{}为{C:attention}1张牌{}时",
                    "增加其{C:attention}#1#次{}重新触发次数"
                }
            },
            j_aij_lucina = {
                name = "狂欢小丑",
                text = {
                    "选择盲注时摧毁其左侧{C:attention}小丑牌",
                    "并为右侧小丑添加{C:dark_edition}随机版本{}",
                    "{C:inactive}(必须有可摧毁小丑)"
                }
            },
            j_aij_circuit_diagram = {
                name = "电路图",
                text = {
                    "{C:attention}充能牌{}始终置于牌组顶部",
                }
            },
            j_aij_paracosm = {
                name = "平行宇宙",
                text = {
                    "跳过{C:attention}盲注{}时",
                    "提升{C:attention}#1#{}的等级"
                }
            },
            j_aij_mocap = { 
                name = "动作捕捉", 
                text = { 
                    {
                        "当出售一张{C:legendary}传奇{}、{C:rare}稀有{}、",
                        "或{C:uncommon}罕见{}小丑牌时，",
                        "生成一张低一级的",
                        "{C:attention}随机{}小丑牌"
                    }, 
                    {
                        "{C:legendary}传奇{}->{C:rare}稀有{}",
                        "{C:rare}稀有{}->{C:uncommon}罕见{}",
                        "{C:uncommon}罕见{}->{C:common}普通{}"
                    }
                } 
            },
            j_aij_stagehand = { 
                name = "舞台工作人员", 
                text = { 
                    "所有{C:attention}小丑牌{}提供",
                    "{X:mult,C:white}X#1#{}倍率"
                } 
            },
            j_aij_the_mermaid = { name = "美人鱼", text = { "" } },
            j_aij_electric_snow = { 
                name = "电雪", 
                text = { 
                    "回合只会在",
                    "{C:attention}最后一次出牌{}后结束" 
                } 
            },
            j_aij_colour_test = { 
                name = "色彩测试", 
                text = { 
                    "在回合{C:attention}最后{}",
                    "{C:attention}一手牌{}中，为第一张",
                    "计分牌添加{C:attention}多彩{}版本"
                } 
            },
            j_aij_test_card = {
                name = "测试卡",
                text = {
                    "触发手牌中持有的{C:attention}版本{}效果"
                }
            },
            j_aij_interstate = {
                name = "州际公路",
                text = {
                    "当回合{C:attention}首次出牌{}包含{C:attention}顺子{}时",
                    "{C:blue}+#1#{}出牌次数"
                }
            },
            j_aij_bowls_of_joy = { name = "欢乐碗", text = { "" } },
            j_aij_chips_n_dip = {
                name = "筹码蘸酱",
                text = {
                    "{X:chips,C:white}X#1#{}筹码",
                    "回合结束时失去{X:chips,C:white}X#2#{}筹码"
                }
            },
            j_aij_homemade_comic = {
                name = "自制漫画",
                text = {
                    "打出的{C:attention}充能牌{}提供{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_gematria = { name = "希伯来文字符法", text = { "" } },
            j_aij_bingo_card = {
                name = "宾果卡",
                text = {
                    "计分的{C:attention}幸运牌{}",
                    "有{C:green}#1#/#2#{}概率获得{X:mult,C:white}X#4#{}倍率",
                    "有{C:green}#1#/#3#{}概率重新触发"
                }
            },
            j_aij_fish_fingers = {
                name = "炸鱼手指",
                text = {
                    "{C:blue}+#1#{}出牌次数",
                    "击败盲注时{C:blue}-#2#{}出牌次数"
                }
            },
            j_aij_joker_png = { 
                name = "小丑.png", 
                text = { 
                    {
                    '{B:1,C:white,s:0.8}启动式能力',
                    '此小丑牌{C:attention}复制{}一张',
                    '随机{C:attention}小丑牌{}的{C:attention}效果{}',
                    },
                    {
                    '支付{C:money}$#1#{}重掷，本底注内',
                    '每次重掷费用增加{C:money}$#1#{}'
                    }
                } 
            },
            j_aij_kuruko = { name = "库鲁科", text = { "" } },
            j_aij_candy_floss = {
                name = "棉花糖",
                text = {
                    "{C:aij_plasma}平衡{}{C:mult}倍率{}和{C:chips}筹码{}的{C:attention}#1#%{}",
                    "回合结束时减少{C:attention}#2#%{}"
                }
            },
            j_aij_stargazy_pie = {
                name = "观星派",
                text = {
                    "下{C:attention}#1#{}张使用的{C:planet}星球牌{}",
                    "效果重新触发"
                }
            },
            j_aij_gameshow = { 
                name = "游戏节目", 
                text = { 
                    {
                        "当{C:attention}盲注{}被选择时，",
                        "有{C:green}#1# / #2#{}的几率给一张",
                        "随机{C:attention}小丑牌{}添加{C:dark_edition}闪箔{}、",
                        "{C:dark_edition}全息{}或{C:dark_edition}多彩{}版本"
                    },
                    { 
                        "触发时失去{C:money}$#3#{}",
                        "无论结果如何"
                    } ,
                },
            },
            j_aij_bonus_pay = {
                name = "额外薪酬",
                text = {
                    "打出{C:attention}奖励牌{}时",
                    "获得{C:money}$#1#{}"
                }
            },
            j_aij_illuminated_joker = { 
                name = "启迪小丑", 
                text = { 
                    "{C:money}金色{}标签出现的",
                    "概率{C:attention}增加{}" 
                } 
            },
            j_aij_magazine_ad = { name = "杂志广告", text = { "" } },
            j_aij_bonus_bob = {
                name = "红利鲍勃",
                text = {
                    "打出{C:attention}奖励牌{}时",
                    "提供{X:chips,C:white}X#1#{}筹码"
                }
            },
            j_aij_bonus_round = {
                name = "奖励回合",
                text = {
                    "{C:attention}重新触发{}所有",
                    "打出的{C:attention}奖励牌{}"
                }
            },
            j_aij_jack_o_lantern = { name = "杰克灯", text = { "" } },
            j_aij_astrologer = { 
                name = "占星家", 
                text = { 
                    {
                        "{C:planet}天体包{}中的",
                        "选择次数{C:attention}+#1#{}" 
                    },
                    {
                        "在{C:attention}奇数{}底注，{C:planet}星球{}牌",
                        "变为其{C:mult}倍率{}变体；",
                        "在{C:attention}偶数{}底注，变为",
                        "其{C:chips}筹码{}变体"
                    },
                } 
            },
            j_aij_planetarium = { 
                name = "天文馆", 
                text = { 
                    {
                        "消耗牌区的{C:chips}筹码{}类{C:planet}星球{}牌",
                        "为其对应的{C:attention}牌型{}",
                        "提供{C:chips}+#1#{}筹码" 
                    },
                    {
                        "消耗牌区的{C:mult}倍率{}类{C:planet}星球{}牌",
                        "为其对应的{C:attention}牌型{}",
                        "提供{C:mult}+#2#{}倍率" 
                    },
                } 
            },
            j_aij_stargazer = { name = "观星者", text = { "" } },
            j_aij_skald = { name = "吟游诗人", text = { "" } },
            j_aij_sky_trees = { 
                name = "天空树", 
                text = { 
                    "{C:attention}蓝色蜡封{}提供{C:mult}倍率{}和",
                    "{C:chips}筹码{}类{C:planet}星球{}牌，",
                    "而非{C:attention}基础{}类{C:planet}星球{}牌" 
                } 
            },
            j_aij_the_freezer = { name = "冰柜", text = { "" } },
            j_aij_twisted_pair = { 
                name = "双绞线", 
                text = { 
                    "如果手牌是{C:attention}对子{}，",
                    "每张牌获得对应于",
                    "{C:attention}另一张牌{}花色的{C:attention}补丁{}" 
                } 
            },
            j_aij_the_grim_joker = { 
                name = "冷酷小丑", 
                text = { 
                    "由{C:planet}蓝色{}或{C:tarot}紫色{}蜡封",
                    "生成的{C:attention}消耗牌{}",
                    "有{C:green}#1# / #2# 几率{}变为",
                    "{C:dark_edition}负片{}版本"
                } 
            },
            j_aij_lexicon = { 
                name = "词典", 
                text = { 
                    "增加等同于所有持有{C:attention}小丑牌{}",
                    "价值中数字{C:attention}总和{}的{C:mult}倍率{}",
                    "{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率)"
                } 
            },
            j_aij_dendroglpyh = { name = "树木雕刻", text = { "" } },
            j_aij_prank_caller = { name = "恶作剧电话", text = { "" } },
            j_aij_arngren = { 
                name = "阿恩格伦", 
                text = { 
                    "{C:money}商店{}中{C:attention}+#1#{}卡牌槽位，",
                    "{C:attention}+#1#{}补充包槽位，",
                    "以及{C:attention}+#1#{}优惠券槽位"
                } 
            },
            j_aij_blacklist = { 
                name = "黑名单", 
                text = { 
                    "{C:money}已售出{}的小丑牌",
                    "不会再次出现",
                    "当前黑名单小丑：",
                } 
            },
            j_aij_croupier = {
                name = "荷官",
                text = {
                    "当打出牌型分数超过",
                    "盲注要求的{C:attention}两倍{}时",
                    "获得{C:money}#1#${}"
                }
            },
            j_aij_the_lucovico_technique = { name = "卢多维科技术", text = { "" } },
            j_aij_headstone = {
                name = "墓碑",
                text = {
                    "将所有{C:attention}人头牌{}置于",
                    "牌组{C:red}底部{}"
                }
            },
            j_aij_full_monty = { name = "全身脱光光", text = { "" } },
            j_aij_chef = {
                name = "厨师",
                text = {
                    "基础{C:enhanced}易腐{}小丑变为{C:dark_edition}负片{}",
                    "{C:money}商店{}不再出现易腐贴纸"
                }
            },
            j_aij_screamer = { name = "尖叫者", text = { "" } },
            j_aij_evil_twin = { name = "邪恶双胞胎", text = { "" } },
            j_aij_cubic_joker = { name = "立方小丑", text = { "" } },
            j_aij_remina = { 
                name = "蕾米娜", 
                text = { 
                    "当选择{C:attention}小盲注{}或{C:attention}大盲注{}时，",
                    "此小丑牌{C:red}摧毁{}消耗牌区的所有",
                    "{C:planet}星球牌{}并获得其",
                    "{C:chips}筹码{}和{C:mult}倍率{}",
                    "{C:inactive,s:0.8}(当前为{C:chips,s:0.8}+#2#{}{C:inactive,s:0.8}筹码,{C:mult,s:0.8}+#1#{C:inactive,s:0.8}倍率)"
                } 
            },
            j_aij_jpeg = { name = ".jpeg", text = { "" } },
            j_aij_sherrif = { 
                name = "警长",
                text = { 
                    "每手牌第一张计分的{C:attention}万能牌{}",
                    "赚取{C:money}$#1#{}"
                } 
            },
            j_aij_alien_joker = { 
                name = "外星小丑", 
                text = { 
                    {
                        "{C:attention}强制选择 1{}张牌",
                    },
                    {
                        "{C:attention}强制选择{}的牌在计分时",
                        "提供{X:mult,C:white}X#1#{}倍率" 
                    }
                } 
            },
            j_aij_nobody = { 
                name = "无名小卒", 
                text = { 
                    "{C:inactive}什么也不做...？" 
                } 
            },
            j_aij_broken_dreams = { name = "破碎的梦想", text = { "" } },
            j_aij_elf = { 
                name = "精灵", 
                text = { 
                    "跳过{C:attention}#2#{}个盲注后，",
                    "{C:money}出售{}此小丑牌以生成",
                    "{C:attention}#3# 个投资标签",
                    "{C:inactive}(当前为{C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_fall_of_count_chaligny = {
                name = "沙利尼伯爵之陨",
                text = { 
                    "将所有{C:attention}盲注{}的",
                    "{C:attention}分数需求{}设为{C:attention}1X{}基础值"
                } 
            },
            j_aij_coulrorachne = { 
                name = "库尔罗拉克妮", 
                text = { 
                    "每计分{C:attention}#4#{C:inactive}[#3#]{}张{C:attention}8{}",
                    "此小丑牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)" 
                } 
            },
            j_aij_bad_sun = { 
                name = "坏太阳", 
                text = { 
                    "如果{C:attention}打出的{}手牌包含{C:attention}#1#{}",
                    "或更多{C:hearts}红桃{}，摧毁一张",
                    "{C:attention}随机{}打出的牌" 
                } 
            },
            j_aij_lemarchand_cube = { name = "勒马尔尚魔方", text = { "" } },
            j_aij_duende = { name = "杜恩德", text = { "" } },
            j_aij_evil_joker = { 
                name = "邪恶小丑", 
                text = { 
                    "{X:mult,C:white}X#1#{}倍率，当{C:attention}获得{}时",
                    "摧毁一张{C:attention}随机{}小丑牌" 
                } 
            },
            j_aij_sanguine_joker = {
                name = "乐观小丑",
                text = {
                    "计分的{C:hearts}红桃{}有{C:green}#1#/#2#{}概率",
                    "生成随机{C:attention}标签{}"
                }
            },
            j_aij_choleric_joker = {
                name = "暴躁小丑",
                text = {
                    "计分的{C:hearts}方片{}有{C:green}#1#/#2#{}概率",
                    "生成随机{C:tarot}塔罗牌{}",
                    "{C:inactive}(必须有空间){}"
                }
            },
            j_aij_phlegmatic_joker = {
                name = "冷漠小丑",
                text = {
                    "计分的{C:hearts}梅花{}有{C:green}#1#/#2#{}概率",
                    "生成出牌牌型对应的{C:planet}星球牌{}",
                    "{C:inactive}(必须有空间){}"
                }
            },
            j_aij_melancholic_joker = {
                name = "忧郁小丑",
                text = {
                    "计分的{C:hearts}黑桃{}有{C:green}#1#/#2#{}概率",
                    "生成随机{C:spectral}幻灵牌{}",
                    "{C:inactive}(必须有空间){}"
                }
            },
            j_aij_majordomo = { 
                name = "管家", 
                text = { 
                    {
                        "{C:money}商店{}中所有价格",
                        "高于{C:money}$#1#{}的{C:attention}小丑牌{}",
                        "获得{C:money}租赁{}贴纸" 
                    },
                    {
                        "{C:attention}租赁{}扣除的费用减少{C:money}$2{}"
                    }
                }
            },
            j_aij_skinsuit = { 
                name = "人皮衣", 
                text = { 
                    "当一张牌被{C:red}摧毁{}时，",
                    "将其{C:attention}花色补丁{}贴到",
                    "{C:attention}手牌{}中的一张{C:attention}随机牌{}上" 
                } 
            },
            j_aij_shock_humor = { name = "冲击性幽默", text = { "" } },
            j_aij_the_house_that_jack_built = { name = "杰克盖的房子", text = { "" } },
            j_aij_clownbug = { name = "小丑虫", text = { "" } },
            j_aij_the_grand_mathematician = {
                name = "大数学家",
                text = {
                    "每回合开始时进行一次",
                    "{C:attention}数学问答{}。",
                    "答对此小丑{C:green}获得奖励倍率{}",
                    "答错此小丑{C:red}扣除奖励倍率{}",
                    "{C:inactive}（当前为{}{X:mult,C:white}X#1#{}{C:inactive}倍率）"
                }
            },
            j_aij_prototype = {
                name = "原型",
                text = {
                    "{C:inactive}\"哈哈，我不知道自己",
                    "{C:inactive}还有没有台词了\""
                }
            },
            j_aij_spoofy = {
                name = "搞怪",
                text = {
                    "{C:inactive}\"你应该玩《布拉普特罗》\""
                }
            },
            j_aij_toyrapple = { name = "玩具苹果", text = {""} },
            j_aij_grass = {
                name = "草",
                text = {
                    "\"那个游戏\""
                }
            },
            j_aij_mythie = {
                name = "神话",
                text = {
                    "{C:inactive}\"在床上吃烤面包是",
                    "{C:inactive}我的能力\""
                }
            },
            j_aij_zan = { name = "赞", text = {""} },
            j_aij_metrollen = { name = "地铁巨魔", text = {""} },
            j_aij_clay = { name = "黏土", text = {""} },
            j_aij_generic = {
                name = "普通艾瑞克",
                text = {
                    "{C:inactive}\"为了游戏平衡",
                    "{C:inactive}其余内容已清空\""
                }
            },
            j_aij_cheddar = { name = "切达干酪", text = {""} },

            j_aij_nybbas = { name = "尼巴斯", text = { "" }, unlock = { "?????" } },
            j_aij_doink = { name = "咚", text = { "" }, unlock = { "?????" } },
            j_aij_monarcho = { name = "君主", text = { "" }, unlock = { "?????" } },
            j_aij_pompey = {
                name = "庞培",
                text = {
                    "每张位于庞培{C:attention}右侧{}的小丑牌",
                    "包括庞培自己",
                    "给予{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{}{X:mult,C:white}X#2#{}{C:inactive}倍率）"
                },
                unlock = {
                    "?????"
                }
            },j_aij_touchstone = {
                name = "塔奇斯通",
                text = {
                    "手牌上限+{C:attention}#1#",
                    "揭示牌堆中接下来的{C:attention}#2#{}张牌",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fortunato = {
                name = "福尔图纳托",
                text = {
                    "将所有{C:attention}打出但未计分{}的牌",
                    "变为{C:attention}石头牌{}",
                    "当{C:attention}石头牌{}计分时",
                    "此{C:attention}小丑牌{}获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{}{X:mult,C:white}X#1#{}{C:inactive}倍率）",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pellesini = {
                name = "佩莱西尼",
                text = {
                    "当有{C:attention}小丑牌{}被摧毁时",
                    "生成一个完全相同的{C:attention}复制品{}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_nedda = {
                name = "内达",
                text = {
                    "手牌中持有的{C:attention}Q{}",
                    "提供{X:mult,C:white}X#1#{}倍率"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_silvio = {
                name = "西尔维奥",
                text = {
                    "手牌中每有一张{C:attention}Q{}",
                    "所有{C:attention}K{}重新触发一次",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_biancolelli = { 
                name = "比安科莱利", 
                text = { 
                    "在小丑牌触发后", 
                    "{C:aij_plasma}平衡{}{C:chips}筹码{}和{C:mult}倍率{}"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_toto = {
                name = "托托",
                text = {
                    "每获得一个{C:attention}标签{}时",
                    "生成其{C:attention}2{}个复制品",
                    "{C:inactive}（双倍标签除外）"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_grock = { name = "格罗克", text = { "" }, unlock = { "?????" } },
            j_aij_eulenspiegel = {
                name = "尤伦斯皮格尔",
                text = {
                    "击败{C:attention}Boss盲注{}时",
                    "{C:attention}底注-#1#{}",
                    "此小丑牌失去{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive}倍率）"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_deburau = { name = "德布罗", text = { "" }, unlock = { "?????" } },
            j_aij_dacosta = { name = "达科斯塔", text = { "" }, unlock = { "?????" } },
            j_aij_durie = { name = "杜里", text = { "" }, unlock = { "?????" } },
            j_aij_nichola = {
                name = "尼古拉",
                text = {
                    "回合开始时，将一张",
                    "随机的{C:attention}Q{}加入手牌",
                    "带有随机的{C:attention}增强{}、",
                    "{C:dark_edition}版本{}和{C:attention}蜡封{}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fleeman = { name = "弗利曼", text = { "" }, unlock = { "?????" } },
            j_aij_calquhoun = { name = "卡尔昆", text = { "" }, unlock = { "?????" } },
            j_aij_dor = {
                name = "多尔",
                text = {
                    "每回合的{C:attention}最后一手{}牌",
                    "{X:dark_edition,C:white}X#1#{}倍率"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_archy = {
                name = "阿奇",
                text = {
                    "{C:money}商店{}中所有初始的",
                    "{C:attention}卡牌{}和{C:attention}补充包{}免费"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_sommers = { name = "萨默斯", text = { "" }, unlock = { "?????" } },
            j_aij_pace = {
                name = "佩斯",
                text = {
                    "所有{C:uncommon}罕见{}和",
                    "{C:rare}稀有{}小丑牌被视为{C:common}普通{}小丑牌"
                },
                unlock = { "?????" }
                -- TODO discuss: are these rarities inclusive,
                -- so e.g. an Uncommon would count as Common and still be Uncommon
                -- for a Baseball Card (此处已根据上下文和游戏机制进行了处理，使其更符合中文玩家理解)
            },
            j_aij_thomazina = {
                name = "托马齐娜",
                text = {
                    "打出的{C:attention}数字{}牌提供{C:chips}+#1#{}筹码",
                    "每当一张{C:attention}数字{}牌计分时",
                    "额外增加{C:chips}+#2#{}筹码"
                },
                unlock = { "?????" }
            },
            j_aij_mathurine = { name = "玛蒂琳", text = { "" }, unlock = { "?????" } },
            j_aij_guillaume = {
                name = "纪尧姆",
                text = {
                    "若击败{C:attention}Boss盲注{}时",
                    "所拥有的小丑牌少于{C:attention}5{}张",
                    "此小丑牌获得{C:dark_edition}+#2#{}小丑牌槽位",
                    "{C:inactive}（当前为{C:dark_edition}+#1#{C:inactive} 小丑牌槽位）",
                },
                unlock = { "?????" }
            },
            j_aij_tarlton = {
                name = "塔尔顿",
                text = {
                    "获得等同于本回合",
                    "你已打过的{C:attention}牌型{}的{C:attention}总筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）",
                },
                unlock = { "?????" }
            },
            j_aij_roland = { name = "罗兰", text = { "" }, unlock = { "?????" } },
            j_aij_borra = { name = "博拉", text = { "" }, unlock = { "?????" } },
            j_aij_taillefer = {
                name = "塔耶费尔",
                text = {
                    "每打出一手牌，此小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "击败{C:attention}#3#{}个{C:attention}Boss盲注{}后{C:red}自毁{}",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{}倍率，{C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive}）",
                },
                unlock = { "?????" }
            },
            j_aij_killigrew = {
                name = "基利格鲁",
                text = {
                    "每拥有一张{C:attention}优惠券{}",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{}{X:mult,C:white}X#2#{}{C:inactive}倍率）",
                },
                unlock = { "?????" }
            },
            j_aij_dongfang = { name = "东方", text = { "" }, unlock = { "?????" } },
            j_aij_zerco = {
                name = "泽尔科",
                text = {
                    "为每回合{C:attention}第一张{}打出的{C:attention}游戏牌{}",
                    "施加{C:dark_edition}负片{}效果",
                    "{C:inactive}（如果该牌没有现有版本）"
                },
                unlock = { "?????" }
            },
            j_aij_yu_sze = {
                name = "虞瑟",
                text = {
                    "没有{C:dark_edition}版本{}的小丑牌",
                    "提供{X:mult,C:white}X#1#{}倍率"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_brusquet = { name = "布鲁斯凯特", text = { "" }, unlock = { "?????" } },
            j_aij_rahere = { name = "拉希尔", text = { "" }, unlock = { "?????" } },
            j_aij_gonnella = { name = "戈内拉", text = { "" }, unlock = { "?????" } },
            j_aij_gong_gil = { name = "孔吉尔", text = { "" }, unlock = { "?????" } },
            j_aij_angoulevent = {
                name = "安古勒旺",
                text = {
                    "所有打出的牌额外再触发{C:attention}#1#{}次"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_coryat = { name = "科里亚特", text = { "" }, unlock = { "?????" } },
            j_aij_bluet = {
                name = "布鲁特",
                text = {
                    "选择{C:attention}盲注{}时",
                    "生成一张{C:dark_edition}负片{}{C:spectral}幻灵{}牌"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_bebe = {
                name = "贝贝",
                text = {
                    "{C:blue}+4{}次出牌"
                },
                unlock = { "?????" }
            },
            j_aij_pipine = {
                name = "皮平",
                text = {
                    "{C:red}+5{}次弃牌"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_golitsyn = { name = "戈利岑", text = { "" }, unlock = { "?????" } },
            j_aij_buzheninova = { name = "布泽尼诺娃", text = { "" }, unlock = { "?????" } },
            j_aij_yakov = { name = "雅科夫", text = { "" }, unlock = { "?????" } },
            j_aij_komar = {
                name = "科马尔",
                text = {
                    "所有{C:attention}计分{}的牌",
                    "获得等同于所有",
                    "{C:attention}其他{}计分牌的{C:chips}筹码值{}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_lavatch = {
                name = "拉瓦奇",
                text = {
                    "打出的{C:clubs}梅花{}提供{X:mult,C:white}X#1#{}倍率",
                    "当{C:clubs}梅花{}计分时",
                    "额外增加{X:mult,C:white}X#2#{}倍率",
                },
                unlock = { "?????" }
            },
            j_aij_Ffwllier = { name = "弗威尔勒", text = { "" }, unlock = { "?????" } },
            j_aij_martellino = {
                name = "马特利诺",
                text = {
                    "{C:attention}#2#{}回合后{C:money}出售{}此小丑牌",
                    "可从你的{C:attention}收藏{}中",
                    "选择一张{C:attention}小丑牌{}",
                    "{C:inactive}（当前为{C:attention}#1#{}{C:inactive}/#2#）{}"
                },
                unlock = { "?????" }
            },
            j_aij_shir_ei = { name = "诗影", text = { "" }, unlock = { "?????" } },
            j_aij_xinmo = { name = "心魔", text = { "" }, unlock = { "?????" } },
            j_aij_chunyu = { name = "淳于", text = { "" }, unlock = { "?????" } },
            j_aij_fantasio = {
                name = "凡塔西奥",
                text = {
                    "所有牌均视为{C:attention}所有花色{}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_sexton = { name = "教堂司事", text = { "" }, unlock = { "?????" } },
            j_aij_dongtong = {
                name = "东通",
                text = {
                    "{C:green}翻倍{}大多数{C:attention}小丑牌{}的效果",
                },
                unlock = { "?????" }
            },
            j_aij_naiteh = {
                name = "奈特",
                text = {
                    "击败{C:attention}Boss盲注{}时",
                    "手牌上限+{C:attention}#2#",
                    "{C:inactive}（当前为{C:attention}+#1#{C:inactive} 手牌上限）"
                },
                unlock = { "?????" }
            },
            j_aij_talhak = {
                name = "塔尔哈克",
                text = {
                    "击败{C:attention}Boss盲注{}时",
                    "可选择生成一张{C:attention}任意{}{C:spectral}幻灵{}牌",
                    "{C:inactive}（必须有空位）"
                },
                unlock = { "?????" }
            },
            j_aij_baddata = {
                name = "BAD_DATA",
                text = {
                }
            },
            j_aij_office_assistant = {
                name = "办公助手",
                text = {
                    "{B:1,C:white,s:0.8}启动式能力",
                    "修复{C:attention}右侧{}的{C:attention}易腐{}或",
                    "{C:attention}租赁{}小丑牌"
                }
            },
            j_aij_cavalier = {
                name = "骑士",
                text = {
                    "本{C:attention}回合{}每打出过一次{C:attention}手牌{}",
                    "获得{C:mult}+#2#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率)"
                }
            },
            j_aij_elder = {
                name = "长者",
                text = {
                    "复制你{C:attention}拥有时间最长{}的",
                    "{C:attention}小丑牌{}的效果",
                    "{C:inactive}(当前为 #1#)"
                }
            },
            j_aij_cut_here = {
                name = "在此剪开",
                text = {
                    "当此小丑牌被",
                    "{C:red}摧毁{}时，生成一张",
                    "随机的{C:red}稀有{}小丑牌"
                }
            },
            j_aij_firework = {
                name = "烟花",
                text = {
                    "首张打出的{C:attention}倍率{}牌",
                    "计分时提供{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_bad_guy = {
                name = "坏家伙",
                text = {
                    "当{C:attention}Boss盲注{}被击败时，",
                    "为一张{C:attention}手持{}的随机牌",
                    "应用{C:attention}闪箔{}版本"
                }
            },
            j_aij_tool = {
                name = "工具",
                text = {
                    "改变过{C:attention}花色{}的卡牌",
                    "永久获得{C:mult}+#1#{}倍率"
                }
            },
            j_aij_youve_got_mail = {
                name = "收到邮件",
                text = {
                    {
                        "如果{C:red}不是{C:dark_edition}负片{}版本，当",
                        "选择{C:attention}盲注{}时，生成此小丑牌的",
                        "一张{C:dark_edition}负片{C:attention}复制品{}",
                        "且售价为{C:money}$0{}"
                    },
                    {
                        "{V:1}{B:3,V:2}#1##2#{}{V:1}#3#"
                    }
                }
            },
            j_aij_fleshgait = {
                name = "皮行者",
                text = {
                    "{C:attention}计分{}的卡牌如果",
                    "{C:red}没有{C:attention}花色补丁{}，",
                    "获得一个随机{C:attention}花色补丁{}"
                }
            },
            j_aij_czar = {
                name = "沙皇",
                text = {
                    "复制一张{C:attention}收藏{}中",
                    "{C:attention}已发现{}的随机小丑牌的{C:attention}效果",
                    "{C:inactive}(每次商店重掷时改变)"
                }
            },
            j_aij_stage_production = {
                name = "舞台制作",
                text = {
                    "{B:1,C:white,s:0.8}启动式能力",
                    "每回合一次，{C:attention}临时{}重掷",
                    "{C:attention}右侧{}的小丑牌，",
                    "直到选择下一个盲注",
                    "{C:inactive}#1#"
                }
            },
            j_aij_pink_slip = {
                name = "解雇通知",
                text = {
                    "{C:red}弃牌{}的选择上限",
                    "{C:attention}+#1#{}"
                }
            },
            j_aij_chromatist = {
                name = "色彩学家",
                text = {
                    "当{C:attention}多彩{}版本触发时",
                    "获得{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_aij_death_of_a_salesman = {
                name = "推销员之死",
                text = {
                    "每次{C:money}商店{}进货",
                    "有{C:attention}#1#{}个{C:red}混沌{}或{C:red}混乱{C:attention}标签",
                    "可供购买"
                }
            },
            j_aij_parking_space = {
                name = "停车位",
                text = {
                    "如果此小丑牌位于",
                    "{C:attention}小丑槽位 #2#{}，",
                    "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(槽位在回合结束时改变)"
                }
            },
            j_aij_graffiti = {
                name = "涂鸦",
                text = {
                    {
                        '{B:1,C:white,s:0.8}启动式能力',
                        '支付{C:money}$#1#{}以获得一个',
                        '随机{C:attention}标签'
                    },
                    {
                        '使用后{C:money}费用{}增加{C:red}X#2#',
                        '击败{C:attention}Boss盲注{}后重置'
                    }
                }
            },
            j_aij_historian = {
                name = "历史学家",
                text = {
                    "增加等同于最后一张售出小丑牌",
                    "{C:money}售价{}三倍的{C:mult}倍率{}",
                    "{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率)"
                }
            },
            j_aij_bozo = {
                name = "波佐",
                text = {
                    "当{C:attention}Boss盲注{}被",
                    "击败时，生成{C:attention}#1#{}张",
                    "随机{C:dark_edition}负片{}小丑牌"
                },
                unlock = { "?????" }
            },
            j_aij_thalia = {
                name = "塔利亚",
                text = {
                    "如果本回合{C:attention}首次弃牌{}",
                    "仅包含{C:attention}1{}张牌，",
                    "该牌永久获得{C:attention}+1 次重复触发"
                },
                unlock = { "?????" }
            },
            j_aij_a_young_hamlet = {
                name = "年轻的哈姆雷特",
                text = {
                    "每{C:red}弃掉{}{C:attention}#3#{C:inactive} [#4#]{}张牌，",
                    "此小丑牌获得{C:mult}+#2#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率)"
                }
            },
            j_aij_infamous_machine = {
                name = "恶名昭彰的机器",
                text = {}
            },
            j_aij_weatherman = {
                name = "气象员",
                text = {}
            },
            j_aij_headfooter = {
                name = "头足",
                text = {}
            },
            j_aij_rudolph = {
                name = "鲁道夫",
                text = {}
            },
            j_aij_mike_check = {
                name = "麦克风测试",
                text = {}
            },
            j_aij_pure_baseball_card = {
                name = "纯粹棒球卡",
                text = {}
            },
            j_aij_rock_n_roll_clown = {
                name = "摇滚小丑",
                text = {}
            },
            j_aij_vecchio_dolore = {
                name = "旧日悲伤",
                text = {}
            }
        },
        Planet = {
            c_aij_vulcanoid = {
                name = "祝融星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_zoozve = {
                name = "祖兹薇",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_luna = {
                name = "月球",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_phobos = {
                name = "火卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_europa = {
                name = "木卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_titan = {
                name = "土卫六",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_umbriel = {
                name = "天卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_triton = {
                name = "海卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_nix = {
                name = "冥卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_planet_nine = {
                name = "第九行星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_pallas = {
                name = "智神星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_dysnomia = {
                name = "阋卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_phaethon = {
                name = "法厄同",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_kamooalewa = {
                name = "振荡星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_deimos = {
                name = "火卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_callisto = {
                name = "木卫四",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_iapetus = {
                name = "土卫八",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_oberon = {
                name = "天卫四",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_proteus = {
                name = "海卫八",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_charon = {
                name = "冥卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_nibiru = {
                name = "尼比鲁",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_kuiper = {
                name = "柯伊伯",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_rogue = {
                name = "流浪行星",
                text = {
                    '升级所有',
                    '{C:attention}小丑牌{}效果中',
                    '提到的{C:attention}牌型'
                }
            },
            c_aij_dark_star = {
                name = "暗星",
                text = {
                    '升级所有',
                    "尚未{C:attention}打出{}过的",
                    "{C:attention}牌型"
                }
            },
            c_aij_sol = {
                name = "太阳",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#4#{} 倍率和",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_weywot = {
                name = "创卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_namaka = {
                name = "妊卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_ilmare = {
                name = "伊尔玛雷",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_salacia = {
                name = "萨拉恰",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_ixion = {
                name = "伊克西翁",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_hiiaka = {
                name = "妊卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_varda = {
                name = "瓦尔达",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_mk2 = {
                name = "Mk2",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级#1#{S:0.8}){} 升级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            }
        },
        Spectral = {
            c_aij_gravastar = {
                name = '引力星',
                text = {
                    '{C:attention}升级{}所有',
                    '{C:legendary,E:1}牌型{}的',
                    '{C:chips}筹码{}'
                }
            },
            c_aij_pulsar = {
                name = '脉冲星',
                text = {
                    '{C:attention}升级{}所有',
                    '{C:legendary,E:1}牌型{}的',
                    '{C:mult}倍率{}'
                }
            },
            c_aij_shade = {
                name = '阴影',
                text = {
                    '为{C:attention}1{}张手牌',
                    '添加{C:dark_edition}负片{}版本'
                }
            },
            c_aij_trefle = {
                name = '梅花',
                text = {
                    '{C:attention}重掷{}一张',
                    '选中的{C:attention}小丑牌',
                    "{C:inactive}(不可为{}",
                    "{C:inactive}永恒牌){}"
                }
            },
            c_aij_trefle_controller = {
                name = '梅花',
                text = {
                    '{C:attention}重掷{}{C:attention}最右侧{}的',
                    '小丑牌',
                    "{C:inactive}(不可为{}",
                    "{C:inactive}永恒牌){}"
                }
            },
            c_aij_scopophobia = {
                name = '窥视恐惧',
                text = {
                    '{C:red}摧毁{}一张随机{C:attention}小丑牌',
                    '和{C:attention}所有手持牌{}',
                }
            },
            c_aij_reshape = {
                name = '重塑',
                text = {
                    '将所有{C:attention}小丑牌{}变为',
                    '一张随机持有{C:attention}小丑牌{}的复制品',
                    '{C:inactive}(小丑保留其原始',
                    '{C:inactive}贴纸和版本)'
                }
            },
            c_aij_palmistry = {
                name = '手相',
                text = {
                    '给予所有手牌',
                    '一种随机{C:attention}增强{}，',
                    '{C:red}-#1#{} 手牌上限'
                }
            },
            c_aij_gegenschein = {
                name = "对日照",
                text = {
                    '将所有{C:attention}已打出{}的{C:dark_edition}隐藏牌型{}',
                    '等级设为',
                    '其{C:attention}打出次数'
                }
            },
            c_aij_mirth = {
                name = '欢笑',
                text = {
                    '添加一个{V:1}#2#',
                    '到{C:attention}#1#{}张选中的',
                    '手牌上'
                }
            },
        },
        Tag = {
            tag_aij_glimmer = {
                name = '微光标签',
                text = {
                    '下个商店的基础版本',
                    '小丑牌免费并',
                    '变为{C:aij_plasma}微光{}版本'
                }
            },
            tag_aij_silver = {
                name = '白银标签',
                text = {
                    '下个商店的基础版本',
                    '小丑牌免费并',
                    '变为{C:aij_silver}白银{}版本'
                }
            },
            tag_aij_stellar = {
                name = '星辰标签',
                text = {
                    '下个商店的基础版本',
                    '小丑牌免费并',
                    '变为{C:aij_stellar}星辰{}版本'
                }
            },
            tag_aij_aureate = {
                name = '鎏金标签',
                text = {
                    '下个商店的基础版本',
                    '小丑牌免费并',
                    '变为{C:money}鎏金{}版本'
                }
            },
            tag_aij_soulbound = {
                name = '灵魂绑定标签',
                text = {
                    '创建一张随机{C:attention}易腐{}',
                    '{C:legendary}传奇{}小丑牌',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_fortunate = {
                name = '幸运标签',
                text = {
                    '选择{C:attention}任意{}{C:tarot}塔罗{}',
                    '牌并创建',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_overstuffed = {
                name = '填满标签',
                text = {
                    "下个打开的{C:attention}补充包{}",
                    "包含{C:attention}双倍{}的选项数量",
                    "和可选择数量"
                }
            },
            tag_aij_chaos = {
                name = '混沌标签',
                text = {
                    "具有{C:red}随机{}效果"
                }
            },
            -- Gold Tags
            tag_aij_windfall = {
                name = '横财标签',
                text = {
                    "金钱{C:money}翻三倍"
                }
            },
            tag_aij_unusual = {
                name = '非凡标签',
                text = {
                    "商店出现一张免费的",
                    "数值{C:attention}翻倍{}的{C:uncommon}罕见小丑"
                }
            },
            tag_aij_recherche = {
                name = '考究标签',
                text = {
                    "商店出现一张免费的",
                    "数值{C:attention}翻倍{}的{C:rare}稀有小丑"
                }
            },
            tag_aij_hermetic = {
                name = '炼金标签',
                text = {
                    '选择一张{C:attention}非隐藏{}',
                    '{C:spectral}幻灵{}牌并创建',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_dark_matter = {
                name = '暗物质标签',
                text = {
                    '给予一张{C:attention}随机{}',
                    '无版本小丑{C:dark_edition}负片{}版本'
                }
            },
            tag_aij_crystal = {
                name = '水晶标签',
                text = {
                    '给予一张{C:attention}随机{}小丑',
                    '和{C:attention}#1#{}张无版本卡牌',
                    '{C:dark_edition}闪箔{}版本'
                }
            },
            tag_aij_iridescent = {
                name = '虹彩标签',
                text = {
                    '给予一张{C:attention}随机{}小丑',
                    '和{C:attention}#1#{}张无版本卡牌',
                    '{C:dark_edition}全息{}版本'
                }
            },
            tag_aij_omnichrome = {
                name = '全彩标签',
                text = {
                    '给予{C:attention}最右侧{}的基础版本',
                    '小丑{C:dark_edition}多彩{}版本'
                }
            },
            tag_aij_circumplanetary = {
                name = '环行星标签',
                text = {
                    '升级{C:attention}打出次数最多{}的',
                    '{C:attention}牌型{}',
                    '{C:attention}#1#级',
                    '{C:inactive}(当前为#2#)'
                }
            },
            tag_aij_velocity = {
                name = '极速标签',
                text = {
                    '给予 {C:money}$#1#{}，每{C:attention}回合',
                    '减少 {C:money}$#2#',
                    '{C:inactive}(将给予 {C:money}$#3#{C:inactive})'
                }
            },
            tag_aij_capital = {
                name = '资本标签',
                text = {
                    '击败Boss盲注后，',
                    '获得 {C:money}$#1#'
                }
            },
            tag_aij_bierstiefel = {
                name = '啤酒靴标签',
                text = {
                    '用随机{C:common}普通{}或',
                    '{C:uncommon}罕见{}小丑牌',
                    '填满所有{C:attention}小丑槽位{}'
                }
            },
            tag_aij_ticket = {
                name = '奖券标签',
                text = {
                    '{C:attention}兑换{}一张随机',
                    '优惠券及其',
                    '{C:attention}升级{}版本'
                }
            },
            tag_aij_galloping_domino = {
                name = '骨牌标签',
                text = {
                    '下个商店{C:attention}所有{}重掷',
                    '费用变为 {C:money}$#1#'
                }
            },
            tag_aij_gioco = {
                name = '游戏标签',
                text = {
                    '下回合手牌上限',
                    '{C:attention}翻倍{}'
                }
            },
            tag_aij_stereoscopic = {
                name = '立体标签',
                text = {
                    '给予下一个选择的{C:attention}标签{}',
                    '一个{C:money}黄金{}副本',
                    '{s:0.8,C:attention}双倍标签{s:0.8}除外',
                }
            },
            tag_aij_frugal = {
                name = '节俭标签',
                text = {
                    '下个商店{C:attention}所有{}卡牌',
                    '和补充包免费',
                }
            },
            tag_aij_dominus = {
                name = '支配标签',
                text = {
                    '选择{C:attention}任意Boss盲注{}',
                    '替换当前盲注'
                }
            },
            tag_aij_nonstandard = {
                name = '非标标签',
                text = {
                    '创建任意游戏牌的',
                    '{C:attention}2张复制品{}'
                }
            },
            tag_aij_ignoramus = {
                name = '愚者标签',
                text = {
                    '选择{C:attention}任意{}{C:common}普通',
                    '或{C:uncommon}罕见{}小丑',
                    '并创建',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_occult = {
                name = '玄秘标签',
                text = {
                    '创建{C:attention}3张{C:tarot}塔罗{}牌',
                    '和{C:attention}2张{C:spectral}幻灵{}牌', 
                    '{s:0.8}它们带有{s:0.8,C:dark_edition}负片{}版本',
                }
            },
            tag_aij_asteroid = {
                name = '小行星标签',
                text = {
                    '给予一个免费的',
                    '{C:planet}天体包{}，', 
                    '包含{C:dark_edition}黑洞{}、',
                    '{C:dark_edition}脉冲星{}和{C:dark_edition}引力星{}',
                }
            },
            tag_aij_polydactyly = {
                name = '多指标签',
                text = {
                    '本局游戏每有一次未使用',
                    '的{C:blue}出牌{}，下回合{C:blue}+1出牌{}', 
                    '{C:inactive}(将给予 {C:blue}+#1#{C:inactive} 出牌)',
                }
            },
            tag_aij_landfill = {
                name = '填埋标签',
                text = {
                    '本局游戏每{C:red}弃掉{}一张牌',
                    '给予 {C:money}$1{}', 
                    '{C:inactive}(将给予 {C:money}$#1#{C:inactive})',
                }
            },
            tag_aij_cinema = {
                name = '影院标签',
                text = {
                    '给予{C:attention}最左侧{}的基础',
                    '版本小丑{C:aij_silver}白银{}版本'
                }
            },
            tag_aij_ventripotent = {
                name = '暴食标签',
                text = {
                    "下个打开的{C:attention}补充包{}",
                    "包含{C:attention}双倍{}的选项数量",
                    "和{C:attention}无限{}选择次数"
                }
            },
            tag_aij_timelost = {
                name = '失落标签',
                text = {
                    '给予一个免费的{C:purple}笑语',
                    '{C:purple}猜谜包{}，包含',
                    '{C:attention}5{}个易腐选项',
                }
            },
            tag_aij_auspicious = {
                name = '吉祥标签',
                text = {
                    '创建一张{C:attention}你选择{}的',
                    '{C:tarot}塔罗{}牌的',
                    '{C:attention}3张{}{C:dark_edition}负片复制品'
                }
            },
            tag_aij_glamour = {
                name = '魅力标签',
                text = {
                    '给予{C:attention}2张随机{}无版本',
                    '小丑{C:aij_plasma}微光{}版本'
                }
            },
            tag_aij_superlunary = {
                name = '超月标签',
                text = {
                    '给予一张{C:attention}随机{}小丑',
                    '和{C:attention}#1#{}张无版本卡牌',
                    '{C:aij_stellar}星辰{}版本'
                }
            },
            tag_aij_gold_dust = {
                name = '金粉标签',
                text = {
                    '给予{C:attention}#1#{}张无版本',
                    '卡牌{C:money}鎏金{}版本'
                }
            },
            tag_aij_anarchy = {
                name = '无序标签',
                text = {
                    '具有{C:red}随机{}效果{C:red}！！！'
                }
            },
        },
        Tarot = {
            c_aij_magus = {
                name = '魔术师',
                text = {
                    "将{C:attention}#1#{}张选中的",
                    "卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sanctuary_gate = {
                name = '圣所之门',
                text = {
                    "将{C:attention}#1#{}张",
                    "选中的卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_isis_urania = {
                name = '伊西斯-乌拉尼亚',
                text = {
                    "将{C:attention}#1#{}张选中的",
                    "卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_cubic_stone = {
                name = '立方石',
                text = {
                    "将{C:attention}#1#{}张选中的",
                    "卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_master_arcanes = { 
                name = '奥秘大师',
                text = {
                    "{C:green}#1# / #2#{} 几率",
                    "创建一张随机",
                    "{C:spectral}幻灵{}牌",
                    '{C:inactive}(必须有空位)'
                }
            },
            c_aij_two_ways = {
                name = '双岔路',
                text = {
                    "将{C:attention}#1#{}张选中的卡牌",
                    "分裂为{C:attention}2{}张拥有",
                    "原始{C:attention}点数一半{}的复制品",
                    "{C:inactive}(奇数点数尽可能平均分配){}",
                    "{C:inactive}(A=14, K=13, Q=12, J=11)"
                }
            },
            c_aij_osiris = {
                name = '奥西里斯',
                text = {
                    "{C:red}摧毁{}{C:attention}1{}张选中的",
                    "小丑牌并赚取三倍",
                    "其{C:money}售价",
                    "{C:inactive}(当前为{}{C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_osiris_controller = {
                name = '奥西里斯',
                text = {
                    "{C:red}摧毁{}{C:attention}最右侧{}的",
                    "小丑牌并赚取三倍",
                    "其{C:money}售价",
                    "{C:inactive}(当前为{}{C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_balance_and_blade = {
                name = '衡与刃',
                text = {
                    "给{C:attention}#1#{}张选中的卡牌",
                    "打上随机花色{C:attention}补丁{}"
                }
            },
            c_aij_veiled_lamp = {
                name = '蒙纱之灯',
                text = {
                    "将{C:attention}#1#{}张选中的",
                    "卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sphinx = {
                name = '斯芬克斯',
                text = {
                    "将{C:attention}#1#{}张选中的",
                    "卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_tamed_lion = {
                name = '驯狮',
                text = {
                    "将{C:attention}#1#{}张选中的",
                    "卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_broken_fate = {
                name = '破碎命运',
                text = {
                    "将{C:attention}最左侧消耗牌{}的数值",
                    "在{C:attention}X0.75{}到{C:attention}X2.5{}之间",
                    "随机化"
                }
            },
        },
        Other = {
            -- Other
            aij_patches_suit = {
                name = "补丁",
                text = {
                    "已打上{V:1}#1#{C:attention}补丁"
                }
            },
            aij_jest_mark_of_the_spear = {
                name = "矛之印记",
                text = {
                    '此{C:attention}卡牌{}已被',
                    '{C:attention}矛{}',
                    '永久{C:red}削弱'
                }
            },
            card_extra_retriggers = {
                text={
                    "重新触发此卡牌{C:attention}#1#{}次",
                },
            },
            showdown_blind = {
                name = "决战盲注",
                text = {
                    "每{C:attention}8{}个底注",
                    "出现的{C:attention}Boss盲注{}",
                }
            },
            reroll_joker = {
                name = "重掷",
                text = {
                    '将小丑牌替换为',
                    '一张同稀有度的',
                    '随机小丑牌'
                }
            },
            office_assistant_perishable = {
                name = "易腐",
                text = {
                    '花费{C:money}$3{}',
                    '{C:attention}重置{}易腐小丑牌',
                    '的计数器'
                }
            },
            office_assistant_rental = {
                name = "租赁",
                text = {
                    '花费小丑牌的{C:money}基础价格',
                    '移除{C:attention}租赁{}',
                    '{C:attention}贴纸{}'
                }
            },
            overdesigned_club = {
                name = "梅花",
                text = {
                    "打出的{C:clubs}梅花{}",
                    "计分时给予{C:mult}+14{}倍率",
                }
            },
            overdesigned_spade = {
                name = "黑桃",
                text = {
                    "打出的{C:spades}黑桃{}",
                    "计分时给予{C:chips}+100{}筹码",
                }
            },
            overdesigned_diamond = {
                name = "方片",
                text = {
                    "打出的{C:diamonds}方片{}",
                    "计分时赚取{C:money}$2{}",
                }
            },
            overdesigned_heart = {
                name = "红桃",
                text = {
                    "打出的{C:hearts}红桃{}",
                    "计分时给予{X:mult,C:white}X1.5{}倍率",
                }
            },
            p_aij_guess_the_jest = {
                name = "笑语猜谜包",
                text = {
                    '从{C:attention}#2#{}张隐藏的',
                    '{C:legendary,E:2}传奇{}小丑牌中选择{C:attention}#1#{}张'
                }
            },
            m_aij_dyscalcular_numbered_rank = {
                name = "数字点数",
                text = {
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, {C:attention}5{}, {C:attention}6{},",
                    "{C:attention}7{}, {C:attention}8{}, {C:attention}9{}, 和 {C:attention}10{}",
                }
            },
            palindrome = {
                name = "回文数",
                text = {
                    "反转后{C:attention}保持不变{}的多位数",
                    "{C:inactive}例如: 33, 151, 3003{}"
                }
            },
            -- Stickers
            aij_marked = {
                name = "标记",
                text = {
                    '无法被{C:blue}打出',
                    '或{C:red}弃掉'
                }
            },
            -- (not a sticker but treated as such)
            aij_jest_chaotic_card = {
                name = "混沌",
                text = {
                    "{X:mult,C:white} X#1# {} 倍率",
                    "{C:edition}增强{}在",
                    "打出后{C:attention}随机化{}",
                }
            },
            -- Seals
            aij_smiley_seal = {
                name = "笑脸蜡封",
                text = {
                    '当被{C:red}摧毁{}时，给{C:attention}#1#{}张',
                    '随机{C:attention}小丑牌{}添加一个版本'
                }
            },
            aij_melted_seal = {
                name = "熔化蜡封",
                text = {
                    '当{C:attention}手持{}时，',
                    '{C:attention}变形{}为第一张',
                    '计分的非{V:1}熔化{C:attention}蜡封{}牌'
                }
            },
            nevernamed_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-绘制了所有的美术素材", 
                    "{s:0.8}-构思了约一半的效果设计",
                    "{s:0.8}-于2024年12月开始Balatro美术创作"
                    
                }
            },
            survivalaren_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-编写了约一半的内容代码", 
                    "{s:0.8}-构思了约一半的效果设计",
                    "{s:0.8}-最初发起此模组的人",
                    "{s:0.8}-于2025年4月初创建此模组"
                }
            },
            rattling_snow_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-编写了大部分高级功能代码",
                    "{s:0.8}-编写了几乎所有UI代码",
                    "{s:0.8}-编写了所有着色器(Shader)",
                    "{s:0.8}-于2025年4月下旬加入团队"
                }
            },
            jumbocarrot_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}-在Bug修复和润色方面提供了巨大帮助",
                    "{s:0.8}-主要测试人员",
                    "{s:0.8}-于2025年9月加入团队"
                }
            },
        }
    }
}
