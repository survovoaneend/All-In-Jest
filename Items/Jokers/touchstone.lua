local touchstone = {
    object_type = "Joker",
    order = 1005,

    key = "touchstone",
    config = {
      hand_size = 2,
      future_sense = 10
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 4, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 4, y = 1},
  
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.hand_size, card.ability.future_sense } }
    end,
  
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.hand_size)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.hand_size)
    end,
    generate_ui = function(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
        if G.deck ~= nil and cardd.area == G.jokers then
            local cards = {}
            for i = #G.deck.cards, #G.deck.cards - cardd.ability.future_sense + 1, -1 do
                if i > 0 then
                    local card = copy_card(G.deck.cards[i], nil, nil, G.playing_card)

                    -- Re-adds negative to preview if it was stripped by the mod
                    if G.deck.cards[i].edition and G.deck.cards[i].edition.negative and not All_in_Jest.config.no_copy_neg then
                        card:set_edition({negative = true}, nil, true)
                    end

                    if G.jokers and self.area == G.jokers then
                        card:flip()
                    end
                    table.insert(cards,card)
                end
            end
            SMODS.Joker.super.generate_ui(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
            AllInJest.card_area_preview(nil,desc_nodes,{
                override = true,
                cards = cards,
                w = 2.4,
                h = 0.6,
                ml = 0,
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
    end,
}
return { name = {"Jokers"}, items = {touchstone} }
