
-- Adds playing card stickers tab to collection

create_UIBox_your_collection_stickers = function()
	G.E_MANAGER:add_event(Event({
		func = function()
			G.FUNCS.your_collection_stickers_page({ cycle_config = {}})
			return true
		end
	}))
	return {
		n = G.UIT.O,
		config = { 
            object = UIBox{
            definition = All_in_Jest.stickers_collection_content_UIBox(1, { 5, 5 }, {
                snap_back = true,
                hide_single_page = true,
                collapse_single_page = true,
                center = 'j_joker',
                h_mod = 1.03,
                back_func = 'your_collection_other_gameobjects',
                modify_card = function(card, center)
                    card.ignore_pinned = true
                    center:apply(card, true)
                end,
            }),
			config = { offset = { x = 0, y = 0 }, align = 'cm' }
		}, id = 'your_collection_stickers_contents', align = 'cm' },
	}
end

G.FUNCS.jest_pc_stickers = function(e)
    if G.GAME.jest_pc_stickers_tab then
        G.GAME.jest_pc_stickers_tab = false
    else
        G.GAME.jest_pc_stickers_tab = true
    end
end

G.FUNCS.your_collection_stickers_page = function(args)
	local page = args.cycle_config.current_option or 1
	local t = All_in_Jest.stickers_collection_content_UIBox(page, { 5, 5 }, {
        snap_back = true,
        hide_single_page = true,
        collapse_single_page = true,
        center = 'j_joker',
        h_mod = 1.03,
        back_func = 'your_collection_other_gameobjects',
        modify_card = function(card, center)
            card.ignore_pinned = true
            center:apply(card, true)
        end,
    })
	local e = G.OVERLAY_MENU:get_UIE_by_ID('your_collection_stickers_contents')
	if e.config.object then e.config.object:remove() end
    e.config.object = UIBox{
      definition = t,
      config = {offset = {x=0,y=0}, align = 'cm', parent = e}
    }
end

All_in_Jest.stickers_collection_content_UIBox = function(page, rows, args)
    args = args or {}
    args.w_mod = args.w_mod or 1
    args.h_mod = args.h_mod or 1
    args.card_scale = args.card_scale or 1
    local deck_tables = {}
    local pool = SMODS.collection_pool(SMODS.Stickers)
	for i = #pool, 1, -1 do
	    local v = pool[i]
	    if v.config and v.config.aij and v.config.aij.pc_sticker and not G.GAME.jest_pc_stickers_tab then
	        table.remove(pool, i)
	    elseif G.GAME.jest_pc_stickers_tab then
	        if not (v.config and v.config.aij and v.config.aij.pc_sticker) then
	            table.remove(pool, i)
	        end
	    end
	end

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
            local sticker = pool[i+row_totals[j] + (cards_per_page*(e.cycle_config.current_option - 1))]
            if not sticker then break end

            local base = G.GAME.jest_pc_stickers_tab and G.P_CARDS.S_A or G.P_CARDS.empty
            local center = not G.GAME.jest_pc_stickers_tab and (args.center and G.P_CENTERS[args.center]) or G.P_CENTERS.c_base

            local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W*args.card_scale, G.CARD_H*args.card_scale, base, center)
            if args.modify_card then args.modify_card(card, sticker, i, j) end
            
            if not args.no_materialize then card:start_materialize(nil, i>1 or j>1) end
            G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
    end

    G.FUNCS.SMODS_card_collection_page{ cycle_config = { current_option = page }}

    local t = create_UIBox_generic_options({
        colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_colour or (G.ACTIVE_MOD_UI.ui_config or {}).colour),
        bg_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_bg_colour or (G.ACTIVE_MOD_UI.ui_config or {}).bg_colour),
        back_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_back_colour or (G.ACTIVE_MOD_UI.ui_config or {}).back_colour),
        outline_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_outline_colour or
                (G.ACTIVE_MOD_UI.ui_config or {}).outline_colour),
        back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_"..G.ACTIVE_MOD_UI.id or 'your_collection', snap_back = args.snap_back, infotip = args.infotip, contents = {
          {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
          (not args.hide_single_page or cards_per_page < #pool) and {n=G.UIT.R, config={align = "cm"}, nodes={
            create_option_cycle({options = options, w = 4.5, cycle_shoulders = true, opt_callback = 'SMODS_card_collection_page', current_option = 1, colour = G.ACTIVE_MOD_UI and (G.ACTIVE_MOD_UI.ui_config or {}).collection_option_cycle_colour or G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}}),
          }} or nil,
        (not All_in_Jest.config.aij_lite) and {n=G.UIT.R, config={align = "cm", r = 0.1, w = 0.2, minh = 0.9, hover = true, colour = G.C.RED, button = "jest_pc_stickers", shadow = true, focus_args = {nav = 'wide', snap_to = true}}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true, maxw = 4.8}, nodes={
                {n=G.UIT.T, config={text = localize("aij_pc_stickers"), scale = 0.5, colour = G.C.UI.TEXT_LIGHT}}
            }}
        }} or nil,
      }})
    return t
end
