SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
      { n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('465255')}, nodes = {
        {
          n = G.UIT.R,
          config = { align = 'cm', minh = 1 },
          nodes = {
            { n = G.UIT.T, config = { text = localize('aij_requires_restart'), colour = G.C.RED, scale = 0.5 } }
          }
        },
        {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('4a6972'), minw = 8.5}, nodes = {
          {
            n = G.UIT.R,
            nodes = {
              {
                n = G.UIT.C,
                config = {tooltip = {text = localize('aij_enable_moons_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_enable_moons'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'moons_enabled'
                  },
                },
              },
              {
                n = G.UIT.C,
                config = {tooltip = {text = localize('aij_alter_trypophobia_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_alter_trypophobia'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'alter_trypophobia'
                  },
                },
              }
            }
          },
          {
            n = G.UIT.R,
            nodes = {
              {
                n = G.UIT.C,
                config = {tooltip = {text = localize('aij_blue_stake_rework_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_blue_stake_rework'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'blue_stake_rework'
                  },
                },
              },
            }
          },
        }},
      }},
      { n = G.UIT.R, config = {align = 'cm', emboss = 0.05, r = 0.1, colour = HEX('465255')}, nodes = {
        {
          n = G.UIT.R,
          config = { align = 'cm', minh = 1 },
          nodes = {
            {
              n = G.UIT.T,
              config = {
                text = localize('aij_doesnt_requires_restart'),
                colour = G.C.GREEN,
                scale = 0.5
              }
            }
          }
        },
        {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('4a6972'), minw = 8.5}, nodes = {
          {
            n = G.UIT.R,
            nodes = {
              {
                n = G.UIT.C,
                config = {tooltip = {text = localize('aij_no_copy_neg_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_no_copy_neg'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'no_copy_neg'
                  },
                },
              },
            }
          },
        }},
      }},
    }   
  }
end
local joker_listing = {
	{"j_aij_nevernamed_credits_joker", "j_aij_survivalaren_credits_joker", "j_aij_rattling_snow_credits_joker"},
}
-- Modify main page
All_in_Jest.custom_ui = function(mod_nodes)
	local set = joker_listing[1]
	G.aij_main_jokers_list = CardArea(
		G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
		5.25 * G.CARD_W,
		0.95 * G.CARD_H,
		{ card_limit = #set, type = 'title', highlight_limit = 0, collection = true }
	)
	local silent = false
	for i, center in pairs(set) do
		G.GAME.viewed_back = Back(G.P_CENTERS.b_aij_fabled)
		local card = Card(G.aij_main_jokers_list.T.x + (G.aij_main_jokers_list.T.w / 2), G.aij_main_jokers_list.T.y,
			G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[center] or All_in_Jest.DescriptionDummies[center],
			{
				bypass_discovery_center = true,
				bypass_discovery_ui = true,
				bypass_lock = true,
				playing_card = i,
				viewing_back = false,
				bypass_back =
					G.P_CENTERS["b_aij_fabled"].pos
			})
		G.aij_main_jokers_list:emplace(card)
		card:hard_set_T(G.aij_main_jokers_list.T.x + (G.aij_main_jokers_list.T.w / 2))
		card.sprite_facing = 'front'
		card.facing = 'front'
		card:start_materialize({ G.C.RED }, silent)
		silent = true
	end
	mod_nodes[#mod_nodes + 1] = {
		n = G.UIT.R,
		config = { minh = 0.2, padding = 0.2 }
	}
	mod_nodes[#mod_nodes + 1] = {
		n = G.UIT.R,
		nodes = {
			{
				n = G.UIT.C,
				config = { align = "cm", padding = 0.5, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", no_fill = true },
						nodes = {
							{ n = G.UIT.O, config = { object = G.aij_main_jokers_list } },
						}
					},
				}
			},
		}
	}
	return mod_nodes
