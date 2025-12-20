local chaos = {
  object_type = "Tag",
  key = 'chaos',
  pos = { x = 1, y = 0 },
  atlas = 'tag_atlas',

  discovered = false,
  order = 1,
  config = {
    effects = {
      "money",
      "boss_reroll",
      "open_booster",
      "level_hands",
      "create_jokers",
      "dupe_joker",
      "create_consumables",
      "apply_edition"
    }
  },

  loc_vars = function(self, info_queue)
  end,

  apply = function(self, tag, context)
    local effect = nil
    local trigger = false
    while (not trigger) or (effect == nil) do
      effect = pseudorandom_element(self.config.effects, pseudoseed('jest_chaos_tag'))
      
      effect = "level_hands"

      if effect == "boss_reroll" and MP and MP.LOBBY.code then
        trigger = false
      elseif effect == "create_consumables" then
        trigger = #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
      elseif effect == "create_jokers" then
        trigger = #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
      elseif effect == "dupe_joker" then
        trigger = (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit) and (#G.jokers.cards > 0)
      elseif effect == "apply_edition" then
        if #G.jokers.cards > 0 then
          for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].edition == nil then
              trigger = true
            end
          end
        end
        trigger = false
      else
        trigger = true
      end
    end
    if context.type == 'new_blind_choice' then
      tag:jest_apply("+", G.C.ATTENTION, function()
          if effect == "money" then
            local money = pseudorandom('jest_chaos_tag', 1, 50)
            ease_dollars(money)
          elseif effect == "boss_reroll" and not (MP and MP.LOBBY.code) then
            local bosses = {}
            for k, v in pairs(G.P_BLINDS) do
              if v and v.boss then
                table.insert(bosses, v)
              end
            end
            local _blind = pseudorandom_element(bosses, pseudoseed('jest_chaos_tag'))
            local par = G.blind_select_opts.boss.parent
            G.GAME.round_resets.blind_choices.Boss = _blind.key

            G.blind_select_opts.boss:remove()
            G.blind_select_opts.boss = UIBox {
              T = { par.T.x, 0, 0, 0 },
              definition = {
                n = G.UIT.ROOT,
                config = {
                  align = "cm",
                  colour = G.C.CLEAR
                },
                nodes = { UIBox_dyn_container({ create_UIBox_blind_choice('Boss') }, false,
                  get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8)) }
              },
              config = {
                align = "bmi",
                offset = {
                  x = 0,
                  y = G.ROOM.T.y + 9
                },
                major = par,
                xy_bond = 'Weak'
              }
            }
            par.config.object = G.blind_select_opts.boss
            par.config.object:recalculate()
            G.blind_select_opts.boss.parent = par
            G.blind_select_opts.boss.alignment.offset.y = 0
            play_sound('other1')
          elseif effect == "open_booster" then
            local boosters = {}
            for k, v in pairs(G.P_CENTERS) do
              if v.set == 'Booster' then
                table.insert(boosters, k)
              end
            end
            local key = boosters[pseudorandom('jest_chaos_tag', 1, #boosters)]
            local card = Card(G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
              G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2, G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
              G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
            card.ability.choose = pseudorandom('jest_chaos_tag', 1, 2)
            card.ability.extra = pseudorandom('jest_chaos_tag', 3, 5)
            card.cost = 0
            card.from_tag = true
            G.FUNCS.use_card({ config = { ref_table = card } })
            card:start_materialize()
          elseif effect == "level_hands" then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
              if v.visible then _poker_hands[#_poker_hands + 1] = k end
            end

            local times = pseudorandom('jest_chaos_tag', 1, 2)
            for i = 1, math.min(times, #_poker_hands) do
              local chosen_poker_hand, chosen_index = pseudorandom_element(_poker_hands, pseudoseed('jest_chaos_tag'))
              local levels = pseudorandom('jest_chaos_tag', 1, 3)

              update_hand_text(
                { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 }, 
                { handname = localize(chosen_poker_hand, 'poker_hands'), chips = G.GAME.hands[chosen_poker_hand].chips, mult = G.GAME.hands[chosen_poker_hand].mult, level = G.GAME.hands[chosen_poker_hand].level }
              )
              level_up_hand(nil, chosen_poker_hand, nil, levels)
              update_hand_text(
                { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                { mult = 0, chips = 0, handname = '', level = '' }
              )

              table.remove(_poker_hands, chosen_index)
            end
          elseif effect == "create_jokers" then
            local jokers_to_create = math.min(pseudorandom('jest_chaos_tag', 1, 4),
              G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
              func = function()
                for i = 1, jokers_to_create do
                  local card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, 'jest_chaos_tag')
                  card:add_to_deck()
                  G.jokers:emplace(card)
                  card:start_materialize(nil, i ~= 1)
                  G.GAME.joker_buffer = 0
                end
                return true
              end
            }))
          elseif effect == "dupe_joker" then
            local joker = pseudorandom_element(G.jokers.cards, pseudoseed('jest_chaos_tag'))
            G.E_MANAGER:add_event(Event({
              trigger = 'before',
              delay = 0.4,
              func = function()
                local card = copy_card(joker, nil, nil, nil, joker.edition and joker.edition.negative)
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true
              end
            }))
          elseif effect == "create_consumables" then
            local consumeables_to_create = math.min(pseudorandom('jest_chaos_tag', 2, 3),
              G.consumeables.config.card_limit - (#G.consumeables.cards + G.GAME.consumeable_buffer))
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + consumeables_to_create
            for i = 1, consumeables_to_create do
              create_consumable("Consumeables", nil, nil, nil, nil, nil, nil, i ~= 1)
            end
          elseif effect == "apply_edition" then
            local jokers = {}
            for i = 1, #G.jokers.cards do
              if G.jokers.cards[i].edition == nil then
                table.insert(jokers, G.jokers.cards[i])
              end
            end
            local joker = pseudorandom_element(jokers, pseudoseed('jest_chaos_tag'))
            local edition = poll_edition('jest_chaos_tag' .. G.GAME.round_resets.ante, 2, false, true)
            joker:set_edition(edition)
          end

          if effect ~= "open_booster" then
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
          return true
        end,
        function()
          if effect == "create_consumables" then
            return #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
          elseif effect == "create_jokers" then
            return #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
          elseif effect == "dupe_joker" then
            return (#G.jokers.cards <= G.jokers.config.card_limit and #G.jokers.cards > 0)
          elseif effect == "apply_edition" then
            if #G.jokers.cards > 0 then
              for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].edition == nil then
                  return true
                end
              end
            end
            return false
          else
            return true
          end
        end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { chaos } }
