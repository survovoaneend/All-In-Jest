local choose_copied_blind = function ()
    local best_blind = "bl_needle"
    local best_score = 0.1
    for _, v in pairs(G.P_BLINDS) do
        if v.aij_calculate_counter_score and type(v.aij_calculate_counter_score) == "function" then
            local score = v.aij_calculate_counter_score() + pseudorandom('the_assistant') * 10e-6
            if score > best_score then
                best_score = score
                best_blind = v.key
            end
        end
    end

    return best_blind
end

local the_assistant = {
  object_type = "Blind",
  key = 'the_assistant',
  boss = {
    min = 4,
    all_in_jest = {
      pit = true
    }
  },
  in_pool = function(self)
    return All_in_Jest.pit_blinds_in_play()
  end,
  mult = 2,
  boss_colour = HEX("C94949"),
  atlas = 'blinds_pit',
  pos = { y = 14 },
  order = 516,
  dollars = 6,
  config = {},

  set_blind = function(self)
      local copied_blind = choose_copied_blind()
      G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 1,
          func = (function()
              G.HUD_blind.alignment.offset.y = -10
              return true
          end)
      }))
      G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.5,
          func = (function()
              local saved_atlas = G.GAME.blind.config.blind.atlas
              local saved_pos = copy_table(G.GAME.blind.config.blind.pos)
              G.P_BLINDS[copied_blind].atlas = self.atlas
              G.P_BLINDS[copied_blind].pos = self.pos

              G.GAME.blind:set_blind(G.P_BLINDS[copied_blind])
              G.GAME.blind.ability = G.GAME.blind.ability or {}
              G.GAME.blind.ability.is_the_assistant = true
              G.GAME.blind.dollars = self.dollars

              -- G.GAME.blind.config.blind.pos = saved_pos
              -- G.GAME.blind.config.blind.atlas = saved_atlas
              return true
          end)
      }))
  end,

  calculate = function(self, blind, context)
  end
}

-- Assign a function to each vanilla blind to calculate a "counter score" from 0 to 1
-- 0 = does not counter (default)
-- 1 = fully counters
-- AiJ blinds assigned theirs in their own files

SMODS.Blind:take_ownership("ox", {
    aij_calculate_counter_score = function()
    -- The Ox does not affect score, can crash econ
    -- Max counter should require:
    -- 1) Reliance on their most played poker hand
    -- 2) Lots of money
    -- 3) No econ jokers (check for jokers with $ character)
    return 1
end}, true)

SMODS.Blind:take_ownership("hook", {
    aij_calculate_counter_score = function()
    -- The Hook is a low-danger blind. Can safely assume to never counter a build.
    return 0
end}, true)

SMODS.Blind:take_ownership("mouth", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands often being non-first
    --  OR
    -- 2) Winning hands being spread around multiple hand types
    -- Partial credit:
    -- Winning hands being a 5-card hand type
    return 0
end}, true)

SMODS.Blind:take_ownership("fish", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands often being non-first
    -- 2) Many discards and hands often being used
    -- 3) Having few discards
    return 0
end}, true)

SMODS.Blind:take_ownership("club", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands involving clubs
    -- 2) A joker that includes the word "club"
    --   OR
    -- 3) Many enhanced clubs
    return 0
end}, true)

SMODS.Blind:take_ownership("manacle", {
    aij_calculate_counter_score = function()
    -- Generally a low-risk blind, -1 hand size is fairly small
    -- Max counter should require:
    -- 1) Already having small hand size
    -- 2) Winning hands involve 5-card hands
    return 0
end}, true)

SMODS.Blind:take_ownership("tooth", {
    aij_calculate_counter_score = function()
    -- Generally a low-risk blind, only affects money
    -- Max counter should require:
    -- 1) Having low money
    -- 2) Winning hands involve 5-card hands
    -- 3) Playing many hands
    return 0
end}, true)

SMODS.Blind:take_ownership("wall", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning blinds often get only just above blind requirement
    -- 2) Winning blinds do not have many hands remaining
    return 0
end}, true)

SMODS.Blind:take_ownership("house", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    -- Max counter should require:
    -- 1) Large hand size
    -- 2) Few hands + discards
    return 0
end}, true)

SMODS.Blind:take_ownership("mark", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands involving face cards
    -- 2) A joker that includes the word "face", "king", "queen" or "jack"
    return 0
end}, true)

SMODS.Blind:take_ownership("wheel", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    -- Max counter should require:
    -- 1) Increased probabilities
    -- 2) Few hands + discards
    return 0
end}, true)

SMODS.Blind:take_ownership("arm", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands being mid-level (levels 2 through ~5)
    --  - mid-tier downgrades will take away a greater percentage of the score
    -- 2) Winning blinds often get only just above blind requirement
    -- 3) Winning blinds involve playing the same hand multiple times
    return 0
end}, true)

SMODS.Blind:take_ownership("psychic", {
    aij_calculate_counter_score = function()
    -- The Hook is a low-danger blind. Can safely assume to rarely counter a build.
    -- Max counter should require:
    -- 1) 4 hand size or fewer
    return 0
end}, true)

SMODS.Blind:take_ownership("goad", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands involving spades
    -- 2) A joker that includes the word "spade"
    --   OR
    -- 3) Many enhanced spades
    return 0
end}, true)

SMODS.Blind:take_ownership("water", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Many discards + Few hands
    -- 2) Winning blinds use more discards + hands than hands
    -- 3) Winning blinds requires difficult hands to draw
    return 0
end}, true)

SMODS.Blind:take_ownership("eye", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands being spread around multiple hands of the same type
    -- Partial credit:
    -- Winning hands being an easy to create hand
    return 0
end}, true)

SMODS.Blind:take_ownership("plant", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands involving face cards
    -- 2) A joker that includes the word "face", "king", "queen" or "jack"
    --   OR
    -- 3) Many enhanced faces
    return 0
end}, true)

SMODS.Blind:take_ownership("needle", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Many hands + Few discards
    -- 2) Winning blinds use more hands + discards than discards
    -- 3) Winning blinds requires difficult hands to draw
    -- 4) Winning hands have never individually exceeded X1 mult
    return 0
end}, true)

SMODS.Blind:take_ownership("head", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands involving hearts
    -- 2) A joker that includes the word "heart"
    --   OR
    -- 3) Many enhanced hearts
    return 0
end}, true)

SMODS.Blind:take_ownership("window", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands involving diamonds
    -- 2) A joker that includes the word "diamond"
    --   OR
    -- 3) Many enhanced diamonds
    return 0
end}, true)

SMODS.Blind:take_ownership("serpent", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    -- Max counter should require:
    -- 1) Winning hands score 4 or more cards
    -- 2) No held in hand effects
    return 0
end}, true)

SMODS.Blind:take_ownership("pillar", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    -- Max counter should require:
    -- 1) Many cards having been played previously
    -- 2) Many previously played cards are enhanced
    return 0
end}, true)

SMODS.Blind:take_ownership("flint", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands being quite high level
    -- 2) Low amount of +mult and +chip from cards and jokers
    return 0
end}, true)

return { name = { "Pit Blinds" }, items = { the_assistant } }