end
G.FUNCS.jest_free_reroll_boss = function(e) 
    stop_use()
    if G.GAME.jest_free_stultor_rerolls == 0 then
        G.GAME.round_resets.boss_rerolled = true
        if not G.from_boss_tag then ease_dollars(-10) end
    end
    G.from_boss_tag = nil
    G.CONTROLLER.locks.boss_reroll = true
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          play_sound('other1')
          G.blind_select_opts.boss:set_role({xy_bond = 'Weak'})
          G.blind_select_opts.boss.alignment.offset.y = 20
          return true
        end
      }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.3,
      func = (function()
        local par = G.blind_select_opts.boss.parent
        G.GAME.round_resets.blind_choices.Boss = get_new_boss()
        G.GAME.jest_free_stultor_rerolls = G.GAME.jest_free_stultor_rerolls - 1
        local tem_trigger = false
        local has_stultor = next(SMODS.find_card("j_aij_stultor"))
        if has_stultor and not tem_trigger then
            for i = 1, has_stultor do
                SMODS.find_card("j_aij_stultor")[i].ability.extra.trigger = false
                tem_trigger = true
            end
        end

        G.blind_select_opts.boss:remove()
        G.blind_select_opts.boss = UIBox{
          T = {par.T.x, 0, 0, 0, },
          definition =
            {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
              UIBox_dyn_container({create_UIBox_blind_choice('Boss')},false,get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))
            }},
          config = {align="bmi",
                    offset = {x=0,y=G.ROOM.T.y + 9},
                    major = par,
                    xy_bond = 'Weak'
                  }
        }
        par.config.object = G.blind_select_opts.boss
        par.config.object:recalculate()
        G.blind_select_opts.boss.parent = par
        G.blind_select_opts.boss.alignment.offset.y = 0
        
        G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function()
            G.CONTROLLER.locks.boss_reroll = nil
            return true
          end
        }))

        save_run()
        for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
        end
          return true
      end)
    }))
  end
G.FUNCS.jest_free_reroll_boss_button = function(e)
    if G.GAME.jest_free_stultor_rerolls > 0 then 
        e.config.text = localize('$')..'0'
        e.config.colour = G.C.RED
        e.config.button = 'jest_free_reroll_boss'
        e.children[1].children[1].config.shadow = true
        if e.children[2] then e.children[2].children[1].config.shadow = true end 
    else
        e.config.text = localize('$')..'10'
        G.FUNCS.reroll_boss_button(e)
    end
    if G.blind_prompt_box ~= nil and G.blind_prompt_box.definition.nodes[3] ~= nil then
        if e.config.text ~= G.blind_prompt_box.definition.nodes[3].nodes[1].nodes[2].nodes[1].config.text then
            G.blind_prompt_box.definition.nodes[3].nodes[1].nodes[2].nodes[1].config.text = e.config.text
            G.blind_prompt_box.definition.nodes[3].nodes[1].nodes[2].config.button_UIE.UIBox:recalculate()
        end
    end
  end
SMODS.jest_no_back_card_collection_UIBox = function(_pool, rows, args)
    args = args or {}
    args.w_mod = args.w_mod or 1
    args.h_mod = args.h_mod or 1
    args.card_scale = args.card_scale or 1
    local deck_tables = {}
    local pool = SMODS.collection_pool(_pool)

    G.your_collection = {}
    local cards_per_page = 0
    local row_totals = {}
    for j = 1, #rows do
        if cards_per_page >= #pool and args.collapse_single_page then
            rows[j] = nil
        else
            row_totals[j] = cards_per_page
            cards_per_page = cards_per_page + rows[j]
            G.your_collection[j] = CardArea(
                G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
                (args.w_mod*rows[j]+0.25)*G.CARD_W,
                args.h_mod*G.CARD_H, 
                {card_limit = rows[j], type = args.area_type or 'title', highlight_limit = 0, collection = true}
            )
            table.insert(deck_tables, 
            {n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
                {n=G.UIT.O, config={object = G.your_collection[j]}}
            }})
        end
    end

    local options = {}
    for i = 1, math.ceil(#pool/cards_per_page) do
        table.insert(options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#pool/cards_per_page)))
    end

    G.FUNCS.SMODS_card_collection_page = function(e)
        if not e or not e.cycle_config then return end
        for j = 1, #G.your_collection do
            for i = #G.your_collection[j].cards, 1, -1 do
            local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
            c:remove()
            c = nil
            end
        end
        for j = 1, #rows do
            for i = 1, rows[j] do
            local center = pool[i+row_totals[j] + (cards_per_page*(e.cycle_config.current_option - 1))]
            if not center then break end
            local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W*args.card_scale, G.CARD_H*args.card_scale, G.P_CARDS.empty, (args.center and G.P_CENTERS[args.center]) or center)
            if args.modify_card then args.modify_card(card, center, i, j) end
            if not args.no_materialize then card:start_materialize(nil, i>1 or j>1) end
            G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
    end

    G.FUNCS.SMODS_card_collection_page{ cycle_config = { current_option = 1 }}
    
    local t =  create_UIBox_generic_options({ back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_"..G.ACTIVE_MOD_UI.id or 'your_collection', snap_back = args.snap_back, infotip = args.infotip, no_back = true, contents = {
          {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}, 
          (not args.hide_single_page or cards_per_page < #pool) and {n=G.UIT.R, config={align = "cm"}, nodes={
            create_option_cycle({options = options, w = 4.5, cycle_shoulders = true, opt_callback = 'SMODS_card_collection_page', current_option = 1, colour = G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
          }} or nil,
      }})
    return t
end
G.FUNCS.jest_select = function(e)
    local c1 = e.config.ref_table
    if c1 and c1:is(Card) then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
          if e.config.data[2].copies and e.config.data[2].copies > 1 then
              for i = 1, e.config.data[2].copies do
                  if e.config.data[2].playing_card == true then
                      G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                  end
                  local card = SMODS.add_card {
                    key = c1.config.center_key,
                    area = e.config.data[1]
                  }
                  card = copy_card(c1, card)
                  card:add_to_deck()
                  if c1.edition and c1.edition.negative then
                    card:set_edition({negative = true}, true)
                  end
                  if (not card.edition or (card.edition and not card.edition.negative)) and e.config.data[1] == G.consumeables then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                  end
                  if e.config.data[2].playing_card == true then
                      table.insert(G.playing_cards, card)
                      e.config.data[1].config.card_limit = e.config.data[1].config.card_limit + 1
                      card:start_materialize()
                  end
              end
          else
              if e.config.data[2].playing_card == true then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
              end
              local card = SMODS.add_card {
                key = c1.config.center_key,
                area = e.config.data[1]
              }
              card = copy_card(c1, card)
              card:add_to_deck()
              if c1.edition and c1.edition.negative then
                card:set_edition({negative = true}, true)
              end
              if (not card.edition or (card.edition and not card.edition.negative)) and e.config.data[1] == G.consumeables then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
              end
              if e.config.data[2].playing_card == true then
                  table.insert(G.playing_cards, card)
                  e.config.data[1].config.card_limit = e.config.data[1].config.card_limit + 1
                  card:start_materialize()
              end
          end
          G.SETTINGS.paused = false
          if G.OVERLAY_MENU ~= nil then
              G.OVERLAY_MENU:remove()
              G.OVERLAY_MENU = nil
          end
          return true
        end
      }))
    end
