SMODS.Booster:take_ownership_by_kind('Celestial', {
    group_key = "k_celestial_pack",
    update_pack = SMODS.Booster.update_pack,
    ease_background_colour = function(self) ease_background_colour_blind(G.STATES.PLANET_PACK) end,
    create_UIBox = SMODS.Booster.create_UIBox,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0,0, {
            timer = 0.07,
            scale = 0.1,
            initialize = true,
            lifespan = 15,
            speed = 0.1,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE, HEX('a7d6e0'), HEX('fddca0')},
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0,0, {
            timer = 2,
            scale = 0.05,
            lifespan = 1.5,
            speed = 4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE},
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _hand, _tally = nil, 0
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            if _hand then
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == _hand and not v.config.moon then
                        _planet = v.key
                    end
                end
            end
            _card = {set = "Planet", area = G.pack_cards, skip_materialize = true, soulable = true, key = _planet, key_append = "pl1"}
        else
            _card = {set = "Planet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "pl1"}
        end
        return _card
    end,
    loc_vars = pack_loc_vars,
},true)

if All_in_Jest.config.blue_stake_rework then
    SMODS.Stake:take_ownership('stake_blue', { 
        modifiers = function()
            return
        end,
    },true)
end

-- [[ Overriding Deck Skins ]] --
--G.FUNCS.change_collab = function(args)
--  if args.cycle_config.rank_table.cycle_config.current_option == 1 then
--    G.SETTINGS.CUSTOM_DECK.Collabs[args.cycle_config.curr_suit] = G.COLLABS.options[args.cycle_config.curr_suit][args.to_key] or 'default'
--  end
--  args.cycle_config.rank_table.cycle_config.other_option = args.to_key
--  G.FUNCS.change_collab_rank(args.cycle_config.rank_table)
--  for k, v in pairs(G.I.CARD) do
--    if v.config and v.config.card and v.children.front and v.ability.effect ~= 'Stone Card' then 
--      v:set_sprites(nil, v.config.card)
--    end
--  end
--  G:save_settings()
--end
--
--local custom_deck_tab_ref = G.UIDEF.custom_deck_tab
--function G.UIDEF.custom_deck_tab(_suit)
--  local t = {}
--
--  local rankCount = 0
--  local lookup = {}
--  for i, s in ipairs(SMODS.Suit:obj_list(true)) do
--      local options = G.COLLABS.options[s.key]
--      for i = 1, #options do
--          local skin = SMODS.DeckSkins[options[i]]
--          if skin.palettes and not (skin.display_ranks or skin.ranks) then
--              for _, p in ipairs(skin.palettes) do
--                  local p_ranks = p.display_ranks or p.ranks
--                  for j = 1, #p_ranks do
--                      if not lookup[p_ranks[j]] then
--                          lookup[p_ranks[j]] = true
--                          rankCount = rankCount + 1
--                      end
--                  end
--              end
--          elseif not skin.palettes and (skin.display_ranks or skin.ranks) then
--              local ranks = skin.display_ranks or skin.ranks
--              for j = 1, #ranks do
--                  if not lookup[skin.ranks[j]] then
--                      lookup[skin.ranks[j]] = true
--                      rankCount = rankCount + 1
--                  end
--              end
--          end
--
--      end
--  end
--
--  G.cdds_cards = CardArea(
--      0,0,
--      math.min(math.max(rankCount*G.CARD_W*0.6, 4*G.CARD_W), 10*G.CARD_W),
--      1.4*G.CARD_H,
--      {card_limit = rankCount, type = 'title', highlight_limit = 0})
--
--  G.cdds_cards.rankCount = rankCount
--
--
--
--  table.insert(t, 
--    {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 0.1, padding = 0.07, no_fill = true}, nodes={
--      {n=G.UIT.O, config={object = G.cdds_cards}}
--    }}
--  )
--
--  local loc_options = localize(_suit, 'collabs')
--  local conv_loc_options = {}
--  for k, v in pairs(loc_options) do
--    conv_loc_options[tonumber(k)] = v
--  end
--
--  loc_options = conv_loc_options
--
--  local current_option = 1
--  for k, v in pairs(G.COLLABS.options[_suit]) do
--    if current_rank_option ~= 1 then
--        if G.SETTINGS.all_in_jest.Collabs[_suit][k] == v then current_option = k end
--    else
--        if G.SETTINGS.CUSTOM_DECK.Collabs[_suit] == v then current_option = k end
--    end
--  end
--
--  local loc_rank_options = {}
--  local index = 2
--  loc_rank_options[1] = localize('k_default')
--  for k, v in pairs(lookup) do
--      local cur_rank_option = localize(k, 'ranks')
--      loc_rank_options[index] = cur_rank_option
--      index = index + 1
--  end
--
--  local current_rank_option = 1
--  local index = 1
--  for k, v in pairs(lookup) do
--    index = index + 1
--    for ke, va in pairs(G.COLLABS.options[_suit]) do
--        if G.SETTINGS.all_in_jest.Collabs[_suit][k] == v then current_rank_option = index end
--    end
--  end
--
--  local rank_table = {options = loc_rank_options, w = 5.5, cycle_shoulders = true, curr_suit = _suit, opt_callback = 'change_collab_rank', current_option = current_rank_option, other_option = current_option, colour = G.C.RED, focus_args = {snap_to = true, nav = 'wide'}}
--  table.insert(t, 
--    {n=G.UIT.R, config={align = "cm"}, nodes={
--      create_option_cycle(rank_table),
--    }}
--  )
--
--  table.insert(t, 
--    {n=G.UIT.R, config={align = "cm"}, nodes={
--      create_option_cycle({options = loc_options, w = 5.5, rank_table = {cycle_config = rank_table}, cycle_shoulders = true, curr_suit = _suit, opt_callback = 'change_collab', current_option = current_option, colour = G.C.RED, focus_args = {snap_to = true, nav = 'wide'}}),
--    }}
--  )
--  local deckskin_key = G.COLLABS.options[_suit][current_option]
--  
--  local palette_loc_options = SMODS.DeckSkin.get_palette_loc_options(deckskin_key, _suit)
--  
--  local selected_palette = 1
--  for i, v in ipairs(G.COLLABS.colour_palettes[deckskin_key]) do
--      if G.SETTINGS.colour_palettes[_suit] == v then
--          selected_palette = i
--      end
--  end
--  
--  table.insert(t,
--      {n=G.UIT.R, config={align = "cm", id = 'palette_selector'}, nodes={
--        create_option_cycle({options = palette_loc_options, w = 5.5, cycle_shoulders = false, curr_suit = _suit, curr_skin = deckskin_key, opt_callback = 'change_colour_palette', current_option = selected_palette, colour = G.C.ORANGE, focus_args = {snap_to = true, nav = 'wide'}}),
--      }}
--    )
--
--  local faces = {'K','Q','J'}
--  G.FUNCS.update_collab_cards(current_option, _suit, true)
--
--
--  return {n=G.UIT.ROOT, config={align = "cm", padding = 0, colour = G.C.CLEAR, r = 0.1, minw = 7, minh = 4.2}, nodes=t}
--end
-- [[ Overriding Deck Skins ]] --

