-- A lot here is copied from create_UIBox_your_collection_blinds in SMODS/src/overrides.lua
function aij_create_blind_card(blind, T)
  local temp_blind = AnimatedSprite(T.x, T.y, 1.3, 1.3,
    G.ANIMATION_ATLAS[blind.discovered and blind.atlas or 'blind_chips'],
    blind.discovered and blind.pos or G.b_undiscovered.pos)
  temp_blind.states.click.can = false
  temp_blind.states.drag.can = false
  temp_blind.states.hover.can = true
  local card = Card(T.x, T.y, 1.3, 1.3, G.P_CARDS.empty, G.P_CENTERS.c_base)
  temp_blind.states.click.can = false
  card.states.drag.can = false
  card.states.hover.can = true
  card.children.center = temp_blind
  temp_blind:set_role({ major = card, role_type = 'Glued', draw_major = card })
  card.set_sprites = function(...)
    local args = { ... }
    if not args[1].animation then return end -- fix for debug unlock
    local c = card.children.center
    Card.set_sprites(...)
    card.children.center = c
  end
  temp_blind:define_draw_steps({
    { shader = 'dissolve', shadow_height = 0.05 },
    { shader = 'dissolve' }
  })
  temp_blind.float = true
  card.states.collide.can = true
  card.config.blind = blind
  card.config.force_focus = true

  card.ability.blind_card = { blind = blind }

  card.hover = function()
    if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then
      if not card.hovering and card.states.visible then
        card.hovering = true
        card.hover_tilt = 3
        card:juice_up(0.05, 0.02)
        play_sound('chips1', math.random() * 0.1 + 0.55, 0.12)
        card.config.h_popup = create_UIBox_blind_popup(blind, card.config.blind.discovered)
        card.config.h_popup_config = card:align_h_popup()
        Node.hover(card)
        if card.children.alert then
          card.children.alert:remove()
          card.children.alert = nil
          card.config.blind.alerted = true
          G:save_progress()
        end
      end
    end
    card.stop_hover = function()
      card.hovering = false; Node.stop_hover(card); card.hover_tilt = 0
    end
  end

  return card
end

