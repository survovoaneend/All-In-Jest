local trefle_spectral = {
    object_type = "Consumable",
    key = 'trefle',
    set = 'Spectral',
    pos = { x = 1, y = 4 },
    cost = 4,
    unlocked = true,
    discovered = false,
    order = 0,
    config = {},
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'reroll_joker' }
    end,
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 then
            return not SMODS.is_eternal(G.jokers.highlighted[1], card)
        end
    end,


    use = function(self, card, area, copier)
        --the code for this before sucked ass so i just copied what paperback did with nine of cups
        local joker = G.jokers.highlighted[1]
        local rarity = joker.config.center.rarity
        local base_rarities = {
            "Common",
            "Uncommon",
            "Rare",
            "Legendary"
        }
        if type(rarity) == "number" then
            rarity = base_rarities[rarity] or rarity
        end

        G.E_MANAGER:add_event(Event {
            trigger = 'after',
            delay = 0.4,
            func = function()
                card:juice_up()

                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        joker.T.r = -0.2
                        joker:juice_up(0.3, 0.4)
                        joker.states.drag.is = true
                        joker.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(joker)
                                joker:remove()
                                SMODS.add_card {
                                    set = 'Joker',
                                    rarity = rarity,
                                    edition = joker.edition
                                }
                                return true
                            end
                        }))
                        return true
                    end
                }))

                return true
            end
        })
    end
}
return { name = { "Spectrals" }, items = { trefle_spectral } }
