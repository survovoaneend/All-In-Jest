-- related to Astral cards or alignments
local attributes = { 
  {
    key = 'astral'
  },

  -- adds Chaotic to cards, or has to do with Chaotic
  {
    key = 'chaotic'
  },

  -- triggers during a hand or when a hand is played
  {
    key = 'during_hand'
  },

  -- related to Moon planet cards
  {
    key = 'moon'
  },

  -- related to vouchers or voucher slots
  {
    key = 'voucher',
    keys = { 'tag_voucher' }
  },

  -- related to shop or booster pack slots
  {
    key = 'shop_slot',
    keys = {
      'v_overstock_norm',
      'v_overstock_plus'
    }
  },

  -- triggers when a card or joker is destroyed
  {
    key = 'on_destroy',
    keys = {
      'j_caino',
      'j_glass'
    }
  },

  -- adds Negative edition to cards, or has to do with Negative
  {
    key = 'negative',
    keys = {
      'j_perkeo',
      'c_ectoplasm',
      'tag_negative'
    }
  },

  -- related to activated abilities
  {
    key = 'activated'
  },

  -- causes additional card effects to be triggered
  -- eg. Bizco adding cards, or Mummer triggering steel
  {
    key = 'trigger_cards',
    keys = { 'j_splash' }
  },

  -- related to joker stickers
  {
    key = 'stickers'
  },

  -- causes additional / different cards to be drawn
  {
    key = 'draw_cards',
    keys = { 'bl_serpent' }
  },

  -- related to effects that give a multiplier to other effects
  -- eg. Dongtong or charged cards
  {
    key = 'multiplier'
  },

  -- literally just D'or but probably worth having for the sake of crossmod
  {
    key = 'emult'
  },

  -- egg
  {
    key = 'egg',
    keys = { 'j_egg' }
  },

  -- related to suit patches
  {
    key = 'patches'
  },

  -- related to gold tags
  {
    key = 'gold_tag'
  },

  -- related to legendary jokers
  {
    key = 'legendary',
    keys = { 'c_soul' }
  },

  -- effects that give you a customizable choice for a card
  -- eg. Morio, Martellino, Nonstandard Tag
  {
    key = 'choice'
  },

  -- reveals cards in your deck
  {
    key = 'future_sense'
  },

  -- affects card selection limit
  {
    key = 'select_limit'
  } 
}

for i = 1, #attributes do
    attributes[i].object_type = "Attribute"
end
return { name = { "Attributes" }, items = attributes }
