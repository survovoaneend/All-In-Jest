local occult_tag = {
  object_type = "Tag",
  key = 'occult',

  pos = { x = 7, y = 0 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'charm',
    },
  },

  discovered = false,
  order = 11,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'immediate' then
      tag:jest_apply("+", G.C.ATTENTION, function()
          create_consumable("Tarot", nil, nil, { edition = { negative = true } }, nil, nil, true, true)
          for i = 1, 2 do
            create_consumable("Tarot", nil, nil, { edition = { negative = true } }, nil, nil, true, true)
            create_consumable("Spectral", nil, nil, { edition = { negative = true } }, nil, nil, true, true)
          end
          play_sound('negative', 1.5, 0.4)
          return true
        end,
        function()
          return true
        end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { occult_tag } }
