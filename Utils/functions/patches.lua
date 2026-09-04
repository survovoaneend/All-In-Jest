
function All_in_Jest.has_patches(card, suit)
  --Patches
  if card.ability.patches then
      for k, v in pairs(card.ability.patches) do
         if suit and suit == k and v == true then
            return true
         elseif suit == nil and v == true then
            return true
         end
      end
  end
  return false
end

function All_in_Jest.add_patch(card, suit, instant, append, silent)
  if not suit then
    local keys = {}
	  for k, v in pairs(SMODS.Suits) do
      if card.base.suit ~= k and All_in_Jest.has_suit_in_deck(k, true) and ((v.in_pool and v.in_pool(val, nil)) or not v.in_pool) then
        keys[#keys+1] = k
      end
	  end
	  suit = pseudorandom_element(keys, pseudoseed(append or ''))
  end
  instant = instant or false
  if not instant then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function() 
          card.ability.patches = card.ability.patches or {}
          card.ability.patches[suit] = true
          if not silent then
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
          end
          return true
        end
      }))
  else
    card.ability.patches = card.ability.patches or {}
    card.ability.patches[suit] = true
  end
  check_for_unlock({type = 'modify_deck'})
end