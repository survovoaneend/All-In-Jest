local memory_card = {
    object_type = "Joker",
    order = 4,
    ignore = true,
    key = "memory_card",
    config = {
      jest_stored_memory_card = nil
    },
    rarity = 3,
    pos = { x = 3, y = 0 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,

    remove_from_deck = function(self, card, from_debuff)
        card.ability.jest_stored_memory_card = nil
    end,
  
    calculate = function(self, card, context)
      if context.before and context.cardarea == G.jokers then
        if G.GAME.current_round.hands_played == 0 then
            if #context.full_hand == 1 and G.jokers.cards[1] == card then
                card.ability.jest_stored_memory_card = context.full_hand[1]
                return {
                    message = localize('k_aij_memory_card'),
                    colour = G.C.GOLD
                }
            end
        end
      end
    end,

    generate_ui = function(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
        if cardd.ability.jest_stored_memory_card ~= nil and cardd.area == G.jokers then
            local cards = {}
            local card = copy_card(cardd.ability.jest_stored_memory_card, nil, nil, G.playing_card)
            table.insert(cards,card)
            SMODS.Joker.super.generate_ui(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
            AllInJest.card_area_preview(nil,desc_nodes,{
                override = true,
                cards = cards,
                w = 0.5,
                h = 0.5,
                ml = 200.4,
                scale = 0.4,
            })
        else
            if not cardd then
                cardd = self:create_fake_card()
            end
            local target = {
                type = 'descriptions',
                key = self.key,
                set = self.set,
                nodes = desc_nodes,
                vars =
                    specific_vars or {}
            }
            local res = {}
            if self.loc_vars and type(self.loc_vars) == 'function' then
                res = self:loc_vars(info_queue, cardd) or {}
                target.vars = res.vars or target.vars
                target.key = res.key or target.key
                target.set = res.set or target.set
                target.scale = res.scale
                target.text_colour = res.text_colour
            end
            if desc_nodes == full_UI_table.main and not full_UI_table.name then
                full_UI_table.name = self.set == 'Enhanced' and 'temp_value' or localize { type = 'name', set = target.set, key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or target.vars or {} }
            elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name and self.set ~= 'Enhanced' then
                desc_nodes.name = localize{type = 'name_text', key = res.name_key or target.key, set = target.set }
            end
            if specific_vars and specific_vars.debuffed and not res.replace_debuff then
                target = { type = 'other', key = 'debuffed_' ..
                (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
            end
            if res.main_start then
                desc_nodes[#desc_nodes + 1] = res.main_start
            end
            localize(target)
            if res.main_end then
                desc_nodes[#desc_nodes + 1] = res.main_end
            end
            desc_nodes.background_colour = res.background_colour
        end
    end
  
}
return { name = {"Jokers"}, items = {memory_card} }
