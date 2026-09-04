
-- Save/Load for tags in shop as cards
-- A lovely patch for Card:load() is also needed
local card_save_ref = Card.save
function Card:save()
    local saveTable = card_save_ref(self)
    saveTable.aij = saveTable.aij or {}
    if self.config.tag and self.config.tag.is and self.config.tag:is(Tag) then
        saveTable.aij.tag = self.config.tag:save()
    end

    return saveTable
end

-- Add area in the shop for puchaseable tags (1/2)
-- This changes the UI so that the price appears to the right of the tag
local aij_create_shop_card_ui_ref = create_shop_card_ui
function create_shop_card_ui(card, type, area)
  if card.ability.is_aij_shop_tag then
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.43,
      blocking = false,
      blockable = false,
      func = (function()
        if card.opening then return true end
        -- Different
        local t1 = {
              n=G.UIT.ROOT, config = {minw = 0.6, align = 'cr', colour = darken(G.C.BLACK, 0.2), shadow = true, r = 0.05, padding = 0.05, minh = 0.6}, nodes={
                  {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.BLACK, 0.1), r = 0.1, minw = 1, minh = 0.55, emboss = 0.05, padding = 0.03}, nodes={
                    {n=G.UIT.C, config={ maxw = 0.2, padding = 0.2 }}, -- Adds a bit of padding to the left of the cost
                    {n=G.UIT.O, config={object = DynaText({string = {{prefix = localize('$'), ref_table = card, ref_value = 'cost'}}, colours = {G.C.MONEY}, shadow = true, silent = true, bump = true, pop_in = 0, scale = 0.5})}},
                  }}
              }}
        local t2 = {
          n=G.UIT.ROOT, config = {ref_table = card, minw = 1.1, maxw = 1.3, padding = 0.1, align = 'bm', colour = G.C.GREEN, shadow = true, r = 0.08, minh = 0.94, func = 'can_buy', one_press = true, button = 'buy_from_shop', hover = true}, nodes={
              {n=G.UIT.T, config={text = localize('b_buy'),colour = G.C.WHITE, scale = 0.5}}
          }}
          
          -- Different
        card.children.price = UIBox{
          definition = t1,
          config = {
            align="cr",
            offset = {x=-0.3,y=0},
            major = card,
            bond = 'Weak',
            parent = card
          }
        }

        card.children.buy_button = UIBox{
          definition = t2,
          config = {
            align="bm",
            offset = {x=0,y=-0.3},
            major = card,
            bond = 'Weak',
            parent = card
          }
        }

        card.children.price.alignment.offset.y = 0

        return true
      end)
    }))
  else
    aij_create_shop_card_ui_ref(card, type, area)
  end
end

-- Add area in the shop for puchaseable tags (2/2)
-- This changes the cardarea to have it stack cards vertically instead of horizontally
local aij_cardarea_align_cards_ref = CardArea.align_cards
function CardArea:align_cards()
    if self == G.shop_aij_tags then
        for k, card in ipairs(self.cards) do
            if not card.states.drag.is then 
                card.T.r = 0
                local max_cards = math.max(#self.cards, self.config.temp_limit)
                if #self.cards == 1 then
                    card.T.y = self.T.y
                elseif #self.cards == 2 then
                    card.T.y = self.T.y - (self.T.h-self.card_w)/2 + ((2 * k - 1) / 4) * (self.T.h-self.card_w)
                else
                    card.T.y = self.T.y - (self.T.h-self.card_w)/2 + ((k - 1) / math.max(max_cards - 1, 1)) * (self.T.h-self.card_w)
                end
                local highlight_height = G.HIGHLIGHT_H / 2
                if not card.highlighted then highlight_height = 0 end
                card.T.y = card.T.y + self.T.h/2 - card.T.h/2 - highlight_height
                card.T.y = card.T.y + card.shadow_parrallax.y/30

                card.T.x = self.T.x
            end
        end
        table.sort(self.cards, function (a, b) return a.T.y + a.T.y/2 < b.T.y + b.T.y/2 end)
        for k, card in ipairs(self.cards) do
            card.rank = k
        end
        if self.children.view_deck then
            self.children.view_deck:set_role{major = self.cards[1] or self}
        end
    else
        return aij_cardarea_align_cards_ref(self)
    end
end
