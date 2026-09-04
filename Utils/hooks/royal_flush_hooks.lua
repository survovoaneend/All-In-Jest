
SMODS.PokerHand {
    key = "Royal Flush",
    mult = 8,
    chips = 100,
    l_mult = 6,
    l_chips = 60,
    example = {
        { 'H_A', true },
        { 'H_K', true },
        { 'H_Q', true },
        { 'H_J', true },
        { 'H_T', true },
    },
    above_hand = 'Straight Flush',
    evaluate = function(parts, hand)
        if not next(parts._flush) or not next(parts._straight) then return {} end
        local min = 10
        for j = 1, #hand do
            if hand[j]:get_id() < min then min =hand[j]:get_id() end
        end
        if min >= 10 then 
            return { SMODS.merge_lists(parts._flush, parts._straight) }
        else
            return {}
        end
    end,
    no_collection = true,
    visible = function(self)
        return false
    end,
}

local init_game_object_ref = Game.init_game_object
function Game.init_game_object(self)
  local ret = init_game_object_ref(self)
  local secrets = {}
  for k, v in pairs(SMODS.PokerHands) do
    if (type(v.visible) == 'function' and not v:visible()) or v.visible == false then 
        if k ~= 'aij_Royal Flush' then
            table.insert(secrets, k) 
        end
    end
  end
  ret.all_in_jest = ret.all_in_jest or {}
  ret.all_in_jest.secret_hands = secrets
  return ret
end

-- Upgrade royal flush when a straight flush is played
local aij_SMODS_upgrade_poker_hands_ref = SMODS.upgrade_poker_hands
function SMODS.upgrade_poker_hands(args)
    local ret = aij_SMODS_upgrade_poker_hands_ref(args)
    local straight_flush_upgraded = false
    local royal_flush_upgraded = false
    for _, hand in ipairs(args.hands) do
        if hand == "Straight Flush" then
            straight_flush_upgraded = true
        end
        if hand == "aij_Royal Flush" then
            royal_flush_upgraded = true
        end
    end
    if straight_flush_upgraded and not royal_flush_upgraded then
        local new_args = {
            hands = "aij_Royal Flush",
            parameters = args.parameters,
            func = function(base, hand, parameter, level_up)
                return args.func(base, "Straight Flush", parameter, level_up)
            end,
            level_up = args.level_up,
            instant = true,
            from = nil,
            aij_level_with = true, -- Removes context call
        }
        aij_SMODS_upgrade_poker_hands_ref(new_args)
    end
    return ret
end

local aij_create_UIBox_hand_tip_ref = create_UIBox_hand_tip
function create_UIBox_hand_tip(handname)
    ret = aij_create_UIBox_hand_tip_ref(handname)

    -- Show level of royal flush when hovered over
    if handname == 'Straight Flush' and G.GAME.hands["aij_Royal Flush"] and G.GAME.hands["aij_Royal Flush"].level > G.GAME.hands["Straight Flush"].level then
        ret = {n=G.UIT.R, config={align = "cm", r = 0.1}, nodes={
            ret,
            {n=G.UIT.R, config={align = "cm", padding = 0.05, r = 0.1, colour = darken(G.C.JOKER_GREY, 0.1), emboss = 0.05, hover = true, force_focus = true, on_demand_tooltip = {text = localize("aij_Royal Flush", 'poker_hand_descriptions'), filler = {func = create_UIBox_hand_tip, args = "aij_Royal Flush"}}}, nodes={
                {n=G.UIT.C, config={align = "cl", padding = 0, minw = 5}, nodes={
                    {n=G.UIT.C, config={align = "cm", padding = 0.01, r = 0.1, colour = G.C.HAND_LEVELS[math.min(7, math.max(G.GAME.hands["aij_Royal Flush"].level-G.GAME.hands["Straight Flush"].level))], minw = 1.5, outline = 0.8, outline_colour = G.C.WHITE}, nodes={
                    {n=G.UIT.T, config={text = '+'..localize('k_level_prefix')..(G.GAME.hands["aij_Royal Flush"].level-G.GAME.hands["Straight Flush"].level), scale = 0.5, colour = G.C.UI.TEXT_DARK}}
                    }},
                    {n=G.UIT.C, config={align = "cm", minw = 4.5, maxw = 4.5}, nodes={
                    {n=G.UIT.T, config={text = ' '..localize("aij_Royal Flush",'poker_hands'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
                    }}
                }},
                {n=G.UIT.C, config={align = "cm", padding = 0.05, colour = G.C.BLACK,r = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cr", padding = 0.01, r = 0.1, colour = G.C.CHIPS, minw = 1.1}, nodes={
                    {n=G.UIT.T, config={text = '+'..number_format(G.GAME.hands["aij_Royal Flush"].chips-G.GAME.hands["Straight Flush"].chips, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT}},
                    {n=G.UIT.B, config={w = 0.08, h = 0.01}}
                    }},
                    {n=G.UIT.T, config={text = "X", scale = 0.45, colour = G.C.MULT}},
                    {n=G.UIT.C, config={align = "cl", padding = 0.01, r = 0.1, colour = G.C.MULT, minw = 1.1}, nodes={
                    {n=G.UIT.B, config={w = 0.08,h = 0.01}},
                    {n=G.UIT.T, config={text = '+'..number_format(G.GAME.hands["aij_Royal Flush"].mult-G.GAME.hands["Straight Flush"].mult, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT}}
                    }}
                }},
                {n=G.UIT.C, config={align = "cm"}, nodes={
                    {n=G.UIT.T, config={text = '  #', scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
                    }},
                {n=G.UIT.C, config={align = "cm", padding = 0.05, colour = G.C.L_BLACK,r = 0.1, minw = 0.9}, nodes={
                    {n=G.UIT.T, config={text = G.GAME.hands["aij_Royal Flush"].played, scale = 0.45, colour = G.C.FILTER, shadow = true}},
                }}
            }},
        }}
    end

    return ret
end
