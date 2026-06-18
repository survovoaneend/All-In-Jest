SMODS.Stake{
    dependencies = {
        items = {
          "set_entr_misc"
        }
    },
    order = 1,
    key = "copper",
    pos = { x = 0, y = 0 },
    atlas = "stakes",
    applied_stakes = { "gold" },
    prefix_config = { applied_stakes = { mod = false } },
    sticker_atlas = "stake_stickers",
    sticker_pos = {x=0,y=0},
    modifiers = function()
        G.GAME.modifiers.entr_copper = true
    end,
    shiny = true,
    colour = HEX("ff7747")
}

SMODS.Stake{
    dependencies = {
        items = {
          "set_entr_misc"
        }
    },
    order = 2,
    key = "platinum",
    pos = { x = 1, y = 0 },
    atlas = "stakes",
    applied_stakes = { "entr_copper" },
    prefix_config = { applied_stakes = { mod = false } },
    sticker_atlas = "stake_stickers",
    sticker_pos = {x=1,y=0},
    modifiers = function()
        G.GAME.modifiers.entr_platinum = 1.2
    end,
    shiny = true,
    colour = HEX("aebac1")
}

SMODS.Stake{
    dependencies = {
        items = {
          "set_entr_misc"
        }
    },
    order = 3,
    key = "meteorite",
    pos = { x = 2, y = 0 },
    atlas = "stakes",
    applied_stakes = { "entr_platinum" },
    prefix_config = { applied_stakes = { mod = false } },
    sticker_atlas = "stake_stickers",
    sticker_pos = {x=2,y=0},
    modifiers = function()
        G.GAME.modifiers.entr_meteorite = 0.33
    end,
    shiny = true,
    colour = HEX("983443")
}

local level_up_handref = level_up_hand
function level_up_hand(card, hand, ...)
    if G.GAME.modifiers.entr_meteorite and pseudorandom("entr_platinum_stake") < G.GAME.modifiers.entr_meteorite  then
        if card then
            card_eval_status_text(
                card,
                "extra",
                nil,
                nil,
                nil,
                { message = localize("k_nope_ex"), colour = HEX("983443") }
            )
        end
    else
        return level_up_handref(card, hand, ...)
    end
end

SMODS.Stake{
    dependencies = {
        items = {
          "set_entr_misc"
        }
    },
    order = 4,
    key = "obsidian",
    pos = { x = 3, y = 0 },
    atlas = "stakes",
    applied_stakes = { "entr_meteorite" },
    prefix_config = { applied_stakes = { mod = false } },
    sticker_atlas = "stake_stickers",
    sticker_pos = {x=3,y=0},
    modifiers = function()
        G.GAME.curse_rate_mod = 1
    end,
    colour = HEX("583175"),
    shiny = true,
}

Entropy.curses = {
    ["entr_blind"] = {
        key = "k_curse_blind",
        desc_key = "k_curse_blind_desc",
        sprite_pos = {x = 0, y = 0},
    },
    ["entr_darkness"] = {
        key = "k_curse_darkness",
        desc_key = "k_curse_darkness_desc",
        sprite_pos = {x = 1, y = 0},
    },
    ["entr_lost"] = {
        key = "k_curse_lost",
        desc_key = "k_curse_lost_desc",
        sprite_pos = {x = 2, y = 0},
    },
    ["entr_maze"] = {
        key = "k_curse_maze",
        desc_key = "k_curse_maze_desc",
        in_pool = function()
            return G.GAME.ante ~= G.GAME.win_ante
        end,
        sprite_pos = {x = 3, y = 0},
    }
}

SMODS.Tag {
    key = "curse_indicator",
    atlas = "curse_icons",
    no_collection = true,
    in_pool = function() return false end,
    loc_vars = function()
        return {
            key = G.GAME.curse and "tag_curse_"..G.GAME.curse
        }
    end
}

