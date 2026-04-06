-- args.to_val gets the value of the selected option
-- args.to_key gets the index of the selected option (or the key if its a dictionary-like table)

G.FUNCS.tag_aij_nonstandard_set_suit = function(args)
  local suit_pool = {}
  for suit_key, _ in pairs(SMODS.Suits) do
      table.insert(suit_pool, suit_key)
  end
  table.sort(suit_pool, function(a, b)
      return SMODS.Suits[a].suit_nominal < SMODS.Suits[b].suit_nominal
  end)

  local suit_key = suit_pool[args.to_key]
  G.customize_card.cards[1]:change_suit(suit_key)
end
G.FUNCS.tag_aij_nonstandard_set_rank = function(args)
  local rank_pool = {}
  for rank_key, _ in pairs(SMODS.Ranks) do
      table.insert(rank_pool, rank_key)
  end
  table.sort(rank_pool, function(a, b)
      return (a == "Ace" and -1 or SMODS.Ranks[a].sort_nominal) < (b == "Ace" and -1 or SMODS.Ranks[b].sort_nominal)
  end)

  local rank_key = rank_pool[args.to_key]
  SMODS.change_base(G.customize_card.cards[1], nil, rank_key)
end
G.FUNCS.tag_aij_nonstandard_set_enhancement = function(args)
  local enhancement_pool = {"c_base"}
  for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
      local enhancement_key = enhancement.key
      table.insert(enhancement_pool, enhancement_key)
  end

  local enhancement_key = enhancement_pool[args.to_key]
  G.E_MANAGER:add_event(Event({func = function()
    G.customize_card.cards[1]:set_ability(G.P_CENTERS[enhancement_key])
    return true
  end}))
  G.E_MANAGER:add_event(Event({func = function()
    G.customize_card.cards[1].front_hidden = G.customize_card.cards[1]:should_hide_front()
    return true
  end}))
end
G.FUNCS.tag_aij_nonstandard_set_edition = function(args)
  local edition_pool = {"e_base"}
  for _, edition_key in pairs(get_current_pool("Edition", nil, nil, "edition_generic")) do
      if edition_key ~= "UNAVAILABLE" then
          table.insert(edition_pool, edition_key)
      end
  end

  local edition_key = edition_pool[args.to_key]
  G.E_MANAGER:add_event(Event({func = function()
    G.customize_card.cards[1]:set_edition(edition_key, true)
    return true
  end}))
end
G.FUNCS.tag_aij_nonstandard_set_seal = function(args)
  local seal_pool = {[1] = false}
  for _, seal in pairs(G.P_CENTER_POOLS.Seal) do
      local seal_key = seal.key
      table.insert(seal_pool, seal_key)
  end

  local seal_key = seal_pool[args.to_key]
  G.E_MANAGER:add_event(Event({func = function()
    G.customize_card.cards[1]:set_seal(seal_key, nil, true)
    return true
  end}))
