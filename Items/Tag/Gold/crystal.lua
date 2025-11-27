local crystal_tag = {
  object_type = "Tag",
  key = 'crystal',

  pos = { x = 8, y = 3 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'foil',
    },
    extra = {
      enhance = 5
    }
  },

  discovered = false,
  order = 4,
  min_ante = 3,

  loc_vars = function(self, info_queue)
    return { vars = { self.config.extra.enhance } }
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
          local joker = pseudorandom_element(jokers, pseudoseed('jest_crystal_tag'))
          local edition = { foil = true }
          if joker then
            joker:set_edition(edition, true)
          end
          for _ = 1, tag.config.extra.enhance do
            local deck_cards = {}
            for i = 1, #G.deck.cards do
              if G.deck.cards[i].edition == nil then
                table.insert(deck_cards, G.deck.cards[i])
              end
            end
            if #deck_cards > 0 then
              local playing_card = pseudorandom_element(deck_cards, pseudoseed('jest_crystal_tag'))
              local edition = { foil = true }
              playing_card:set_edition(edition, true, true)
            else
              break
            end
          end
          return true
        end,
        function()
          local joker = false
          if #G.jokers.cards > 0 then
            for i = 1, #G.jokers.cards do
              if G.jokers.cards[i].edition == nil then
                joker = true
              end
            end
          end
          local deck_cards = 0
          if #G.deck.cards > 0 then
            for i = 1, #G.deck.cards do
              if G.deck.cards[i].edition == nil then
                deck_cards = deck_cards + 1
              end
            end
          end
          if joker or deck_cards >= 1 then
            return true
          end
          return false
        end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { crystal_tag } }