end
G.FUNCS.jest_continue_select = function(e)
    local c1 = e.config.ref_table
    if c1 and c1:is(Card) then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
          if e.config.data[2].following == 0 then
            G.FUNCS.jest_select(e)
            return true
          end
          e.config.data[2].following = e.config.data[2].following - 1
          e.config.data[2].times = e.config.data[2].times + 1
          if G.OVERLAY_MENU ~= nil then
              G.OVERLAY_MENU:remove()
              G.OVERLAY_MENU = nil
          end
          e.config.data[2].cards = e.config.data[2].cards or {}
          table.insert(e.config.data[2].cards, c1)
          G.FUNCS.overlay_menu{
                config = {no_esc = true}, 
                definition = SMODS.jest_no_back_card_collection_UIBox(
                    e.config.data[2].pools[e.config.data[2].times], 
                    {e.config.data[2].size.x[e.config.data[2].times],e.config.data[2].size.y[e.config.data[2].times]}, 
                    {
                        no_materialize = true, 
                        hide_single_page = true,
                        collapse_single_page = true,
                        center = e.config.data[2].center,
                        modify_card = function(card, center) 
                            local conditionals = true
                            if e.config.data[2].conditionals then
                                conditionals = e.config.data[2].conditionals[e.config.data[2].times] or true
                            end
                            if e.config.data[2].extra_function then
                                e.config.data[2].extra_function(card, center, c1, e.config.data[2])
                            end
                            if conditionals then
                                jest_create_select_playing_card_ui(card, e.config.data[1], e.config.data[2])
                            end
                        end, 
                        h_mod = 1.05,
                    }
                ),
          }
          
          return true
        end
      }))
    end
end
G.FUNCS.jest_gold_tags = function(e)
    if G.GAME.jest_upgrade_tab then
        G.GAME.jest_upgrade_tab = false
    else
        G.GAME.jest_upgrade_tab = true
    end
