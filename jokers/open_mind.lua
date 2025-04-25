SMODS.Joker {
  key = "open_mind",
  config = {
    extra = { packs = 2 }
  },
  rarity = 3,
  pos = { x = 22, y = 4 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.packs } }
    end,

    calculate = function(self, card, context)

    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(card.ability.extra.packs)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-card.ability.extra.packs)
    end,
}
