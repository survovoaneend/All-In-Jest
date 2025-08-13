--ALOPHRINE的个人汉化修正！如遇到问题请联系我。QQ与B站同名
--vergenti Q群：奇小苦、:)，对部分汉化进行了修正，包括需要代码修改的丑
return {
    misc = {
        dictionary = {
            k_moon = "卫星牌",
            k_moon_q = "卫星牌？",
            k_star = "恒星牌",
            k_star_q = "恒星牌？",
            k_asteroid = "小行星牌",
            aij_requires_restart = "需要重启",
            aij_enable_moons = "启用卫星牌",
            k_aij_guess_the_jest = "笑语猜谜",
            aij_alter_trypophobia = "是否和谐“密集恐惧”",
            aij_no_copy_neg = "允许复制负片卡牌",
            k_aij_memory_card = "已铭记！",
            aij_plus_tag = "标签+1",
        },
        labels = {
            aij_glimmer = "微光",
            aij_stellar = "星辰",
        }
    },
    descriptions = {
        Back = {
            b_aij_fabled = {
                name = '传奇牌组',
                text = {
                    '{C:legendary,E:1}传奇{}小丑牌可能',
                    '出现在{C:attention}商店{}',
                    '{C:attention}-1{}小丑牌槽位'
                },
                unlock = {
                    '解锁一张',
                    '{C:legendary,E:1}传奇{}小丑牌',
                }
            },
            b_aij_fabled_hidden = {
                name = '传奇牌组',
                text = {},
                unlock = {
                    '?????',
                }
            }
        },
        Enhanced = {
            m_aij_fervent = {
                name = "狂热牌",
                text = {
                    "打出时{C:chips}+#2#{}筹码"
                }
            },
            m_aij_dyscalcular = {
                name = "失算牌",
                text = {
                    "视为所有{C:attention}数字{}牌",
                    "{C:inactive}（不用于组成牌型）"
                }
            },
            m_aij_charged = {
                name = "充能牌",
                text = {
                    "若与此牌一同{C:attention}打出{}",
                    "或{C:attention}手牌{}中包含此牌",
                    "{C:attention}增强效果{}获得 {C:attention}#1#％{}加成",
                }
            },
        },
        Edition = {
            e_aij_glimmer = {
                name = "微光",
                text = {
                    "{C:aij_plasma}平衡{}{C:attention}#1#%{} 的",
                    "{C:mult}倍率{} 和 {C:chips}筹码"
                }
            },
            e_aij_stellar = {
                name = "星辰",
                text = {
                    "根据打出的牌型{C:attention}等级{}",
                    "每级 {C:chips}+#1#{} 筹码和 {C:mult}+#2#{}倍率"
                }
            },
        },
        Joker = {
            j_aij_flying_ace = {
                name = "空中王牌",
                text = {
                    "本回合中，每打出一张",
                    "独特{C:attention}花色{}的{C:attention}A{}",
                    "回合结束时获得 {C:money}$#1#{} ",
                    "{C:inactive}（当前为{} {C:money}$#2#{}{C:inactive}）"
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
                    "将所有打出的 {C:attention}#1#{}",
                    "变为 {C:attention}#2#{}牌",
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
                    "{C:attention}K{}、{C:attention}Q{} 和 {C:attention}J",
                    "{C:inactive}（不用于组成牌型）"
                }
            },
            j_aij_handsome_joker = { name = "帅气小丑", text = { "" } },
            j_aij_whiteface_grotesque = { name = "白面怪诞", text = { "" } },
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
            j_aij_pierrot = { name = "皮耶罗", text = { "" } },
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
                    "{C:inactive}（当前为{} {X:mult,C:white}X#2#{}{C:inactive} 倍率）",
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
            j_aij_old_joker = { name = "老小丑", text = { "" } },
            j_aij_imageboard = { name = "图版", text = { "" } },
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
                    "有 {C:green}#1#/#2#{} 的几率变为{C:dark_edition}负片{}"
                },
            },
            j_aij_doodle = {
                name = "涂鸦",
                text = {
                    "有 {C:green}#1#/#2#{} 的几率复制",
                    "相邻两个{C:attention}小丑牌{}的{C:attention}能力{}"
                },
            },
            j_aij_joqr = { name = "小丑牌（音译）", text = { "" } },
            j_aij_greasepaint = { name = "油彩", text = { "" } },
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
            j_aij_pell_mel = { name = "杂乱", text = { "" } },
            j_aij_pput_together = { name = "组合", text = { "" } },
            j_aij_krampus = {
                name = "坎卜斯",
                text = {
                    "打出的{C:attention}黄金牌{}",
                    "会变为{C:attention}石头牌{}",
                    "{C:attention}石头牌{}打出时",
                    "获得 {C:money}$#1#{} "
                },
            },
            j_aij_art_of_the_deal = {
                name = "交易艺术",
                text = {
                    "每当获得{C:money}金钱{}时",
                    "{C:mult}+#2#{}倍率",
                    "如果{C:money}金钱{}为{C:money}$0{}或更少",
                    "效果重置",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive} 倍率）"
                }
            },
            j_aij_word_art = {
                name = "文字艺术",
                text = {
                    "打出的牌型中每包含一张",
                    "{C:attention}A{}、{C:attention}K{}、{C:attention}Q{} 或 {C:attention}J{}",
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
                    "给予 {C:mult}+#1#{}倍率"
                },
            },
            j_aij_paper_bag = { name = "纸袋", text = { "" } },
            j_aij_fruity_joker = { name = "水果小丑", text = { "" } },
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
            j_aij_cool_joker = { name = "酷小丑", text = { "" } },
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
                    "减少 {C:mult}-#2#{}倍率",
                }
            },
            j_aij_wireframe = { name = "线框图", text = { "" } },
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
                    "{C:green}#1#/#2#{} 的几率{C:attention}再次触发{}"
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
                    "{C:green}重掷{}费用减少 {C:money}$#1#{}",
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
                    "此小丑牌获得 {C:mult}+#2#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{} {C:inactive}倍率）"
                }
            },
            j_aij_polybius = { name = "波利比乌斯", text = { "" } },
            j_aij_joker_sighting = { name = "小丑目击", text = { "" } },
            j_aij_pencil_drawing = { name = "铅笔画", text = { "" } },
            j_aij_holy_bible = { name = "圣经", text = { "" } },
            j_aij_great_white_north = { name = "大白北方", text = { "" } },
            j_aij_right_angle = { name = "直角", text = { "" } },
            j_aij_adoring_joker = {
                name = "崇拜小丑",
                text = {
                    "{C:attention}小丑牌{}触发后",
                    "将{C:mult}倍率{}设为你在当前{C:attention}底注{}中",
                    "达到过的最高{C:mult}倍率{}",
                    "{C:inactive}（当前为{C:mult}#1# {C:inactive}倍率）"
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
            j_aij_punch_and_judy = { name = "潘趣与朱迪", text = { "" } },
            j_aij_nature_tapes = { name = "自然磁带", text = { "" } },
            j_aij_low_priest = { name = "低级牧师", text = { "" } },
            j_aij_oil_and_water = { name = "水火不容", text = { "" } },
            j_aij_big_ears = { name = "大耳朵", text = { "" } },
            j_aij_causal_absent_paranoia = { name = "因果缺席妄想", text = { "" } },
            j_aij_hand_drawn = { name = "手绘", text = { "" } },
            j_aij_haruspex = { name = "预言家", text = { "" } },
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
                    "此小丑牌的{C:money}出售价值{}增加 {C:money}$#1#{}"
                },
            },
            j_aij_bad_apple = { name = "坏苹果", text = { "" } },
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
                    "获得 {X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}）"
                },
            },
            j_aij_zanni = { name = "赞尼", text = { "" } },
            j_aij_furbo_e_stupido = {
                name = "黠与愚",
                text = {
                    "{C:attention}失算牌{}同时视为",
                    "{C:attention}A{}和{C:attention}J{}"
                }
            },
            j_aij_read_em_and_weep = { name = "看牌哭泣", text = { "" } },
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
            j_aij_silver_screen = { name = "银幕", text = { "" } },
            j_aij_pedrolino = { name = "佩德罗利诺", text = { "" } },
            j_aij_pierrette = { name = "皮耶雷特", text = { "" } },
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
            j_aij_sunny_joker = { name = "阳光小丑", text = { "" } },
            j_aij_red_wine = { name = "红酒", text = { "" } },
            j_aij_mute_joker = { name = "沉默小丑", text = { "" } },
            j_aij_scapino = { name = "斯卡皮诺", text = { "" } },
            j_aij_pinhead = {
                name = "针头",
                text = {
                    "如果{C:attention}单手牌{}击败{C:attention}盲注{}",
                    "获得 {C:money}$#1#{}"
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
            j_aij_j_file = { name = "J档案", text = { "" } },
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
                    "则{C:chips}+#1#{} 筹码"
                },
            },j_aij_clowns_on_parade = {
                name = "游行小丑",
                text = {
                    "如果打出的牌型中包含至少三张{C:attention}2{}",
                    "此{C:attention}小丑牌{}获得 {C:chips}+#2#{} 筹码",
                    "{C:inactive}（当前为{} {C:chips}+#1#{} {C:inactive}筹码）"
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
                    "购买的{C:attention}消耗品{}有 {C:green}#1#/#2#{} 的几率",
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
            j_aij_little_boy_blue = { name = "小蓝孩", text = { "" } },
            j_aij_big_red = { name = "大红", text = { "" } },
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
            j_aij_honker = { name = "响鼻（汽车喇叭声）", text = { "" } },
            j_aij_mummy = { name = "木乃伊", text = { "" } },
            j_aij_sitcom = { name = "情景喜剧", text = { "" } },
            j_aij_in_vino_veritas = { name = "酒后吐真言", text = { "" } },
            j_aij_beefeater = { name = "伦敦塔守卫", text = { "" } },
            j_aij_tetraphobia = {
                name = "惧四症",
                text = {
                    "每{C:red}弃掉{}一张{C:attention}4{}",
                    "此小丑牌获得 {C:mult}+#2#{}倍率",
                    "打出的{C:attention}4{}计分时重置",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive} 倍率）"
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
                    "{C:aij_plasma}平衡{}打出{C:attention}牌型{}的{C:attention}基础{} {C:chips}筹码{}和{C:mult}倍率{}"
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
                    "{C:chips}+#1#{} 筹码",
                },
            },
            j_aij_giocoliere = {
                name = "手技艺人",
                text = {
                    "在每个{C:attention}Boss盲注{}期间",
                    "手牌上限{C:attention}+3{}"
                },
            },
            j_aij_spectre = { name = "幽灵", text = { "" } },
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
                    "{C:money}金色蜡封{}，获得 {C:money}$#2#{}",
                    "{C:inactive}（当前为{C:money}$#1#{C:inactive}）"
                },
            },
            j_aij_peeping_tom = { name = "偷窥狂汤姆", text = { "" } },
            j_aij_la_commedia_e_finita = {
                name = "喜剧终章",
                text = {
                    "当一张{C:attention}人头牌{}被摧毁时",
                    "此小丑牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive} 倍率）"
                },
            },
            j_aij_straight_to_hell = {
                name = "直奔地狱",
                text = {
                    "当一个{C:attention}顺子{}被{C:attention}弃掉{}时",
                    "这张小丑牌获得 {X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive} 倍率）"
                },
            },
            j_aij_guiser = {
                name = "假面伶人",
                text = {
                    "每使用一张{C:tarot}塔罗牌{}",
                    "这张小丑牌{C:attention}出售价值{}增加 {C:money}$#1#{}"
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
                    "获得其他{C:attention}小丑牌{} ",
                    "{C:money}出售价值{}的{C:attention}20%{}",
                    "向上取整",
                    "{C:inactive}（当前为{} {C:money}$#1#{}{C:inactive}）"
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
            j_aij_arlecchino = { name = "阿莱基诺", text = { "" } },
            j_aij_arlecchina = { name = "阿莱基娜", text = { "" } },
            j_aij_taikomochi = {
                name = "太鼓持",
                text = {
                    "每张手牌中持有的{C:attention}J{}",
                    "给予{C:chips}+#1#{} 筹码"
                }
            },
            j_aij_sudoku = {
                name = "数独",
                text = {
                    "每次连续打出包含",
                    "{C:attention}顺子{}的牌型",
                    "此小丑牌获得 {X:mult,C:white}X#1#{}倍率",
                    "打出其他牌型时重置",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive} 倍率）"
                }
            },
            j_aij_gnasher = { name = "磨牙者", text = { "" } },
            j_aij_executioner = {
                name = "刽子手",
                text = {
                    "每当一张{C:attention}人头牌{}被摧毁时",
                    "此小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive} 筹码）"
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
            j_aij_rodeo_clown = { name = "牛仔小丑", text = { "" } },
            j_aij_joculator = { name = "小丑（Joculator）", text = { "" } },
            j_aij_scurra = {
                name = "嘲弄者",
                text = {
                    "所有打出并带有{C:red}红色蜡封{}的牌",
                    "额外触发{C:attention}#1#{}次"
                },
            },
            j_aij_pigpen = { name = "猪圈", text = { "" } },
            j_aij_cyclops = { name = "独眼巨人", text = { "" } },
            j_aij_blarney_stone = { name = "布拉尼石", text = { "" } },
            j_aij_sticker = {
                name = "贴纸",
                text = {
                    "每张特殊{C:attention}贴纸{}",
                    "提供{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                }
            },
            j_aij_feedback_form = { name = "反馈表", text = { "" } },
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
                    "若打出的牌仅有{C:spades}黑桃{} {C:attention}K{}",
                    "则这张小丑牌获得 {C:chips}+#1#{} 筹码",
                    "{C:inactive}（当前为{} {C:chips}+#2#{C:inactive} 筹码）",
                },
            },
            j_aij_charles = {
                name = "查理大帝",
                text = {
                    "若打出的牌仅有{C:hearts}红桃{} {C:attention}K{}",
                    "此小丑牌获得 {X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{} {X:mult,C:white}X#2#{C:inactive} 倍率）",
                },
            },
            j_aij_cesar = {
                name = "凯撒大帝",
                text = {
                    "回合结束时获得 {C:money}$#1#{}",
                    "如果打出的牌仅有{C:diamonds}方片{} {C:attention}K{}",
                    "额外增加 {C:money}$#2#{} "
                },
            },
            j_aij_alexandre = {
                name = "亚历山大大帝",
                text = {
                    "若打出的牌仅有{C:clubs}梅花{} {C:attention}K{}",
                    "此小丑牌获得 {C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{} {C:mult}+#2#{C:inactive} 倍率）",
                },
            },
            j_aij_sannio = { name = "萨尼奥", text = { "" } },
            j_aij_stock_photo = { name = "图库照片", text = { "" } },
            j_aij_fou_du_roi = {
                name = "宫廷弄臣",
                text = {
                    "若打出的牌型包含一张{C:attention}K{}或{C:attention}Q{}",
                    "有 {C:green}#2# 分之 #1#{} 的几率生成一张{C:tarot}塔罗牌{}",
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
            j_aij_infuriating_note = { name = "恼人纸条", text = { "" } },
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
                text = { "" } 
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
            j_aij_lost_carcosa = { name = "失落的卡尔科萨", text = { "" } },
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
                    "这张小丑牌获得 {C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{} {C:chips}+#2#{C:inactive} 筹码）"
                },
            },j_aij_spiders_georg = { name = "蜘蛛乔治", text = { "" } },
            j_aij_gille = { name = "吉尔", text = { "" } },
            j_aij_fulehung = { name = "福勒洪", text = { "" } },
            j_aij_bearded_joker = {
                name = "胡子小丑",
                text = {
                    "牌组中每有一张{C:attention}增强{}牌",
                    "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{}{C:inactive} 倍率）"
                }
            },
            j_aij_skomorokh = { name = "斯科莫罗赫", text = { "" } },
            j_aij_silly_billy = { name = "傻比利", text = { "" } },
            j_aij_ijoker_co = { name = "i小丑公司", text = { "" } },
            j_aij_corpse_paint = {
                name = "尸脸彩绘",
                text = {
                    "移除计分的牌的{C:dark_edition}负片{}效果",
                    "每移除一张，此小丑牌有 {C:green}#2#/#1#{} 的几率",
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
                    "{C:inactive}（当前为{} {C:mult}+#2#{}{C:inactive} 倍率）"
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
            j_aij_the_artist = { name = "艺术家", text = { "" } },
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
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{} {C:inactive}倍率）"
                }
            },
            j_aij_chippy = {
                name = "碎屑小筹",
                text = {
                    "此小丑牌获得与",
                    "所花费过{C:money}金钱{}的总额数相等的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive} 筹码）",
                }
            },
            j_aij_hofnarr_the_barbarian = {
                name = "野蛮人霍夫纳尔",
                text = {
                    "{C:mult}+#1#{}倍率",
                    "在{C:attention}决胜盲注{}中禁用",
                    "并提供 {X:mult,C:white}X#2#{}倍率"
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
                    "回合结束时，此小丑牌获得 {C:chips}+#2#{} 筹码",
                    "和 {C:money}$#3#{} 的{C:attention}出售价值{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive} 筹码）",
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
            j_aij_mandrake = { name = "曼德拉草", text = { "" } },
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
                    "跳过{C:attention}盲注{}时额外增加 {C:money}$#2#{}",
                }
            },
            j_aij_machine_intelligence = { name = "机器智能", text = { "" } },
            j_aij_grandma = { name = "奶奶", text = { "" } },
            j_aij_funny_money = { name = "假钞", text = { "" } },
            j_aij_witchfinder = { name = "巫师猎人", text = { "" } },
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
                    "至{C:attention}2的整数次幂"
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
                    "商店中额外提供{C:attention}+#1#{} 个",
                    "{C:attention}优惠券{}可供购买"
                }
            },
            j_aij_whatsisname = {
                name = "那个谁",
                text = {
                    "{C:attention}笑语猜谜包{}更容易出现"
                }
            },
            j_aij_downing_street = { name = "唐宁街", text = { "" } },
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
            j_aij_tilty_joker = { name = "倾斜小丑", text = { "" } },
            j_aij_opening_move = { name = "开局", text = { "" } },
            j_aij_bartender = { name = "酒保", text = { "" } },
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
            j_aij_mr_catfish = { name = "鲶鱼先生", text = { "" } },
            j_aij_angel_number = {
                name = "天使数字",
                text = {
                    "本回合每张计分的{C:attention}7{}",
                    "所有{C:green}概率{}{C:attention}+#1#{}",
                    "每回合重置"
                }
            },
            j_aij_doctors_orders = { name = "医嘱", text = { "" } },
            j_aij_blue_eyes_white_joker = {
                name = "蓝眼白丑",
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
            j_aij_mocap = { name = "动作捕捉", text = { "" } },
            j_aij_stagehand = { name = "舞台工作人员", text = { "" } },
            j_aij_the_mermaid = { name = "美人鱼", text = { "" } },
            j_aij_electric_snow = { name = "电雪", text = { "" } },
            j_aij_colour_test = { name = "色彩测试", text = { "" } },
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
                    "{X:chips,C:white}X#1#{} 筹码",
                    "回合结束时失去 {X:chips,C:white}X#2#{} 筹码"
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
            j_aij_joker_png = { name = "小丑.png", text = { "" } },
            j_aij_kuruko = { name = "库鲁科", text = { "" } },
            j_aij_candy_floss = {
                name = "棉花糖",
                text = {
                    "{C:aij_plasma}平衡{} {C:mult}倍率{}和{C:chips}筹码{} 的{C:attention}#1#%{}",
                    "回合结束时减少{C:attention}#2#%{} "
                }
            },
            j_aij_stargazy_pie = {
                name = "观星派",
                text = {
                    "下{C:attention}#1#{}张使用的{C:planet}星球牌{}",
                    "效果重新触发"
                }
            },
            j_aij_gameshow = { name = "游戏节目", text = { "" } },
            j_aij_bonus_pay = {
                name = "额外薪酬",
                text = {
                    "打出{C:attention}奖励牌{}时",
                    "获得 {C:money}$#1#{}"
                }
            },
            j_aij_illuminated_joker = { name = "启迪小丑", text = { "" } },
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
            j_aij_astrologer = { name = "占星家", text = { "" } },
            j_aij_planetarium = { name = "天文馆", text = { "" } },
            j_aij_stargazer = { name = "观星者", text = { "" } },
            j_aij_skald = { name = "吟游诗人", text = { "" } },
            j_aij_sky_trees = { name = "天空树", text = { "" } },
            j_aij_the_freezer = { name = "冰柜", text = { "" } },
            j_aij_twisted_pair = { name = "双绞线", text = { "" } },
            j_aij_the_grim_joker = { name = "冷酷小丑", text = { "" } },
            j_aij_lexicon = { name = "词典", text = { "" } },
            j_aij_dendroglpyh = { name = "树木雕刻", text = { "" } },
            j_aij_prank_caller = { name = "恶作剧电话", text = { "" } },
            j_aij_arngren = { name = "阿恩格伦", text = { "" } },
            j_aij_blacklist = { name = "黑名单", text = { "" } },
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
            j_aij_remina = { name = "蕾米娜", text = { "" } },
            j_aij_jpeg = { name = ".jpeg", text = { "" } },
            j_aij_sherrif = { name = "警长", text = { "" } },
            j_aij_alien_joker = { name = "外星小丑", text = { "" } },
            j_aij_nobody = { name = "无名小卒", text = { "" } },
            j_aij_broken_dreams = { name = "破碎的梦想", text = { "" } },
            j_aij_elf = { name = "精灵", text = { "" } },
            j_aij_fall_of_count_chaligny = { name = "沙利尼伯爵之陨", text = { "" } },
            j_aij_coulrorachne = { name = "库尔罗拉克妮", text = { "" } },
            j_aij_bad_sun = { name = "坏太阳", text = { "" } },
            j_aij_lemarchand_cube = { name = "勒马尔尚魔方", text = { "" } },
            j_aij_duende = { name = "杜恩德", text = { "" } },
            j_aij_evil_joker = { name = "邪恶小丑", text = { "" } },
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
            j_aij_majordomo = { name = "管家", text = { "" } },
            j_aij_skinsuit = { name = "人皮衣", text = { "" } },
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
                    "{C:inactive}（当前为{} {X:mult,C:white}X#1#{} {C:inactive}倍率）"
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
                    "{C:inactive}（当前为{} {X:mult,C:white}X#2#{}{C:inactive} 倍率）"
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
                    "此{C:attention}小丑牌{}获得 {X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{} {X:mult,C:white}X#1#{} {C:inactive}倍率）",
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
                    "提供 {X:mult,C:white}X#1#{}倍率"
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
            j_aij_biancolelli = { name = "比安科莱利", text = { "" }, unlock = { "?????" } },
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
                    "此小丑牌失去 {X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#3#{C:inactive} 倍率）"
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
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive} 筹码）",
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
                    "获得 {X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{} {X:mult,C:white}X#2#{} {C:inactive}倍率）",
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
                    "提供 {X:mult,C:white}X#1#{}倍率"
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
                    "生成一张{C:dark_edition}负片{} {C:spectral}幻灵{}牌"
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
                    "打出的{C:clubs}梅花{}提供 {X:mult,C:white}X#1#{}倍率",
                    "当{C:clubs}梅花{}计分时",
                    "额外增加 {X:mult,C:white}X#2#{}倍率",
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
                    "可选择生成一张{C:attention}任意{} {C:spectral}幻灵{}牌",
                    "{C:inactive}（必须有空位）"
                },
                unlock = { "?????" }
            },
        },
        Planet = {
            c_aij_vulcanoid = {
                name = "祝融星",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_zoozve = {
                name = "祖兹维",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_luna = {
                name = "月亮",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_phobos = {
                name = "火卫一",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_europa = {
                name = "木卫二",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_titan = {
                name = "土卫六",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_umbriel = {
                name = "天卫二",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_triton = {
                name = "海卫一",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_nix = {
                name = "冥卫二",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_planet_nine = {
                name = "第九行星",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_pallas = {
                name = "智神星",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_dysnomia = {
                name = "阎卫一",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_phaethon = {
                name = "法厄同",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_2013_nd15 = {
                name = "2013 ND15",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_kamooalewa = {
                name = "振荡天星",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_deimos = {
                name = "火卫二",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_callisto = {
                name = "木卫四",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_iapetus = {
                name = "土卫八",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_oberon = {
                name = "天卫四",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_proteus = {
                name = "海卫八",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_charon = {
                name = "冥卫一",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_nibiru = {
                name = "尼比鲁",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_2000_eu16 = {
                name = "2000 EU16",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_kuiper = {
                name = "柯伊伯带",
                text = {
                    "{S:0.8}（等级#1#）{}",
                    "{C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_paper_weywot = {
                name = "怀沃特",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_paper_namaka = {
                name = "娜玛卡",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_paper_ilmare = {
                name = "伊尔马雷",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_paper_salacia = {
                name = "萨拉西亚",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:mult}+#3#{}倍率"
                }
            },
            c_aij_paper_ixion = {
                name = "伊克西翁",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_paper_hiiaka = {
                name = "希亚卡",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_paper_varda = {
                name = "瓦尔达",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            },
            c_aij_paper_mk2 = {
                name = "Mk2",
                text = {
                    "{S:0.8}（等级#1#）{} {C:attention}#2#{}等级提升",
                    "{C:chips}+#3#{} 筹码"
                }
            }
        },
        Spectral = {
            c_aij_gravastar = {
                name = '真空星',
                text = {
                    '提升所有{C:legendary,E:1}牌型{}的',
                    '{C:chips}筹码{}等级'
                }
            },
            c_aij_pulsar = {
                name = '脉冲星',
                text = {
                    '提升所有{C:legendary,E:1}牌型{}的',
                    '{C:mult}倍率{}等级'
                }
            },
            c_aij_shade = {
                name = '暗影',
                text = {
                    '为手牌中随机{C:attention}1{}张牌',
                    '添加{C:dark_edition}负片{}版本'
                }
            },
            c_aij_trefle = {
                name = '三叶草',
                text = {
                    '{C:attention}重掷{}一张',
                    '选定的小丑牌',
                    "{C:inactive}（无法对永恒小丑牌使用）{}"
                }
            },
        },
        Tag = {
            tag_aij_glimmer = {
                name = '微光标签',
                text = {
                    '下一个商店中出售的基础',
                    '小丑牌免费，并变为{C:aij_plasma}微光版本'
                }
            },
            tag_aij_stellar = {
                name = '星辰标签',
                text = {
                    '下一个商店中出售的基础',
                    '小丑牌免费，并变为{C:aij_stellar}星辰版本'
                }
            },
            tag_aij_soulbound = {
                name = '灵魂绑定标签',
                text = {
                    '生成一张随机{C:attention}易腐{}的',
                    '{C:legendary}传奇{}小丑牌',
                    '{C:inactive}（必须有空位）'
                }
            },
            tag_aij_fortunate = {
                name = '幸运标签',
                text = {
                    '可选择生成一张任意{C:tarot}塔罗牌{}',
                    '{C:inactive}（必须有空位）'
                }
            },
            tag_aij_overstuffed = {
                name = '超载标签',
                text = {
                    "下一个开启的{C:attention}补充包{}",
                    "选项和可选数量都翻倍"
                }
            },
            tag_aij_chaos = {
                name = '混沌标签',
                text = {
                    "拥有{C:green}随机{}效果"
                }
            }
        },
        Tarot = {
            c_aij_magus = {
                name = '魔术师',
                text = {
                    "将所选的{C:attention}#1#{}张牌",
                    "增强为{C:attention}#2#{}"
                }
            },
            c_aij_isis_urania = {
                name = '天界女神',
                text = {
                    "将所选的{C:attention}#1#{}张牌",
                    "增强为{C:attention}#2#{}"
                }
            },
            c_aij_cubic_stone = {
                name = '立方石',
                text = {
                    "将所选的{C:attention}#1#{}张牌",
                    "增强为{C:attention}#2#{}"
                }
            },
            c_aij_master_arcanes = {
                name = '奥术大师',
                text = {
                    "{C:green}#1#/#2#{}生成一张随机的",
                    "{C:spectral}幻灵{}牌",
                    '{C:inactive}（必须有空位）'
                }
            },
            c_aij_two_ways = {
                name = '双途',
                text = {
                    "将所选的{C:attention}#1#{}张牌",
                    "拆分为{C:attention}2{}张复制牌",
                    "牌面点数为原始牌的{C:attention}一半{}",
                    "{C:inactive}（单数牌会尽可能平均拆分）{}",
                    "{C:inactive}（A=14, K=13, Q=12, J=11）"
                }
            },
            c_aij_osiris = {
                name = '冥王',
                text = {
                    "摧毁所选的{C:attention}1{}张{C:attention}小丑牌{}",
                    "并获得其{C:money}出售价值{}的{C:attention}3倍{}",
                    "{C:inactive}（当前为{} {C:money}$#1#{}{C:inactive}）"
                }
            },
            c_aij_broken_fate = {
                name = '破碎命运',
                text = {
                    "将最左侧消耗品的数值",
                    "随机调整至{C:attention}X0.75{}到{C:attention}X2.5{}之间"
                }
            },
        },
        Other = {
            showdown_blind = {
                name = "决胜盲注",
                text = {
                    "每{C:attention}第8个{}底注",
                    "会出现的{C:attention}Boss盲注{}"
                }
            },
            reroll_joker = {
                name = "重掷",
                text = {
                    '将小丑牌替换为',
                    '同稀有度的随机小丑牌'
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
                name = "失算牌",
                text = {
                    "{C:attention}2{}、{C:attention}3{}、{C:attention}4{}、{C:attention}5{}、{C:attention}6{}、",
                    "{C:attention}7{}、{C:attention}8{}、{C:attention}9{} 和 {C:attention}10{}",
                }
            },
            aij_jest_chaotic_card = {
                name = "混沌牌",
                text = {
                    "卡牌被打出后",
                    "{C:attention}随机变换{}其{C:edition}增强{}效果",
                }
            },
            palindrome = {
                name = "回文数",
                text = {
                    "多位数且{C:attention}正反对称{}",
                    "{C:inactive}例：33, 151, 3003{}"
                }
            }
        }
    }
}