--SMODS.Voucher:take_ownership('v_petroglyph', {
--    calculate = function(self, card, context)
--        ease_ante(-card.ability.extra)
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-card.ability.extra
--        if next(SMODS.find_card('j_aij_aluzinnu')) then
--        else
--            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra
--            ease_discard(-card.ability.extra)
--        end
--    end,
--}, true)
--
--SMODS.Voucher:take_ownership('v_hieroglyph', {
--    calculate = function(self, card, context)
--        ease_ante(-card.ability.extra)
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-card.ability.extra
--        if next(SMODS.find_card('j_aij_aluzinnu')) then
--        else
--            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra
--            ease_hands_played(-card.ability.extra)
--        end
--    end,
--}, true)

local has_any_suit_ref = SMODS.has_any_suit
function SMODS.has_any_suit(card)
    return has_any_suit_ref(card) or All_in_Jest.counts_as_all_suits(card)
end

local always_scores_ref = SMODS.always_scores
function SMODS.always_scores(card)
    return always_scores_ref(card)
end

local has_no_suit_ref = SMODS.has_no_suit
function SMODS.has_no_suit(card)
    if card.base.suit == nil then return true end
    if SMODS.has_enhancement(card, 'm_aij_canvas') then
        if (card.area == G.hand or card.area == G.play) and not card.debuff then
            for k, v in pairs(G.play.cards) do
                if v == card and v ~= G.play.cards[#G.play.cards] and not G.play.cards[k+1].debuff then
                    card.front_hidden = G.play.cards[k+1]:should_hide_front()
                    return SMODS.has_no_suit(G.play.cards[k+1])
                end
            end
            local highlighted = false
            local highlighted_cards = {}
            for k, v in pairs(G.hand.cards) do
                for key, val in pairs(G.hand.highlighted) do
                    if v == val then
                        highlighted_cards[#highlighted_cards+1] = v
                    end
                end
            end
            for k, v in pairs(highlighted_cards) do
                if v == card then
                    highlighted = true
                    if v ~= highlighted_cards[#highlighted_cards] and not highlighted_cards[k+1].debuff then
                        card.front_hidden = highlighted_cards[k+1]:should_hide_front()
                        return SMODS.has_no_suit(highlighted_cards[k+1])
                    end
                end
            end
            if not highlighted then
                for k, v in pairs(G.hand.cards) do
                    if v == card and v ~= G.hand.cards[#G.hand.cards] and not G.hand.cards[k+1].debuff then
                        card.front_hidden = G.hand.cards[k+1]:should_hide_front()
                        return SMODS.has_no_suit(G.hand.cards[k+1])
                    end
                end
            end
            card.front_hidden = card:should_hide_front()
            return true
        else
            card.front_hidden = card:should_hide_front()
            return true
        end
    end
    return has_no_suit_ref(card)
end

local has_no_rank_ref = SMODS.has_no_rank
function SMODS.has_no_rank(card)
    if card.base.id == nil then return true end
    if SMODS.has_enhancement(card, 'm_aij_canvas') then
        if (card.area == G.hand or card.area == G.play) and card.area ~= nil and not card.debuff then
            for k, v in pairs(G.play.cards) do
                if v == card and v ~= G.play.cards[#G.play.cards] and not G.play.cards[k+1].debuff then
                    card.front_hidden = G.play.cards[k+1]:should_hide_front()
                    return SMODS.has_no_rank(G.play.cards[k+1])
                end
            end
            local highlighted = false
            local highlighted_cards = {}
            for k, v in pairs(G.hand.cards) do
                for key, val in pairs(G.hand.highlighted) do
                    if v == val then
                        highlighted_cards[#highlighted_cards+1] = v
                    end
                end
            end
            for k, v in pairs(highlighted_cards) do
                if v == card then
                    highlighted = true
                    if v ~= highlighted_cards[#highlighted_cards] and not highlighted_cards[k+1].debuff then
                        card.front_hidden = highlighted_cards[k+1]:should_hide_front()
                        return SMODS.has_no_rank(highlighted_cards[k+1])
                    end
                end
            end
            if not highlighted then
                for k, v in pairs(G.hand.cards) do
                    if v == card and v ~= G.hand.cards[#G.hand.cards] and not G.hand.cards[k+1].debuff then
                        card.front_hidden = G.hand.cards[k+1]:should_hide_front()
                        return SMODS.has_no_rank(G.hand.cards[k+1])
                    end
                end
            end
            card.front_hidden = card:should_hide_front()
            return true
        else
            card.front_hidden = card:should_hide_front()
            return true
        end
    end
    return has_no_rank_ref(card)
end

local get_front_spriteinfo_ref = get_front_spriteinfo
function get_front_spriteinfo(_front)
    if _front and _front.suit and _front.value and _front.card and _front.card.ability and _front.card.ability.all_in_jest and _front.card.ability.all_in_jest.random_aij_deck_skin and All_in_Jest.config.random_deck_skins then
        local collab = _front.card.ability.all_in_jest.random_aij_deck_skin[_front.suit]
        if collab then
            local deckSkin = SMODS.DeckSkins[collab]
            if deckSkin then
                if deckSkin.outdated then
                    local hasRank = false
                    for i = 1, #deckSkin.ranks do
                        if deckSkin.ranks[i] == _front.value then hasRank = true break end
                    end
                    if hasRank then
                        local atlas = G.ASSET_ATLAS[G.SETTINGS.colour_palettes[_front.suit] == 'hc' and deckSkin.hc_atlas or deckSkin.lc_atlas]
                        if atlas then
                            if deckSkin.pos_style == 'collab' then
                                return atlas, G.COLLABS.pos[_front.value]
                            elseif deckSkin.pos_style == 'suit' then
                                return atlas, { x = _front.pos.x, y = 0}
                            elseif deckSkin.pos_style == 'deck' then
                                return atlas, _front.pos
                            elseif deckSkin.pos_style == 'ranks' or nil then
                                for i, rank in ipairs(deckSkin.ranks) do
                                    if rank == _front.value then
                                        return atlas, { x = i - 1, y = 0}
                                    end
                                end
                            end
                        end
                    end
                    return G.ASSET_ATLAS[G.SETTINGS.colour_palettes[_front.suit] == 'hc' and _front.hc_atlas or _front.lc_atlas or {}] or G.ASSET_ATLAS[_front.atlas] or G.ASSET_ATLAS["cards_"..(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and 2 or 1)], _front.pos
                else
                    local palette = deckSkin.palette_map and deckSkin.palette_map[G.SETTINGS.colour_palettes[_front.suit] or ''] or (deckSkin.palettes or {})[1]
                    local hasRank = false
                    for i = 1, #palette.ranks do
                        if palette.ranks[i] == _front.value then hasRank = true break end
                    end
                    if hasRank then
                        local atlas = G.ASSET_ATLAS[palette.atlas]
                        if type(palette.pos_style) == "table" then
                            if palette.pos_style[_front.value] then
                                if palette.pos_style[_front.value].atlas then
                                    atlas = G.ASSET_ATLAS[palette.pos_style[_front.value].atlas]
                                end
                                if palette.pos_style[_front.value].pos then
                                    return atlas, palette.pos_style[_front.value].pos
                                end
                            elseif palette.pos_style.fallback_style then
                                if palette.pos_style.fallback_style == 'collab' then
                                    return atlas, G.COLLABS.pos[_front.value]
                                elseif palette.pos_style.fallback_style == 'suit' then
                                    return atlas, { x = _front.pos.x, y = 0}
                                elseif palette.pos_style.fallback_style == 'deck' then
                                    return atlas, _front.pos
                                end
                            end
                        elseif palette.pos_style == 'collab' then
                            return atlas, G.COLLABS.pos[_front.value]
                        elseif palette.pos_style == 'suit' then
                            return atlas, { x = _front.pos.x, y = 0}
                        elseif palette.pos_style == 'deck' then
                            return atlas, _front.pos
                        elseif palette.pos_style == 'ranks' or nil then
                            for i, rank in ipairs(palette.ranks) do
                                if rank == _front.value then
                                    return atlas, { x = i - 1, y = 0}
                                end
                            end
                        end
                    end
                    return G.ASSET_ATLAS[palette.hc_default and _front.hc_atlas or _front.lc_atlas or {}] or G.ASSET_ATLAS[_front.atlas] or G.ASSET_ATLAS["cards_"..(palette.hc_default and 2 or 1)], _front.pos
                end
            end
        end
    end
    -- if _front and _front.suit and _front.value and G.SETTINGS.all_in_jest and G.SETTINGS.all_in_jest.Collabs then
    --     local collab = G.SETTINGS.all_in_jest.Collabs[_front.suit][_front.value]
    --     if collab and collab ~= 'default_'.._front.suit and collab ~= 'default' then
    --         local deckSkin = SMODS.DeckSkins[collab]
    --         if deckSkin then
    --             if deckSkin.outdated then
    --                 local hasRank = false
    --                 for i = 1, #deckSkin.ranks do
    --                     if deckSkin.ranks[i] == _front.value then hasRank = true break end
    --                 end
    --                 if hasRank then
    --                     local atlas = G.ASSET_ATLAS[G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] == 'hc' and deckSkin.hc_atlas or deckSkin.lc_atlas]
    --                     if atlas then
    --                         if deckSkin.pos_style == 'collab' then
    --                             return atlas, G.COLLABS.pos[_front.value]
    --                         elseif deckSkin.pos_style == 'suit' then
    --                             return atlas, { x = _front.pos.x, y = 0}
    --                         elseif deckSkin.pos_style == 'deck' then
    --                             return atlas, _front.pos
    --                         elseif deckSkin.pos_style == 'ranks' or nil then
    --                             for i, rank in ipairs(deckSkin.ranks) do
    --                                 if rank == _front.value then
    --                                     return atlas, { x = i - 1, y = 0}
    --                                 end
    --                             end
    --                         end
    --                     end
    --                 end
    --                 return G.ASSET_ATLAS[G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] == 'hc' and _front.hc_atlas or _front.lc_atlas or {}] or G.ASSET_ATLAS[_front.atlas] or G.ASSET_ATLAS["cards_"..(G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] == 'hc' and 2 or 1)], _front.pos
    --             else
    --                 local palette = deckSkin.palette_map and deckSkin.palette_map[G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] or ''] or (deckSkin.palettes or {})[1]
    --                 local hasRank = false
    --                 for i = 1, #palette.ranks do
    --                     if palette.ranks[i] == _front.value then hasRank = true break end
    --                 end
    --                 if hasRank then
    --                     local atlas = G.ASSET_ATLAS[palette.atlas]
    --                     if type(palette.pos_style) == "table" then
    --                         if palette.pos_style[_front.value] then
    --                             if palette.pos_style[_front.value].atlas then
    --                                 atlas = G.ASSET_ATLAS[palette.pos_style[_front.value].atlas]
    --                             end
    --                             if palette.pos_style[_front.value].pos then
    --                                 return atlas, palette.pos_style[_front.value].pos
    --                             end
    --                         elseif palette.pos_style.fallback_style then
    --                             if palette.pos_style.fallback_style == 'collab' then
    --                                 return atlas, G.COLLABS.pos[_front.value]
    --                             elseif palette.pos_style.fallback_style == 'suit' then
    --                                 return atlas, { x = _front.pos.x, y = 0}
    --                             elseif palette.pos_style.fallback_style == 'deck' then
    --                                 return atlas, _front.pos
    --                             end
    --                         end
    --                     elseif palette.pos_style == 'collab' then
    --                         return atlas, G.COLLABS.pos[_front.value]
    --                     elseif palette.pos_style == 'suit' then
    --                         return atlas, { x = _front.pos.x, y = 0}
    --                     elseif palette.pos_style == 'deck' then
    --                         return atlas, _front.pos
    --                     elseif palette.pos_style == 'ranks' or nil then
    --                         for i, rank in ipairs(palette.ranks) do
    --                             if rank == _front.value then
    --                                 return atlas, { x = i - 1, y = 0}
    --                             end
    --                         end
    --                     end
    --                 end
    --                 return G.ASSET_ATLAS[palette.hc_default and _front.hc_atlas or _front.lc_atlas or {}] or G.ASSET_ATLAS[_front.atlas] or G.ASSET_ATLAS["cards_"..(palette.hc_default and 2 or 1)], _front.pos
    --             end
    --         end
    --     end
    -- end
    return get_front_spriteinfo_ref(_front)
end

local should_hide_front_ref = Card.should_hide_front
function Card:should_hide_front()
  if SMODS.has_enhancement(self, 'm_aij_canvas') then
    if ((G.hand and self.area == G.hand) or (G.play and self.area == G.play)) and not self.debuff then
        for k, v in pairs(G.play.cards) do
            if v == self and v ~= G.play.cards[#G.play.cards] and not G.play.cards[k+1].debuff then
                return G.play.cards[k+1]:should_hide_front()
            end
        end
        local highlighted = false
        local highlighted_cards = {}
        for k, v in pairs(G.hand.cards) do
            for key, val in pairs(G.hand.highlighted) do
                if v == val then
                    highlighted_cards[#highlighted_cards+1] = v
                end
            end
        end
        for k, v in pairs(highlighted_cards) do
            if v == self then
                highlighted = true
                if v == self and v ~= highlighted_cards[#highlighted_cards] and not highlighted_cards[k+1].debuff then
                    return highlighted_cards[k+1]:should_hide_front()
                end
            end
        end
        if not highlighted then
            for k, v in pairs(G.hand.cards) do
                if v == self and v ~= G.hand.cards[#G.hand.cards] and not G.hand.cards[k+1].debuff then
                    return G.hand.cards[k+1]:should_hide_front()
                end
            end
        end
        return true
    else
        return true
    end
  end
  return should_hide_front_ref(self)
end

local has_showman_ref = SMODS.showman
function SMODS.showman(card_key)
    --if next(SMODS.find_card('j_aij_aluzinnu')) and (card_key == "v_petroglyph" or card_key == "v_hieroglyph") then
    --    return true
    --end
    return has_showman_ref(card_key)
end

All_in_Jest.vanilla_food = {
  j_gros_michel = true,
  j_egg = true,
  j_ice_cream = true,
  j_cavendish = true,
  j_turtle_bean = true,
  j_diet_cola = true,
  j_popcorn = true,
  j_ramen = true,
  j_selzer = true,
}

if not SMODS.ObjectTypes.Food then
  SMODS.ObjectType {
    key = 'Food',
    default = 'j_egg',
    cards = {},
    inject = function(self)
      SMODS.ObjectType.inject(self)
      for k, _ in pairs(All_in_Jest.vanilla_food) do
        self:inject_card(G.P_CENTERS[k])
      end
    end
  }
end

--Sharpest Tool
local temp_create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local card = nil
    if ((area == G.shop_jokers) or (area == G.pack_cards and key_append == 'buf')) and _type == 'Joker' then
        if G.GAME.modifiers.aij_sharpest_tool_1 then
            card = temp_create_card(_type, area, false, 0, skip_materialize, soulable, nil, key_append)
        end
    end
    if not card then
        card = temp_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    end
    return card
end

--Aureate Coin, The Clay
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod > 0 then
        G.P_BLINDS['bl_aij_aureate_coin'].boss.spent_money = 0
        local common_suit, common_rank = nil, nil
        local temp_suit_val, temp_rank_val = 0, 0
        local suit_table, rank_table = {}, {}
        for k, v in pairs(G.deck.cards) do
            suit_table[v.base.suit] = suit_table[v.base.suit] or 0 
            suit_table[v.base.suit] = suit_table[v.base.suit] + 1
            rank_table[v.base.value] = rank_table[v.base.value] or 0 
            rank_table[v.base.value] = rank_table[v.base.value] + 1
        end
        for k, v in pairs(suit_table) do
            if v >= temp_suit_val then
                temp_suit_val = v
                common_suit = k
            end
        end
        for k, v in pairs(rank_table) do
            if v >= temp_rank_val then
                temp_rank_val = v
                common_rank = k
            end
        end
        G.P_BLINDS['bl_aij_the_journey'].boss.selected_suit = pseudorandom_element(All_in_Jest.get_suits('key'), pseudoseed('the_journey'))
        G.P_BLINDS['bl_aij_the_auroch'].boss.suit = common_suit or G.P_BLINDS['bl_aij_the_auroch'].boss.suit
        G.P_BLINDS['bl_aij_the_auroch'].boss.rank = common_rank or G.P_BLINDS['bl_aij_the_auroch'].boss.rank
        -- G.P_BLINDS['bl_aij_the_clay'].mult = pseudorandom("clay", 2, 4) + math.floor(100*pseudorandom("clay"))/100 -- Randomises an integer part (1-4) and a decimal part (0.00 to 0.99) before adding both together
        G.GAME.all_in_jest.unused_hands.ante = 0
        G.GAME.all_in_jest.unused_discards.ante = 0
    end
    
    local ref = ease_anteref(mod)
    return ref
end
SMODS.jest_Badge = {
    key = "jest_chaotic_card",
    badge_colour = HEX '8F00FF',
}

SMODS.PokerHand {
    key = "Royal Flush",
    mult = 8,
    chips = 100,
    l_mult = 6,
    l_chips = 60,
    example = {
        { 'S_A', true },
        { 'S_K', true },
        { 'S_Q', true },
        { 'S_J', true },
        { 'S_10', true },
    },
    above_hand = 'Straight Flush',
    evaluate = function(parts, hand)
        if not next(parts._flush) or not next(parts._straight) then return {} end
        local min = 10
        for j = 1, #hand do
            if hand[j]:get_id() < min then min =hand[j]:get_id() end
        end
        if min >= 10 then 
            return { SMODS.merge_lists(parts._flush, parts._straight) }
        else
            return {}
        end
    end,
    visible = function(self)
        return false
    end,
}

local init_game_object_ref = Game.init_game_object
function Game.init_game_object(self)
  local ret = init_game_object_ref(self)
  local secrets = {}
  for k, v in pairs(SMODS.PokerHands) do
    if (type(v.visible) == 'function' and not v:visible()) or v.visible == false then 
        if k ~= 'aij_Royal Flush' then
            table.insert(secrets, k) 
        end
    end
  end
  ret.all_in_jest = ret.all_in_jest or {}
  ret.all_in_jest.secret_hands = secrets
  return ret
end

-- Modified from Aura
function All_in_Jest.update_frame(dt, k, obj, jkr)
    local anim = G.GAME.all_in_jest.AIJAnimated[k]
    local layers = anim.layers
    if anim and obj and (anim.frames or anim.individual) then
        local next_frame = false
        local next_soul_frames = {}
        if not anim.t then anim.t = 0 end
        anim.t = anim.t + dt
        if anim.t > 1/(anim.fps or 10) then
            anim.t = anim.t - 1/(anim.fps or 10)
            next_frame = true
        end
        if layers then
            for key, v in pairs(layers) do
                if not v.t then v.t = 0 end
                if not next_soul_frames[key] then next_soul_frames[key] = false end
                next_soul_frames[key] = false
                v.t = v.t + dt
                if v.t > 1/(v.fps or anim.fps or 10) then
                    v.t = v.t - 1/(v.fps or anim.fps or 10)
                    next_soul_frames[key] = true
                end
            end
        end
        if next_frame then
            local xrows, yrows = nil
            if anim.frames_per_row and anim.frames_per_row == 'atlas_size' then
                xrows, yrows = SMODS.Atlas.obj_table[obj.atlas].image:getDimensions()
                xrows = xrows / SMODS.Atlas.obj_table[obj.atlas].px
                yrows = yrows / SMODS.Atlas.obj_table[obj.atlas].py
                anim.frames_per_row = xrows
                if anim.start_frame then
                    anim.start_frame = anim.start_frame + (xrows * anim.extra_yrows)
                end
                anim.frames = anim.frames + (xrows * anim.extra_yrows)
            end
            local loc = obj.pos.y*(anim.frames_per_row or anim.frames)+obj.pos.x
            if (not anim.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                loc = loc + 1
                if anim.immediate and jkr and jkr.animation.target then
                    loc = jkr.animation.target
                end
            end
            if loc >= anim.frames then loc = anim.start_frame or 0 end
            obj.pos.x = (anim.held_frame or loc)%(anim.frames_per_row or anim.frames)
            obj.pos.y = math.floor((anim.held_frame or loc)/(anim.frames_per_row or anim.frames))
            if obj.all_in_jest and obj.all_in_jest.layer_funcs and obj.all_in_jest.layer_funcs.pos and type(obj.all_in_jest.layer_funcs.pos) == "function" then
                obj.all_in_jest.layer_funcs.pos(anim, obj, loc)
            end
            if anim.hold then
                local hold = anim.hold
                local xrows, yrows = nil
                if hold.frames_per_row and hold.frames_per_row == 'atlas_size' then
                    xrows, yrows = SMODS.Atlas.obj_table[obj.atlas].image:getDimensions()
                    xrows = xrows / SMODS.Atlas.obj_table[obj.atlas].px
                    yrows = yrows / SMODS.Atlas.obj_table[obj.atlas].py
                    hold.frames_per_row = xrows
                    if hold.min_start_frames then
                        hold.min_start_frames = hold.min_start_frames + (xrows * anim.extra_yrows)
                    end
                    hold.min_frames = hold.min_frames + (xrows * anim.extra_yrows)
                    hold.max_frames = hold.max_frames + (xrows * anim.extra_yrows)
                end
                hold.temp = hold.temp or 0
                hold.temp = hold.temp + 1
                if hold.hold_for_min then hold.cur_random = hold.cur_random or math.random(hold.hold_for_min, hold.hold_for_max) end
                if hold.temp >= (hold.hold_for or hold.cur_random) then
                    anim.frames = anim.frames + hold.frames
                    anim.start_frame = anim.start_frame + hold.frames
                    if anim.frames >= hold.max_frames then
                        anim.frames = hold.min_frames
                        anim.start_frame = hold.min_start_frames
                    end
                    if hold.cur_random then hold.cur_random = nil end
                    hold.temp = 0
                end
            end
        end
        if layers then
            for key, v in pairs(layers) do
                if next_soul_frames[key] then
                    local loc = nil
                    local xrows, yrows = nil
                    if v.frames_per_row and v.frames_per_row == 'atlas_size' then
                        xrows, yrows = SMODS.Atlas.obj_table[obj.atlas].image:getDimensions()
                        xrows = xrows / SMODS.Atlas.obj_table[obj.atlas].px
                        yrows = yrows / SMODS.Atlas.obj_table[obj.atlas].py
                        v.frames_per_row = xrows
                        if v.start_frame then
                            v.start_frame = v.start_frame + (xrows * v.extra_yrows)
                        end
                        v.frames = v.frames + (xrows * v.extra_yrows)
                    end
                    if key == 'soul_pos' then
                        loc = obj.soul_pos.y*(v.frames_per_row or v.frames)+obj.soul_pos.x
                        if (not v.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                            loc = loc + 1
                            if v.immediate and jkr and jkr.animation.target then
                                loc = jkr.animation.target
                            end
                        end
                        if loc >= v.frames then loc = v.start_frame or 0 end
                        obj.soul_pos.x = (v.held_frame or loc)%(v.frames_per_row or v.frames)
                        obj.soul_pos.y = math.floor((v.held_frame or loc)/(v.frames_per_row or v.frames))
                        if obj.all_in_jest and obj.all_in_jest.layer_funcs and obj.all_in_jest.layer_funcs.soul_pos and type(obj.all_in_jest.layer_funcs.soul_pos) == "function" then
                            obj.all_in_jest.layer_funcs.soul_pos(v, obj, loc)
                        end
                    else
                        loc = obj.all_in_jest.soul_layers[key].pos.y*(v.frames_per_row or v.frames)+obj.all_in_jest.soul_layers[key].pos.x
                        if (not v.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                            loc = loc + 1
                            if v.immediate and jkr and jkr.animation.target then
                                loc = jkr.animation.target
                            end
                        end
                        if loc >= v.frames then loc = v.start_frame or 0 end
                        obj.all_in_jest.soul_layers[key].pos.x = (v.held_frame or loc)%(v.frames_per_row or v.frames)
                        obj.all_in_jest.soul_layers[key].pos.y = math.floor((v.held_frame or loc)/(v.frames_per_row or v.frames))
                        if obj.all_in_jest.layer_funcs and obj.all_in_jest.layer_funcs[key] and type(obj.all_in_jest.layer_funcs[key]) == "function" then
                            obj.all_in_jest.layer_funcs[key](v, obj, loc)
                        end
                    end
                    if v.hold then
                        local hold = v.hold
                        hold.temp = hold.temp or 0
                        hold.temp = hold.temp + 1
                        if hold.hold_for_min then hold.cur_random = hold.cur_random or math.random(hold.hold_for_min, hold.hold_for_max) end
                        if hold.temp >= (hold.hold_for or hold.cur_random) then
                            v.frames = v.frames + hold.frames
                            v.start_frame = v.start_frame + hold.frames
                            if v.frames >= hold.max_frames then
                                v.frames = hold.min_frames
                                v.start_frame = hold.min_start_frames
                            end
                            if hold.cur_random then hold.cur_random = nil end
                            hold.temp = 0
                        end
                    end
                end
            end
        end
    end
end

local gameupdateref = Game.update
function Game:update(dt)
    local ref = gameupdateref(self, dt)
    for k, v in pairs(G.GAME.all_in_jest.AIJAnimated) do
        All_in_Jest.update_frame(dt, k, G.P_CENTERS[k])
        if not G.P_CENTERS[k] then
            for n, val in pairs(G.P_CENTER_POOLS.Enhanced) do
                if G.P_CENTER_POOLS.Enhanced[n].key == k then
                    All_in_Jest.update_frame(dt, k, G.P_CENTER_POOLS.Enhanced[n])
                end
            end
        end
    end
    return ref
end

local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
	local ref = set_spritesref(self, _center, _front)
    if _center and _center.discovered and _center.all_in_jest and _center.all_in_jest.soul_layers then
        for k, v in pairs(_center.all_in_jest.soul_layers) do
            if _center.all_in_jest.soul_layers[k] and not self.children[k] then
                local scale_mod = _center.all_in_jest.soul_layers[k].moving and 0.07 + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3 or 0.07
				local rotate_mod = _center.all_in_jest.soul_layers[k].moving and 0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2 or 0
				self.children[k] = Sprite(
					self.T.x,
					self.T.y,
					self.T.w,
					self.T.h,
					G.ASSET_ATLAS[_center.all_in_jest.soul_layers.atlas or _center.atlas or _center.set],
					_center.all_in_jest.soul_layers[k].pos
				)
				self.children[k].role.draw_major = self
				self.children[k].states.hover.can = false
				self.children[k].states.click.can = false
			end
            self.children[k]:set_sprite_pos(_center.all_in_jest.soul_layers[k].pos)
        end
    end
    return ref
end

-- Save/Load for tags in shop as cards
-- A lovely patch for Card:load() is also needed
local card_save_ref = Card.save
function Card:save()
    local saveTable = card_save_ref(self)
    saveTable.aij = saveTable.aij or {}
    if self.config.tag and self.config.tag.is and self.config.tag:is(Tag) then
        saveTable.aij.tag = self.config.tag:save()
    end
    return saveTable
end

-- Automatically saves G.GAME.blind.original_chips when blind is loaded
local aij_blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    local ret = aij_blind_set_blind_ref(self, blind, reset, silent)
    if not reset then
        self.original_chips = self.chips
    end
    return ret
end

-- Handle original chips when game is saved and reloaded
local aij_blind_save_ref = Blind.save
function Blind:save()
    local blindTable = aij_blind_save_ref(self)
    blindTable.original_chips = self.original_chips
    return blindTable
end
local aij_blind_load_ref = Blind.load
function Blind:load(blindTable)
    local ret = aij_blind_load_ref(self, blindTable)
    self.original_chips = blindTable.original_chips
    return blindTable
end