-- A lot here is copied from create_UIBox_your_collection_blinds in SMODS/src/overrides.lua
All_in_Jest.jest_blind_collection_UIBox = function(_pool, rows, args)
  args = args or {}
  args.w_mod = args.w_mod or 1
  args.h_mod = args.h_mod or 1
  args.card_scale = args.card_scale or 1
  local deck_tables = {}
  local pool = SMODS.collection_pool(_pool)
  if args.sort then args.sort(pool) end

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
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        (args.w_mod * rows[j] + 0.25) * 1.55,
        args.h_mod * 1.33,
        { card_limit = rows[j], type = args.area_type or 'title_2', highlight_limit = 0, collection = true }
      )
      table.insert(deck_tables,
        {
          n = G.UIT.R,
          config = { align = "cm", padding = 0.07, no_fill = true },
          nodes = {
            j % 2 == 0 and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
            { n = G.UIT.O, config = { object = G.your_collection[j] } },
            j % 2 == 1 and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
          }
        })
    end
  end

  local options = {}
  for i = 1, math.ceil(#pool / cards_per_page) do
    table.insert(options, localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#pool / cards_per_page)))
  end

  G.FUNCS.SMODS_blind_collection_page = function(e)
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
        local index = i + row_totals[j] + (cards_per_page * (e.cycle_config.current_option - 1))
        local blind = pool[index]
        if not blind then break end
        local card = aij_create_blind_card(blind,
          { x = G.your_collection[j].T.x + G.your_collection[j].T.w / 2, y = G.your_collection[j].T.y })

        if args.modify_card then args.modify_card(card, blind, i, j, pool, index) end
        if not args.no_materialize then card:start_materialize(nil, i > 1 or j > 1) end
        G.your_collection[j]:emplace(card)
      end
    end
    INIT_COLLECTION_CARD_ALERTS()
  end

  G.FUNCS.SMODS_blind_collection_page { cycle_config = { current_option = 1 } }

  local t = create_UIBox_generic_options({
    back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or 'your_collection',
    snap_back = args.snap_back,
    infotip = args.infotip,
    no_back = true,
    contents = {
      { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
      (not args.hide_single_page or cards_per_page < #pool) and {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
          create_option_cycle({
            options = options,
            w = 4.5,
            cycle_shoulders = true,
            opt_callback =
            'SMODS_blind_collection_page',
            current_option = 1,
            colour = G.C.RED,
            no_pips = true,
            focus_args = { snap_to = true, nav = 'wide' }
          })
        }
      } or nil,
    }
  })
  return t
end

G.FUNCS.jest_select_blind = function(e)
  local c1 = e.config.ref_table
  if c1 and c1:is(Card) then
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      func = function()
        local new_boss = c1.config.blind.key
        G.GAME.round_resets.blind_choices.Boss = new_boss

        play_sound('other1')

        if G.blind_select_opts.boss then
          -- Copied from G.FUNCS.reroll_boss_button
          G.CONTROLLER.locks.boss_reroll = true
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
              play_sound('other1')
              G.blind_select_opts.boss:set_role({ xy_bond = 'Weak' })
              G.blind_select_opts.boss.alignment.offset.y = 20
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = (function()
              local par = G.blind_select_opts.boss.parent
              G.blind_select_opts.boss:remove()
              G.blind_select_opts.boss = UIBox {
                T = { par.T.x, 0, 0, 0, },
                definition =
                { n = G.UIT.ROOT, config = { align = "cm", colour = G.C.CLEAR }, nodes = {
                  UIBox_dyn_container({ create_UIBox_blind_choice('Boss') }, false, get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))
                } },
                config = { align = "bmi",
                  offset = { x = 0, y = G.ROOM.T.y + 9 },
                  major = par,
                  xy_bond = 'Weak'
                }
              }
              par.config.object = G.blind_select_opts.boss
              par.config.object:recalculate()
              G.blind_select_opts.boss.parent = par
              G.blind_select_opts.boss.alignment.offset.y = 0

              G.E_MANAGER:add_event(Event({
                blocking = false,
                trigger = 'after',
                delay = 0.5,
                func = function()
                  G.CONTROLLER.locks.boss_reroll = nil
                  return true
                end
              }))

              save_run()
              for i = 1, #G.GAME.tags do
                if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then break end
              end
              return true
            end)
          }))
        end

        G.SETTINGS.paused = false
        if G.OVERLAY_MENU ~= nil then
          G.OVERLAY_MENU:remove()
          G.OVERLAY_MENU = nil
        end
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then
            break
          end
        end
        return true
      end
    }))
  end
end

local dominus_tag = {
  object_type = "Tag",
  key = 'dominus',

  pos = { x = 6, y = 3 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'boss',
    },
  },

  discovered = false,
  order = 9,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:jest_apply("+", G.C.ATTENTION, function()
          if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
              func = function()
                G.SETTINGS.paused = true
                G.FUNCS.overlay_menu {
                  config = { no_esc = true },
                  definition = All_in_Jest.jest_blind_collection_UIBox(
                    G.P_BLINDS,
                    { 5, 5, 5, 5, 5, 5 },
                    {
                      no_materialize = true,
                      modify_card = function(card, blind)
                        if blind.discovered then
                          if G.GAME.banned_keys[card.config.center.key] then
                            card.debuff = true
                          elseif blind.key == "bl_small" or blind.key == "bl_big" then
                            card.greyed = true
                          else
                            jest_create_select_card_ui(card, nil, nil, "jest_select_blind")
                          end
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
          return true
        end,
        function()
          return (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit
        end)
      if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
        tag.triggered = true
        return true
      end
      return
    end
  end,
}
return { name = "Tags", items = { dominus_tag } }
