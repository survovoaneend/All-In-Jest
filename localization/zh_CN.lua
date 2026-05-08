--ALOPHRINE的个人汉化修正！如遇到问题请联系我。QQ与B站同名
--vergenti Q群：奇小苦、:)，对部分汉化进行了修正，包括需要代码修改的丑
--我是第三批汉化的人，但我感觉没啥必要留名字。更新是因为当前汉化已经过时了，缺了大概50%的内容。
return {
    misc = {
        dictionary = {
            k_coder_badge = "程序员",
            k_artist_badge = "美术",
            k_moon = "卫星牌",
            k_moon_q = "卫星牌？",
            k_star = "恒星牌",
            k_tag = "标签",
            k_star_q = "恒星牌？",
            k_asteroid = "小行星牌",
            k_tarot_q = "塔罗牌？",
            k_active = "已激活",
            k_inactive = "未激活",
            aij_requires_restart = "需要重启",
            aij_doesnt_requires_restart = "无需重启",
            aij_upgraded_tags = "黄金标签",
            aij_enable_moons = "启用卫星牌",
            aij_enable_moons_tooltip = {
                '允许出现 {C:chips}筹码{} 和 {C:mult}倍率{} 类型的',
                '{C:planet}星球牌{}',
            },
            aij_alter_trypophobia = "和谐密集恐惧症",
            aij_alter_trypophobia_tooltip = {
                '{C:attention}更改{}小丑牌',
                '{C:attention}密集恐惧症{} 的贴图',
                '使其{C:attention}不那么令人不适{}'
            },
            aij_no_copy_neg = "允许复制负片游戏牌",
            aij_no_copy_neg_tooltip = {
                '允许复制 {C:attention}游戏牌{} 上的',
                '{C:dark_edition}负片{} 版本。',
                '处于 {C:attention}关闭{} 状态时（默认），被复制的',
                '{C:dark_edition}负片{} 卡牌会 {C:red}失去{} 其版本'
            },
            aij_blue_stake_rework = '蓝注重做',
            aij_blue_stake_rework_tooltip = {
                '{C:attention}更改{} 蓝注的难度效果：',
                '使用新的 {C:attention}深渊盲注{}，',
                '而不是 {C:red}-1{} 弃牌次数'
            },
            aij_lite = 'All in Jest 精简版',
            aij_lite_tooltip = {
                '仅启用精挑细选的、',
                '最 {C:attention}贴近原版{} 的内容',
                '{s:0.8,C:inactive}(目前包含 76 项内容)'
            },
            aij_red_destroy_text = "修改小丑牌描述",
            aij_red_destroy_text_tooltip = {
                '更改所有 {C:attention}原版{} 和',
                '{C:attention}模组{} 的卡牌描述，',
                '使“摧毁(destroy)”字样变为 {C:red}红色{}。',
                '{s:0.8,C:inactive}(这可能会对其他模组的',
                '{s:0.8,C:inactive}提示框造成负面影响)'
            },
            aij_random_deck_skins = '随机牌组皮肤',
            aij_random_deck_skins_tooltip = {
                '添加到牌组中的 {C:attention}游戏牌{}',
                '将拥有随机的 {C:attention}牌组皮肤{}'
            },
            aij_guess_names = '猜猜笑话名称',
            aij_guess_names_tooltip = {
                '{C:purple}笑语猜谜包{} 的无障碍选项，',
                '显示小丑牌的名称',
                '{s:0.8,C:inactive}(但不显示其具体描述)'
            },
            k_aij_guess_the_jest = "笑语猜谜",
            k_aij_memory_card = "已铭记！",
            aij_plus_tag = "标签+1",
            aij_refreshed = '已翻新',
            aij_paid_off = '已付清',
            k_aij_polychrome_ex = '幻彩！',
            k_aij_foiled_again = '又是闪箔！',
            k_aij_p_arcana = "秘仪+1",
            k_aij_merry_christmas = "圣诞快乐！",
            k_aij_change_ex = '变！',
            k_aij_blood_spilt_ex = '鲜血飞溅！',
            k_aij_double_ex = '双倍！',
            k_aij_triple_ex = '三倍！',
            k_aij_chaos_ex = '混沌！',
            k_aij_two_into_one_ex = '合二为一！',
            k_aij_plus_two_moons = "卫星牌+2",
            k_aij_does_not_score_ex = "不计分！",
            k_aij_create = "生成"
        },
        v_dictionary = {
            a_aij_exp_mult="^#1# 倍率",
            a_aij_mult_equal="=#1# 倍率",
            a_aij_ante_minus="-#1# 底注",
            a_aij_win_ante_plus="+#1# 胜利底注",
            a_aij_percent_balance = "+%#1#",
            a_aij_percent_balance_minus = "-%#1#",
            a_aij_hands_minus = "-#1# 出牌次数",
            a_aij_joker_slots = '+#1# 小丑牌槽位',
            a_aij_joker_slots_minus = '-#1# 小丑牌槽位',
            a_aij_odds = "+#1# 概率",
            a_aij_jokers = "+#1# 小丑牌",
        },
        challenge_names = {
            c_aij_bananarama = "香蕉狂热",
            c_aij_sharpest_tool = "最锋利的工具",
            c_aij_the_pit = "深渊",
        },
        v_text = {
            ch_c_aij_sharpest_tool_1 = {
                '只有 {C:common}普通{} 小丑牌会出现在',
            },
            ch_c_aij_sharpest_tool_2 = {
                '{C:attention}商店{} 或 {C:attention}小丑包{} 中'
            },
            ch_c_aij_all_pit_blinds = {
                '底注 1 之后所有的常规 Boss盲注 均变为 {C:attention}深渊盲注{}'
            },
        },
        extra_joker_dictionary = {
            k_aij_youve_got_mail = "你有新邮件！",
            k_aij_youve_got_mail_goodbye = "再见",
            k_aij_youve_got_mail_none = "毫无作用...",
            k_aij_youve_got_mail_plus_prefix = "+",
            k_aij_youve_got_mail_dollar_prefix = "$",
            k_aij_youve_got_mail_xmult_prefix = "X",
            k_aij_youve_got_mail_mult_text = " 倍率",
            k_aij_youve_got_mail_chip_text = " 筹码",
            k_aij_youve_got_mail_dollars_text = " 每次打出牌型",
            k_aij_overdesigned_give_prefix = "给予",
            k_aij_overdesigned_earn_prefix = "获得",
            k_aij_overdesigned_heart = "红桃",
            k_aij_overdesigned_club = "梅花",
            k_aij_overdesigned_spade = "黑桃",
            k_aij_overdesigned_diamond = "方块",
            k_aij_jerko_retrigger = "重新触发",
            k_aij_jerko_times = "次",
            k_aij_blacklist_empty = '无',
            k_aij_blacklist_and = '以及',
            k_aij_blacklist_more = '更多',
        },
        labels = {
            aij_glimmer = "微光",
            aij_silver = "白银",
            aij_stellar = "星辰",
            aij_aureate = "鎏金",
            aij_torn = "撕裂",
            aij_marked = "已标记",
            aij_unusual_doubled = "双倍",
            aij_recherche_doubled = "双倍",
            aij_smiley_seal = "笑脸蜡封",
            aij_melted_seal = "融化蜡封",
            aij_jest_chaotic_card = "混沌",
        },
        poker_hands = {
            ['aij_Royal Flush'] = "皇家同花顺",
        },
        poker_hand_descriptions = {
            ['aij_Royal Flush'] = {
                "5张连续点数的牌，",
                "且所有牌花色相同，",
                "最低点数为 10"
            },
        },
        tutorial = {
           k_aij_line1 =  {"嘿。"},
           k_aij_line2 =  {"你已经玩了", "有一阵子了，", "我在想..."},
           k_aij_line3 =  {"是不是该", "全押(All in)了？"},
        }
    },
    descriptions = {
        Back = {
            b_aij_fabled = {
                name = '传奇牌组',
                text = {
                    '{C:legendary,E:1}传奇{}小丑牌可能',
                    '出现在 {C:attention}商店{}',
                    '{C:attention}-1{} 小丑牌槽位'
                },
                unlock = {
                    '解锁一张',
                    '{C:legendary,E:1}传奇{} 小丑牌',
                }
            },
            b_aij_fabled_hidden = {
                name = '传奇牌组',
                text = {},
                unlock = {
                    '解锁一张 {C:legendary,E:1}传奇{}',
                    '小丑牌',
                }
            },
            b_aij_branching = {
                name = '分支牌组',
                text = {
                    '跳过盲注时',
                    '在 {C:attention}3{} 个标签中进行选择',
                },
                unlock = {
                    '在一次游戏中',
                    '至少跳过 {C:attention}5{} 次盲注',
                }
            },
            b_aij_branching_hidden = {
                name = '分支牌组',
                text = {},
                unlock = {
                    '在一次游戏中',
                    '至少跳过 {C:attention}5{} 次盲注',
                }
            },
            b_aij_patchwork = {
                name = '拼布牌组',
                text = {
                    '所有游戏牌在 {C:attention}出现时{}',
                    '都会带有一个 {C:attention}随机{} 花色补丁'
                },
                unlock = {
                    '同时拥有至少 {C:attention}13{}',
                    '张带有 {C:attention}花色补丁{} 的牌'
                }
            },
            b_aij_patchwork_hidden = {
                name = '拼布牌组',
                text = {},
                unlock = {
                    '同时拥有至少 {C:attention}13{}',
                    '张带有 {C:attention}花色补丁{} 的牌'
                }
            }
        },
        Stake = All_in_Jest and All_in_Jest.config and All_in_Jest.config.blue_stake_rework and {
            stake_blue = {
                name = "蓝注",
                text = {
                    '底注 {C:attention}4{} 或 {C:attention}5{} 的',
                    'Boss盲注变为深渊盲注',
                    '{s:0.8}包含此前所有难度注'
                }
            },
        } or {},
        Partner = {
            pnr_aij_simply = {
                name = "简单",
                text = {
                    "回合结束时获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)",
                },
                unlock={
                    "在 {C:attention}黄金注{} 难度下",
                    "携带 {C:attention}傻蛋西蒙{}",
                    "赢得一场游戏",
                },
            },
            pnr_aij_fourwarning = {
                name = "四重警告",
                text = {
                    "如果弃牌中包含 {C:attention}4{}",
                    "获得 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)",
                },
                unlock={
                    "在 {C:attention}黄金注{} 难度下",
                    "携带 {C:attention}惧四症{}",
                    "赢得一场游戏",
                },
            },
            pnr_aij_nellie = {
                name = "内莉",
                text = {
                    "{C:dark_edition}负片{} 小丑牌的出现几率",
                    "提高 {C:attention}#1#倍{}",
                },
                unlock={
                    "在 {C:attention}黄金注{} 难度下",
                    "携带 {C:attention}负面南希{}",
                    "赢得一场游戏",
                },
            },
            pnr_aij_scratch = {
                name = "抓痕",
                text = {
                    "在 {C:blue}奇数{} {C:attention}回合{}，",
                    "{C:attention}重新触发{}最左侧的",
                    "{C:attention}#1#{} 张最右侧小丑牌",
                },
                unlock={
                    "在 {C:attention}黄金注{} 难度下",
                    "携带 {C:attention}涂鸦{}",
                    "赢得一场游戏",
                },
            },
            pnr_aij_banger = {
                name = "爆竹",
                text = {
                    '{C:green}重掷{} 费用减少 {C:money}$#1#{}',
                    '{C:inactive}(不能低于 {C:money}$0{C:inactive}){}'
                },
                unlock={
                    "在 {C:attention}黄金注{} 难度下",
                    "携带 {C:attention}蠢蠢香肠{}",
                    "赢得一场游戏",
                },
            },
            pnr_aij_flub = {
                name = "失误",
                text = {
                    '{C:attention}永恒{} 小丑牌',
                    '变为 {C:money}#1#{}'
                },
                unlock={
                    "在 {C:attention}黄金注{} 难度下",
                    "携带 {C:attention}错误{}",
                    "赢得一场游戏",
                },
            },
        },
        Sleeve = {
            sleeve_aij_fabled = {
                name = "传奇卡套",
                text = {
                    '{C:legendary,E:1}传奇{} 小丑牌可能',
                    '出现在 {C:attention}商店{}',
                    '{C:attention}-1{} 小丑牌槽位'
                }
            },
            sleeve_aij_fabled_alt = {
                name = "传奇卡套",
                text = {
                    '{C:legendary,E:1}传奇{} 小丑牌',
                    '出现得更加 {C:attention}频繁{}'
                },
            },
            sleeve_aij_patchwork = {
                name = "拼布卡套",
                text = {
                    '所有游戏牌在 {C:attention}出现时{}',
                    '都会带有一个 {C:attention}随机{} 花色补丁'
                }
            },
            sleeve_aij_patchwork_alt = {
                name = "拼布卡套",
                text = {
                    '所有游戏牌在 {C:attention}出现时{}',
                    '都会带有 {C:attention}2个随机{} 花色补丁'
                },
            },
        },
        Blind = {
            --常规盲注
            bl_aij_the_beith = { name = "白桦", text = { '所有方块', '最后抽取' } },
            bl_aij_the_elm = { name = "榆树", text = { '所有梅花', '最后抽取' } },
            bl_aij_the_alder = { name = "桤木", text = { '所有红桃', '最后抽取' } },
            bl_aij_the_willow = { name = "柳树", text = { '所有黑桃', '最后抽取' } },
            bl_aij_the_branch = { name = "树枝", text = { '所有人头牌', '最后抽取' } },
            bl_aij_the_horror = { name = "恐惧", text = { '在回合的最后一手牌', "对随机小丑牌", "施加易腐" } },
            bl_aij_the_oak = { name = "橡树", text = { '削弱', '最右侧的小丑牌' } },
            bl_aij_the_ingot = { name = "铸锭", text = { '在回合的最后一手牌', '对所有小丑牌', '施加永恒' } },
            bl_aij_the_hazel = { name = "榛树", text = { "击败此盲注时", "对一张随机小丑牌", "施加租赁" } },
            bl_aij_the_apple = { name = "苹果", text = { '如果仅用一手牌', "就击败盲注，", "摧毁最左侧的小丑牌" } },
            bl_aij_the_neck = { name = "颈部", text = { '每次只能', '弃掉 1 张牌' } },
            bl_aij_the_groan = { name = "呻吟", text = { '每次打出牌型后', '要求分数增加 1X 基础分数' } },
            bl_aij_the_ash = { name = "白蜡树", text = { '完整牌组中', '每有一张低于 #1# 的牌', '要求分数增加 0.2X 基础分数' } },
            bl_aij_the_clay = { name = "黏土", text = { '随机的巨大盲注' } },
            bl_aij_the_aspen = { name = "白杨", text = { '本底注中每击败一个盲注', '要求分数增加 2X 基础分数' } },
            bl_aij_the_evergreen = { name = "常青树", text = { '完整牌组中', '每有一张高于 #1# 的牌', '要求分数增加 0.2X 基础分数' } },
            bl_aij_the_enigma = { name = "谜团", text = { '增强牌', '最后抽取' } },
            bl_aij_the_bullion = { name = "金块", text = { '每打出一张', '增强牌，失去 $5' } },
            bl_aij_the_elbow = { name = "手肘", text = { '打出的增强牌', '效果会被随机打乱' } },
            bl_aij_the_thorn = { name = "荆棘", text = { '削弱所有', '增强牌' } },
            bl_aij_the_twin = { name = "双子", text = { '增强牌抽取时', '牌面向下' } },
            bl_aij_the_giant = { name = "巨人", text = { '非常大的盲注', '出牌次数 +2' } },
            bl_aij_the_auroch = { name = "原牛", text = { '所有 #1# 和 #2#', '抽取时牌面向下' } },
            bl_aij_the_journey = { name = "旅程", text = { '本回合若有 #1# 花色', '的牌参与计分，', '胜利底注 +1' } },
            bl_aij_the_gift = { name = "礼物", text = { "金钱归零", "每打出或弃掉", "一张牌获得 $1" } },
            bl_aij_the_ancestor = { name = "祖先", text = { '本回合你弃掉过的', '牌型', '将无法打出' } },
            bl_aij_the_god = { name = "神明", text = { '所有打出的牌', '都必须参与计分' } },
            bl_aij_the_beast = { name = "野兽", text = { '击败此盲注时，', '摧毁所有食物类', '小丑牌' } },
            bl_aij_the_ulcer = { name = "溃疡", text = { "出牌次数 -1", "弃牌次数 -1" } },
            bl_aij_the_need = { name = "需求", text = { "必须拥有至少 $20", "打出的牌型", "才会计分" } },
            bl_aij_the_day = { name = "白昼", text = { '打出的手牌必须', '包含红桃或方块' } },
            bl_aij_the_celebration = { name = "庆典", text = { '本底注每保留一次未使用的', '出牌/弃牌次数，', '要求分数增加 0.2X 基础分数' } },
            bl_aij_the_storm = { name = "风暴", text = { '如果计分的牌型包含', '3张或更多牌，', "摧毁所有打出的牌" } },
            bl_aij_the_frost = { name = "冰霜", text = { '打出牌型后，', '随机摧毁一张', '留在手中的牌' } },
            bl_aij_the_yew = { name = "紫杉", text = { '所有奇数点数牌', '被削弱' } },
            bl_aij_the_hoard = { name = "囤积", text = { '选择此盲注时，', '本底注之前溢出的分数', '会加进此盲注要求中' } },
            bl_aij_the_pear = { name = "梨树", text = { '计分后，随机改变', '留在手中的牌的', '花色和点数' } },
            bl_aij_the_elk = { name = "麋鹿", text = { '无法打出本底注中', '之前已经', '打出过的牌型' } },
            bl_aij_the_birch = { name = "桦树", text = { '所有偶数点数牌', '被削弱' } },
            bl_aij_the_sun = { name = "太阳", text = { '黑桃和梅花', '抽取时', '牌面向下' } },
            bl_aij_the_spear = { name = "长矛", text = { '击败盲注的最后一手牌中，', '所有打出的牌', '被永久削弱' } },
            bl_aij_the_steed = { name = "骏马", text = { '打出牌型时，', '削弱所有', '留在手中的牌' } },
            bl_aij_the_figure = { name = "人像", text = { '打出的手牌不能包含', '3张或更多的人头牌' } },
            bl_aij_the_lake = { name = "湖泊", text = { '本底注中打出过的牌', '最后', '抽取' } },
            bl_aij_the_field = { name = "原野", text = { '所有牌被削弱，', '直到你弃掉', '#1# 张牌' } },
            bl_aij_the_wound = { name = "创伤", text = { '直到弃牌次数为 0，', '打出的牌型', '才会计分' } },
            bl_aij_the_brimstone = { name = "硫磺", text = { '每次弃牌，', '失去一半的', '金钱' } },
            bl_aij_the_blush = { name = "红晕", text = { '每次弃牌必须', '弃掉 5 张牌' } },
            --深渊盲注
            bl_aij_the_heart = { name = "心脏", text = { '必须先打出一手', '包含 #1# 的牌，', '之后的牌型才会计分' } },
            bl_aij_the_rains = { name = "降雨", text = { '如果打出的手牌击败了', '盲注，计分的牌', '将失去所有增强、版本和蜡封' } },
            bl_aij_the_child = { name = "孩童", text = { '所有计分牌的', '点数减 1' } },
            bl_aij_the_moon = { name = "月亮", text = { '奇数次打出的手牌中，', '所有牌均被削弱' } },
            bl_aij_the_shell = { name = "外壳", text = { '#2# 分之 #1# 的牌被削弱', '#4# 分之 #3# 的牌抽取时', '牌面向下' } },
            bl_aij_the_earth = { name = "大地", text = { '计分后，', '将留在手中的牌', '变为石头牌' } },
            bl_aij_the_dragon = { name = "巨龙", text = { '直到手牌为空，', '才能抽取', '任何牌' } },
            bl_aij_the_mountain = { name = "高山", text = { '非常大的盲注', '手牌上限 +1' } },
            bl_aij_the_conflagration = { name = "大火", text = { '如果打出的手牌击败了', '盲注，摧毁所有', '打出的牌和留在手中的牌' } },
            bl_aij_the_umbilical = { name = "脐带", text = { '每次出牌随机标记一张牌，', '被标记的牌无法', '被打出或弃掉' } },
            bl_aij_the_divine = { name = "神圣", text = { '打出的手牌必须', '包含一张增强牌' } },
            bl_aij_the_bird = { name = "飞鸟", text = { '计分前，随机打乱', '1张小丑牌的位置' } },
            bl_aij_the_arrow = { name = "箭矢", text = { '打出的手牌分数必须', '超过之前所有', '打出的手牌分数' } },
            bl_aij_the_brilliance = { name = "辉煌", text = { '必须满足', '目标分数两次', '出牌次数 +2' } },
            --决胜盲注
            bl_aij_obsidian_blade = { name = "黑曜石刃", text = { '出牌次数 -1', '弃牌次数 -1', '手牌上限 -1', '大盲注' } },
            bl_aij_aureate_coin = { name = "鎏金硬币", text = { '本底注每花费 $1，', '要求分数', '增加 0.1X 基础分数' } },
        },
        Enhanced = {
            m_aij_fervent = {
                name = "狂热牌",
                text = {
                    "计分时",
                    "提供 {C:chips}+#2#{} 筹码"
                }
            },
            m_aij_dyscalcular = {
                name = "失算牌",
                text = {
                    "视为所有 {C:attention}数字{} 点数",
                    "{C:inactive}(不用于组成牌型)"
                }
            },
            m_aij_charged = {
                name = "充能牌",
                text = {
                    "如果与此牌一同 {C:attention}打出{}",
                    "或在 {C:attention}手中持有{} 此牌，",
                    "{C:attention}增强{} 效果提升 {C:attention}+#1#%{}"
                }
            },
            m_aij_ice = {
                name = "冰冻牌",
                text = {
                    "{C:attention}必定{} 参与计分并",
                    "{C:red}无视{} 出牌数量上限",
                    "{C:inactive}多余的冰冻牌不会",
                    "{C:inactive}影响牌型判定"
                }
            },
            m_aij_wood = {
                name = "木头牌",
                text = {
                    "当留在手中时，提供 {C:chips}+#3#{} 筹码，",
                    "手中每额外持有一张 {C:attention}木头牌{}，",
                    "再提供 {C:chips}+#2#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)"
                }
            },
            m_aij_simulated = {
                name = "模拟牌",
                text = {
                    "每回合 {C:attention}第一次{} 打出时",
                    "{C:attention}返回{} 到手中"
                }
            },
            m_aij_canvas = {
                name = "画布牌",
                text = {
                    "{C:attention}复制{} {C:attention}右侧{} 卡牌的",
                    "点数和花色"
                }
            },
        },
        Voucher = {
            v_aij_fairy_dust ={
                name = "精灵粉尘",
                text = {
                    "{C:dark_edition}微光{}、{C:dark_edition}白银{} 和",
                    "{C:dark_edition}星辰{} 版本卡牌",
                    "出现的几率提升 {C:attention}#1#倍{}",
                },
            },
            v_aij_live_pixie ={
                name = "活体小妖精",
                text = {
                    "{C:dark_edition}微光{}、{C:dark_edition}白银{} 和",
                    "{C:dark_edition}星辰{} 版本卡牌",
                    "出现的几率提升 {C:attention}#1#倍{}",
                },
            },
            v_aij_gold_medal ={
                name = "金牌",
                text = {
                    "{C:money}黄金{} 标签出现的几率",
                    "提升 {C:attention}#1#倍{}",
                },
            },
            v_aij_trophy ={
                name = "奖杯",
                text = {
                    "跳过 {C:attention}大盲注{} 获得的",
                    "标签有 {C:green}#1# / #2#{}",
                    "的几率变为 {C:money}黄金{} 标签"
                },
            },
            v_aij_sticker_sheet ={
                name = "贴纸册",
                text = {
                    '{C:attention}减轻{} {C:red}负面',
                    '{C:attention}贴纸{} 的影响'
                },
            },
            v_aij_polkadot ={
                name = "波尔卡圆点",
                text = {
                    '{C:attention}减轻{} {C:red}负面',
                    '{C:attention}贴纸{} 的影响'
                },
            },
        },
        Edition = {
            e_aij_negative_playing_card = {
                name = "负片",
                text = {
                    "{C:dark_edition}+#1#{} 手牌上限",
                    "{C:inactive}(在复制时被移除)"
                },
            },
            e_aij_glimmer = {
                name = "微光",
                text = {
                    "{C:aij_plasma}平衡{} {C:attention}#1#%{} 的",
                    "{C:chips}筹码{} 和 {C:mult}倍率{}"
                }
            },
            e_aij_silver = {
                name = "白银",
                text = {
                    "效果变为 {C:attention}X#1#{}"
                }
            },
            e_aij_stellar = {
                name = "星辰",
                text = {
                    "打出的牌型每有1个 {C:attention}等级{}，",
                    "提供 {C:chips}+#1#{} 筹码和",
                    "{C:mult}+#2#{} 倍率"
                }
            },
            e_aij_aureate = {
                name = "鎏金",
                text = {
                    "提供 {X:money,C:white}X#1#{} {C:money}${}",
                    "{C:inactive}(最高 {C:money}$#2#{}{C:inactive})"
                }
            },
            e_aij_torn = {
                name = "撕裂",
                text = {
                    
                }
            },
        },
        Joker = {
            -- 致谢
            j_aij_nevernamed_credits_joker = {
                name = "Nevernamed",
                text = {
                    '{C:inactive}“此区域故意',
                    '{C:inactive}留白”',
                },
            },
            j_aij_survivalaren_credits_joker = {
                name = "Survivalaren",
                text = {
                    '{C:inactive}“随遇而安”'
                },
            },
            j_aij_rattling_snow_credits_joker = {
                name = "RattlingSnow353",
                text = {
                    '{C:inactive}“样样皆通，样样稀松，',
                    '{C:inactive}但通常比只精一门要好。”'
                },
            },
            j_aij_jumbocarrot_credits_joker = {
                name = "Jumbocarrot",
                text = {
                    '{C:inactive}“嗨，Alex”'
                },
            },
            j_aij_heavenbrand_credits_joker = {
                name = "HEAVENBRAND",
                text = {
                    '{C:inactive}“正如法国人所说，',
                    '{C:inactive}‘给我来两个。’”'
                },
            },
            -- 小丑牌
            j_aij_flying_ace = {
                name = "空中王牌",
                text = {
                    "本回合计分牌中，每有1张",
                    "不同 {C:attention}花色{} 的 {C:attention}A{}，",
                    "在回合结束时获得 {C:money}$#1#{} ",
                    "{C:inactive}(当前为 {C:money}$#2#{C:inactive})"
                },
            },
            j_aij_lucky_seven = {
                name = "幸运七",
                text = {
                    "将所有计分的未增强",
                    "{C:attention}7{} 变为",
                    "{C:attention}幸运牌{}"
                },
            },
            j_aij_you_broke_it = {
                name = "你搞砸了！",
                text = {
                    "将所有计分的未增强 {C:attention}#1#{}",
                    "变为 {C:attention}#2#{}",
                    "{s:0.8}点数和增强效果",
                    "{s:0.8}在回合结束时改变"
                },
            },
            j_aij_birthday_clown = {
                name = "生日小丑",
                text = {
                    "每个 {C:attention}底注{} 提供",
                    "{X:mult,C:white}X#1#{} 倍率，持续 {C:attention}1{} 个回合",
                    "{C:inactive}#2#"
                },
            },
            j_aij_memory_card = { 
                name = "记忆卡", 
                text = { 
                    "如果回合的第一手牌",
                    "正好是 {C:attention}1{} 张牌，",
                    "在未来的盲注中总是 {C:attention}最先{} {C:attention}抽到{} 它",
                    "{C:inactive}(只能存储一张牌)",
                    "{C:inactive}(仅在最左侧位置触发)" 
                } 
            },
            j_aij_sleepy_joker = { 
                name = "瞌睡小丑", 
                text = { 
                    "如果打出的牌型", 
                    "仅包含 {C:spades}黑桃{} 和 {C:clubs}梅花{}，",
                    "提供 {X:mult,C:white}X#1#{} 倍率"
                } 
            },
            j_aij_invisible_man = { 
                name = "隐形人", 
                text = { 
                    "所有 {C:attention}人头牌{} 均被视为",
                    "{C:attention}K{}、{C:attention}Q{} 和 {C:attention}J{}",
                    "{C:inactive}(不用于组成牌型)"
                } 
            },
            j_aij_handsome_joker = { 
                name = "帅气小丑", 
                text = { 
                    "{C:attention}完整牌组{} 中",
                    "每有一张 {C:attention}#2#{}，",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#3#{} {C:inactive}倍率)",
                } 
            },
            j_aij_whiteface_grotesque = { 
                name = "白面怪诞", 
                text = { 
                    "打出牌型时，{C:attention}留在手中{} 的",
                    "每张 {C:attention}人头牌{}，",
                    "使此小丑牌获得 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)"
                }
            },
            j_aij_the_clown_show = { 
                name = "小丑秀", 
                text = { 
                    "本次游戏中每购买过一张 {C:attention}小丑牌{}",
                    "提供 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)"
                } 
            },
            j_aij_little_devil = {
                name = "小恶魔",
                text = {
                    "当 {C:attention}跳过{} 盲注时，",
                    "生成一个 {C:attention}标准{}、{C:tarot}吊饰{}、",
                    "{C:planet}流星{}、{C:spectral}空灵{} 或",
                    "{C:red}小丑包 {C:attention}标签{}"
                },
            },
            j_aij_pierrot = { 
                name = "皮耶罗", 
                text = { 
                    "留在手中的 {C:attention}数字牌{}",
                    "会提供其 {C:chips}筹码{} 值" 
                } 
            },
            j_aij_hat_trick = { 
                name = "帽子戏法", 
                text = { 
                    "如果打出的牌型是 {C:attention}三条{}，",
                    "计分的牌会提供等同于",
                    "该牌型 {C:attention}等级{} 的 {C:mult}倍率{}",
                    "{C:inactive}(当前为 {C:mult}+#1#{} {C:inactive}倍率)",
                } 
            },
            j_aij_squeezy_pete = {
                name = "皮特捏捏",
                text = {
                    "每次 {C:attention}连续{} 打出",
                    "包含 {C:attention}葫芦{} 的牌型，",
                    "获得 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{} {C:inactive}倍率)",
                },
            },
            j_aij_infinite_jest = { 
                name = "无限玩笑", 
                text = { 
                    "当 {C:attention}Boss盲注{} 被击败时，",
                    "升级 {C:attention}所有牌型{}"
                } 
            },
            j_aij_bloody_mary = { name = "血腥玛丽", text = { "" } },
            j_aij_trypophobia = {
                name = "密集恐惧症",
                text = {
                    "如果计分的牌",
                    "仅包含 {C:attention}8{}，提供 {C:mult}+#1#{} 倍率",
                },
            },
            j_aij_rummikub = { name = "拉密牌", text = { "" } },
            j_aij_imperial_bower = { 
                name = "帝国花园", 
                text = { 
                    "每回合 {C:attention}最先抽到{} 的牌",
                    "被视为 {C:attention}任意{} 点数和花色",
                    "{C:inactive}(点数不用于组成牌型)"
                } 
            },
            j_aij_ultrasound = {
                name = "超声波",
                text = {
                    "选择 {C:attention}补充包{} 时，",
                    "展示其中的一项内容"
                }
            },
            j_aij_negative_nancy = {
                name = "负面南希",
                text = {
                    "{C:dark_edition}负片{} 小丑牌在 {C:attention}商店{} 中",
                    "出现的几率提高 {C:attention}#1#倍{}"
                },
            },
            j_aij_old_joker = { 
                name = "老小丑", 
                text = { 
                    "当 {C:attention}Boss盲注{} 被击败时，",
                    "此小丑牌获得 {C:chips}+#2#{} 筹码",
                    "和 {C:mult}+#4#{} 倍率",
                    "{C:inactive,s:0.8}(当前为 {C:chips,s:0.8}+#1#{C:inactive,s:0.8} 筹码，{C:mult,s:0.8}+#3#{C:inactive,s:0.8} 倍率)",
                    "{C:inactive,s:0.8}(始终为永恒)"
                } 
            },
            j_aij_imageboard = { 
                name = "图贴版", 
                text = { 
                    "每张 {C:attention}计分{} 牌的 {C:attention}点数{}",
                    "在此次出牌中每 {C:attention}计分{} 一次，",
                    "该牌提供 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(例：{C:attention}2 2 2{C:inactive} -> {C:mult}+#1#{C:inactive}, {C:mult}+#2#{C:inactive}, {C:mult}+#3#{C:inactive})"
                } 
            },
            j_aij_carousel = { 
                name = "旋转木马", 
                text = { 
                    "计分后，{C:attention}轮换{}",
                    "{C:attention}计分牌{} 的花色",
                    "{C:inactive,s:0.8}(黑桃 -> 红桃 -> 梅花 -> 方块)"
                } 
            },
            j_aij_slippery_when_wet = { name = "湿滑警告", text = { "" } },
            j_aij_founding_father = { 
                name = "开国元勋", 
                text = { 
                    "{C:attention}充能牌{} 的",
                    "效果 {C:attention}翻倍{}"
                } 
            },
            j_aij_scary_story = {
                name = "恐怖故事",
                text = {
                    "{C:attention}标准包{} 中的基础版本",
                    "游戏牌有 {C:green}#1# / #2#{} 的几率",
                    "变为 {C:dark_edition}负片{}"
                },
            },
            j_aij_doodle = {
                name = "涂鸦",
                text = {
                    "每 {C:attention}回合{} 开始时，有 {C:green}#1# / #2#{}",
                    "的几率在 {C:attention}回合{} 剩余时间内",
                    "复制 {C:attention}两侧相邻{} 的小丑牌",
                    "{C:inactive}#3#"
                },
            },
            j_aij_joqr = { name = "小丑牌（音译）", text = { "" } },
            j_aij_greasepaint = { 
                name = "油彩", 
                text = {
                    {
                        "{C:red}削弱{} 相邻的 {C:attention}小丑牌{}"
                    },
                    {
                        "被削弱的 {C:attention}小丑牌{} 和",
                        "{C:attention}游戏牌{} 提供 {X:mult,C:white}X#1#{} 倍率"
                    }  
                } 
            },
            j_aij_public_bathroom = {
                name = "公共厕所",
                text = {
                    "在 {C:attention}同花{} 牌型中每计分一张 {C:attention}2{}，",
                    "此小丑牌获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                },
            },
            j_aij_diogenes = { name = "第欧根尼", text = { "" } },
            j_aij_blank_card = {
                name = "空白牌",
                text = {
                    "每当从 {C:attention}标准包{} 中",
                    "选择一张 {C:attention}游戏牌{} 时，",
                    "生成一张完全相同的 {C:attention}复制品{}"
                },
            },
            j_aij_comedians_manifesto = { 
                name = "小丑宣言", 
                text = { 
                    "{C:attention}标准包{} 中的",
                    "{C:attention}K{} 和 {C:attention}Q{}",
                    "变为 {C:attention}J{}" 
                } 
            },
            j_aij_circuit_board = { name = "电路板", text = { "" } },
            j_aij_platinum_chip = { name = "白金筹码", text = { "" } },
            j_aij_cctv = { 
                name = "闭路电视", 
                text = { 
                    "当 {C:attention}玻璃牌{} {C:attention}碎裂{} 时，",
                    "获得 {C:money}$#1#{}，并将一张",
                    "留在手中的随机牌",
                    "增强为 {C:attention}玻璃牌{}"
                } 
            },
            j_aij_pell_mel = { 
                name = "杂乱无章", 
                text = { 
                    "提供 {X:mult,C:white}X1{} 倍率，{C:attention}打出牌型{} 中",
                    "每有一种 {C:attention}不同{} 的花色，",
                    "再增加 {X:mult,C:white}X#1#{} 倍率"
                } 
            },
            j_aij_pput_together = { name = "拼凑", text = { "" } },
            j_aij_krampus = {
                name = "坎卜斯",
                text = {
                    {
                        "计分的 {C:attention}黄金牌{}",
                        "变为 {C:attention}石头牌{}",
                    },
                    {
                        "{C:attention}石头牌{} 计分时",
                        "获得 {C:money}$#1#{}"
                    }
                },
            },
            j_aij_art_of_the_deal = { 
                name = "交易的艺术", 
                text = { 
                    "获得 {C:money}金钱{} 时，",
                    "增加 {C:mult}+#2#{} 倍率。",
                    "如果你持有的金钱为 {C:money}$#3#{} 或更少，",
                    "则倍率重置。",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)"
                } 
            },
            j_aij_word_art = { 
                name = "艺术字", 
                text = { 
                    "提供 {X:mult,C:white}X1{} 倍率，打出的牌型中",
                    "每包含一张 {C:attention}A{}、{C:attention}K{}、{C:attention}Q{} 或 {C:attention}J{}，",
                    "再增加 {X:mult,C:white}X#1#{} 倍率"
                } 
            },
            j_aij_atom = {
                name = "原子",
                text = {
                    "如果打出的牌型是",
                    "单张 {C:attention}A{}，",
                    "提升 {C:attention}高牌{} 的等级"
                },
            },
            j_aij_plain_jane = {
                name = "朴素婕恩",
                text = {
                    "计分的 {C:attention}未增强{} 卡牌",
                    "提供 {C:mult}+#1#{} 倍率"
                },
            },
            j_aij_paper_bag = { 
                name = "纸袋", 
                text = { 
                    "每个 {C:red}弃掉{} 的牌型，",
                    "其每有1个 {C:attention}等级{}，",
                    "此小丑牌获得 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)" 
                } 
            },
            j_aij_fruity_joker = { 
                name = "水果小丑", 
                text = { 
                    "{C:attention}幻彩{} 游戏牌和小丑牌",
                    "提供 {C:mult}+#1#{} 倍率",
                } 
            },
            j_aij_jokia = { name = "小丑诺基亚", text = { "" } },
            j_aij_the_mycologists = {
                name = "真菌学家",
                text = {
                    "如果打出的牌型正好是 {C:attention}#1#{}，",
                    "{C:red}摧毁{} 右侧的牌，并将其",
                    "{C:chips}筹码{}、{C:dark_edition}增强{} 和 {C:dark_edition}版本{}",
                    "赋予左侧的牌"
                }
            },
            j_aij_cool_joker = { 
                name = "酷小丑", 
                text = { 
                    "{B:1,C:white,s:0.8}主动能力",
                    "在它 {C:attention}正常{} 计分时",
                    "{V:1}激活{} 此 {C:attention}小丑牌{}，",
                    "提供 {X:mult,C:white}X#1#{} 倍率" 
                } 
            },
            j_aij_square_eyes = { 
                name = "方眼", 
                text = {
                    "打出的牌型中每包含一张 {C:attention}4{}，",
                    "计分的 {C:attention}4{} 提供 {C:mult}+#1#{} 倍率"
                } 
            },
            j_aij_punk_joker = {
                name = "朋克小丑",
                text = {
                    "如果牌型中有一张",
                    "{C:attention}万能牌{} 参与计分，将一张",
                    "随机未增强的计分牌",
                    "变为 {C:attention}万能牌{}"
                },
            },
            j_aij_slim_joker = { 
                name = "苗条小丑", 
                text = { 
                    "提供 {C:mult}+#1#{} 倍率，",
                    "打出的牌型中每包含一张牌，",
                    "提供 {C:mult}-#2#{} 倍率"
                } 
            },
            j_aij_wireframe = { 
                name = "线框", 
                text = { 
                    "每回合 {C:attention}第一次{} 打出的手牌",
                    "会 {C:attention}返回{} 到你的 {C:attention}手中{}"
                } 
            },
            j_aij_soviet = { 
                name = "苏维埃", 
                text = { 
                    "如果 {C:attention}打出的牌型{}",
                    "不包含 {C:attention}K{} 或 {C:attention}Q{}，",
                    "提供 {C:mult}+#1#{} 倍率"
                } 
            },
            j_aij_mustachio = { name = "小胡子", text = { "" } },
            j_aij_penny = {
                name = "便士",
                text = {
                    "带有 {C:money}金色蜡封{} 的牌有",
                    "{C:green}#1# / #2#{} 的几率 {C:attention}重新触发{}"
                },
            },
            j_aij_doctors_note = { 
                name = "医生证明", 
                text = { 
                    "所有 {C:attention}数字{} 点数的 {C:hearts}红桃{} 牌",
                    "均视为 {C:attention}相同点数{}",
                    "{C:inactive}(不用于组成牌型)"
                } 
            },
            j_aij_silly_sausage = { 
                name = "傻香肠", 
                text = { 
                    "{C:green}重掷{} 费用减少 {C:money}$#1#{}",
                    "在回合结束时，减费效果",
                    "{C:attention}降低{} {C:money}$#2#{}"
                } 
            },
            j_aij_joker_baby = { name = "小丑宝宝", text = { "" } },
            j_aij_anchor = { 
                name = "船锚", 
                text = { 
                    "此小丑牌及其",
                    "相邻的小丑牌 {C:attention}无法{}",
                    "{C:attention}被 {C:red}摧毁{}" 
                } 
            },
            j_aij_hei_tiki = { 
                name = "提基护身符", 
                text = { 
                    "如果打出的牌型最终",
                    "{C:chips}筹码{} 超过 {C:mult}倍率{}，",
                    "此 {C:attention}小丑牌{} 获得 {X:mult,C:white}X#2#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率)"
                } 
            },
            j_aij_polybius = { 
                name = "波利比斯", 
                text = { 
                    "提供打出牌型中",
                    "{C:attention}包含{} 的所有牌型的",
                    "{C:mult}倍率{} 和 {C:chips}筹码{}"
                } 
            },
            j_aij_joker_sighting = { name = "目击小丑", text = { "" } },
            j_aij_pencil_drawing = { 
                name = { "铅笔画" },
                text = { 
                    "{B:1,C:white,s:0.8}主动能力",
                    "支付 {C:money}$#1#{}，将一张 {C:attention}随机{}",
                    "{C:attention}游戏牌{} 加入手牌"
                } 
            },
            j_aij_holy_bible = { name = "圣经", text = { "" } },
            j_aij_great_white_north = { name = "大白北", text = { "" } },
            j_aij_right_angle = { 
                name = "直角", 
                text = { 
                    "当一张 {C:attention}9{} 计分时，",
                    "留在手中的所有 {C:attention}10{} 参与计分"
                } 
            },
            j_aij_adoring_joker = {
                name = "崇拜小丑",
                text = {
                    "在 {C:attention}小丑牌{} 触发 {C:attention}之后{}，",
                    "将 {C:mult}倍率{} 设置为本 {C:attention}底注{}",
                    "达到过的 {C:attention}最高{} {C:mult}倍率{}",
                    "{C:inactive}(当前为 {C:mult}#1# {C:inactive}倍率)"
                } 
            },
            j_aij_lucignolo = {
                name = "小灯芯",
                text = {
                    "当任何游戏牌被 {C:attention}摧毁{} 时",
                    "获得 {C:money}$#1#{}"
                },
            },
            j_aij_scorecard = { 
                name = "计分卡", 
                text = { 
                    "选择 {C:attention}盲注{} 时，",
                    "提升一个 {C:attention}随机{}",
                    "{C:attention}牌型{} {C:attention}#1#{} 个等级"
                } 
            },
            j_aij_punch_and_judy = { 
                name = "潘趣与朱迪", 
                text = { 
                    {
                        "如果 {C:attention}打出的牌型{} 恰好包含",
                        "{C:attention}一张 K{} 和 {C:attention}一张 Q{}，",
                        "重新触发所有计分牌"
                    },
                    {
                        "{C:attention}K{} 和 {C:attention}Q{}",
                        "总是参与计分"
                    }
                } 
            },
            j_aij_nature_tapes = { 
                name = "自然录音带", 
                text = { 
                    "使用 {C:mult}倍率{} 类型的 {C:planet}星球{} 牌时，",
                    "此小丑牌获得 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2# {C:inactive}倍率)",
                } 
            },
            j_aij_low_priest = { 
                name = "低级牧师", 
                text = { 
                    "提供 {X:mult,C:white}X#1#{} 倍率，",
                    "打出的牌型每有1个 {C:attention}等级{}，",
                    "提供 {X:mult,C:white}-X#2#{} 倍率"
                } 
            },
            j_aij_oil_and_water = { name = "水火不容", text = { "" } },
            j_aij_big_ears = { name = "大耳朵", text = { "" } },
            j_aij_causal_absent_paranoia = { name = "因果缺失妄想", text = { "" } },
            j_aij_hand_drawn = { 
                name = "手绘", 
                text = { 
                    "在回合 {C:attention}开始{} 时，",
                    "不断抽牌，",
                    "直到你的手牌 {C:attention}包含{}",
                    "你最常打出的 {C:attention}牌型{}" 
                }
            },
            j_aij_haruspex = { 
                name = "占卜师", 
                text = { 
                    "{B:1,C:white,s:0.8}主动能力",
                    "消耗 {C:attention}#1#{} 次 {C:red}弃牌{}，从你的",
                    "{C:attention}牌组{} 中选择 {C:attention}#2#{} 张牌",
                    "{C:attention}抽取{} 到手中"
                } 
            },
            j_aij_bobblehead = { name = "摇头娃娃", text = { "" } },
            j_aij_topsy_the_clown = { 
                name = "颠倒小丑", 
                text = { 
                    "将 {C:chips}筹码{} 和 {C:mult}倍率{}",
                    "向上取整至最接近的",
                    "{C:attention}回文数{}" 
                } 
            },
            j_aij_cloudwatching = { name = "看云", text = { "" } },
            j_aij_line_in_the_sand = {
                name = "沙中线",
                text = {
                    "{C:attention}弃掉{} 的牌直到本底注结束",
                    "才会返回 {C:attention}牌组{}"
                }
            },
            j_aij_hairy_joker = { name = "毛茸小丑", text = { "" } },
            j_aij_realty_sign = {
                name = "房产招牌",
                text = {
                    "打出 {C:attention}葫芦{} 会使",
                    "此小丑牌的 {C:money}出售价值{}",
                    "增加 {C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = { 
                name = "坏苹果", 
                text = { 
                    "如果 {C:attention}计分手牌{} 包含",
                    "{C:attention}#4#{} 张 {C:spades}深色{} 花色和 {C:attention}#3#{} 张 {C:hearts}浅色{} 花色，",
                    "此小丑牌获得 {X:mult,C:white}X#2#{} 倍率",
                    "{C:inactive,s:0.8}(比例在回合结束时改变)",
                    "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率)"
                } 
            },
            j_aij_dim_bulb = {
                name = "暗淡灯泡",
                text = {
                    "如果你没有",
                    "{C:uncommon}罕见{} 或 {C:red}稀有{} {C:attention}小丑牌{}，",
                    "提供 {X:mult,C:white}X#1#{} 倍率"
                },
            },
            j_aij_blood_artist = { 
                name = "鲜血艺术家", 
                text = { 
                    "当任何小丑牌或游戏牌",
                    "被 {C:money}出售{} 或 {C:attention}摧毁{} 时，",
                    "将当前 {C:attention}盲注{} 的",
                    "分数要求降低 {C:attention}#1#%"
                } 
            },
            j_aij_null_joker = {
                name = "空值小丑",
                text = {
                    "将所有 {C:green}概率{}",
                    "设置为 {C:attention}零{}"
                },
            },
            j_aij_magick_joker = {
                name = "魔法小丑",
                text = {
                    "打出的 {V:1}#1#{} 牌",
                    "将其 {C:chips}+筹码{} 作为 {C:mult}+倍率{} 提供",
                    "{C:inactive,s:0.8}(花色在回合结束时改变){}"
                }
            },
            j_aij_jeff_the_joker = {
                name = "小丑杰夫",
                text = {
                    '选择 {C:attention}小盲注{} 时，',
                    '{C:red}摧毁{} 所有其他小丑牌，每摧毁一张，',
                    '此小丑牌获得 {X:mult,C:white}X#2#{} 倍率',
                    '{C:inactive}(当前为 {X:mult,C:white}X#1#{C:inactive})'
                },
            },
            j_aij_zanni = { 
                name = "扎尼", 
                text = { 
                    "{C:attention}数字牌{} {C:attention}计分{} 时，",
                    "有 {C:green}#1# / #2#{} 的几率",
                    "生成一张 {C:tarot}塔罗牌{}"
                } 
            },
            j_aij_furbo_e_stupido = { 
                name = "黠与愚", 
                text = { 
                    "{C:attention}失算牌{} 同时",
                    "也被视为 {C:attention}A{} 和 {C:attention}J{}" 
                } 
            },
            j_aij_read_em_and_weep = {
                name = "看牌哭泣", 
                text = { 
                    "如果牌型包含 {C:attention}顺子{}，",
                    "在计分前将所有 {C:attention}打出{} 的牌",
                    "转换为相同的随机 {C:attention}花色{}"
                } 
            },
            j_aij_goblin_joker = { 
                name = "哥布林小丑", 
                text = { 
                    "{C:red}弃牌{} 后，额外",
                    "抽取 {C:attention}#1#{} 张牌" 
                } 
            },
            j_aij_string_theory = { 
                name = "弦理论", 
                text = { 
                    "打出的牌型总是被视为",
                    "包含一个 {C:attention}顺子{}" 
                } 
            },
            j_aij_jesters_privelege = {
                name = "弄臣特权",
                text = {
                    "{C:legendary}传奇{} 小丑牌可能",
                    "出现在 {C:attention}商店{} 中",
                },
            },
            j_aij_privelege_fabled = {
                name = "弄臣特权",
                text = {
                    "{C:legendary}传奇{} 小丑牌",
                    "出现得 {C:attention}更频繁{}",
                },
            },
            j_aij_quark = {
                name = "夸克",
                text = {
                    '如果计分的牌型正好是 {C:attention}三张{}',
                    '{C:attention}点数相同{} 但',
                    '{C:attention}花色不同{} 的牌，',
                    '提升 {C:attention}三条{} 的等级'
                },
            },
            j_aij_lucky_carder = { name = "幸运牌手", text = { "" } },
            j_aij_silver_screen = { 
                name = "银幕", 
                text = { 
                    "当一张 {C:attention}人头牌{} 被",
                    "{C:red}摧毁{} 时，为 {C:attention}手中{} 的",
                    "一张随机牌添加 {C:aij_silver}白银{} 版本" 
                } 
            },
            j_aij_pedrolino = { 
                name = "佩德罗利诺", 
                text = { 
                    "{C:money}出售{} 此牌以将",
                    "当前 {C:attention}盲注{} 的",
                    "{C:attention}分数要求{} 降低 {C:attention}#1#%"
                } 
            },
            j_aij_pierrette = { 
                name = "皮耶雷特", 
                text = { 
                    "重新触发所有 {C:attention}卡牌",
                    "{C:attention}弃牌{} 效果" 
                } 
            },
            j_aij_scaramouche = { 
                name = "斯卡拉穆什", 
                text = { 
                    "如果 {C:attention}打出的牌型{} 是",
                    "{C:attention}#1#{}，",
                    "{C:attention}重新触发{} 所有计分牌",
                    "{C:inactive}(牌型在回合结束时改变){}"
                } 
            },
            j_aij_clay_joker = { 
                name = "黏土小丑", 
                text = { 
                    "复制最后被",
                    "{C:red}摧毁{} 的小丑牌的效果" 
                } 
            },
            j_aij_sunny_joker = { 
                name = "阳光小丑", 
                text = { 
                    "如果打出的牌型 {C:attention}包含{}",
                    "{C:attention}皇家同花顺{}，所有计分牌",
                    "获得 {X:mult,C:white}X#1#{} 倍率" 
                } 
            },
            j_aij_red_wine = { name = "红酒", text = { "" } },
            j_aij_mute_joker = { 
                name = "静音小丑", 
                text = { 
                    "本回合，打出的前 {C:attention}#1#{} 手牌",
                    "会 {C:red}摧毁{} 所有计分牌",
                    "{C:inactive}(牌型在回合结束时改变)"
                } 
            },
            j_aij_scapino = { 
                name = "斯卡皮诺", 
                text = { 
                    "在 {C:money}商店{} 中 {C:green}重掷{} 需要花费",
                    "{C:money}+$#1#{}，但同时会重新进货",
                    "{C:attention}补充包{}" 
                } 
            },
            j_aij_pinhead = {
                name = "针头",
                text = {
                    "如果在 {C:attention}一手牌{} 内击败了",
                    "{C:attention}盲注{}，获得 {C:money}$#1#{}"
                },
            },
            j_aij_saltimbanco = { 
                name = "杂技演员", 
                text = { 
                    "计分时，",
                    "成功的 {C:green}概率{} 效果",
                    "提供 {X:mult,C:white}X倍率{}，数值为 {X:mult,C:white}X1{}",
                    "加上其 {C:red}失败{} 几率",
                    "{C:inactive}(例：{C:green}1 / 4{} {C:inactive} -> {X:mult,C:white}X1.75{C:inactive})"
                } 
            },
            j_aij_pulcinella = { name = "普钦内拉", text = { "" } },
            j_aij_petrushka = {
                name = "彼得鲁什卡",
                text = {
                    "提供 {C:mult}+倍率{}，等同于",
                    "所有 {C:attention}计分牌{} 的",
                    "总 {C:attention}点数{}",
                    "{C:inactive,s:0.8}(A=14, K=13, Q=12, J=11)"
                },
            },
            j_aij_void = { 
                name = "虚空", 
                text = { 
                    "如果本 {C:attention}底注{} 内未使用过",
                    "{C:planet}星球{} 牌，提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_kasperle = { 
                name = "卡斯珀尔", 
                text = { 
                    "如果本 {C:attention}底注{} 内购买过",
                    "{C:attention}优惠券{}，",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}#2#"
                } 
            },
            j_aij_tumbler = { name = "翻滚者", text = { "" } },
            j_aij_plain_packaging = { name = "朴素包装", text = { "" } },
            j_aij_mixel_perfect = {
                name = "完美混合",
                text = {
                    "如果 {C:attention}计分牌型{} 包含",
                    "{C:attention}奇数{} 张牌，",
                    "提供 {C:mult}+#1#{} 倍率"
                },
            },
            j_aij_columbina = { 
                name = "科伦比娜",
                text = {
                    "{C:aij_plasma}平衡{} {C:chips}筹码{} 和 {C:mult}倍率{} 的 {C:attention}#1#%{}，",
                    "当使用 {C:spectral}幻灵{} 牌时，",
                    "该比例增加 {C:attention}#2#%{}"
                }
            },
            j_aij_j_file = { 
                name = "J文件", 
                text = { 
                    "在 {C:attention}回合{} 开始时，",
                    "从你的 {C:attention}牌组{} 中搜寻 {C:attention}#1#{} 张牌",
                    "加入手牌" 
                } 
            },
            j_aij_bumper_sticker = { 
                name = "保险杠贴纸", 
                text = { 
                    "打出的 {C:attention}卡牌{}",
                    "计分时永久获得",
                    "{C:mult}+#1#{} 倍率"
                } 
            },
            j_aij_vesti_la_guibba = { name = "穿上戏服", text = { "" } },
            j_aij_dead_president = {
                name = "已故总统",
                text = {
                    "出售此 {C:attention}小丑牌{} 时，",
                    "相邻 {C:attention}小丑牌{} 的 {C:money}出售价值{}",
                    "{C:attention}翻倍{}",
                    "{C:inactive}(最高 {C:money}$#1#{}{C:inactive})"
                },
            },
            j_aij_second_tier_meme = { name = "二流模因", text = { "" } },
            j_aij_teeny_joker = {
                name = "微小小丑",
                text = {
                    "如果打出的牌型",
                    "仅包含 {C:attention}2{}，提供 {C:chips}+#1#{} 筹码",
                },
            },
            j_aij_clowns_on_parade = {
                name = "游行小丑",
                text = {
                    "如果打出的牌型中",
                    "包含至少三张 {C:attention}2{}，",
                    "此 {C:attention}小丑牌{} 获得 {C:chips}+#2#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#1#{} {C:inactive}筹码){}"
                },
            },
            j_aij_rising_sun = { 
                name = "旭日", 
                text = { 
                    "在回合的 {C:attention}第一手{} 和",
                    "{C:attention}最后一手{} 牌中，重新触发",
                    "{C:attention}第一张{} 和 {C:attention}最后一张{} 计分牌",
                }
             },
            j_aij_red_sky = {
                name = "红天",
                text = {
                    "回合的 {C:attention}第一手{} 和",
                    "{C:attention}最后一手{} 牌中的计分牌，",
                    "将其 {C:chips}+筹码{} 作为 {C:mult}+倍率{} 提供"
                }
            },
            j_aij_blind_drawn = {
                name = "盲抽",
                text = {
                    "{X:mult,C:white}X#1#{} 倍率",
                    "在选择前无法看到 {C:attention}Boss盲注{}",
                    "或其效果",
                }
            },
            j_aij_mp_blind_drawn = {
                name = "盲抽",
                text = {
                    "{X:mult,C:white}X#1#{} 倍率",
                    "在 {C:attention}PvP盲注{} 期间，无法看到",
                    "你的 {X:purple,C:white}宿敌{} 的分数或",
                    "剩余出牌次数",
                }
            },
            j_aij_heidelberg_tun = {
                name = "海德堡大酒桶",
                text = {
                    "每个商店中购买的第一个 {C:attention}消耗牌{}",
                    "会获得 {C:dark_edition}负片{} 版本",
                    "{C:inactive}#1#"
                },
            },
            j_aij_open_mind = {
                name = "开放思维",
                text = {
                    "{C:attention}商店{} 中额外提供",
                    "{C:attention}+#1#{} 个 {C:attention}补充包{}",
                    "可供购买"
                },
            },
            j_aij_little_boy_blue = { 
                name = "小蓝孩", 
                text = { 
                    "{C:chips}+#1#{} 筹码",
                    "只会出现 {C:chips}筹码{} 类小丑牌"
                } 
            },
            j_aij_big_red = { 
                name = "大红", 
                text = { 
                    "{C:mult}+#1#{} 倍率",
                    "只会出现 {C:mult}倍率{} 类小丑牌" 
                } 
            },
            j_aij_party_streamers = {
                name = "派对彩带",
                text = {
                    "如果回合的 {C:attention}第一手牌{}",
                    "正好是 {C:attention}1{} 张没有 {C:attention}蜡封{} 的牌，",
                    "它会获得一个 {C:red}红色{}、{C:blue}蓝色{} 或",
                    "{C:money}金色{} 的 {C:attention}蜡封{}"
                },
            },
            j_aij_kilroy = { 
                name = "基尔罗伊", 
                text = { 
                    "当 {C:money}出售{} 时，",
                    "{C:attention}翻倍{} 此小丑牌的 {C:chips}筹码{} 值",
                    "{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)",
                } 
            },
            j_aij_janus = { 
                name = "雅努斯", 
                text = { 
                    "{C:attention}人头牌{} 上的 {C:attention}版本{}、",
                    "{C:attention}增强{} 和 {C:attention}蜡封{} 效果",
                    "变为 {C:green}双倍{}" 
                } 
            },
            j_aij_honker = { 
                name = "按喇叭", 
                text = { 
                    "当一张 {C:attention}倍率牌{} 计分时，",
                    "此小丑牌获得 {C:red}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)",
                } 
            },
            j_aij_mummy = { name = "木乃伊", text = { "" } },
            j_aij_sitcom = { name = "情景喜剧", text = { "" } },
            j_aij_in_vino_veritas = { name = "酒后吐真言", text = { "" } },
            j_aij_beefeater = { name = "吃牛肉的人", text = { "" } },
            j_aij_tetraphobia = {
                name = "惧四症",
                text = {
                    "每弃掉一张 {C:attention}4{}，此小丑牌",
                    "获得 {C:mult}+#2#{} 倍率，当一张 {C:attention}4{} 计分时重置",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)",
                },
            },
            j_aij_jack_of_all_trades = {
                name = "多面手",
                text = {
                    "{C:attention}J{} 视为任意 {C:attention}花色{}",
                },
            },
            j_aij_jumbo_joker = { 
                name = "巨型小丑", 
                text = { 
                    "只会出现 {C:attention}巨型{} 和 {C:attention}超级{}",
                    "{C:attention}补充包{}" 
                } 
            },
            j_aij_pellucid_joker = { 
                name = "透明小丑", 
                text = { 
                    "当拥有 {C:dark_edition}版本{} 的 {C:attention}小丑牌{} 被",
                    "{C:money}出售{} 或 {C:red}摧毁{} 时，向牌组中",
                    "添加一张拥有相同 {C:dark_edition}版本{} 的",
                    "随机游戏牌"
                } 
            },
            j_aij_cosmological_constant = {
                name = "宇宙常数",
                text = {
                    "{C:aij_plasma}平衡{} 打出 {C:attention}牌型{} 的",
                    "{C:attention}基础{} {C:chips}筹码{} 和 {C:mult}倍率{}"
                },
            },
            j_aij_monster = { name = "怪物", text = { "" } },
            j_aij_mistigri = {
                name = "米斯蒂格里",
                text = {
                    "手中每持有 {C:attention}2{} 张 {C:attention}J{}，",
                    "手牌上限 {C:attention}+1{}"
                },
            },
            j_aij_simple_simon = {
                name = "傻蛋西蒙",
                text = {
                    "{C:chips}+#1#{} 筹码",
                },
            },
            j_aij_giocoliere = {
                name = "手技艺人",
                text = {
                    "在每个 {C:attention}Boss盲注{} 期间",
                    "手牌上限 {C:attention}+#1#{}"
                },
            },
            j_aij_spectre = { 
                name = "幽灵", 
                text = { 
                    "当 {C:attention}Boss盲注{} 被击败时，",
                    "将所有持有的 {C:attention}消耗牌{}",
                    "替换为随机的 {C:spectral}幻灵{} 牌" 
                } 
            },
            j_aij_dapper_dan = { 
                name = "衣冠楚楚的丹", 
                text = { 
                    "小丑牌的 {C:dark_edition}版本{} 效果",
                    "变为 {C:attention}双倍{}",
                    "{C:inactive}(负片除外)"
                } 
            },
            j_aij_average_joe = {
                 name = "普通人乔", 
                 text = { 
                    "{C:aij_plasma}平衡{} {C:chips}筹码{} 和 {C:mult}倍率{} 的",
                    "{C:attention}#1#%{}"
                } 
            },
            j_aij_silent_sam = { 
                name = "沉默的山姆", 
                text = { 
                    "手中持有的每张 {C:attention}牌{}",
                    "提供 {X:mult,C:white}X#1#{} 倍率"
                } 
            },
            j_aij_pantomimus = { 
                name = "哑剧演员", 
                text = { 
                    "在 {C:attention}回合{} 结束时，每有一张",
                    "{C:attention}留在手中{} 的牌，此小丑牌",
                    "获得 {C:chips}+#2#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)"
                } 
            },
            j_aij_sneaky_pete = {
                name = "鬼祟的皮特",
                text = {
                    '回合结束时，你的 {C:attention}完整牌组{} 中',
                    '每有一张 {C:money}金色蜡封{}，',
                    '获得 {C:money}$#2#{}',
                    '{C:inactive}(当前为 {C:money}$#1#{C:inactive})'
                },
            },
            j_aij_peeping_tom = { name = "偷窥狂汤姆", text = { "" } },
            j_aij_la_commedia_e_finita = {
                name = "喜剧结束了",
                text = {
                    "当一张 {C:attention}人头{} 牌被 {C:attention}摧毁{} 时，",
                    "此小丑牌获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                },
            },
            j_aij_straight_to_hell = {
                name = "直下地狱",
                text = {
                    "当弃牌中包含 {C:attention}顺子{} 时，",
                    "此 {C:attention}小丑牌{} 获得 {X:mult,C:white}X#1#{} 倍率",
                    '{C:inactive}(当前为 {X:mult,C:white}X#2#{C:inactive} 倍率)'
                },
            },
            j_aij_guiser = {
                name = "伪装者",
                text = {
                    "当使用一张 {C:tarot}塔罗{} 牌时，",
                    "获得 {C:money}$#1#{} 的 {C:attention}出售价值{}"
                },
            },
            j_aij_mummer = { 
                name = "默剧演员", 
                text = { 
                    "当一张 {C:aij_silver}钢铁{} 牌 {C:attention}计分{} 时，",
                    "触发所有 {C:attention}留在手中{} 的",
                    "{C:aij_silver}钢铁{} 牌"
                } 
            },
            j_aij_tipteerer = {
                name = "告密者",
                text = {
                    "在 {C:attention}回合{} 结束时，获得其他",
                    "{C:attention}小丑牌{} {C:money}出售价值{} 的 {C:attention}#2#%{}，",
                    "向上取整",
                    "{C:inactive}(当前为 {C:money}$#1#{}{C:inactive}){}"
                },
            },
            j_aij_honest_john = { name = "诚实的约翰", text = { "" } },
            j_aij_dizzard = { 
                name = "呆子", 
                text = { 
                    "跳过 {C:attention}盲注{} 后，",
                    "访问 {C:money}商店{}" 
                } 
            },
            j_aij_arlecchino = { 
                name = "阿勒基诺", 
                text = { 
                    "在 {C:attention}小丑包{} 和 {C:attention}标准包{} 中",
                    "可以选择无限个选项" 
                } 
            },
            j_aij_arlecchina = { name = "阿勒基娜", text = { "" } },
            j_aij_taikomochi = { 
                name = "太鼓持", 
                text = { 
                    "留在手中的 {C:attention}J{}",
                    "提供 {C:chips}+#1#{} 筹码"
                } 
            },
            j_aij_sudoku = { 
                name = "数独", 
                text = { 
                    "每次连续打出包含 {C:attention}顺子{} 的牌型，",
                    "此小丑牌获得 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{C:inactive} 倍率)"
                } 
            },
            j_aij_gnasher = { 
                name = "咬牙者", 
                text = { 
                    "{B:1,C:white,s:0.8}主动能力",
                    "每个底注一次，{C:attention}复制{} 并",
                    "{C:attention}立即{} 使用一张随机的",
                    "持有的 {C:attention}消耗牌{}",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_executioner = {
                name = "刽子手",
                text = {
                    "当一张 {C:attention}人头{} 牌被 {C:attention}摧毁{} 时，",
                    "此小丑牌获得 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)"
                },
            },
            j_aij_jongleur = {
                name = "杂耍艺人",
                text = {
                    "{C:attention}-$#1#{} {C:green}重掷{} 费用",
                },
            },
            j_aij_event_horizon = { 
                name = "事件视界", 
                text = { 
                    "{C:dark_edition}黑洞{} 拥有与其他",
                    "{C:planet}星球{} 牌相同的稀有度",
                } 
            },
            j_aij_the_jester = {
                name = "弄臣",
                text = {
                    "每回合售出的",
                    "第一张 {C:attention}小丑牌{}",
                    "会生成一张 {C:tarot}愚者{}",
                    "{C:inactive}#1#{}"
                },
            },
            j_aij_joka_lisa = { 
                name = "蒙娜丽莎小丑", 
                text = { 
                    "{C:attention}手牌上限{} 超过 {C:attention}7{} 的部分，", 
                    "每有一张提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{C:inactive} 倍率){}",
                    "{C:inactive}(最低为 {X:mult,C:white}X1{C:inactive} 倍率){}"
                } 
            },
            j_aij_tonpraten = { name = "闲聊", text = { "" } },
            j_aij_rodeo_clown = { 
                name = "牛仔小丑", 
                text = { 
                    "如果在回合的 {C:attention}最后一手牌{}",
                    "击败了 {C:attention}盲注{}，此小丑牌获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                } 
            },
            j_aij_joculator = { 
                name = "滑稽演员", 
                text = { 
                    "如果你剩余 {C:attention}0{} 次 {C:red}弃牌{}",
                    "和 {C:attention}#1#{} 次 {C:blue}出牌{}，",
                    "最多抽取你手牌上限 {C:attention}两倍{} 的牌" 
                } 
            },
            j_aij_scurra = {
                name = "弄臣",
                text = {
                    '所有打出的带有 {C:red}红色蜡封{} 的牌',
                    '额外重新触发 {C:attention}#1#{} 次'
                },
            },
            j_aij_pigpen = { name = "猪圈", text = { "" } },
            j_aij_cyclops = { name = "独眼巨人", text = { "" } },
            j_aij_blarney_stone = { 
                name = "巧言石", 
                text = { 
                    "增加等同于",
                    "当前 {C:attention}分数{} 的 {C:attention}首位数字{}",
                    "{C:attention}三倍{} 的 {C:mult}倍率{}",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率){}"
                } 
            },
            j_aij_sticker = { 
                name = "贴纸", 
                text = { 
                    "你的 {C:attention}小丑牌{} 上的",
                    "每个 {C:attention}贴纸{} 提供 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率){}",
                } 
            },
            j_aij_feedback_form = { 
                name = "反馈表", 
                text = { 
                    "如果所有 {C:attention}计分{} 牌",
                    "拥有不同的 {C:attention}增强{} 效果，",
                    "每张 {C:attention}计分{} 牌提供 {C:mult}+#1#{} 倍率" 
                }
            },
            j_aij_stultor = { 
                name = "蠢人", 
                text = { 
                    "每个底注可以免费",
                    "重掷 {C:attention}Boss盲注{} {C:attention}#1#{} 次" 
                } 
            },
            j_aij_david = {
                name = "大卫",
                text = {
                    "如果 {C:attention}打出的牌型{}",
                    "只有 {C:spades}黑桃{} {C:attention}K{}，",
                    "此小丑牌获得 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码){}",
                },
            },
            j_aij_charles = {
                name = "查理",
                text = {
                    "如果 {C:attention}打出的牌型{}",
                    "只有 {C:hearts}红桃{} {C:attention}K{}，",
                    "此小丑牌获得 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{C:inactive} 倍率){}",
                },
            },
            j_aij_cesar = {
                name = "凯撒",
                text = {
                    '每次打出牌型赚取 {C:money}$#1#{}。',
                    '如果 {C:attention}打出的牌型{} 只有',
                    '{C:diamonds}方块{} {C:attention}K{}，金额增加 {C:money}$#2#{}'
                },
            },
            j_aij_alexandre = {
                name = "亚历山大",
                text = {
                    "如果 {C:attention}打出的牌型{}",
                    "只有 {C:clubs}梅花{} {C:attention}K{}，",
                    "此小丑牌获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率){}",
                },
            },
            j_aij_sannio = { name = "萨尼奥", text = { "" } },
            j_aij_stock_photo = { name = "图库图", text = { "" } },
            j_aij_fou_du_roi = {
                name = "国王的弄臣",
                text = {
                    "如果打出的牌型包含 {C:attention}K{} 或 {C:attention}Q{}，",
                    "有 {C:green}#1# / #2#{} 的几率生成一张",
                    "{C:tarot}塔罗{} 牌",
                    '{C:inactive}(必须有空位)'
                },
            },
            j_aij_fatuus = {
                name = "愚者",
                text = {
                    '如果回合的第一手牌',
                    '仅包含 {C:attention}K{} 和 {C:attention}Q{}，',
                    '为一张随机打出的牌添加 {C:blue}蓝色蜡封{}',
                },
            },
            j_aij_enraging_photo = { name = "激怒照片", text = { "" } },
            j_aij_infuriating_note = { 
                name = "恼人字条", 
                text = {{ 
                    "{X:mult,C:white}X#1#{} 倍率",
                    "此小丑牌的 {C:dark_edition}负片{} 复制品",
                    "可能会出现在 {C:attention}商店{} 和 {C:attention}小丑包{} 中", 
                },
                {
                    "{C:inactive}“我拿走了你的东西，",
                    "{C:inactive}但你却一直在坚持；",
                    "{C:inactive}我得加把劲了，",
                    "{C:inactive}向你致敬！” -R. R.",
                }
            }
            },
            j_aij_magic_hat = { name = "魔术帽", text = { "" } },
            j_aij_anagraph = { 
                name = "回文构词", 
                text = { 
                    "当任何 {C:attention}小丑牌{} 或 {C:attention}游戏牌{}",
                    "被 {C:money}出售{} 或 {C:red}摧毁{} 时，",
                    "生成一个完全相同的 {C:attention}复制品{}，",
                    "并立即再次将其 {C:red}摧毁{}" 
                } 
            },
            j_aij_beanstalk = { 
                name = "豆蔓", 
                text = { 
                    "{C:attention}J{} {C:attention}无法{} 被 {C:red}削弱{}",
                    "且 {C:attention}总是{} 参与计分" 
                } 
            },
            j_aij_phoney_baloney = { name = "假胡说", text = { "" } },
            j_aij_jerko = { 
                name = "混蛋", 
                text = { 
                    '{C:mult}+#1#{} 倍率'
                } 
            },
            j_aij_design_document = { 
                name = "设计文档", 
                text = { 
                    "当任何 {C:green}概率{} 判定失败时",
                    "获得 {C:money}$#1#{}"
                } 
            },
            j_aij_animatronic = { 
                name = "机械玩偶", 
                text = {
                    "每连续打出包含 {C:attention}顺子{} 的牌型，",
                    "{C:attention}+#1#{} 手牌上限",
                    "{C:inactive}(当前为 {C:attention}+#2#{C:inactive} 手牌上限){}",
                    "{C:inactive}(最高 {C:attention}+#3#{C:inactive}){}"
                } 
            },
            j_aij_arecibo_message = { name = "阿雷西博信息", text = { "" } },
            j_aij_napkin = { 
                name = "餐巾纸", 
                text = { 
                    "{C:attention}连续{} 跳过 {C:attention}2{} 个盲注时，",
                    "此小丑牌获得 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{C:inactive} 倍率){}",
                }
            },
            j_aij_lost_carcosa = { 
                name = "失落的卡尔克萨", 
                text = { 
                    "将使用的 {C:planet}星球{} 牌的",
                    "{C:chips}筹码{} 和 {C:mult}倍率{}",
                    "随机化为原值的 {C:attention}#1#%{} 到 {C:attention}#2#%{}"
                } 
            },
            j_aij_magic_mirror = { 
                name = "魔镜", 
                text = { 
                    "为本 {C:attention}底注{} 第一张",
                    "计分的 {C:attention}人头{} 牌应用 {C:dark_edition}负片{}",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_postcard_from_perdition_trail = { name = "毁灭之路的明信片", text = { "" } },
            j_aij_mr_lonely = {
                name = "孤独先生",
                text = {
                    "在 {C:attention}回合{} 结束时，",
                    "每个空的小丑牌槽位提供 {C:chips}+#1# 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)"
                },
            },
            j_aij_spiders_georg = { 
                name = "蜘蛛乔治", 
                text = { 
                    "将 {C:mult}倍率{} 乘以 {C:attention}#2#{} 加上",
                    "本次游戏中每次出牌",
                    "{C:attention}平均{} {C:attention}计分{} 的 {C:attention}8{} 的数量",
                    "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率)",
                } 
            },
            j_aij_gille = { name = "吉尔", text = { "" } },
            j_aij_fulehung = { 
                name = "福勒宏", 
                text = { 
                    "选择 {C:attention}盲注{} 时，",
                    "有 {C:green}#1# / #2#{} 的几率获得",
                    "它的 {C:attention}跳过标签{}" 
                } 
            },
            j_aij_bearded_joker = { 
                name = "胡子小丑", 
                text = { 
                    "你的 {C:attention}完整牌组{} 中",
                    "每有一张 {C:attention}增强{} 牌，提供 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{} {C:inactive}倍率)"
                } 
            },
            j_aij_skomorokh = { 
                name = "斯科莫罗赫", 
                text = { 
                    "你的 {C:attention}完整牌组{} 中",
                    "每有一张拥有 {C:attention}版本{} 的牌，此小丑牌",
                    "获得 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{} {C:inactive}倍率)"
                } 
            },
            j_aij_silly_billy = { name = "傻比利", text = { "" } },
            j_aij_ijoker_co = { 
                name = "i小丑公司", 
                text = { 
                    "每个 {C:money}商店{} 提供",
                    "{C:attention}#1#{} 个随机 {C:attention}标签{}",
                    "可供购买" 
                } 
            },
            j_aij_corpse_paint = { 
                name = "尸脸彩绘", 
                text = { 
                    "移除计分牌的 {C:dark_edition}负片{} 效果。",
                    "每移除一个，此小丑牌有 {C:green}#1# / #2#{} 的几率",
                    "获得 {C:attention}+#3# 手牌上限",
                    "{C:inactive}(当前为 {C:attention}+#4#{C:inactive} 手牌上限)"
                } 
            },
            j_aij_toothy_joker = { 
                name = "龅牙小丑", 
                text = { 
                    "本 {C:attention}底注{} 内每使用一张",
                    "{C:tarot}塔罗{} 牌，提供 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)"
                } 
            },
            j_aij_mondrian_joker = {
                name = "蒙德里安小丑",
                text = {
                    "你的 {C:attention}完整牌组{} 中",
                    "每有一张 {C:attention}4{}，提供 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{}{C:inactive} 倍率)"
                },
            },
            j_aij_orphic_joker = {
                name = "俄耳甫斯小丑",
                text = {
                    "跳过 {C:attention}盲注{} 时，",
                    "生成 {C:attention}#1#{} 张随机的",
                    "{C:uncommon}罕见{} {C:attention}小丑牌{}",
                    "{C:inactive}(必须有空位){}"
                },
            },
            j_aij_the_artist = { 
                name = "艺术家", 
                text = { 
                    "{C:tarot}塔罗{} 牌的选择上限 {C:attention}+#1#{}" 
                } 
            },
            j_aij_toynbee_joker = { name = "汤因比小丑", text = { "" } },
            j_aij_aluzinnu = {
                name = "阿卢津努",
                text = {
                    "{C:attention}象形文字{} 和 {C:attention}岩画{} 优惠券",
                    "{C:attention}没有{} {C:red}负面效果{}，",
                    "并且可以出现 {C:attention}多次{}"
                }
            },
            j_aij_great_kraken = { 
                name = "大克拉肯", 
                text = { 
                    "剩余的每次 {C:blue}出牌次数{}",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(将提供 {X:mult,C:white}X#2#{} {C:inactive}倍率)",
                    "{C:inactive}(最低为 {X:mult,C:white}X1{C:inactive} 倍率)"
                } 
            },
            j_aij_truhan = { 
                name = "特鲁汉", 
                text = { 
                    "当任何小丑牌被 {C:money}出售{} 或",
                    "{C:red}摧毁{} 时，该小丑牌被持有的",
                    "每 {C:attention}回合{} 使此小丑牌获得 {X:mult,C:white}X#2#{}",
                    "倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率)"
                } 
            },
            j_aij_chippy = { 
                name = "筹码多多", 
                text = { 
                    "此小丑牌获得等同于",
                    "已花费 {C:money}金钱{} 的 {C:chips}筹码{}",
                    "{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)",
                } 
            },
            j_aij_hofnarr_the_barbarian = {
                name = "野蛮人霍夫纳尔",
                text = {
                    "{C:mult}+#1#{} 倍率",
                    "遇到 {C:attention}决胜盲注(Showdown){} 时，将其 {C:attention}禁用{}",
                    "并提供 {X:mult,C:white}X#2#{} 倍率"
                },
            },
            j_aij_histrio = { 
                name = "罗马演员", 
                text = { 
                    "回合结束时，",
                    "每次 {C:attention}未使用的出牌次数{}",
                    "多赚取 {C:money}$#1#{}"
                } 
            },
            j_aij_loregg = { name = "罗雷格", text = { "" } },
            j_aij_egg_cc = {
                name = "\"蛋\"",
                text = {
                    "回合结束时，此小丑牌获得 {C:chips}+#2#{} 筹码",
                    "并增加 {C:money}$#3#{} 的 {C:attention}出售价值{}",
                    "{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)",
                    "{C:inactive}嘿，这是“蛋”"
                },
            },
            j_aij_sot = { 
                name = "酒鬼", 
                text = { 
                    "持有的每个 {C:attention}标签{}",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{} {C:inactive}倍率)"
                } 
            },
            j_aij_fat_ed = { name = "胖艾德", text = { "" } },
            j_aij_stained_glass_joker = {
                name = "花窗玻璃小丑",
                text = {
                    "{C:attention}玻璃牌{} 视为",
                    "任意 {C:attention}花色{}",
                },
            },
            j_aij_mushroom_cloud = { name = "蘑菇云", text = { "" } },
            j_aij_overdesigned_joker = {
                name = "过度设计的小丑",
                text = {
                    {
                        "计分时打出 {V:1}#1#{} 的牌#3# {B:3,V:2}#4##2#{}#5#",
                    },
                    {
                        "当一张牌 {C:attention}计分{} 时",
                        "花色和效果发生 {C:attention}轮换{}",
                        "{C:inactive}({V:4}红桃{C:inactive}->{V:5}梅花{C:inactive}->{V:6}方块{C:inactive}->{V:7}黑桃{C:inactive}){}"
                    }
                }
            },
            j_aij_morio = {
                name = "莫里奥",
                text = {
                    "当 {C:attention}Boss盲注{} 被击败时，",
                    "选择生成 {C:attention}任意{}",
                    "{C:tarot}塔罗{} 牌",
                    "{C:inactive}(必须有空位)"
                }
            },
            j_aij_visage = { 
                name = "容貌", 
                text = { 
                    "复制最后被",
                    "{C:money}出售{} 的小丑牌的效果" 
                } 
            },
            j_aij_goofball = { 
                name = "傻瓜球", 
                text = { 
                    "计分的 {C:attention}人头{} 牌会 {C:aij_plasma}平衡{}",
                    "{C:chips}筹码{} 和 {C:mult}倍率{} 的 {C:attention}#1#%{}"
                } 
            },
            j_aij_heyokha = { name = "海奥卡", text = { "" } },
            j_aij_casual_absent_paranoia = { name = "偶然缺席妄想", text = { "" } },
            j_aij_mandrake = { 
                name = "曼德拉草", 
                text = { 
                    "{C:attention}#2#{} 个回合后，{C:money}出售{}",
                    "此小丑牌以 {C:red}摧毁{}",
                    "所有 {C:attention}留在手中{} 的牌",
                    "{C:inactive}(当前为 {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_jester_zombie = { 
                name = "弄臣僵尸", 
                text = { 
                    "如果本盲注中有 {C:attention}游戏牌{} 被",
                    "{C:red}摧毁{}，重新触发所有",
                    "{C:attention}计分{} 牌",
                    "{C:inactive}#1#{}"
                } 
            },
            j_aij_richie_rich = { name = "小富翁里奇", text = { "" } },
            j_aij_devil_deal = { 
                name = "恶魔交易", 
                text = { 
                    "当一张 {C:hearts}红桃{} 牌",
                    "被 {C:attention}摧毁{} 时，此小丑牌获得 {X:mult,C:white}X#1#{}",
                    "倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{} {C:inactive}倍率)",
                } 
            },
            j_aij_totally_nuts = { 
                name = "彻底疯了", 
                text = { 
                    "{C:attention}+#1#{} 消耗牌槽位，",
                    "当一个 {C:attention}消耗牌{} 被 {C:money}出售{} 时",
                    "槽位被 {C:attention}消耗{}" 
                } 
            },
            j_aij_warhol = { name = "沃霍尔", text = { "" } },
            j_aij_mistake = {
                name = "失误",
                text = {
                    "{C:attention}永恒{} 小丑牌",
                    "可以被 {C:attention}出售{}",
                }
            },
            j_aij_depth_of_delusion = { name = "错觉深度", text = { "" } },
            j_aij_curse_of_scotland = { name = "苏格兰的诅咒", text = { "" } },
            j_aij_banana_man = { 
                name = "香蕉人", 
                text = { 
                    {
                        "{C:attention}重新触发{} 所有",
                        "其他小丑牌",
                    },
                    {
                        "每次打出牌型后，每张小丑牌",
                        "有 {C:green}#1# / #2#{} 的几率",
                        "被 {C:red}摧毁{}"
                    }
                } 
            },
            j_aij_corny_joker = { name = "老套小丑", text = { "" } },
            j_aij_entropy = { 
                name = "熵", 
                text = { 
                    "当盲注被 {C:attention}跳过{} 时",
                    "生成一个 {C:attention}混沌标签{}"
                } 
            },
            j_aij_urchin = { 
                name = "顽童", 
                text = { 
                    "本次游戏中每",
                    "跳过一个 {C:attention}盲注{}，回合",
                    "结束时赚取 {C:money}$#2#{}",
                    "{C:inactive}(当前为 {C:money}$#1#{}{C:inactive}){}"
                } 
            },
            j_aij_machine_intelligence = { name = "机器智能", text = { "" } },
            j_aij_grandma = { name = "祖母", text = { "" } },
            j_aij_funny_money = { 
                name = "滑稽货币", 
                text = { 
                    "当 {C:attention}跳过{} 盲注时",
                    "赚取 {C:money}$#1#{}"
                } },
            j_aij_witchfinder = { 
                name = "巫师猎人", 
                text = { 
                    "{C:money}商店{} 中额外提供",
                    "{C:attention}#1#{} 个 {C:tarot}秘仪包{}"
                } 
            },
            j_aij_trophy_kill = { name = "战利品猎杀", text = { "" } },
            j_aij_tract = { 
                name = "传单", 
                text = { 
                    "每拥有一张 {C:attention}优惠券{}，",
                    "提供 {C:chips}+#1#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#2#{} {C:inactive}筹码){}"
                } 
            },
            j_aij_stock_broker = { 
                name = "股票经纪人", 
                text = { 
                    "将 {C:money}利息{} 乘以一个",
                    "介于 {C:attention}X#1#{} 和 {C:attention}X#2#{}",
                    "之间的随机数" 
                } 
            },
            j_aij_omlette = { 
                name = "煎蛋卷", 
                text = { 
                    "当使用一次 {C:blue}出牌{} 或 {C:red}弃牌{} 时，",
                    "获得 {C:money}$#1#{} 的出售价值",
                } 
            },
            j_aij_stave = { name = "五线谱", text = { "" } },
            j_aij_sunny_side = { name = "阳光面", text = { "" } },
            j_aij_omelette = { name = "煎蛋卷", text = { "" } },
            j_aij_theyre_looking_at_you = { name = "它们在看着你...", text = { "" } },
            j_aij_comedy_of_errors = { 
                name = "错误的喜剧", 
                text = { 
                    "每当一张 {C:hearts}红桃{} 牌被 {C:red}弃掉{} 时，",
                    "赚取 {C:money}$#1#{}",
                } 
            },
            j_aij_fuzzy_joker = { 
                name = "毛绒小丑",
                text = { 
                    "将 {C:mult}倍率{} 向上取整至",
                    "{C:attention}#1#{} 的下一个幂" 
                } 
            },
            j_aij_saucy_jacky = { name = "俏皮杰基", text = { "" } },
            j_aij_funny_phone = { name = "滑稽电话", text = { "" } },
            j_aij_taggart = { 
                name = "塔加特", 
                text = { 
                    "获得的每个 {C:attention}标签{}",
                    "生成 {C:attention}#1# 个复制品{}",
                    "{C:inactive}(双倍标签除外)"
                } 
            },
            j_aij_chitty = { 
                name = "小钞票", 
                text = { 
                    "{C:attention}商店{} 中额外提供",
                    "{C:attention}+#1#{} 张 {C:attention}优惠券{} 可供购买" 
                } 
            },
            j_aij_whatsisname = { 
                name = "叫啥来着", 
                text = { 
                    "{C:attention}笑语猜谜包{}",
                    "出现得更频繁"
                } 
            },
            j_aij_downing_street = { 
                name = "唐宁街", 
                text = { 
                    "计分的 {C:attention}10{} 有 {C:green}#1# / #2#{} 的几率",
                    "生成一个随机 {C:attention}标签{}"
                } 
            },
            j_aij_one_little_duck = { name = "一只小鸭子", text = { "" } },
            j_aij_four_leaf_clover = { name = "四叶草", text = { "" } },
            j_aij_aphantasia = { 
                name = "心盲症", 
                text = { 
                    "所有打出的 {C:attention}增强{} 牌",
                    "变为 {C:red}混沌{} 状态" 
                } 
            },
            j_aij_tabula_rasa = { 
                name = "白板", 
                text = { 
                    "选择 {C:attention}盲注{} 时，",
                    "移除此小丑牌的 {C:dark_edition}版本{}，",
                    "并且其效果变为 {C:jest_inherent}固有{}" 
                } 
            },
            j_aij_vitruvian_joker = {
                name = "维特鲁威小丑",
                text = {
                    "如果恰好拥有 {C:attention}5{} 张",
                    "小丑牌，提供 {X:mult,C:white}X#1#{} 倍率"
                }
            },
            j_aij_american_comic = { name = "美国漫画", text = { "" } },
            j_aij_from_the_top_rope = { name = "飞身压制", text = { "" } },
            j_aij_fortune_cookie = { 
                name = "幸运饼干", 
                text = { 
                    "打开、消耗任何 {C:attention}补充包{} 时",
                    "生成一张随机的 {C:tarot}塔罗{} 牌，",
                    "在 {C:attention}#1#{} 个包之后被消耗",
                    "{C:inactive}(必须有空位){}",
                } 
            },
            j_aij_tilty_joker = { 
                name = "倾斜小丑", 
                text = { 
                    "{C:attention}计分{} 牌提供其",
                    "基础 {C:chips}筹码{} 的 {C:attention}X#1#{}" 
                } 
            },
            j_aij_opening_move = { 
                name = "开局", 
                text = { 
                    {
                        "回合的 {C:attention}第一手牌{} 中",
                        "每有一张 {C:attention}计分{} 牌，本回合",
                        "获得 {X:mult,C:white}X#1#{} 倍率{}",
                        "{C:inactive}(当前为 {X:mult,C:white}X#2#{C:inactive} 倍率)",
                    },
                    {
                        "每回合的 {C:attention}第一手牌{}",
                        "{C:red}不会{} 计入你的总分",
                    },
                } 
            },
            j_aij_bartender = { 
                name = "酒保", 
                text = { 
                    "{C:attention}消耗牌{} 可能会具有",
                    "{C:dark_edition}闪箔{}、{C:dark_edition}镭射{} 或",
                    "{C:dark_edition}幻彩{} 版本" 
                } 
            },
            j_aij_mahoney = { 
                name = "马霍尼", 
                text = { 
                    "盲注被 {C:attention}跳过{} 时，",
                    "有 {C:green}#1# / #2#{} 的几率",
                    "生成一个 {C:attention}优惠券标签{}",
                } 
            },
            j_aij_le_fils_de_banane = { 
                name = "香蕉之子", 
                text = { 
                    "计分的 {C:attention}人头{} 牌提供 {C:mult}+#3#{} 倍率，",
                    "但有 {C:green}#1# / #2#{} 的几率",
                    "将自己 {C:red}摧毁{}" 
                } 
            },
            j_aij_pygmalion = { 
                name = "皮格马利翁", 
                text = { 
                    "所有 {C:attention}石头{} 牌",
                    "均被视为 {C:attention}Q{}",
                } 
            },
            j_aij_grue = { name = "格鲁", text = { "" } },
            j_aij_heavy_sixer = { name = "重型六轮", text = { "" } },
            j_aij_tetrominoker = { 
                name = "四格骨牌", 
                text = { 
                    "计分的 {C:attention}4{} 有 {C:green}#1# / #2#{} 的几率",
                    "生成一张自身的 {C:attention}复制品{}" 
                } 
            },
            j_aij_mr_catfish = { 
                name = "鲶鱼先生", 
                text = { 
                    "每弃掉 {C:attention}#2#{C:inactive} [#3#]{}",
                    "张牌，赚取 {C:money}$#1#{}"
                } 
            },
            j_aij_angel_number = { 
                name = "天使数字", 
                text = { 
                    "本次出牌中，每有一张计分的 {C:attention}7{}",
                    "所有 {C:green}列出的概率{}",
                    "{C:attention}+#1#{}"
                } 
            },
            j_aij_doctors_orders = { 
                name = "医嘱", 
                text = { 
                    "打出的牌型中每有一张 {C:attention}9{}，",
                    "提供 {X:mult,C:white}X#1#{} 倍率。如果没有",
                    "打出 {C:attention}9{}，则发生 {C:red}自毁{}"
                } 
            },
            j_aij_blue_eyes_white_joker = { 
                name = "蓝眼白小丑", 
                text = { 
                    "如果回合的 {C:attention}最后一手牌{}",
                    "正好是 {C:attention}1{} 张牌，",
                    "它会永久获得",
                    "{C:attention}+#1# 次重新触发{}"
                } 
            },
            j_aij_lucina = { 
                name = "狂欢的弄臣", 
                text = { 
                    "当选择盲注时，",
                    "{C:red}摧毁{} {C:attention}左侧{} 的小丑牌",
                    "并为 {C:attention}右侧{} 的小丑牌",
                    "应用一个随机的 {C:dark_edition}版本{}",
                } 
            },
            j_aij_circuit_diagram = { 
                name = "电路图", 
                text = { 
                    "{C:attention}充能{} 牌总是",
                    "被洗到牌组的顶部",
                } 
            },
            j_aij_paracosm = { 
                name = "平行宇宙", 
                text = { 
                    "当跳过 {C:attention}盲注{} 时，",
                    "提升最常打出的",
                    "{C:attention}牌型{} 的等级",
                    "{C:inactive}(当前为 #1#)"
                } 
            },
            j_aij_mocap = { 
                name = "动作捕捉", 
                text = { 
                    {
                        "当一张 {C:legendary}传奇{}、{C:rare}稀有{} 或",
                        "{C:uncommon}罕见{} 小丑牌被 {C:money}出售{} 时，",
                        "生成一张低一级的",
                        "{C:attention}随机{} 小丑牌"
                    }, 
                    {
                        "{C:legendary}传奇{} -> {C:rare}稀有{}",
                        "{C:rare}稀有{} -> {C:uncommon}罕见{}",
                        "{C:uncommon}罕见{} -> {C:common}普通{}"
                    }
                } 
            },
            j_aij_stagehand = { 
                name = "舞台助手", 
                text = { 
                    "持有的每张 {C:attention}小丑牌{}",
                    '提供 {X:mult,C:white}X#1#{} 倍率',
                    '{C:inactive}(当前为 {X:mult,C:white}X#2#{C:inactive} 倍率)'
                } 
            },
            j_aij_the_mermaid = { name = "美人鱼", text = { "" } },
            j_aij_colour_test = { 
                name = "色彩测试", 
                text = { 
                    "在回合的 {C:attention}最后一手牌{} 中，",
                    "为第一张计分牌",
                    "应用 {C:attention}幻彩{} 版本"
                } 
            },
            j_aij_test_card = { 
                name = "测试卡", 
                text = { 
                    "留在手中的牌上的 {C:attention}版本{}",
                    "也会触发其效果"
                } 
            },
            j_aij_interstate = { 
                name = "州际公路", 
                text = { 
                    "如果回合的 {C:attention}第一手牌{}",
                    "包含 {C:attention}顺子{}，",
                    "本回合 {C:blue}+#1#{} 次出牌"
                } 
            },
            j_aij_bowls_of_joy = { name = "欢乐碗", text = { "" } },
            j_aij_chips_n_dip = {
                name = "筹码与蘸酱",
                text = {
                    "{X:chips,C:white}X#1#{} 筹码，在 {C:attention}回合{} 结束时",
                    "失去 {X:chips,C:white}X#2#{} 筹码"
                }
            },
            j_aij_homemade_comic = { 
                name = "自制漫画", 
                text = { 
                    "计分的 {C:attention}充能牌{}",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                } 
            },
            j_aij_gematria = { name = "希伯来字母代码", text = { "" } },
            j_aij_bingo_card = { 
                name = "宾果卡", 
                text = { 
                    "计分的 {C:attention}幸运牌{} 有",
                    "{C:green}#1# / #2#{} 的几率提供 {X:mult,C:white}X#5#{} 倍率，",
                    "且有 {C:green}#3# / #4#{} 的几率 {C:attention}重新触发{}"
                } 
            },
            j_aij_fish_fingers = { 
                name = "炸鱼条", 
                text = { 
                    "每回合 {C:blue}+#1#{} 次出牌，",
                    "当盲注被 {C:attention}击败{} 时",
                    "失去 {C:blue}-#2#{} 次出牌"
                } 
            },
            j_aij_joker_png = { 
                name = "小丑.png", 
                text = { 
                    {
                    '{B:1,C:white,s:0.8}主动能力',
                    '此小丑牌 {C:attention}复制{} 一张',
                    '随机 {C:attention}小丑牌{} 的 {C:attention}效果{}'
                    },
                    {
                    '支付 {C:money}$#1#{} 重掷，',
                    '本底注中每次重掷费用增加 {C:money}$#1#{}'
                    }
                } 
            },
            j_aij_kuruko = { name = "黑子", text = { "" } },
            j_aij_candy_floss = { 
                name = "棉花糖", 
                text = { 
                    "{C:aij_plasma}平衡{} {C:chips}筹码{} 和 {C:mult}倍率{} 的",
                    "{C:attention}#1#%{}，在回合结束时",
                    "减少 {C:attention}#2#%{}"
                } 
            },
            j_aij_stargazy_pie = { 
                name = "仰望星空派", 
                text = { 
                    "接下来的 {C:attention}#1#{} 张使用的",
                    "{C:planet}星球{} 牌重新触发" 
                } 
            },
            j_aij_electric_snow = { 
                name = "电雪", 
                text = { 
                    "回合只有在",
                    "{C:attention}最后一手牌{} 之后才结束" 
                } 
            },
            j_aij_gameshow = { 
                name = "游戏节目", 
                text = { 
                    {
                        "当 {C:attention}盲注{} 被选择时，",
                        "有 {C:green}#1# / #2#{} 的几率",
                        "为一张随机的 {C:attention}小丑牌{} 添加",
                        "{C:dark_edition}闪箔{}、{C:dark_edition}镭射{} 或 {C:dark_edition}幻彩{} 版本",
                    },
                    { 
                        "触发时消耗 {C:money}$#3#{}",
                        "无论结果如何"
                    } ,
                },
            },
            j_aij_bonus_pay = { 
                name = "奖金发放", 
                text = { 
                    "当一张 {C:attention}奖励牌{} 计分时",
                    "赚取 {C:money}$#1#{}"
                } 
            },
            j_aij_illuminated_joker = { 
                name = "发光小丑", 
                text = { 
                    "{C:money}黄金{} 标签",
                    "更有可能出现" 
                } 
            },
            j_aij_magazine_ad = { name = "杂志广告", text = { "" } },
            j_aij_bonus_bob = { 
                name = "奖励鲍勃", 
                text = { 
                    "{C:attention}奖励牌{} 计分时",
                    "提供 {X:chips,C:white}X#1#{} 筹码"
                } 
            },
            j_aij_bonus_round = { 
                name = "奖励回合", 
                text = { 
                    "{C:attention}重新触发{} 所有",
                    "计分的 {C:attention}奖励牌{}",
            } 
            },
            j_aij_jack_o_lantern = { name = "南瓜灯", text = { "" } },
            j_aij_astrologer = { 
                name = "占星家", 
                text = { 
                    {
                        "{C:planet}天体包{} 中可以选择 {C:attention}+#1#{} 张牌" 
                    },
                    {
                        "{C:planet}星球{} 牌在 {C:attention}奇数{} 底注时",
                        "被替换为其 {C:mult}倍率{} 变体，",
                        "在 {C:attention}偶数{} 底注时",
                        "被替换为其 {C:chips}筹码{} 变体"
                    },
                } 
            },
            j_aij_planetarium = { 
                name = "天文馆", 
                text = { 
                    {
                        "位于你的 {C:attention}消耗牌{} 区域的",
                        "{C:chips}筹码{} 类型的 {C:planet}星球{} 牌，",
                        "为其指定的 {C:attention}牌型{}",
                        "提供 {C:chips}+#1#{} 筹码" 
                    },
                    {
                        "位于你的 {C:attention}消耗牌{} 区域的",
                        "{C:mult}倍率{} 类型的 {C:planet}星球{} 牌，",
                        "为其指定的 {C:attention}牌型{}",
                        "提供 {C:mult}+#2#{} 倍率" 
                    },
                } 
            },
            j_aij_negative_space = { 
                name = "负空间", 
                text = { 
                    "每持有一张 {C:dark_edition}负片{} 小丑牌，",
                    "手牌上限 {C:attention}+#1#{}",
                    "{C:inactive}(当前为 {C:attention}+#2#{} {C:inactive}手牌上限){}",
                    "{C:inactive}(最高 {C:attention}+#3#{}{C:inactive})"
                } 
            },
            j_aij_stargazer = { name = "观星者", text = { "" } },
            j_aij_skald = { name = "斯卡尔德诗人", text = { "" } },
            j_aij_sky_trees = { 
                name = "天空树", 
                text = { 
                    "{C:attention}蓝色蜡封{} 会提供",
                    "{C:mult}倍率{} 和 {C:chips}筹码{} 类型的",
                    "{C:planet}星球{} 牌，而不是",
                    "{C:attention}基础{} 类型的 {C:planet}星球{} 牌" 
                } 
            },
            j_aij_the_freezer = { name = "冰柜", text = { "" } },
            j_aij_twisted_pair = { 
                name = "双绞线", 
                text = { 
                    "如果牌型是 {C:attention}对子{}，每张牌",
                    "都会获得一个对应于",
                    "{C:attention}另一张牌{} 花色的花色 {C:attention}补丁{}" 
                } 
            },
            j_aij_the_grim_joker = { 
                name = "冷酷小丑", 
                text = { 
                    "由 {C:planet}蓝色{} 或 {C:tarot}紫色{} 蜡封",
                    "生成的 {C:attention}消耗牌{}，有",
                    "{C:green}#1# / #2# 的几率{} 变为 {C:dark_edition}负片{}"
                } 
            },
            j_aij_lexicon = { 
                name = "词典", 
                text = { 
                    "增加等同于所有其他",
                    "拥有的小丑牌 {C:attention}能力描述{} 中",
                    "所有数字的 {C:attention}总和{} 的 {C:mult}倍率{}",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)"
                } 
            },
            j_aij_dendroglpyh = { name = "树木雕刻", text = { "" } },
            j_aij_prank_caller = { name = "恶作剧电话", text = { "" } },
            j_aij_arngren = { 
                name = "阿恩格伦", 
                text = { 
                    "在 {C:money}商店{} 中：",
                    "{C:attention}+#1#{} 卡牌槽位，{C:attention}+#1#{} 补充包槽位，",
                    "以及 {C:attention}+#1#{} 优惠券槽位"
                } 
            },
            j_aij_blacklist = { 
                name = "黑名单", 
                text = { 
                    "被 {C:money}出售{} 的小丑牌将不再",
                    "重新出现",
                    "当前被拉黑的小丑牌：",
                } 
            },
            j_aij_croupier = { 
                name = "荷官", 
                text = { 
                    "如果最终分数",
                    "超过盲注要求的 {C:attention}两倍{}，",
                    "赚取 {C:money}$#1#{}" 
                } 
            },
            j_aij_the_lucovico_technique = { name = "卢多维科疗法", text = { "" } },
            j_aij_headstone = { 
                name = "墓碑", 
                text = { 
                    "所有 {C:attention}人头牌{} 会被洗到",
                    "你的牌组的 {C:red}底部{}" 
                } 
            },
            j_aij_full_monty = { name = "毫无保留", text = { "" } },
            j_aij_chef = { 
                name = "厨师", 
                text = {
                    {
                        "基础版本的 {C:attention}易腐{}",
                        "小丑牌变为 {C:dark_edition}负片{}",
                    },
                    {
                        "{C:attention}易腐{} 小丑牌上的 {C:attention}版本{}",
                        "不再增加它们在",
                        "{C:money}商店{} 中的售价" 
                    }
                } 
            },
            j_aij_screamer = { name = "尖叫者", text = { "" } },
            j_aij_evil_twin = { name = "邪恶双胞胎", text = { "" } },
            j_aij_cubic_joker = { name = "立方小丑", text = { "" } },
            j_aij_remina = { 
                name = "蕾米娜", 
                text = { 
                    "当选择 {C:attention}小盲注{} 或 {C:attention}大盲注{}",
                    "时，此小丑牌",
                    "{C:red}摧毁{} 你的 {C:attention}消耗牌{} 区域内",
                    "的所有 {C:planet}星球牌{}，并",
                    "吸收它们的 {C:chips}筹码{} 和 {C:mult}倍率{}",
                    "{C:inactive,s:0.8}(当前为 {C:chips,s:0.8}+#2#{} {C:inactive,s:0.8}筹码，{C:mult,s:0.8}+#1#{C:inactive,s:0.8} 倍率)"
                } 
            },
            j_aij_jpeg = { name = ".jpeg", text = { "" } },
            j_aij_sherrif = { 
                name = "警长",
                text = { 
                    "每次出牌时，第一张",
                    "计分的 {C:attention}万能牌{}",
                    "赚取 {C:money}$#1#{}"
                } 
            },
            j_aij_alien_joker = { 
                name = "外星小丑", 
                text = { 
                    {
                        "{C:attention}强制选择 1{} 张牌",
                    },
                    {
                        "{C:attention}被强制选择的{} 牌",
                        "计分时提供 {X:mult,C:white}X#1#{} 倍率" 
                    }
                } 
            },
            j_aij_nobody = { 
                name = "无名小卒", 
                text = { 
                    "{C:inactive}毫无作用...?" 
                } 
            },
            j_aij_broken_dreams = { name = "破碎的梦", text = { "" } },
            j_aij_elf = { 
                name = "精灵", 
                text = { 
                    "在跳过 {C:attention}#2#{} 个盲注后，",
                    "{C:money}出售{} 此小丑牌以生成",
                    "{C:attention}#3# 个投资标签{}",
                    "{C:inactive}(当前为 {C:attention}#1#{C:inactive}/#2#)"
                } 
            },
            j_aij_fall_of_count_chaligny = {
                name = "沙利尼伯爵之陨",
                text = { 
                    "将所有 {C:attention}盲注{} 的",
                    "{C:attention}分数要求{} 设为 {C:attention}1X{} 基础分数"
                } 
            },
            j_aij_mp_fall_of_count_chaligny = {
                name = "沙利尼伯爵之陨",
                text = { 
                    "将所有 {C:attention}盲注{} 的",
                    "{C:attention}分数要求{} 设为 {C:attention}1X{} 基础分数",
                    "{C:inactive}(不影响 PvP 盲注){}"
                } 
            },
            j_aij_coulrorachne = { 
                name = "库尔洛拉克尼", 
                text = { 
                    "每有 {C:attention}#4# {C:inactive}[#3#]{} 张计分的 {C:attention}8{}，",
                    "此小丑牌获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)" 
                } 
            },
            j_aij_bad_sun = { 
                name = "坏太阳", 
                text = { 
                    "如果 {C:attention}打出{} 的手牌包含 {C:attention}#1#{} 张",
                    "或更多的 {C:hearts}红桃{}，摧毁一张",
                    "{C:attention}随机{} 打出的牌" 
                } 
            },
            j_aij_lemarchand_cube = { name = "勒马尔尚魔方", text = { "" } },
            j_aij_duende = { name = "杜恩德", text = { "" } },
            j_aij_evil_joker = { 
                name = "邪恶小丑", 
                text = { 
                    "{X:mult,C:white}X#1#{} 倍率，在 {C:attention}获得{} 时",
                    "摧毁一张 {C:attention}随机{} 小丑牌" 
                } 
            },
            j_aij_sanguine_joker = { 
                name = "多血质小丑", 
                text = { 
                    "打出的 {C:hearts}红桃{} 牌在计分时",
                    "有 {C:green}#1# / #2#{} 的几率生成一个",
                    "随机 {C:attention}标签{}"
                } 
            },
            j_aij_choleric_joker = { 
                name = "胆汁质小丑", 
                text = { 
                    "打出的 {C:diamonds}方块{} 牌在计分时",
                    "有 {C:green}#1# / #2#{} 的几率生成一张",
                    "随机 {C:tarot}塔罗{} 牌",
                    "{C:inactive}(必须有空位){}"
                } 
            },
            j_aij_phlegmatic_joker = { 
                name = "粘液质小丑", 
                text = { 
                    "打出的 {C:clubs}梅花{} 牌在计分时",
                    "有 {C:green}#1# / #2#{} 的几率",
                    "生成该 {C:attention}打出牌型{} 的",
                    "{C:planet}星球{} 牌",
                    "{C:inactive}(必须有空位){}"
                } 
            },
            j_aij_melancholic_joker = { 
                name = "抑郁质小丑", 
                text = { 
                    "打出的 {C:spades}黑桃{} 牌在计分时",
                    "有 {C:green}#1# / #2#{} 的几率",
                    "生成一张随机的",
                    "{C:spectral}幻灵{} 牌",
                    "{C:inactive}(必须有空位){}"
                } 
            },
            j_aij_majordomo = { 
                name = "管家", 
                text = { 
                    {
                        "{C:money}商店{} 中所有售价",
                        "超过 {C:money}$#1#{} 的 {C:attention}小丑牌{}",
                        "都会获得 {C:money}租赁{} 贴纸" 
                    },
                    {
                        "{C:attention}租赁{} 扣除的钱减少 {C:money}$2{}"
                    }
                }
            },
            j_aij_skinsuit = { 
                name = "人皮服", 
                text = { 
                    "当一张牌被 {C:red}摧毁{} 时，",
                    "将其 {C:attention}花色{} 作为补丁缝合到一张",
                    "留在手中的 {C:attention}随机牌{} 上" 
                } 
            },
            j_aij_shock_humor = { name = "冲击性幽默", text = { "" } },
            j_aij_the_house_that_jack_built = { name = "杰克盖的房子", text = { "" } },
            j_aij_clownbug = { name = "小丑虫", text = { "" } },
            j_aij_infamous_machine = { 
                name = "臭名昭著的机器", 
                text = {
                
                } 
            },
            j_aij_weatherman = { 
                name = "气象预报员", 
                text = {
                
                } 
            },
            j_aij_headfooter = { 
                name = "页眉页脚", 
                text = {
                
                } 
            },
            j_aij_rudolph = { 
                name = "鲁道夫", 
                text = {
                
                } 
            },
            j_aij_cut_here = { 
                name = "沿此剪开", 
                text = {
                    "当此小丑牌被",
                    "{C:red}摧毁{} 时，生成一张",
                    "随机 {C:red}稀有{} 小丑牌"
                } 
            },
            j_aij_a_young_hamlet = { 
                name = "年轻的哈姆雷特", 
                text = {
                    "每被 {C:red}弃掉{} {C:attention}#3#{C:inactive} [#4#]{} 张牌，",
                    "此小丑牌获得 {C:mult}+#2#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)"
                } 
            },
            j_aij_mike_check = { 
                name = "麦克风测试", 
                text = {
                
                } 
            },
            j_aij_pure_baseball_card = { 
                name = "纯粹棒球卡", 
                text = {
                
                } 
            },
            j_aij_rock_n_roll_clown = { 
                name = "摇滚小丑", 
                text = {
                
                } 
            },
            j_aij_vecchio_dolore = { 
                name = "旧痛", 
                text = {
                
                } 
            },
            j_aij_firework = { 
                name = "烟花", 
                text = {
                    "第一张打出的 {C:attention}倍率{}",
                    "牌在计分时，",
                    "提供 {X:mult,C:white}X#1#{} 倍率"
                } 
            },
             j_aij_bad_guy = { 
                name = "坏蛋", 
                text = {
                    "当 {C:attention}盲注{} 被击败时，",
                    "为一张 {C:attention}留在手中{} 的",
                    "随机牌应用 {C:attention}闪箔{} 版本"
                } 
            },
            
            j_aij_tool = { 
                name = "工具", 
                text = {
                    "改变 {C:attention}花色{} 的卡牌",
                    "永久获得 {C:mult}+#1#{} 倍率"
                } 
            },
            j_aij_youve_got_mail = { 
                name = "你有邮件", 
                text = {
                    {
                        "如果 {C:red}不是{} {C:dark_edition}负片{}，当选择",
                        "{C:attention}盲注{} 时，生成一张出售价值为 {C:money}$0{}",
                        "的此小丑牌的 {C:dark_edition}负片 {C:attention}复制品{}"
                    },
                    {
                        "{V:1}{B:3,V:2}#1##2#{}{V:1}#3#",
                    }
                } 
            },
            j_aij_fleshgait = { 
                name = "肉步", 
                text = {
                    "{C:red}没有{} {C:attention}花色补丁{} 的",
                    "{C:attention}计分{} 牌会获得",
                    "一个随机的 {C:attention}花色补丁{}"
                } 
            },
            j_aij_czar = { 
                name = "沙皇", 
                text = {
                    "复制你的 {C:attention}图鉴{} 中",
                    "一张已发现的 {C:attention}随机{} 小丑牌的",
                    "{C:attention}效果{}",
                    "{C:inactive}(当商店重掷时改变)"
                } 
            },
            j_aij_stage_production = { 
                name = "舞台制作", 
                text = {
                    "{B:1,C:white,s:0.8}主动能力",
                    "每回合一次，{C:attention}暂时{C:attention}重掷{}",
                    "右侧的小丑牌，直到选择",
                    "下一个盲注",
                    "{C:inactive}#1#"
                } 
            },
            j_aij_pink_slip = { 
                name = "解雇通知", 
                text = {
                    "{C:red}弃牌{} 的选择上限",
                    "{C:attention}+#1#{}"
                } 
            },
            j_aij_chromatist = { 
                name = "色彩学家", 
                text = {
                    "当 {C:attention}幻彩{} 版本",
                    "触发时，提供 {X:mult,C:white}X#1#{} 倍率"
                } 
            },
            j_aij_death_of_a_salesman = { 
                name = "推销员之死", 
                text = {
                    "每个 {C:money}商店{} 都提供",
                    "{C:attention}#1#{} 个 {C:red}混沌{} 或 {C:red}无政府 {C:attention}标签{}",
                    "可供购买"
                } 
            },
            j_aij_parking_space = { 
                name = "停车位", 
                text = {
                    "如果此小丑牌在",
                    "{C:attention}小丑牌槽位 #2#{} 中，提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(槽位在回合结束时改变)"
                } 
            },
            j_aij_graffiti = { 
                name = "涂鸦", 
                text = {
                    {
                        '{B:1,C:white,s:0.8}主动能力',
                        '支付 {C:money}$#1#{} 以获得一个',
                        '随机的 {C:attention}标签{}'
                    },
                    {
                        '使用后 {C:money}成本{} 会乘以 {C:red}X#2#{}。',
                        '在击败 {C:attention}Boss盲注{} 后重置'
                    }
                } 
            },
            j_aij_historian = {
                name = "历史学家", 
                text = {
                    "增加等同于最后出售的",
                    "小丑牌 {C:money}出售价值{} {C:attention}三倍{} 的",
                    "{C:mult}倍率{}",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)"
                } 
            },
            j_aij_baddata = {
                name = "错误数据", 
                text = {
                } 
            },
            j_aij_office_assistant = {
                name = "办公室助手", 
                text = {
                    "{B:1,C:white,s:0.8}主动能力",
                    '修复 {C:attention}右侧{} 的',
                    '{C:attention}易腐{} 或 {C:attention}租赁{} 小丑牌'
                } 
            },
            j_aij_cavalier = {
                name = "骑士", 
                text = {
                    "本 {C:attention}回合{} 之前每有",
                    "一次计分的 {C:attention}出牌{}，提供 {C:mult}+#2#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)"
                } 
            },
            j_aij_elder = {
                name = "长者", 
                text = {
                    '复制你拥有时间',
                    '{C:attention}最长{} 的另一张',
                    "{C:attention}小丑牌{} 的效果",
                    "{C:inactive}(当前为 #1#)"
                } 
            },


            j_aij_prototype = { name = "原型", text = {
                "{C:inactive}“哈哈，我不知道自己",
            "{C:inactive}还有没有台词了”"} },
            j_aij_spoofy = { name = "搞怪", text = {
                "{C:inactive}“你应该玩《Braptro》”"} },
            j_aij_toyrapple = { name = "玩具苹果", text = {""} },
            j_aij_grass = { name = "草", text = {
                "“那个游戏”"} },
            j_aij_mythie = { name = "神话", text = {
                "{C:inactive}“在床上吃烤吐司是",
            "{C:inactive}我的能力”"} },
            j_aij_zan = { name = "赞", text = {""} },
            j_aij_metrollen = { name = "地铁巨魔", text = {""} },
            j_aij_clay = { name = "黏土", text = {""} },
            j_aij_generic = { name = "大众-艾瑞克", text = {
                "{C:inactive}“为了游戏平衡，",
                "{C:inactive}其余内容已清空”"
            } },
            j_aij_cheddar = { name = "切达奶酪", text = {""} },
            



            j_aij_nybbas = { name = "尼巴斯", text = { "" }, unlock = { "?????" } },
            j_aij_doink = { name = "咚", text = { "" }, unlock = { "?????" } },
            j_aij_monarcho = { name = "君主", text = { "" }, unlock = { "?????" } },
            j_aij_pompey = {
                name = "庞培",
                text = {
                    "位于 {C:attention}右侧{} 的每张 {C:attention}小丑牌{}",
                    "(包括庞培自身)，",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{}{C:inactive} 倍率){}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_touchstone = {
                name = "试金石",
                text = {
                    "{C:attention}+#1#{} 手牌上限",
                    "揭示你的牌组中接下来的 {C:attention}#2#{} 张牌",
                },
                unlock = { 
                    "?????" 
                }
            },
            j_aij_fortunato = {
                name = "福尔图纳托",
                text = {
                    {
                        "将所有 {C:attention}打出{} 但 {C:attention}未计分{} 的",
                        "卡牌变为 {C:attention}石头牌{}",
                    },
                    {
                        "当一张 {C:attention}石头牌{} 计分时，",
                        "此 {C:attention}小丑牌{} 获得 {X:mult,C:white}X#2#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率){}",
                    }
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_pellesini = { 
                name = "佩莱西尼", 
                text = { 
                    "当任何小丑牌",
                    "被 {C:red}摧毁{} 时，生成一个",
                    "{C:attention}完全相同{} 的复制品",
					          "{C:inactive}(包括它自己)"
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_nedda = {
                name = "内达",
                text = {
                    "留在手中的 {C:attention}Q{}",
                    "提供 {X:mult,C:white}X#1#{} 倍率"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_silvio = {
                name = "西尔维奥",
                text = {
                    "留在手中的每张 {C:attention}Q{}，",
                    "会使所有 {C:attention}K{}",
                    "重新触发一次",
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_biancolelli = { 
                name = "比安科莱利", 
                text = { 
                    "在小丑牌触发后", 
                    "{C:aij_plasma}平衡{} {C:chips}筹码{} 和 {C:mult}倍率{}"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_toto = { 
                name = "托托", 
                text = { 
                    "获得的每个 {C:attention}标签{}",
                    "生成 {C:attention}#1#{} 个复制品",
                    "{C:inactive}(双倍标签除外)" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_grock = { name = "格罗克", text = { "" }, unlock = { "?????" } },
            j_aij_eulenspiegel = { 
                name = "尤伦斯皮格尔", 
                text = { 
                    {
                        "当 {C:attention}Boss盲注{} 被击败时，",
                    "{C:attention}-#1#{} 底注，且此小丑牌",
                    "失去 {X:mult,C:white}X#2#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#3#{C:inactive} 倍率)"
                    },
                    {
                        "当降至 {X:mult,C:white}X0{} 倍率时，",
                        "{C:red}削弱自身{}"
                    }

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
                    "回合开始时，将一张随机的",
                    "{C:attention}Q{} 加入你的手牌中，",
                    "它带有一个随机的 {C:attention}增强{}、",
                    "{C:dark_edition}版本{} 和 {C:attention}蜡封{}"
                },
                unlock = {
                    "?????"
                }
            },
            j_aij_fleeman = { name = "弗利曼", text = { "" }, unlock = { "?????" } },
            j_aij_colquhoun = { 
                name = "科尔昆", 
                text = { 
                    "所有卡牌在 {C:attention}计分{} 时",
                    "赚取 {C:money}$#1#{}，当 {C:attention}Boss盲注{}",
                    "被击败时，该金额增加 {C:money}$#2#{}"
                }, 
                unlock = { 
                    "?????"
                } 
            },
            j_aij_dor = { 
                name = "多尔", 
                text = { 
                    "在 {C:attention}回合{} 的 {C:attention}最后一手牌{}",
                    "提供 {X:dark_edition,C:white}#1#{} 倍率" 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_archy = { 
                name = "阿奇", 
                text = { 
                    "{C:money}商店{} 中所有初始的",
                    "{C:attention}卡牌{} 和 {C:attention}补充包{}",
                    "都是免费的" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_sommers = { 
                name = "萨默斯", 
                text = { 
                    "{C:attention}升级{} 所有",
                    "打出的牌型" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_pace = {
                name = "佩斯",
                text = {
                    {
                        "所有小丑牌的 {C:red}稀有度{}",
                        "在 {C:money}商店{} 中出现的几率",
                        "变为 {C:green}相等{}",
                        "{C:inactive}(传奇除外)"
                    },
                    {
                        "所有小丑牌售价为 {C:money}$#1#{}"
                    }
                },
                unlock = { "?????" }
            },
            j_aij_thomazina = {
                 name = "托马齐纳",
                 text = {
                    "计分的 {C:attention}数字牌{}",
                    "提供 {C:chips}+#1#{} 筹码。当一张 {C:attention}数字牌{}",
                    "计分时，该数值增加 {C:chips}+#2#{} 筹码"
                },
                unlock = { "?????" } },
            j_aij_mathurine = { name = "玛秋林", text = { "" }, unlock = { "?????" } },
            j_aij_guillaume = { 
                name = "纪尧姆", 
                text = { 
                    "如果以少于 {C:attention}5{} 张小丑牌",
                    "的阵容击败 {C:attention}Boss盲注{}，此小丑牌",
                    "提供 {C:dark_edition}+#2#{} 小丑牌槽位",
                    "{C:inactive}(当前为 {C:dark_edition}+#1#{C:inactive} 小丑牌槽位){}",
                },
                unlock = { "?????" } 
            },
            j_aij_tarlton = { 
                name = "塔尔顿", 
                text = { 
                    "提供等同于",
                    "本回合 {C:attention}上一次{} 打出的 {C:attention}牌型{}",
                    "的 {C:attention}总{} {C:chips}筹码{} 数量的筹码",
                    "{C:inactive}(当前为 {C:chips}+#1#{} {C:inactive}筹码){}",
                }, 
                unlock = { "?????" }
            },
            j_aij_roland = { name = "罗兰", text = { "" }, unlock = { "?????" } },
            j_aij_borra = { name = "博拉", text = { "" }, unlock = { "?????" } },
            j_aij_taillefer = { 
                name = "泰耶费尔", 
                text = { 
                    "每打出一次牌型，此小丑牌获得 {X:mult,C:white}X#2#{} 倍率，",
                    "在击败 {C:attention}#3#{} 个 {C:attention}Boss盲注{} 后发生",
                    "{C:red}自毁{}",
                    "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率，{C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive}){}",
                }, 
                unlock = { "?????" } 
            },
            j_aij_killigrew = {
                name = "基利格鲁",
                text = {
                    "每拥有一张 {C:attention}优惠券{}，",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white}X#2#{} {C:inactive}倍率){}",
                },
                unlock = { "?????" }
            },
            j_aij_dongfang = { name = "东方", text = { "" }, unlock = { "?????" } },
            j_aij_zerco = {
                name = "泽尔科",
                text = {
                    "为每个 {C:attention}回合{} {C:attention}第一张{}",
                    "计分的 {C:attention}卡牌{} 应用 {C:dark_edition}负片{} 版本",
                    "{C:inactive}(如果它没有现有版本)"
                },
                unlock = { "?????" } },
            j_aij_yu_sze = { 
                name = "虞四", 
                text = { 
                    "没有 {C:dark_edition}版本{} 的小丑牌",
                    "提供 {X:mult,C:white}X#1#{} 倍率" 
                },
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_brusquet = { name = "布吕斯凯", text = { "" }, unlock = { "?????" } },
            j_aij_rahere = { name = "拉希尔", text = { "" }, unlock = { "?????" } },
            j_aij_gonnella = { name = "贡内拉", text = { "" }, unlock = { "?????" } },
            j_aij_gong_gil = { name = "孔吉", text = { "" }, unlock = { "?????" } },
            j_aij_angoulevent = { 
                name = "昂古勒旺", 
                text = { 
                    "所有打出的牌",
                    "额外重新触发 {C:attention}#1#{} 次" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_coryat = { name = "科里亚特", text = { "" }, unlock = { "?????" } },
            j_aij_bluet = { 
                name = "布鲁埃", 
                text = { 
                    "选择 {C:attention}盲注{} 时，",
                    "生成一张 {C:dark_edition}负片{}",
                    "{C:spectral}幻灵{} 牌"
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_bebe = {
                 name = "贝贝",
                 text = {
                    "每回合 {C:blue}+#1#{} 次出牌",
                },
                 unlock = { "?????" } },
            j_aij_pipine = { 
                name = "皮平", 
                text = { 
                    "每回合 {C:red}+#1#{} 次弃牌" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_golitsyn = { name = "戈利岑", text = { "" }, unlock = { "?????" } },
            j_aij_buzheninova = { name = "布热尼诺娃", text = { "" }, unlock = { "?????" } },
            j_aij_yakov = { name = "雅科夫", text = { "" }, unlock = { "?????" } },
            j_aij_komar = { 
                name = "科马尔", 
                text = { 
                    "所有 {C:attention}计分{} 的牌获得的 {C:chips}筹码{}",
                    "会加上所有 {C:attention}其他{} 打出牌的",
                    "基础 {C:chips}筹码值{}" 
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_lavatch = {
                 name = "拉瓦奇",
                 text = {
                    "计分的 {C:clubs}梅花{} 提供 {X:mult,C:white}X#1#{} 倍率，",
                    "当一张 {C:clubs}梅花{} 计分时，",
                    "该倍率增加 {X:mult,C:white}X#2#{}",
                },
                 unlock = { "?????" } },
            j_aij_Ffwllier = { name = "福列尔", text = { "" }, unlock = { "?????" } },
            j_aij_martellino = {
                name = "马特利诺",
                text = {
                    "在 {C:attention}#2#{} 个回合后，{C:money}出售{} 此",
                    "小丑牌以从你的 {C:attention}收藏{} 中",
                    "生成 {C:attention}任意小丑牌{}",
                    "{C:inactive}(当前为 {C:attention}#1#{}{C:inactive}/#2#){}"
                },
                unlock = { "?????" }
            },
            j_aij_shir_ei = { name = "诗影", text = { "" }, unlock = { "?????" } },
            j_aij_xinmo = { name = "心魔", text = { "" }, unlock = { "?????" } },
            j_aij_chunyu = { name = "淳于琨", text = { "" }, unlock = { "?????" } },
            j_aij_fantasio = { 
                name = "范塔西奥", 
                text = { 
                    "所有牌都",
                    "视为 {C:attention}所有花色{}",
                }, 
                unlock = { 
                    "?????" 
                } 
            },
            j_aij_sexton = { name = "塞克斯顿", text = { "" }, unlock = { "?????" } },
            j_aij_dongtong = {
                name = "董同",
                text = {
                    {
                    "将大部分 {C:attention}小丑牌{}",
                    "的数值 {C:green}翻倍{}",
                    },
                    {
                        "将 {C:attention}盲注{} 的",
                        "{C:attention}分数要求{} 翻倍"
                    }
            },
                unlock = { "?????" }
            },
            j_aij_naiteh = {
                name = "乃特",
                text = {
                    "当 {C:attention}Boss盲注{} 被击败时，",
                    "手牌上限 {C:attention}+#2#{}",
                    "{C:inactive}(当前为 {C:attention}+#1#{C:inactive} 手牌上限)"
                },
                unlock = { "?????" }
            },
            j_aij_talhak = {
                name = "塔尔哈克",
                text = {
                    "当 {C:attention}Boss盲注{} 被击败时，",
                    "选择生成 {C:attention}任意{} 非隐藏的",
                    "{C:spectral}幻灵{} 牌",
                    "{C:inactive}(必须有空位)"
                },
                unlock = { "?????" }
            },
            j_aij_bozo = {
                name = "波佐",
                text = {
                    "当 {C:attention}Boss盲注{} 被",
                    "击败时，生成 {C:attention}#1#{} 张",
                    "随机的 {C:dark_edition}负片{} 小丑牌",
                },
                unlock = { "?????" }
            },
            j_aij_thalia = {
                name = "塔利亚",
                text = {
                    "如果回合的 {C:attention}第一次弃牌{}",
                    "恰好包含 {C:attention}1{} 张牌，它会",
                    "永久获得 {C:attention}+#1#{} 次重新触发"

                },
                unlock = { "?????" }
            },
        },
        Planet = {
            c_aij_vulcanoid = {
                name = "祝融星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_zoozve = {
                name = "祖兹维星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_luna = {
                name = "月球",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_phobos = {
                name = "火卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_europa = {
                name = "木卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_titan = {
                name = "土卫六",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_umbriel = {
                name = "天卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_triton = {
                name = "海卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_nix = {
                name = "冥卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_planet_nine = {
                name = "第九行星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_pallas = {
                name = "智神星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_dysnomia = {
                name = "阋卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_phaethon = {
                name = "法厄同星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_kamooalewa = {
                name = "震荡天星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_deimos = {
                name = "火卫二",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_callisto = {
                name = "木卫四",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_iapetus = {
                name = "土卫八",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_oberon = {
                name = "天卫四",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_proteus = {
                name = "海卫八",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_charon = {
                name = "冥卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_nibiru = {
                name = "尼比鲁星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_kuiper = {
                name = "柯伊伯带",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_rogue = {
                name = "流浪行星",
                text = {
                    '提升你的 {C:attention}小丑牌{}',
                    '所提到的 {C:attention}所有',
                    '牌型{} 的等级'
                }
            },
            c_aij_dark_star = {
                name = "暗星",
                text = {
                    '提升 {C:attention}所有{} 尚未被',
                    '{C:attention}打出{} 过的',
                    '牌型的等级'
                }
            },
            c_aij_sol = {
                name = "太阳",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#4#{} 倍率 和",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_weywot = {
                name = "维沃特星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_namaka = {
                name = "娜玛卡",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_ilmare = {
                name = "伊尔玛蕾",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_salacia = {
                name = "萨拉喀亚",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:mult}+#3#{} 倍率",
                }
            },
            c_aij_paper_ixion = {
                name = "伊克西翁",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_hiiaka = {
                name = "希亚卡",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_varda = {
                name = "瓦尔达",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            },
            c_aij_paper_mk2 = {
                name = "鸟卫一",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 提升等级",
                    "{C:attention}#2#{}",
                    "{C:chips}+#3#{} 筹码",
                }
            }
        },
        Spectral = {
            c_aij_gravastar = {
                name = '真空星',
                text = {
                    '{C:attention}升级{} 所有',
                    '{C:legendary,E:1}牌型{} 的',
                    '{C:chips}筹码{}'
                }
            },
            c_aij_pulsar = {
                name = '脉冲星',
                text = {
                    '{C:attention}升级{} 所有',
                    '{C:legendary,E:1}牌型{} 的',
                    '{C:mult}倍率{}'
                }
            },
            c_aij_shade = {
                name = '暗影',
                text = {
                    '为手中 {C:attention}#1#{} 张随机的',
                    '卡牌添加 {C:dark_edition}负片{} 版本'
                }
            },
            c_aij_trefle = {
                name = '三叶草',
                text = {
                    '{C:attention}重掷{} 一张',
                    '选定的 {C:attention}小丑牌{}',
                    "{C:inactive}(不能是永恒的){}"
                }
            },
            c_aij_trefle_controller = {
                name = '三叶草',
                text = {
                    '{C:attention}重掷{} 最',
                    '{C:attention}右侧{} 的小丑牌',
                    "{C:inactive}(不能是永恒的){}"
                }
            },
            c_aij_scopophobia = {
                name = '注视恐惧症',
                text = {
                    '{C:red}摧毁{} 一张随机的 {C:attention}小丑牌{}',
                    '以及 {C:attention}所有留在手中{} 的牌',
                }
            },
            c_aij_reshape = {
                name = '重塑',
                text = {
                    '将所有 {C:attention}小丑牌{} 变成',
                    '一张随机持有的 {C:attention}小丑牌{} 的复制品',
                    '{C:inactive}(小丑牌保留其原本的',
                    '{C:inactive}贴纸和版本)'
                }
            },
            c_aij_palmistry = {
                name = '手相术',
                text = {
                    '使手中所有的牌',
                    '获得一种随机的',
                    '{C:attention}增强{} 效果，',
                    '{C:red}-#1#{} 手牌上限'
                }
            },
            c_aij_gegenschein = {
                name = "对日照",
                text = {
                    '将所有 {C:attention}已打出过{} 的',
                    '{C:dark_edition}隐藏牌型{} 的等级',
                    '设为它们被',
                    '{C:attention}打出{} 过的',
                    '{C:attention}次数{}'
                }
            },
            c_aij_mirth = {
                name = '欢笑',
                text = {
                    '为手中 {C:attention}#1#{} 张',
                    '选定的卡牌',
                    '添加一个 {V:1}#2#{}'
                }
            },
        },
        Tag = {
            tag_aij_glimmer = {
                name = '微光标签',
                text = {
                    '下一张商店中的基础版本',
                    '小丑牌免费，并且',
                    '变为 {C:aij_plasma}微光{} 版本'
                }
            },
            tag_aij_silver = {
                name = '白银标签',
                text = {
                    '下一张商店中的基础版本',
                    '小丑牌免费，并且',
                    '变为 {C:aij_silver}白银{} 版本'
                }
            },
            tag_aij_stellar = {
                name = '星辰标签',
                text = {
                    '下一张商店中的基础版本',
                    '小丑牌免费，并且',
                    '变为 {C:aij_stellar}星辰{} 版本'
                }
            },
            tag_aij_aureate = {
                name = '鎏金标签',
                text = {
                    '下一张商店中的基础版本',
                    '小丑牌免费，并且',
                    '变为 {C:money}鎏金{} 版本'
                }
            },
            tag_aij_soulbound = {
                name = '灵魂绑定标签',
                text = {
                    '生成一张随机带有 {C:attention}易腐{} 的',
                    '{C:legendary}传奇{} 小丑牌',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_fortunate = {
                name = '幸运标签',
                text = {
                    '选择生成一张 {C:attention}任意{} {C:tarot}塔罗{} 牌',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_overstuffed = {
                name = '超载标签',
                text = {
                    "下一个打开的 {C:attention}补充包{}",
                    "包含 {C:attention}两倍{} 的",
                    "选项数量和可选数量"
                }
            },
            tag_aij_chaos = {
                name = '混沌标签',
                text = {
                    "触发一个 {C:red}随机{} 效果"
                }
            },
            -- 黄金标签
            tag_aij_windfall = {
                name = '横财标签',
                text = {
                    "使你的金钱 {C:money}翻三倍{}",
                    "{C:inactive}(最高 {C:money}$300{}{C:inactive})"
                }
            },
            tag_aij_unusual = {
                name = '非凡标签',
                text = {
                    "商店中提供一张免费的",
                    "{C:uncommon}罕见小丑牌{}，且其",
                    "数值 {C:attention}翻倍{}"
                }
            },
            tag_aij_recherche = {
                name = '珍奇标签',
                text = {
                    "商店中提供一张免费的",
                    "{C:rare}稀有小丑牌{}，且其",
                    "数值 {C:attention}翻倍{}"
                }
            },
            tag_aij_hermetic = {
                name = '炼金标签',
                text = {
                    '选择生成一张 {C:attention}非隐藏的{}',
                    '{C:spectral}幻灵{} 牌',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_dark_matter = {
                name = '暗物质标签',
                text = {
                    '为一张没有版本的',
                    '{C:attention}随机{} 小丑牌',
                    '应用 {C:dark_edition}负片{} 版本'
                }
            },
            tag_aij_crystal = {
                name = '水晶标签',
                text = {
                    '为一张 {C:attention}随机{} 小丑牌和',
                    '牌组中 {C:attention}#1#{} 张没有版本的卡牌',
                    '应用 {C:dark_edition}闪箔{} 版本'
                }
            },
            tag_aij_iridescent = {
                name = '虹彩标签',
                text = {
                    '为一张 {C:attention}随机{} 小丑牌和',
                    '牌组中 {C:attention}#1#{} 张没有版本的卡牌',
                    '应用 {C:dark_edition}镭射{} 版本'
                }
            },
            tag_aij_omnichrome = {
                name = '全彩标签',
                text = {
                    '为最 {C:attention}右侧{} 的基础版本',
                    '小丑牌应用 {C:dark_edition}幻彩{} 版本',
                }
            },
            tag_aij_circumplanetary = {
                name = '环行星标签',
                text = {
                    '将 {C:attention}最常打出的{}',
                    '{C:attention}牌型{} 升级',
                    '{C:attention}#1# 个等级{}',
                    '{C:inactive}(当前为 #2#)'
                }
            },
            tag_aij_velocity = {
                name = '速度标签',
                text = {
                    '获得 {C:money}$#1#{}，每经过一个 {C:attention}回合{}',
                    '减少 {C:money}$#2#{}',
                    '{C:inactive}(将提供 {C:money}$#3#{C:inactive})'
                }
            },
            tag_aij_capital = {
                name = '资本标签',
                text = {
                    '击败 Boss盲注',
                    '之后，',
                    '获得 {C:money}$#1#{}'
                }
            },
            tag_aij_bierstiefel = {
                name = '靴子杯标签',
                text = {
                    '用随机的 {C:common}普通{} 或',
                    '{C:uncommon}罕见{} 小丑牌填满',
                    '所有空置的 {C:attention}小丑牌槽位{}'
                }
            },
            tag_aij_ticket = {
                name = '门票标签',
                text = {
                    '{C:attention}兑换{} 一张随机的',
                    '优惠券及其',
                    '{C:attention}升级{} 版本'
                }
            },
            tag_aij_galloping_domino = {
                name = '奔腾多米诺标签',
                text = {
                    '下一个商店的 {C:attention}所有{} 重掷',
                    '费用均为 {C:money}$#1#{}'
                }
            },
            tag_aij_gioco = {
                name = '游戏标签',
                text = {
                    '下一回合手牌上限',
                    '{C:attention}翻倍{}',
                }
            },
            tag_aij_stereoscopic = {
                name = '立体标签',
                text = {
                    '提供一份下一个被选择的 {C:attention}标签{} 的',
                    '{C:money}黄金{} 复制品',
                    '{s:0.8,C:attention}双倍标签{s:0.8} 除外',
                }
            },
            tag_aij_frugal = {
                name = '节俭标签',
                text = {
                    '下一个商店里的',
                    '{C:attention}所有{} 卡牌和补充包',
                    '均免费',
                }
            },
            tag_aij_dominus = {
                name = '主宰标签',
                text = {
                    '选择 {C:attention}任意 Boss盲注{} 来',
                    '替换当前的盲注'
                }
            },
            tag_aij_nonstandard = {
                name = '非标准标签',
                text = {
                    '生成一张 {C:attention}自定义游戏牌{}，',
                    '并将 2 张复制品添加到牌组中',
                }
            },
            tag_aij_ignoramus = {
                name = '无知者标签',
                text = {
                    '选择生成 {C:attention}任意{} 一张',
                    '{C:common}普通{} 或 {C:uncommon}罕见{} 小丑牌',
                    '{C:inactive}(必须有空位)'
                }
            },
            tag_aij_occult = {
                name = '神秘标签',
                text = {
                    '生成 {C:attention}3 张 {C:tarot}塔罗{} 牌',
                    '和 {C:attention}2 张 {C:spectral}幻灵{} 牌', 
                    '{s:0.8}它们带有 {s:0.8,C:dark_edition}负片{} 版本',
                }
            },
            tag_aij_asteroid = {
                name = '小行星标签',
                text = {
                    '提供一个免费的',
                    '{C:planet}天体包{}，其中包含', 
                    '{C:dark_edition}黑洞{}、{C:dark_edition}脉冲星{}',
                    '和 {C:dark_edition}真空星{}',
                }
            },
            tag_aij_polydactyly = {
                name = '多指标签',
                text = {
                    '本次游戏中每次未使用的 {C:blue}出牌次数{}，',
                    '在下回合提供 {C:blue}+1 次出牌{}', 
                    '{C:inactive}(将提供 {C:blue}+#1#{C:inactive} 次出牌)',
                    '{C:inactive}(最高 {C:blue}+40{C:inactive} 次出牌)'
                }
            },
            tag_aij_landfill = {
                name = '垃圾填埋场标签',
                text = {
                    '本次游戏中每 {C:red}弃掉{} 一张牌',
                    '提供 {C:money}$1{}', 
                    '{C:inactive}(将提供 {C:money}$#1#{C:inactive})',
                }
            },
            tag_aij_cinema = {
                name = '电影院标签',
                text = {
                    '为最 {C:attention}左侧{} 的基础版本',
                    '小丑牌应用',
                    '{C:aij_silver}白银{} 版本',
                }
            },
            tag_aij_ventripotent = {
                name = '大肚汉标签',
                text = {
                    "下一个打开的 {C:attention}补充包{}",
                    "包含 {C:attention}两倍{} 的选项数量，",
                    "且可以选择 {C:attention}无限{} 次"
                }
            },
            tag_aij_timelost = {
                name = '迷失时间标签',
                text = {
                    '提供一个免费的 {C:purple}笑语',
                    '{C:purple}猜谜包{}，其中包含',
                    '{C:attention}5{} 个带有易腐贴纸的选项',
                }
            },
            tag_aij_auspicious = {
                name = '吉祥标签',
                text = {
                    '生成 {C:attention}3{} 张一张你所选择的',
                    '{C:tarot}塔罗{} 牌的',
                    '{C:dark_edition}负片{} 复制品'
                }
            },
            tag_aij_glamour = {
                name = '魅力标签',
                text = {
                    '为 {C:attention}2 张随机{} 没有版本的',
                    '小丑牌应用',
                    '{C:aij_plasma}微光{} 版本'
                }
            },
            tag_aij_superlunary = {
                name = '天上标签',
                text = {
                    '为一张 {C:attention}随机{} 小丑牌和',
                    '牌组中 {C:attention}#1#{} 张没有版本的卡牌',
                    '应用 {C:aij_stellar}星辰{} 版本'
                }
            },
            tag_aij_gold_dust = {
                name = '金粉标签',
                text = {
                    '为牌组中 {C:attention}#1#{} 张没有版本的卡牌',
                    '应用 {C:money}鎏金{} 版本'
                }
            },
            tag_aij_anarchy = {
                name = '无政府标签',
                text = {
                    '具有一个 {C:red}随机{} 的效果{C:red}！！！'
                }
            },
        },
        Tarot = {
            c_aij_magus = {
                name = '魔术师',
                text = {
                    "将 {C:attention}#1#{} 张选定的卡牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sanctuary_gate = {
                name = '圣所之门',
                text = {
                    "将 {C:attention}#1#{} 张",
                    "选定的卡牌增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_isis_urania = {
                name = '伊西斯-乌拉尼亚',
                text = {
                    "将 {C:attention}#1#{} 张选定的卡牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_cubic_stone = {
                name = '立方石',
                text = {
                    "将 {C:attention}#1#{} 张选定的卡牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_master_arcanes = { 
                name = '奥术大师',
                text = {
                    "有 {C:green}#1# / #2#{} 的几率",
                    "生成一张随机的",
                    "{C:spectral}幻灵{} 牌",
                    '{C:inactive}(必须有空位)'
                }
            },
            c_aij_two_ways = {
                name = '两条路',
                text = {
                    "将 {C:attention}#1#{} 张选定的卡牌拆分",
                    "为 {C:attention}2{} 张复制品，其 {C:attention}点数{}",
                    "为原牌的 {C:attention}一半{}",
                    "{C:inactive}(奇数牌会尽可能平均分配){}",
                    "{C:inactive}(A=14, K=13, Q=12, J=11)"
                }
            },
            c_aij_osiris = {
                name = '奥西里斯',
                text = {
                    "{C:red}摧毁{} {C:attention}1{} 张选定的",
                    "小丑牌，并赚取其",
                    "{C:money}出售价值{} 三倍的金额",
                    "{C:inactive}(当前为 {C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_osiris_controller = {
                name = '奥西里斯',
                text = {
                    "{C:red}摧毁{} 最 {C:attention}右侧{} 的",
                    "小丑牌，并赚取其",
                    "{C:money}出售价值{} 三倍的金额",
                    "{C:inactive}(当前为 {C:money}$#1#{}{C:inactive}){}"
                }
            },
            c_aij_balance_and_blade = {
                name = '天平与剑',
                text = {
                    "将一个随机的补丁",
                    "{C:attention}缝合{} 到 {C:attention}#1#{} 张选定的牌上"
                }
            },
            c_aij_veiled_lamp = {
                name = '蒙着面纱的灯',
                text = {
                    "将 {C:attention}#1#{} 张选定的卡牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_sphinx = {
                name = '斯芬克斯',
                text = {
                    "将 {C:attention}#1#{} 张选定的卡牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_tamed_lion = {
                name = '被驯服的狮子',
                text = {
                    "将 {C:attention}#1#{} 张选定的卡牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_aij_broken_fate = {
                name = '破碎的命运',
                text = {
                    "将最 {C:attention}左侧消耗牌{} 的数值",
                    "随机化为其 {C:attention}默认{} 数值的",
                    "{C:attention}X0.75{} 到 {C:attention}X2.5{} 之间"
                }
            },
        },
        Other = {
            aij_patches_suit = {
                name = "补丁",
                text = {
                    "被视为一张 {V:1}#1#"
                }
            },
            aij_jest_mark_of_the_spear = {
                name = "长矛标记",
                text = {
                    '这张 {C:attention}牌{} 已经被',
                    '{C:attention}长矛{} 永久 {C:red}削弱{}'
                }
            },
            card_extra_retriggers = {
                text={
                    "将这张牌额外重新触发 {C:attention}#1#{} 次",
                },
            },
            showdown_blind = {
                name = "决胜盲注",
                text = {
                    "每经过 {C:attention}#1#{} 个底注",
                    "就会出现的 {C:attention}Boss盲注{}",
                }
            },
            reroll_joker = {
                name = "重掷",
                text = {
                    '将小丑牌替换为',
                    '一张相同稀有度的',
                    '随机小丑牌'
                }
            },
            office_assistant_perishable = {
                name = "易腐",
                text = {
                    '花费 {C:money}$3{} {C:attention}重置{}',
                    '{C:attention}易腐{} 小丑牌的计数器'
                }
            },
            office_assistant_rental = {
                name = "租赁",
                text = {
                    '花费小丑牌的 {C:money}基础价格{}',
                    '移除 {C:attention}租赁{} {C:attention}贴纸{}'
                }
            },
            overdesigned_club = {
                name = "梅花",
                text = {
                    "计分的 {C:clubs}梅花{}",
                    "提供 {C:mult}+#1#{} 倍率",
                }
            },
            overdesigned_spade = {
                name = "黑桃",
                text = {
                    "计分的 {C:spades}黑桃{}",
                    "提供 {C:chips}+#1#{} 筹码",
                }
            },
            overdesigned_diamond = {
                name = "方块",
                text = {
                    "计分的 {C:diamonds}方块{}",
                    "赚取 {C:money}$#1#{}",
                }
            },
            overdesigned_heart = {
                name = "红桃",
                text = {
                    "计分的 {C:hearts}红桃{}",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                }
            },
            p_aij_guess_the_jest = {
                name = "笑语猜谜包",
                text = {
                    '从 {C:attention}#2#{} 张隐藏的',
                    '{C:legendary,E:2}传奇{} 小丑牌中选择 {C:attention}#1#{} 张'
                }
            },
            m_aij_dyscalcular_numbered_rank = {
                name = "数字点数",
                text = {
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, {C:attention}5{}, {C:attention}6{},",
                    "{C:attention}7{}, {C:attention}8{}, {C:attention}9{}, 以及 {C:attention}10{}",
                }
            },
            palindrome = {
                name = "回文数",
                text = {
                    "正反读都 {C:attention}相同{} 的",
                    "多位数数字",
                    "{C:inactive}例: 33, 151, 3003{}"
                }
            },
            guess_the_jest_hidden={
                name="???",
                text={
                    "{C:inactive,E:1,s:1.5}???{}",
                },
            },
            -- 贴纸
            aij_marked = {
                name = "被标记",
                text = {
                    '无法 {C:blue}打出{}',
                    '或 {C:red}弃掉{}'
                }
            },
            aij_unusual_doubled = {
                name = "双倍",
                text = {
                    '{C:attention}X2{} 效果',
                    '{C:inactive,s:0.8}(由非凡标签赋予){}'
                }
            },
            aij_recherche_doubled = {
                name = "双倍",
                text = {
                    '{C:attention}X2{} 效果',
                    '{C:inactive,s:0.8}(由珍奇标签赋予){}'
                }
            },
            -- (并非贴纸但被当作贴纸处理)
            aij_jest_chaotic_card = {
                name = "混沌",
                text = {
                    "{X:mult,C:white} X#1# {} 倍率",
                    "被打出后，其 {C:edition}增强{} 效果",
                    "会被 {C:attention}随机化{}",
                }
            },
            -- 蜡封
            aij_smiley_seal = {
                name = "笑脸蜡封",
                text = {
                    '当被 {C:red}摧毁{} 时，',
                    '为 {C:attention}#1#{} 张随机的 {C:attention}小丑牌{}',
                    '应用一种版本'
                }
            },
            aij_melted_seal = {
                name = "融化蜡封",
		        text = {
                    '当 {C:attention}留在手中{} 时，',
                    '{C:attention}转变{} 为第一种',
                    '计分的非 {V:1}融化{} {C:attention}蜡封{}'
		        }
            },
            nevernamed_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}- 制作了所有的美术资产", 
                    "{s:0.8}- 构思了大约一半的效果",
                    "{s:0.8}- 于 2024 年 12 月开始创作 Balatro 美术"
                    
                }
            },
            survivalaren_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}- 编写了大约一半的内容代码", 
                    "{s:0.8}- 构思了大约一半的效果",
                    "{s:0.8}- 最初发起此模组的人",
                    "{s:0.8}- 进行了大量的游玩测试",
                    "{s:0.8}- 于 2025 年 4 月初创建此模组"
                }
            },
            rattling_snow_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}- 编写了大部分高级进阶代码",
                    "{s:0.8}- 编写了几乎所有的 UI 代码",
                    "{s:0.8}- 编写了所有的着色器(Shader)代码",
                    "{s:0.8}- 于 2025 年 4 月末加入团队"
                }
            },
            jumbocarrot_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}- 为错误修复和细节打磨提供了巨大帮助",
                    "{s:0.8}- 说真的，修复了非常非常多的 Bug",
                    "{s:0.8}- 于 2025 年 9 月加入团队"
                }
            },
            heavenbrand_credits_info = {
                name = "信息",
                text = {
                    "{s:0.8}- 制作了 All in Jest 的宣传片及其配乐",
                    "{s:0.8}- 制作了白银(Silver)和鎏金(Aureate)的音效",
                    "{s:0.8}- 提供了大量有用的游玩测试和反馈",
                    "{s:0.8}- 于 2026 年 2 月开始参与 All in Jest 的工作"
                }
            },
        }
    }
}
