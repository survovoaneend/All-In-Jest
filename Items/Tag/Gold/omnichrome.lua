local omnichrome_tag = {
  object_type = "Tag",
  key = 'omnichrome',

  pos = { x = 9, y = 3 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'polychrome',
    }
  },

  discovered = false,
  order = 6,
  min_ante = 3,

  loc_vars = function(self, info_queue)
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:jest_apply("+", G.C.ATTENTION, 
      function()
          if #G.jokers.cards > 0 then
            local joker = G.jokers.cards[#G.jokers.cards]
            local edition = { polychrome = true }
            joker:set_edition(edition, true)
          end
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
          return true
        end,
        function()
          if #G.jokers.cards > 0 then
            return true
          end
          return false
        end)
      if #G.jokers.cards > 0 then
        tag.triggered = true
      end
      return true
    end
  end,
}
return { name = "Tags", items = { omnichrome_tag } }
