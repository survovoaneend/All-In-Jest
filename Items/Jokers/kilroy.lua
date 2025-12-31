local function round_hundredth(x)
    if x >= 0 then
        return math.floor(x * 100 + 0.5) / 100
    else
        return math.ceil(x * 100 - 0.5) / 100
    end
end

local kilroy = {
    object_type = "Joker",
    order = 132,

    key = "kilroy",
    config = {
        silver_multiplier_buff = 100, -- Make 100 instead of 1 to keep 2 decimals of precision
    },
    rarity = 1,
    pos = { x = 1, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return { vars = {round_hundredth(G.GAME.all_in_jest.jest_kilroy_curvalue * card.ability.silver_multiplier_buff / 100)}}
    end,
  
    calculate = function(self, card, context)

        if context.selling_card and not context.blueprint then
            if (context.card == card) then
                SMODS.scale_card(card, {
                    ref_table = G.GAME.all_in_jest,
                    ref_value = "jest_kilroy_curvalue",
                    scalar_table = {scale = 2},
                    operation = "X",
                    scalar_value = "scale",
                    -- no_message = true,
                })
            end
        end

        if context.joker_main then
            if round_hundredth(G.GAME.all_in_jest.jest_kilroy_curvalue * card.ability.silver_multiplier_buff / 100) > 0 then
                return {
                  chips = round_hundredth(G.GAME.all_in_jest.jest_kilroy_curvalue * card.ability.silver_multiplier_buff / 100),
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {kilroy} }