end
G.FUNCS.jest_next_tag = function(e)
    local _tag = e.UIBox:get_UIE_by_ID('tag_container')
    if _tag then
      print(_tag)
      local _tag_sprite = _tag.children[2]
      local _tag_ui = _tag_sprite.children[1].children[1]
      if G.GAME.all_in_jest.skip_tags._tag_2 and G.GAME.all_in_jest.skip_tags._tag_3 then
        if _tag.config.ref_table.key ~= G.GAME.all_in_jest.skip_tags._tag_2._tag.key and _tag.config.ref_table.key ~= G.GAME.all_in_jest.skip_tags._tag_3._tag.key then
            G.GAME.all_in_jest.skip_tags._tag_1 = G.GAME.all_in_jest.skip_tags._tag_1 or {}
            if #G.GAME.all_in_jest.skip_tags._tag_1 == 0 then
                G.GAME.all_in_jest.skip_tags._tag_1._tag = G.GAME.all_in_jest.skip_tags._tag_1._tag or {}
                for k, v in pairs(_tag.config.ref_table) do 
                    G.GAME.all_in_jest.skip_tags._tag_1._tag[k] = v
                end
            end
            local temp_tag = Tag(G.GAME.all_in_jest.skip_tags._tag_2._tag.key)
            _tag.config.ref_table = temp_tag
            _tag_ui, _tag_sprite.config.ref_table = temp_tag:generate_UI()
            G.GAME.all_in_jest.skip_tags._tag_ui, G.GAME.all_in_jest.skip_tags._tag_sprite = temp_tag:generate_UI()
        elseif _tag.config.ref_table.key == G.GAME.all_in_jest.skip_tags._tag_2._tag.key then
            local temp_tag = Tag(G.GAME.all_in_jest.skip_tags._tag_3._tag.key)
            _tag.config.ref_table = temp_tag
            _tag_ui, _tag_sprite.config.ref_table = temp_tag:generate_UI()
            G.GAME.all_in_jest.skip_tags._tag_ui, G.GAME.all_in_jest.skip_tags._tag_sprite = temp_tag:generate_UI()
        elseif _tag.config.ref_table.key == G.GAME.all_in_jest.skip_tags._tag_3._tag.key and G.GAME.all_in_jest.skip_tags._tag_1 then
            local temp_tag = Tag(G.GAME.all_in_jest.skip_tags._tag_1._tag.key)
            _tag.config.ref_table = temp_tag
            _tag_ui, _tag_sprite.config.ref_table = temp_tag:generate_UI()
            G.GAME.all_in_jest.skip_tags._tag_ui, G.GAME.all_in_jest.skip_tags._tag_sprite = temp_tag:generate_UI()
        end
      end
    end
end
function jest_create_select_card_ui(card, area, extra_data)
    extra_data = extra_data or {}
    extra_data.copies = extra_data.copies or 1 
    local t2 =  {n=G.UIT.ROOT, config = {ref_table = card, minw = 0.6, maxw = 1, padding = 0.1, align = 'bm', colour = G.C.GREEN, shadow = true, r = 0.08, minh = 0.3, one_press = true, button = 'jest_select', data = {area, extra_data}, hover = true}, nodes={
        {n=G.UIT.T, config={text = "Select",colour = G.C.WHITE, scale = 0.5}}
    }}

    card.children.select_button = UIBox{
        definition = t2,
        config = {
            align="bm",
            offset = {x=-0,y=-0.15},
            major = card,
            bond = 'Weak',
            parent = card
        }
    }
end
function jest_create_select_playing_card_ui(card, area, extra_data)
    extra_data.times = extra_data.times or 0
    extra_data.copies = extra_data.copies or 1 
    local t2 =  {n=G.UIT.ROOT, config = {ref_table = card, minw = 0.6, maxw = 1, padding = 0.1, align = 'bm', colour = G.C.GREEN, shadow = true, r = 0.08, minh = 0.3, one_press = true, button = 'jest_continue_select', data = {area, extra_data}, hover = true}, nodes={
        {n=G.UIT.T, config={text = "Select",colour = G.C.WHITE, scale = 0.5}}
    }}

    card.children.select_button = UIBox{
        definition = t2,
        config = {
            align="bm",
            offset = {x=-0,y=-0.15},
            major = card,
            bond = 'Weak',
            parent = card
        }
    }
end
G.FUNCS.All_in_Jest_can_use_active_ability_button = function(e)
    local obj = e.config.ref_table.config.center
    local can_use = false
    if obj.all_in_jest and obj.all_in_jest.can_use_ability and type(obj.all_in_jest.can_use_ability) == 'function' then
        can_use = obj.all_in_jest:can_use_ability(e.config.ref_table)
    end
    if e.config.ref_table.debuff then
        can_use = false
    end
    if can_use then 
        e.config.colour = G.C.SECONDARY_SET.Enhanced
        e.config.button = 'All_in_Jest_use_active_ability_button'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.All_in_Jest_use_active_ability_button = function(e, mute, nosave)
    local card = e.config.ref_table
    local area = card.area

    e.config.ref_table.config.center.all_in_jest:use_ability(card)
    SMODS.calculate_context({all_in_jest = {using_ability = true, card = card, area = card.from_area}})
end

G.FUNCS.All_in_Jest_select_tag = function(e)
    local number = e.config.ref_table[1]
    local tag = e.config.ref_table[2]
    local other_tags = e.parent.parent.config.ref_table
    for i = 1, #other_tags do
        if i ~= number then
            other_tags[i].T.scale = 0.7
        else
            other_tags[i].T.scale = 1
        end
    end
    tag:juice_up()
    G.GAME.all_in_jest.blind_tags.selected_index = number
end