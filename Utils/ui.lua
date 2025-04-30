SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
      {
        n = G.UIT.R,
        config = { align = 'cm', minh = 1 },
        nodes = {
          { n = G.UIT.T, config = { text = localize('aij_requires_restart'), colour = G.C.RED, scale = 0.5 } }
        }
      },
      {
        n = G.UIT.R,
        nodes = {
          {
            n = G.UIT.C,
            nodes = {
              create_toggle {
                label = localize('aij_enable_moons'),
                ref_table = All_in_Jest.config,
                ref_value = 'moons_enabled'
              },
          },
        }
      }
    }
    }
  }
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
        delay = 0.1,
        func = function()
          local card = copy_card(c1)
          card:add_to_deck()
          G.jokers:emplace(card)
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
function jest_create_select_card_ui(card)
    local t2 =  {n=G.UIT.ROOT, config = {ref_table = card, minw = 0.6, maxw = 1, padding = 0.1, align = 'bm', colour = G.C.GREEN, shadow = true, r = 0.08, minh = 0.3, one_press = true, button = 'jest_select', hover = true}, nodes={
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
