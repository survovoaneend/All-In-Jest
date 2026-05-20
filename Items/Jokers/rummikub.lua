function create_UIBox_rummikub()  

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

  local t = create_UIBox_generic_options({ back_func = 'exit_overlay_menu', back_label = localize("b_skip"), snap_back = true, contents = {
    {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 0.1, padding = 0.07, no_fill = true}, nodes={
      {n=G.UIT.O, config={object = G.customize_card}},
    }},
    UIBox_button{ label = { localize("k_aij_create") }, button = "aij_rummikub_set_submit", minw = 5},
    {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 0.1}, nodes={
      {n=G.UIT.C, config={align = "tm", colour = G.C.BLACK, r = 0.1}, nodes = {
        suits_option_cycle,
        ranks_option_cycle,
      }},
      {n=G.UIT.C, config={align = "tm", colour = G.C.BLACK, r = 0.1}, nodes = {
        enhancements_option_cycle,
      }}
    }},
  }})
  return t
end
G.FUNCS.aij_rummikub_set_submit = function(args)
  G.E_MANAGER:add_event(Event({func = function()
      local new_cards = {}
      local new_card = copy_card(G.customize_card.cards[1], nil, nil, G.playing_card)
      new_card:add_to_deck()
      G.deck.config.card_limit = G.deck.config.card_limit + 1
      table.insert(G.playing_cards, new_card)
      G.deck:emplace(new_card)
      new_cards[#new_cards+1] = new_card
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
end
local rummikub = {
    object_type = "Joker",
    order = 17,

    key = "rummikub",
    config = {
      
    },
    rarity = 2,
    pos = { x = 16, y = 0 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind and G.GAME.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    -- G.SETTINGS.paused = true
                    G.FUNCS.overlay_menu{
                        config = { no_esc = true },
                        definition = create_UIBox_rummikub()
                    }
                    return true 
                end 
            }))
        end
    end
  
}
return { name = {"Jokers"}, items = {rummikub} }