end
G.FUNCS.tag_aij_nonstandard_set_paperback_clip = function(args)
  local paperback_clip_pool = {}
  for sticker_key, _ in pairs(SMODS.Stickers) do
      if PB_UTIL.is_paperclip(sticker_key) and not PB_UTIL.is_special_clip(string.sub(sticker_key, #"paperback_" + 1, #sticker_key)) then
          local clip_key = string.sub(sticker_key, #"paperback_" + 1, #sticker_key - #"_clip")
          table.insert(paperback_clip_pool, clip_key)
      end
  end

  local clip_sort_values = {}
  for i, v in ipairs(PB_UTIL.ENABLED_PAPERCLIPS) do
      clip_sort_values[string.sub(v , 1, #v - #"_clip")] = i
  end
  table.sort(paperback_clip_pool, function(a, b)
      local a_sort_nominal = clip_sort_values[a] or 99
      local b_sort_nominal = clip_sort_values[b] or 99
      return a_sort_nominal < b_sort_nominal
  end)

  table.insert(paperback_clip_pool, 1, false)

  local paperback_clip_key = paperback_clip_pool[args.to_key]
  G.E_MANAGER:add_event(Event({func = function()
    if paperback_clip_key then
        PB_UTIL.set_paperclip(G.customize_card.cards[1], paperback_clip_key)
    else
        PB_UTIL.remove_paperclip(G.customize_card.cards[1])
    end
    return true
  end}))
end
G.FUNCS.tag_aij_nonstandard_set_submit = function(args)
  G.E_MANAGER:add_event(Event({func = function()
      local new_cards = {}
      for i = 1, 2 do
          local new_card = copy_card(G.customize_card.cards[1], nil, nil, G.playing_card)
          new_card:add_to_deck()
          G.deck.config.card_limit = G.deck.config.card_limit + 1
          table.insert(G.playing_cards, new_card)
          G.deck:emplace(new_card)
          new_cards[#new_cards+1] = new_card
      end
      playing_card_joker_effects(new_cards)
      if G.customize_card ~= nil then
          G.customize_card:remove()
          G.customize_card = nil
      end
      if G.OVERLAY_MENU ~= nil then
          G.OVERLAY_MENU:remove()
          G.OVERLAY_MENU = nil
      end
      return true
  end}))
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

function create_UIBox_nonstandard()  

  G.customize_card = CardArea(
      0,0,
      math.min(math.max(1*G.CARD_W*0.6, 4*G.CARD_W), 10*G.CARD_W),
      1.4*G.CARD_H,
      {card_limit = 1, type = 'play', highlight_limit = 0}
  )

  local card = Card(
    G.customize_card.T.x+G.customize_card.T.w/2,
    G.customize_card.T.y+G.customize_card.T.h/2,
    G.CARD_W*1.2,
    G.CARD_H*1.2,
    G.P_CARDS["D_A"],
    G.P_CENTERS.c_base
  )
  -- card.no_ui = true
  card.ability.jest_copy_edition = true
  G.customize_card:emplace(card)

  local suit_pool = {}
  for suit_key, _ in pairs(SMODS.Suits) do
      table.insert(suit_pool, suit_key)
  end
  table.sort(suit_pool, function(a, b)
      return SMODS.Suits[a].suit_nominal < SMODS.Suits[b].suit_nominal
  end)
  for i, suit_key in ipairs(suit_pool) do
      suit_pool[i] = localize(suit_key, "suits_singular")
  end
  local suits_option_cycle = create_option_cycle({label = "Set Suit", text_scale = 0.4, scale = 0.8, w = 3, options = suit_pool, opt_callback = "tag_aij_nonstandard_set_suit", current_option = 1})

  local rank_pool = {}
  for rank_key, _ in pairs(SMODS.Ranks) do
      table.insert(rank_pool, rank_key)
  end
  table.sort(rank_pool, function(a, b)
      return (a == "Ace" and -1 or SMODS.Ranks[a].sort_nominal) < (b == "Ace" and -1 or SMODS.Ranks[b].sort_nominal)
  end)
  for i, rank_key in ipairs(rank_pool) do
      rank_pool[i] = localize(rank_key, "ranks")
  end
  local ranks_option_cycle = create_option_cycle({label = "Set Rank", text_scale = 0.4, scale = 0.8, w = 3, options = rank_pool, opt_callback = "tag_aij_nonstandard_set_rank", current_option = 1})

  local enhancement_pool = {localize("k_none")}
  for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
      local enhancement_key = enhancement.key
      table.insert(enhancement_pool, localize{key = enhancement_key, set = "Enhanced", type = "name_text"})
  end
  local enhancements_option_cycle = create_option_cycle({label = "Enhancement", text_scale = 0.4, scale = 0.8, w = 3, options = enhancement_pool, opt_callback = "tag_aij_nonstandard_set_enhancement", current_option = 1})

  local edition_pool = {localize{key = "e_base", set = "Edition", type = "name_text"}}
  for _, edition_key in pairs(get_current_pool("Edition", nil, nil, "edition_generic")) do
      if edition_key ~= "UNAVAILABLE" then
          table.insert(edition_pool, localize{key = edition_key, set = "Edition", type = "name_text"})
      end
  end
  local editions_option_cycle = create_option_cycle({label = "Edition", text_scale = 0.4, scale = 0.8, w = 3, options = edition_pool, opt_callback = "tag_aij_nonstandard_set_edition", current_option = 1})

  local seal_pool = {localize("k_none")}
  for _, seal in pairs(G.P_CENTER_POOLS.Seal) do
      local seal_key = string.lower(seal.key) .. "_seal"
      table.insert(seal_pool, localize{key = seal_key, set = "Other", type = "name_text"})
  end
  local seals_option_cycle = create_option_cycle({label = "Seal", text_scale = 0.4, scale = 0.8, w = 3, options = seal_pool, opt_callback = "tag_aij_nonstandard_set_seal", current_option = 1})


  local paperback_clip_option_cycle = nil
  if next(SMODS.find_mod("paperback")) then
      local paperback_clip_pool = {}
      for sticker_key, _ in pairs(SMODS.Stickers) do
          if PB_UTIL.is_paperclip(sticker_key) and not PB_UTIL.is_special_clip(string.sub(sticker_key, #"paperback_" + 1, #sticker_key)) then
              table.insert(paperback_clip_pool, sticker_key)
          end
      end

      local clip_sort_values = {}
      for i, v in ipairs(PB_UTIL.ENABLED_PAPERCLIPS) do
          clip_sort_values["paperback_" .. v] = i
      end
      table.sort(paperback_clip_pool, function(a, b)
          local a_sort_nominal = clip_sort_values[a] or 99
          local b_sort_nominal = clip_sort_values[b] or 99
          return a_sort_nominal < b_sort_nominal
      end)
      for i, v in ipairs(paperback_clip_pool) do
          paperback_clip_pool[i] = localize{key = v, set = "Other", type = "name_text"}
      end

      table.insert(paperback_clip_pool, 1, localize("k_none"))

      paperback_clip_option_cycle = create_option_cycle({label = "Paperclips", text_scale = 0.4, scale = 0.8, w = 3, options = paperback_clip_pool, opt_callback = "tag_aij_nonstandard_set_paperback_clip", current_option = 1})
  end

  local t = create_UIBox_generic_options({ back_func = 'exit_overlay_menu', back_label = localize("b_skip"), snap_back = true, contents = {
    {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 0.1, padding = 0.07, no_fill = true}, nodes={
      {n=G.UIT.O, config={object = G.customize_card}},
    }},
    UIBox_button{ label = { localize("k_aij_create") }, button = "tag_aij_nonstandard_set_submit", minw = 5},
    {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 0.1}, nodes={
      {n=G.UIT.C, config={align = "tm", colour = G.C.BLACK, r = 0.1}, nodes = {
        suits_option_cycle,
        ranks_option_cycle,
        next(SMODS.find_mod("paperback")) and paperback_clip_option_cycle,
      }},
      {n=G.UIT.C, config={align = "tm", colour = G.C.BLACK, r = 0.1}, nodes = {
        enhancements_option_cycle,
        editions_option_cycle,
        seals_option_cycle,
      }}
    }},
  }})
  return t
end

local nonstandard_tag = {
    object_type = "Tag",
    key = 'nonstandard',

    pos = { x = 6, y = 2 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'standard',
        },
    },

    discovered = false,
    order = 10,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.DARK_EDITION, function()

                G.E_MANAGER:add_event(Event({
                    func = function() 
                        -- G.SETTINGS.paused = true
                        G.FUNCS.overlay_menu{
                            config = { no_esc = true },
                            definition = create_UIBox_nonstandard()
                        }
                        return true 
                    end 
                }))
                return true
            end)

            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {nonstandard_tag}}