function _G.add_curse_icon(_tag, no_copy)
    G.HUD_curses = G.HUD_curses or {}
    local tag_sprite_ui, tag_sprite = _tag:generate_UI()
    G.HUD_curses[#G.HUD_curses+1] = UIBox{
        definition = {n=G.UIT.ROOT, config={align = "tm", padding = 0.05, colour = G.C.CLEAR}, nodes={
          tag_sprite_ui
        }},
        config = {
          align = G.HUD_curses[1] and 'bm' or 'br',
          offset = G.HUD_curses[1] and {x=0,y=0} or {x=-0.8,y=0.4},
          major = G.HUD_curses[1] and G.HUD_curses[#G.HUD_curses] or G.consumeables}
    }
    discover_card(G.P_TAGS[_tag.key])
    unlock_card(G.P_TAGS[_tag.key])

    _tag.HUD_tag = G.HUD_curses[#G.HUD_curses]
    _tag.HUD_tag.actual = _tag
    _tag.HUD_sprite = tag_sprite
    _tag.ability.index = #G.HUD_curses
    if #G.HUD_curses > 6 then
		for i = 2, #G.HUD_curses do
			G.HUD_curses[i].config.offset.y = -0.9 + 0.9 * (6 / #G.HUD_curses)
		end
	end
end

function Entropy.get_curse_rate()
    if not Entropy.config.curses_enabled then return 0 end
    if to_big(G.GAME.round_resets.ante) <= to_big(G.GAME.win_ante or 8) then return 0 end
    local key = G.GAME.selected_back and G.GAME.selected_back.effect.center.original_key
    local wins = G.PROFILES and G.SETTINGS.profile and G.PROFILES[G.SETTINGS.profile].deck_usage and G.PROFILES[G.SETTINGS.profile].deck_usage[key] and G.PROFILES[G.SETTINGS.profile].deck_usage[key].wins or {}
    return 0.04 + (G.GAME.entr_alt and 0.06 or 0)
end

function sprite_attention_text(args)
    local a = {}
    for i, v in pairs(args) do a[i] = v end
    args = args or {}
    args.text = args.text or 'test'
    args.scale = args.scale or 1
    args.colour = SMODS.shallow_copy(args.colour or G.C.WHITE)
    args.hold = (args.hold or 0) + 0.1*(G.SPEEDFACTOR)
    args.pos = args.pos or {x = 0, y = 0}
    args.align = args.align or 'cm'
    args.emboss = args.emboss or nil

    args.fade = 1

    if args.cover then
      args.cover_colour = SMODS.shallow_copy(args.cover_colour or G.C.RED)
      args.cover_colour_l = SMODS.shallow_copy(lighten(args.cover_colour, 0.2))
      args.cover_colour_d = SMODS.shallow_copy(darken(args.cover_colour, 0.2))
    else
      args.cover_colour = copy_table(G.C.CLEAR)
    end

    args.uibox_config = {
      align = args.align or 'cm',
      offset = args.offset or {x=0,y=0}, 
      major = args.cover or args.major or nil,
    }
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0,
      blockable = false,
      blocking = false,
      func = function()
        local sprite
            if args.atlas then
                sprite = SMODS.create_sprite(args.X, args.Y, args.W, args.H, args.atlas, args.spos or {x = 0, y = 0})
            end
          args.AT = UIBox{
            T = {args.pos.x + args.X,args.pos.y + args.Y,0,0},
            definition = 
              {n=G.UIT.ROOT, config = {
                align = args.cover_align or 'cm', minw = (args.cover and args.cover.T.w or 0.001) + (args.cover_padding or 0), 
                minh = (args.cover and args.cover.T.h or 0.001) + (args.cover_padding or 0), padding = 0.03, r = 0.1, 
                emboss = args.emboss, colour = args.cover_colour}, nodes={
                sprite and {n=G.UIT.O, config={draw_layer = 1, object = sprite}} or nil,
              }}, 
            config = args.uibox_config
          }
          args.AT.attention_text = true

          args.sprite = args.AT.UIRoot.children[1].config.object
          --args.text:pulse(0.5)
          return true
      end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = args.hold,
        blockable = false,
        blocking = false,
        func = function()
          if not args.start_time then
            args.start_time = G.TIMERS.TOTAL
            --args.text:pop_out(3)
          else
            --args.AT:align_to_attach()
            args.fade = math.max(0, 1 - 3*(G.TIMERS.TOTAL - args.start_time))
            if args.cover_colour then args.cover_colour[4] = math.min(args.cover_colour[4], 2*args.fade) end
            if args.cover_colour_l then args.cover_colour_l[4] = math.min(args.cover_colour_l[4], args.fade) end
            if args.cover_colour_d then args.cover_colour_d[4] = math.min(args.cover_colour_d[4], args.fade) end
            if args.backdrop_colour then args.backdrop_colour[4] = math.min(args.backdrop_colour[4], args.fade) end
            args.colour[4] = math.min(args.colour[4], args.fade)
            if args.fade <= 0 then
              args.AT:remove()
              return true
            end
          end
        end
      }))
      attention_text(a)
  end

function Entropy.create_curse(key)
    G.GAME.entr_maze_applied = nil
    local curses = {}
    for i, v in pairs(Entropy.curses) do
        if not v.in_pool or v:in_pool() then
            curses[#curses+1] = i
        end
    end
    G.GAME.curse = key or pseudorandom_element(curses, pseudoseed("entr_curse"))
    local atlas = Entropy.curses[G.GAME.curse].atlas or "entr_curse_icons"
    local pos = Entropy.curses[G.GAME.curse].sprite_pos or {x = 0, y = 0}
    attention_text({
        scale = 1,
        text = localize(Entropy.curses[G.GAME.curse].key),
        hold = 8,
        align = "cm",
        offset = { x = 0, y = -2.7 },
        major = G.play,
    })
    attention_text({
        scale = 0.7,
        text = localize(Entropy.curses[G.GAME.curse].desc_key),
        hold = 8,
        align = "cm",
        offset = { x = 0, y = -1.8 },
        major = G.play,
    })
    if G.GAME.curse == "entr_lost" then
        G.GAME.modifiers.cry_no_small_blind_last = G.GAME.modifiers.cry_no_small_blind
        G.GAME.modifiers.cry_no_small_blind = true
    else
        G.GAME.modifiers.cry_no_small_blind = G.GAME.modifiers.cry_no_small_blind_last
        G.GAME.modifiers.cry_no_small_blind_last = nil
    end
    if not G.HUD_curses or #G.HUD_curses < 1 then
        add_curse_icon(Tag("tag_entr_curse_indicator"))
    elseif G.HUD_curses then
        G.HUD_curses[1].actual:juice_up()
    end
    local sprite = G.HUD_curses[1].actual.HUD_sprite
    sprite.atlas = G.ASSET_ATLAS[atlas]
    sprite:set_sprite_pos(pos)
end

local dft = Blind.defeat
function Blind:defeat(s)
    dft(self, s)
    if G.GAME.blind_on_deck == "Boss" then
        G.GAME.curse_rate = (G.GAME.curse_rate_mod or Entropy.get_curse_rate()) * G.GAME.round_resets.ante
        if to_big(G.GAME.curse_rate_mod or 0) < to_big(1) and to_big(G.GAME.round_resets.ante) <= to_big(G.GAME.win_ante or 8) then G.GAME.curse_rate = 0 end
        if not (MP and MP.LOBBY and MP.LOBBY.code) then
            if pseudorandom("entr_curse") < G.GAME.curse_rate then
                Entropy.create_curse()
            else
                if G.HUD_curses and G.HUD_curses[1] then
                    G.HUD_curses[1].actual:yep('+', G.C.PURPLE, function() 
                        return true end)
                    G.HUD_curses = nil
                end
                G.GAME.entr_maze_applied = nil
                G.GAME.curse = nil
            end
        end
    end
end

local ccfs = create_card_for_shop
function create_card_for_shop(...)
    local card = ccfs(...)
    if G.GAME.curse == "entr_blind" then
        if pseudorandom("entr_blind_curse") < 0.5 then
            card.cry_flipped = true
        end
    end
    return card
end

SMODS.Stake{
    dependencies = {
        items = {
          "set_entr_misc"
        }
    },
    order = 5,
    key = "iridium",
    pos = { x = 4, y = 0 },
    atlas = "stakes",
    applied_stakes = { "entr_obsidian" },
    prefix_config = { applied_stakes = { mod = false } },
    sticker_atlas = "stake_stickers",
    sticker_pos = {x=4,y=0},
    modifiers = function()
        G.GAME.win_ante = 10
    end,
    colour = HEX("983443"),
    shiny = true,
}

SMODS.Stake{
    dependencies = {
        items = {
          "set_entr_misc"
        }
    },
    order = 6,
    key = "zenith",
    pos = { x = 5, y = 0 },
    atlas = "stakes",
    applied_stakes = { "entr_iridium" },
    prefix_config = { applied_stakes = { mod = false } },
    sticker_atlas = "stake_stickers",
    sticker_pos = {x=5,y=0},
    modifiers = function()
        G.GAME.modifiers.zenith = true
        G.GAME.entr_ante_8_boss = localize{type="name_text", set="Blind", key = "bl_entr_endless_entropy_phase_one"}
        G.GAME.entr_ante_12_boss = localize{type="name_text", set="Blind", key = "bl_entr_endless_entropy_phase_one"}
        G.E_MANAGER:add_event(Event{
            func = function()
                ease_ante(15)
                Entropy.create_ee_splash()
                return true
            end
        })
    end,
    colour = HEX("ff00ff")
}

-- SHITPOST STUFF
SMODS.Stake{
    dependencies = {
        items = {
          "set_entr_misc"
        }
    },
    order = 7,
    key = "gfb",
    pos = { x = 6, y = 0 },
    atlas = "stakes",
    applied_stakes = { "white" },
    prefix_config = { applied_stakes = { mod = false } },
    sticker_atlas = "stake_stickers",
    sticker_pos = {x=5,y=0},
    modifiers = function()
        G.GAME.modifiers.entr_gfb = true
        G.GAME.seeded = true
    end,
    colour = Entropy.zenith_gradient
}

function Entropy.localize_rarity(center, rarity)
    local vanilla_rarity_keys = { localize('k_common'), localize('k_uncommon'), localize('k_rare'), localize(
        'k_legendary') }
    if G.GAME.modifiers.entr_gfb then
        if center and center.rarity == 4 then
            rarity = "entr_zenith"
        end
        if center and center.rarity == "entr_reverse_legendary" then
            rarity = "entr_reverse_zenith"
        end
    end
    if (vanilla_rarity_keys)[rarity] then
        return vanilla_rarity_keys[rarity] --compat layer in case function gets the int of the rarity
    else
        return localize("k_" .. rarity:lower())
    end
end

function Entropy.get_rarity_colour(rarity, card, _c)
    if G.GAME.modifiers.entr_gfb then
        if rarity == 4 then
            return Entropy.zenith_gradient
        end
        if rarity == "entr_reverse_legendary" then
            return Entropy.reverse_zenith_gradient
        end
    end
    return G.C.RARITY[rarity]
end

Entropy.Blind{
    order = 676767,
	key = "paw",
	pos = { x = 0, y = 11 },
	atlas = "blinds",
	boss_colour = HEX("f43f7d"),
    mult=1,
    dollars = 6,
	boss = {
		min = 1,
	},
    recalc_debuff = function(self, card, from_blind)
        if not card.edition or not card.edition.entr_freaky then return true end
    end,
    no_collection = true,
    in_pool = function()
        return G.GAME.modifiers.entr_gfb
    end
}

SMODS.Atlas {
    key = "gfb_jokers",
    path = "gfb_jokers.png",
    px = 71,
    py = 95
}


function Entropy.inject_gfb()
    G.P_CENTERS.j_entr_chalice_of_blood.use = function(self, card)
        for i, v in pairs(G.P_CENTER_POOLS.Pact) do
            Spectrallib.forcetrigger {
                card = Entropy.get_dummy(v, card.area, card), context = {}, silent = true
            }
        end
    end
    G.P_CENTERS.j_entr_chalice_of_blood.can_use = function() return true end
    G.P_CENTERS.j_entr_chalice_of_blood.needs_use_button = function() return G.GAME.modifiers.entr_gfb end

    G.P_CENTERS.j_entr_sunny_joker.gfb_atlas = "entr_gfb_jokers"

    G.P_CENTERS.c_entr_ichor.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.c_entr_ichor.gfb_pos = {x = 1, y = 0}

    G.P_CENTERS.c_wheel_of_fortune.gfb_config = {extra = 6.7}

    G.P_CENTERS.j_dna.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_dna.gfb_pos = {x = 2, y = 0}

    G.P_CENTERS.j_splash.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_splash.gfb_pos = {x = 3, y = 0}

    G.P_CENTERS.j_entr_chair.gfb_atlas = "entr_gfb_jokers"

    SMODS.Joker:take_ownership("misprint", {
        calculate = function(self, card, context)
            if G.GAME.modifiers.entr_gfb then
                if context.ending_shop then
                    for i, v in pairs(G.I.CARD) do
                        Spectrallib.manipulate(v, {
                            min = 1/3,
                            max = 3,
                        })
                    end
                    return {
                        message = "ZZAZZ!"
                    }
                end
            else
                if context.joker_main then
                    return {mult = pseudorandom('misprint', card.ability.extra.min, card.ability.extra.max)}
                end
            end
        end,
        discovered = true
    }, true)

    SMODS.Joker:take_ownership("lusty_joker", {
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    mult = not G.GAME.modifiers.entr_gfb and card.ability.extra.s_mult or nil,
                    xlog_chips = G.GAME.modifiers.entr_gfb and 69 or nil
                }
            end
        end,
        loc_vars = function(self, q, card)
            return { vars = { G.GAME.modifiers.entr_gfb and 69 or card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }, key = G.GAME.modifiers.entr_gfb and "j_lusty_joker_gfb" or nil }
        end,
        discovered = true
    }, true)

    SMODS.Joker:take_ownership("space", {
        calculate = function(self, card, context)
             if context.before then
                if G.GAME.modifiers.entr_gfb then
                    if SMODS.pseudorandom_probability(card, 'space', 1, 4) then
                        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

                        local eligible_card = pseudorandom_element(editionless_jokers, 'space_joker')
                        local edition = SMODS.poll_edition { key = "space_joker", guaranteed = true, no_negative = true, options = { 'e_polychrome', 'e_holo', 'e_foil' } }
                        eligible_card:set_edition(edition, true)
                        check_for_unlock({ type = 'have_edition' })
                    else
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                attention_text({
                                    text = localize('k_nope_ex'),
                                    scale = 1.3,
                                    hold = 1.4,
                                    major = card,
                                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                                        'tm' or 'cm',
                                    offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                                    silent = true
                                })
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.06 * G.SETTINGS.GAMESPEED,
                                    blockable = false,
                                    blocking = false,
                                    func = function()
                                        play_sound('tarot2', 0.76, 0.4)
                                        return true
                                    end
                                }))
                                play_sound('tarot2', 1, 0.4)
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                elseif SMODS.pseudorandom_probability(card, 'space', 1, 4) then
                    return {
                        level_up = true,
                        message = localize('k_level_up_ex')
                    }
                end
            end
        end,
        loc_vars = function(self, q, card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, 4,
            'space')
            return { vars = {numerator, denominator}, key = G.GAME.modifiers.entr_gfb and "j_space_joker_gfb" or nil }
        end,
        discovered = true
    }, true)

    SMODS.Joker:take_ownership("hanging_chad", {
        calculate = function(self, card, context)
            if context.repetition and context.other_card == context.other_card.area.cards[1] and (G.GAME.modifiers.entr_gfb or context.cardarea == G.play) then
                return {
                    repetitions = card.ability.extra
                }
            end
        end,
        loc_vars = function(self, q, card)
            return { key = G.GAME.modifiers.entr_gfb and "j_hanging_chad_gfb" or nil }
        end,
        unlocked = true,
        discovered = true
    }, true)

    SMODS.Joker:take_ownership("smiley", {
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_face() then
                return {
                    mult = not G.GAME.modifiers.entr_gfb and card.ability.extra or nil,
                    asc = G.GAME.modifiers.entr_gfb and card.ability.extra/5 or nil
                }
            end
        end,
        loc_vars = function(self, q, card)
            return { vars = {card.ability.extra / (G.GAME.modifiers.entr_gfb and 5 or 1)}, key = G.GAME.modifiers.entr_gfb and "j_smiley_gfb" or nil }
        end,
        discovered = true
    })
    G.P_CENTERS.j_smiley.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_smiley.gfb_pos = {x = 4, y = 0}

    G.P_CENTERS.j_blueprint.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_blueprint.gfb_pos = {x = 5, y = 0}

    SMODS.Joker:take_ownership("blueprint", {
        calculate = function(self, card, context)
            local other_joker = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + (G.GAME.modifiers.entr_gfb and -1 or 1)] end
            end
            local ret = SMODS.blueprint_effect(card, other_joker, context)
            if ret then
                ret.colour = G.GAME.modifiers.entr_gfb and G.C.RED or G.C.BLUE
            end
            return ret
        end,
        loc_vars = function(self, q, card)
            return { key = G.GAME.modifiers.entr_gfb and "j_blueprint_gfb" or nil}
        end,
        discovered = true,
        unlocked = true
    })

    G.P_CENTERS.c_tower.gfb_config = {
        max_highlighted = 2
    }

    SMODS.Consumable:take_ownership("lovers", {
        config = {max_highlighted = 1, mod_conv = "m_wild"},
         use = function(self, card, area, copier)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if G.GAME.modifiers.entr_gfb then
                            G.hand.highlighted[i]:set_edition("e_entr_freaky")
                        else
                            G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                        end
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end,
        can_use = function(self, card)
            return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
        end,
        loc_vars = function(self, info_queue, card)
            local conv = G.P_CENTERS[G.GAME.modifiers.entr_gfb and "e_entr_freaky" or card.ability.mod_conv]
            info_queue[#info_queue + 1] = conv
            return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = conv.set, key = conv.key } }, key = G.GAME.modifiers.entr_gfb and "c_lovers_gfb" or nil }
        end,
        discovered = true
    }, true)

    G.P_CENTERS.c_star.gfb_config = {
        mod_conv = "j_supernova",
        suit_conv = "remove"
    }
    SMODS.Consumable:take_ownership("star", {
        discovered = true,
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                local conv = G.P_CENTERS[card.ability.mod_conv] or G.P_CENTERS.j_supernova
                info_queue[#info_queue + 1] = conv
                return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = conv.set, key = conv.key } }, key = "c_star_gfb" }
            else
                return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
            end
        end,
    }, true)

    G.P_CENTERS.c_sun.gfb_config = {
        mod_conv = "j_entr_sunny_joker",
        suit_conv = "remove"
    }
    SMODS.Consumable:take_ownership("sun", {
        discovered = true,
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                local conv = G.P_CENTERS[card.ability.mod_conv] or G.P_CENTERS.j_entr_sunny_joker
                info_queue[#info_queue + 1] = conv
                return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = conv.set, key = conv.key } }, key = "c_sun_gfb" }
            else
                return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
            end
        end,
    }, true)

    G.P_CENTERS.c_world.gfb_config = {
        mod_conv = "c_earth",
        suit_conv = "remove"
    }
    SMODS.Consumable:take_ownership("world", {
        discovered = true,
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                local conv = G.P_CENTERS[card.ability.mod_conv] or G.P_CENTERS.c_earth
                info_queue[#info_queue + 1] = conv
                return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = conv.set, key = conv.key } }, key = "c_world_gfb" }
            else
                return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
            end
        end,
    }, true)

    G.P_CENTERS.c_moon.gfb_config = {
        mod_conv = "j_to_the_moon",
        suit_conv = "remove"
    }
    SMODS.Consumable:take_ownership("moon", {
        discovered = true,
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                local conv = G.P_CENTERS[card.ability.mod_conv] or G.P_CENTERS.j_to_the_moon
                info_queue[#info_queue + 1] = conv
                return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = conv.set, key = conv.key } }, key = "c_moon_gfb" }
            else
                return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
            end
        end,
    }, true)

    SMODS.Consumable:take_ownership("talisman", {
        discovered = true,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_SEALS["Gold"]
            return { vars = { card.ability.max_highlighted }, key = G.GAME.modifiers.entr_gfb and "c_talisman_gfb" }
        end,
        use = function(self, card, area, copier)
            if pseudorandom("talisman_gfb") < 0.2 and G.GAME.modifiers.entr_gfb then
                error("attempt to compare number with table")
            end
            local conv_card = G.hand.highlighted[1]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal("Gold", nil, true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end,
    }, true)

    G.P_CENTERS.j_brainstorm.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_brainstorm.gfb_pos = {x = 6, y = 0}

    SMODS.Joker:take_ownership("brainstorm", {
        calculate = function(self, card, context)
            local other_joker = nil
            local ret = SMODS.blueprint_effect(card, G.jokers.cards[G.GAME.modifiers.entr_gfb and #G.jokers.cards or 1], context)
            if ret then
                ret.colour = G.GAME.modifiers.entr_gfb and G.C.BLUE or G.C.RED
            end
            return ret
        end,
        loc_vars = function(self, q, card)
            return { key = G.GAME.modifiers.entr_gfb and "j_brainstorm_gfb" or nil}
        end,
        discovered = true,
        unlocked = true
    })

    SMODS.Joker:take_ownership("stone", {
        calculate = function(self, card, context)
            if G.GAME.modifiers.entr_gfb then
                if context.ending_shop then
                    for i, v in pairs(G.playing_cards) do
                        v:set_ability(G.P_CENTERS.m_stone)
                    end
                end
            else
                if context.joker_main then
                    local stone_tally = 0
                    for _, playing_card in ipairs(G.playing_cards) do
                        if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
                    end
                    return {
                        chips = card.ability.extra * stone_tally
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
            if G.GAME.modifiers.entr_gfb then
                return {key = "j_stone_gfb"}
            end
            local stone_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
                end
            end
            return { vars = { card.ability.extra, card.ability.extra * stone_tally } }
        end,
        discovered = true,
        unlocked = true
    })

    SMODS.Joker:take_ownership("golden", {
        calc_dollar_bonus = function(self, card)
            return not G.GAME.modifiers.entr_gfb and card.ability.extra or nil
        end,
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                return {key = "j_golden_gfb"}
            end
            return { vars = { card.ability.extra } }
        end,
        discovered = true,
        unlocked = true
    })

    SMODS.Joker:take_ownership("joker", {
        loc_vars = function(self, info_queue, card)
            return { key = G.GAME.modifiers.entr_gfb and "j_joker_gfb" or nil, vars = { card.ability.mult } }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                if G.GAME.modifiers.entr_gfb then
                    return SMODS.merge_effects {
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                        { mult = -card.ability.mult },
                        { mult = card.ability.mult },
                    }
                else
                    return { mult = card.ability.mult }
                end
            end
        end,
        discovered = true,
        unlocked = true
    })

    G.P_CENTERS.j_entr_searing_joke.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_entr_searing_joke.gfb_config = {
        left = 1, left_mod = 1
    }

    G.P_CENTERS.j_cavendish.gfb_config = {
        extra = { odds = 12, Xmult = 3 },
    }
    SMODS.Joker:take_ownership("cavendish", {
        unlocked = true,
        discovered = true,
        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if SMODS.pseudorandom_probability(card, 'cavendish', 1, card.ability.extra.odds) then
                    SMODS.destroy_cards(card, nil, nil, true)
                    G.GAME.pool_flags.cavendish_extinct = true
                    return {
                        message = localize('k_extinct_ex')
                    }
                else
                    return {
                        message = localize('k_safe_ex')
                    }
                end
            end
            if context.joker_main or context.forcetrigger then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    })

    SMODS.Joker:take_ownership("photograph", {
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                return {name_key = "j_photograph_gfb", vars = {card.ability.extra, G.PROFILES[G.SETTINGS.profile].name}}
            end
            return { vars = { card.ability.extra } }
        end,
        discovered = true,
        unlocked = true,
    })

    G.P_CENTERS.j_banner.gfb_config = {
        extra = 25,
    }
    SMODS.Joker:take_ownership("banner", {
        loc_vars = function(self, info_queue, card)
            return { key = G.GAME.modifiers.entr_gfb and "j_banner_gfb" or nil, vars = { card.ability.extra } }
        end,
        discovered = true,
        unlocked = true,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    chips = G.GAME.current_round.discards_left * card.ability.extra
                }
            end
            if context.selling_card and G.GAME.modifiers.entr_gfb then
                G.GAME.banned_keys[context.card.config.center.key] = true
                SMODS.calculate_context({banishing_card = true, card = context.card, cardarea = card.area, banisher = card})
            end
        end
    })
    G.P_CENTERS.j_chaos.gfb_config = {
        extra = { chips = 0, chips_mod = 8, free_rerolls_given = 0 },
    }
    SMODS.Joker:take_ownership("chaos", {
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                return { key = "j_chaos_gfb", vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
            end
            return { vars = { card.ability.extra } }
        end,
        discovered = true,
        unlocked = true,
        calculate = function(self, card, context)
            if G.GAME.modifiers.entr_gfb then
                if context.reroll_shop then
                    SMODS.change_free_rerolls(1)
                    card.ability.extra.free_rerolls_given = card.ability.extra.free_rerolls_given + 1
                    SMODS.scale_card(card, {ref_table = card.ability.extra, ref_value = "chips", scalar_value = "chips_mod", message_key = "a_chips"})
                end
                if context.joker_main and card.ability.extra.chips ~= 0 then
                    return { chips = card.ability.extra.chips}
                end
            end
        end,
        add_to_deck = function(self, card, from_debuff)
            card.ability.extra.free_rerolls_given = 0
            SMODS.change_free_rerolls(G.GAME.modifiers.entr_gfb and 1 or card.ability.extra)
        end,
        remove_from_deck = function(self, card, from_debuff)
            SMODS.change_free_rerolls(G.GAME.modifiers.entr_gfb and (-1 - card.ability.extra.free_rerolls_given) or -card.ability.extra)
        end
    })

    SMODS.Joker:take_ownership("diet_cola", {
        loc_vars = function(self, info_queue, card)
            if G.GAME.modifiers.entr_gfb then
                return { key = "j_diet_cola_gfb"}
            end
        end,
        discovered = true,
        unlocked = true,
        calculate = function(self, card, context)
            if G.GAME.modifiers.entr_gfb then
                if context.selling_card and context.card.config.center.rarity then
                    local tag = "tag_uncommon"
                    local tags = {
                       [2] = "tag_uncommon", [3] = "tag_rare", [4] = "tag_entr_ascendant_legendary"
                    }
                    tag = tags[context.card.config.center.rarity]
                    if tag then
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                add_tag(Tag(tag))
                                play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end)
                        }))
                    end
                    return nil, true
                end
            elseif context.selling_self then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_double'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end)
                }))
                return nil, true
            end
        end,
    })

    G.P_CENTERS.j_entr_blooming_crimson.gfb_soul_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_entr_blooming_crimson.gfb_soul_pos = {x = 8, y = 0}

    G.P_CENTERS.j_entr_insatiable_dagger.gfb_config = {
        perc = 1.2
    }

    G.P_CENTERS.j_entr_menger_sponge.gfb_config = {
        chips_mod = 1.25
    }

    G.P_CENTERS.j_credit_card.gfb_config = {
        extra = 1000
    }

    SMODS.Joker:take_ownership("credit_card", {
        loc_vars = function(self, q, card)
            return {
                vars = {
                    card.ability.extra
                },
                key = G.GAME.modifiers.entr_gfb and "j_credit_card_gfb" or nil
            }
        end,
        calculate = function(self, card, context)
            if G.GAME.modifiers.entr_gfb then
                if context.ending_shop and G.GAME.dollars < 0 then
                    return {
                        dollars = G.GAME.dollars * 0.25
                    }
                end
            end
        end,
        discovered = true
    })

    G.P_CENTERS.j_entr_surreal_joker.gfb_config = {
        qmult = 4
    }
    G.P_CENTERS.j_entr_tesseract.gfb_config = {
        degrees = 0,
        degrees_mod = 15
    }

    SMODS.Joker:take_ownership("certificate", {
        loc_vars = function(self, q, card)
            return {
                key = G.GAME.modifiers.entr_gfb and "j_certificate_gfb" or nil
            }
        end,
        calculate = function(self, card, context)
            if context.first_hand_drawn then
                local _card = SMODS.create_card { set = not G.GAME.modifiers.entr_gfb and "Base" or nil, 
                    seal = SMODS.poll_seal({ guaranteed = true, type_key = 'certificate_seal' }), area = G.discard,
                    key = G.GAME.modifiers.entr_gfb and "j_certificate" or nil
                }
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                _card.playing_card = G.playing_card
                table.insert(G.playing_cards, _card)

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(_card)
                        _card:start_materialize()
                        G.GAME.blind:debuff_card(_card)
                        G.hand:sort()
                        if context.blueprint_card then
                            context.blueprint_card:juice_up()
                        else
                            card:juice_up()
                        end
                        SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                        save_run()
                        return true
                    end
                }))

                return nil, true
            end
        end,
        discovered = true,
        unlocked = true
    })

    G.P_CENTERS.j_entr_milk.gfb_atlas = "entr_gfb_jokers"
    G.P_CENTERS.j_entr_yogurt.gfb_atlas = "entr_gfb_jokers"

    SMODS.Consumable:take_ownership("death", {
        loc_vars = function(self, q, card)
            return {
                vars = {
                    card.ability.max_highlighted
                },
                key = G.GAME.modifiers.entr_gfb and "c_death_gfb" or nil
            }
        end,
        use = function(self, card)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            local rightmost = G.GAME.modifiers.entr_gfb and G.hand.highlighted[#G.hand.highlighted] or G.hand.highlighted[1]
            for i = 1, #G.hand.highlighted do
                if (G.GAME.modifiers.entr_gfb and G.hand.highlighted[i].T.x < rightmost.T.x) or (not G.GAME.modifiers.entr_gfb and G.hand.highlighted[i].T.x > rightmost.T.x) then
                    rightmost = G.hand.highlighted[i]
                end
            end
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if G.hand.highlighted[i] ~= rightmost then
                            copy_card(rightmost, G.hand.highlighted[i])
                        end
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end,
        discovered = true,
        unlocked = true
    })
end

G.CANVAS_DESC_SCALE = 5
function Entropy.draw()
    love.graphics.setColor(G.C.WHITE)
    if not G.CANVASES then G.CANVASES = {} end
    if G.CANVASES.DESC_CANVAS then
        G.CANVASES.DESC_CANVAS.canvas:renderTo(function()
            love.graphics.clear({0,0,0,1})
            local w = G.CANVAS:getPixelWidth()
            local h = G.CANVAS:getPixelHeight()
            local cw = G.CANVASES.DESC_CANVAS.canvas:getPixelWidth()
            local ch = G.CANVASES.DESC_CANVAS.canvas:getPixelHeight()
            local sw = cw/w
            local sh = ch/h
            love.graphics.draw(G.CANVAS, cw/2, ch/2, 0, sw, sh, w/2, h/2)
        end)
    end
end

local card_stop_hover = Card.stop_hover
function Card:stop_hover(...)
    local ret = card_stop_hover(self, ...)
    for i, v in pairs(G.CANVASES or {}) do
        v:remove()
        v = nil
    end
    G.DWS_HOVERED = nil
    return ret
end

local card_set_sprites = Card.set_sprites
function Card:set_sprites(...)
    if self.config.center.orig_pos then
        self.config.center.atlas = self.config.center.orig_atlas
        self.config.center.pos = self.config.center.orig_pos
        self.config.center.soul_pos = self.config.center.orig_soul_pos
    end
    if G.GAME.modifiers.entr_gfb then
        self.config.center.orig_atlas = self.config.center.orig_atlas or self.config.center.atlas
        self.config.center.orig_pos = self.config.center.orig_pos or self.config.center.pos
        self.config.center.orig_soul_pos = self.config.center.orig_soul_pos or self.config.center.soul_pos
        self.config.center.atlas = self.config.center.gfb_atlas or self.config.center.orig_atlas
        self.config.center.pos = self.config.center.gfb_pos or self.config.center.orig_pos
        self.config.center.soul_pos = self.config.center.gfb_soul_pos or self.config.center.orig_soul_pos
    end
    local ret = card_set_sprites(self, ...)
    if G.GAME.modifiers.entr_gfb and
        self.config.center.gfb_soul_atlas 
        and self.children.floating_sprite    
    then
        self.children.floating_sprite.atlas = G.ASSET_ATLAS[self.config.center.gfb_soul_atlas ]
        self.children.floating_sprite:reset()
    end
    return ret
end

local card_set_ability = Card.set_ability
function Card:set_ability(cen, ...)
    local ret = card_set_ability(self, cen, ...)
    local cen = G.P_CENTERS[cen] or cen
    if G.GAME.modifiers.entr_gfb then
        if type(cen) == "table" and (cen.gfb_config or self.config.center.gfb_config) then
            for i, v in pairs(cen.gfb_config or self.config.center.gfb_config) do
                if type(v) == "table" then self.ability[i] = copy_table(v) else
                    self.ability[i] = v ~= "remove" and v or nil
                end
            end
            if cen.consumeable then
                self.ability.consumeable = copy_table(self.ability)
            end
        end
    end
    return ret
end

local ld = love.draw
function love.draw(...)
    local r = ld(...)
    Entropy.draw()
    return r
end

SMODS.Sound({
	key = "music_2",
	path = "music_2.ogg",
	select_music_track = function()
		return G.GAME.modifiers.entr_gfb and 10^300
	end,
})

function Entropy.gfb_voucher()
    return pseudorandom_element({

    }, pseudoseed("DOESTHEVERMILLIONMOONHOWL"))
end

SMODS.ScreenShader({
    key="perkeosimulator",
    path="perkeosimulator.fs",
    send_vars = function (sprite, card)
        return {
            realtime = G.TIMERS.REAL
        }
    end,
    should_apply = function()
        return G.GAME.modifiers.entr_gfb and (next(SMODS.find_card("j_perkeo")) or next(SMODS.find_card("j_entr_oekrep")))
    end
})

Entropy.Joker {
    key = "gros_michel_2",
    order = 999,
    rarity = 1,
    cost = 4,
    atlas = "entr_gfb_jokers",
    pos = { x = 7, y = 0 },
    eternal_compat = false,
    blueprint_compat = true,
    demicoloncompat = true,
    perishable_compat = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    config = { extra = { odds = 1e308, emult = 2 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'entr_gros_michel_2')
        return { vars = { card.ability.extra.emult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'entr_gros_michel_2', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_main or context.forcetrigger then
            return {
                emult = card.ability.extra.emult
            }
        end
    end,
    in_pool = function(self, args)
        return G.GAME.pool_flags.cavendish_extinct
    end
}

function Entropy.stencil_stencil()
    G.stencil_bypass = true
    local s = G.SETTINGS.GRAPHICS.shadows
    G.SETTINGS.GRAPHICS.shadows = nil
    for i, v in pairs(G.I.CARD) do
        if v.config and v.config.center and v.config.center.key == "j_stencil" then
            love.graphics.push()
            v:translate_container()
            v:draw()
            love.graphics.pop()
        end
    end
    G.SETTINGS.GRAPHICS.shadows = s
    G.stencil_bypass = nil
end

local card_draw = Card.draw
function Card:draw(...)
    if self.config.center.key == "j_stencil" then
        if (G.stencil_bypass or not G.GAME.modifiers.entr_gfb or self.area ~= G.jokers) then
            card_draw(self, ...)
        end
    else    
        card_draw(self, ...)
    end
end
