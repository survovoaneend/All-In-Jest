local bobblehead = {
    object_type = "Joker",
    order = 78,

    key = "bobblehead",
    config = {
        extra = {
            raritys = {}
        }
    },
    rarity = 2,
    pos = { x = 23, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local raritys = ''
        for k, v in pairs(card.ability.extra.raritys) do
            if raritys ~= '' then
                raritys = raritys..","
            end
            raritys = raritys.." "..v.key
        end
        if raritys == '' then
            raritys = ' Rarity'
        end
        return {
            vars = {
                raritys,
            }
        }
    end,
  
    update = function(self, card, dt)
        if G.jokers and #G.jokers.cards >= 1 and G.GAME then
            if SMODS.find_card("j_aij_bobblehead") and SMODS.find_card("j_aij_bobblehead")[1] == card then
                local raritys = {}
                local highest = {}
                local temp = SMODS.ObjectTypes["Joker"].rarities
                local count = 0
                for k, v in pairs(card.ability.extra.raritys) do
                    if G.GAME[tostring(v.key):lower().."_mod"] then G.GAME[tostring(v.key):lower().."_mod"] = G.GAME[tostring(v.key):lower().."_mod"] - tonumber(v.mult) end
                    card.ability.extra.raritys[k] = nil
                end
                card.ability.extra.raritys = {}
                for k, v in pairs(G.jokers.cards) do
                    if v.config.center.rarity and v ~= card then
                        raritys[v.config.center.rarity] = raritys[v.config.center.rarity] or 0
                        raritys[v.config.center.rarity] = raritys[v.config.center.rarity] + 1
                    end
                end
                for k, v in pairs(raritys) do
                    if v >= count then
                        count = v
                    end
                end
                for k, v in pairs(raritys) do
                    if v == count then
                        local mult = 2
                        local key = temp[k] and temp[k].key
                        if k == '4' or k == 4 then
                            if G.GAME.jest_legendary_pool.in_shop then
                                mult = 1
                                highest[k] = {
                                    key = 'Legendary',
                                    mult = tostring(mult),
                                }
                            end
                        else
                            highest[k] = {
                                key = key,
                                mult = tostring(mult),
                            }
                        end
                    end
                end
                for k, v in pairs(highest) do
                    if v.key then
                        card.ability.extra.raritys[k] = v
                        local mod_key = v.key:lower() 
                        if G.GAME[mod_key.. "_mod"] then
                            G.GAME[mod_key.. "_mod"] = (G.GAME[mod_key.. "_mod"] or 0) + tonumber(v.mult)
                        end
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(card.ability.extra.raritys) do
            if G.GAME[tostring(v.key):lower().."_mod"] then G.GAME[tostring(v.key):lower().."_mod"] = G.GAME[tostring(v.key):lower().."_mod"] - tonumber(v.mult) end
            card.ability.extra.raritys[k] = nil
        end
        card.ability.extra.raritys = {}
    end,
}
return { name = {"Jokers"}, items = {bobblehead} }
