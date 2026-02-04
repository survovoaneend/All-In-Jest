local dark_matter_tag = {
  object_type = "Tag",
  key = 'dark_matter',

  pos = { x = 7, y = 2 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'negative',
    }
  },

  discovered = false,
  order = 3,
  min_ante = 3,

  loc_vars = function(self, info_queue)
  end,

  apply = function(self, tag, context)
    if context.type == 'immediate' then
      tag:jest_apply("+", G.C.ATTENTION, function()
          local jokers = {}
          for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].edition == nil then
              table.insert(jokers, G.jokers.cards[i])
            end
          end
          if #jokers > 0 then
            local joker = pseudorandom_element(jokers, pseudoseed('jest_dark_matter_tag'))
            local edition = { negative = true }
            joker:set_edition(edition, true)
            return true
          end
        end,
        function()
          if #G.jokers.cards > 0 then
            for i = 1, #G.jokers.cards do
              if G.jokers.cards[i].edition == nil then
                return true
              end
            end
          end
          return false
        end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { dark_matter_tag } }
