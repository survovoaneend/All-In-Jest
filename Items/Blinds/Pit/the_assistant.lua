local choose_copied_blind = function ()
    local best_blind = "bl_needle"
    local best_score = 0.00
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
      local saved_atlas = G.P_BLINDS[copied_blind].atlas
      local saved_pos = copy_table(G.P_BLINDS[copied_blind].pos)
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
              G.P_BLINDS[copied_blind].atlas = self.atlas
              G.P_BLINDS[copied_blind].pos = self.pos

              G.GAME.blind:set_blind(G.P_BLINDS[copied_blind])
              G.GAME.blind.ability = G.GAME.blind.ability or {}
              G.GAME.blind.ability.is_the_assistant = true
              G.GAME.blind.dollars = self.dollars
              -- G.GAME.blind = copy_table(G.GAME.blind)
              return true
          end)
      }))
      G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 1,
          func = (function()
              G.P_BLINDS[copied_blind].atlas = saved_atlas
              G.P_BLINDS[copied_blind].pos = saved_pos
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
-- Max counter score for "danger" value: low - 0.50, mid - 0.75, high - 1.00 (ensures high risk counter get picked over low risk in case of a tie between them)
-- AiJ blinds assigned theirs in their own files

local function aij_curve(x, maxValue, risePercent)
    local p = risePercent / 100
    local k = math.log(2) / (1 - p)

    return maxValue * (1 - math.exp(-k * x)) / (1 - math.exp(-k))
end

SMODS.Blind:take_ownership("ox", {
    aij_calculate_counter_score = function()
    -- The Ox does not affect score, can crash econ
    -- Max counter should require:
    -- 1) Reliance on their most played poker hand - most played poker hand is played 10 more times than others
    -- 2) Lots of money - $50 or higher
    -- 3) No econ jokers (check for jokers with $ character)
    return 0
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
    -- 2) Winning hands being spread around multiple hand types - 70% of winning hands are different hand type
    -- Partial credit:
    -- Winning hands being a 5-card hand type
    return 0
end}, true)

SMODS.Blind:take_ownership("fish", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands often being non-first
    -- 2) Many discards and hands often being used - used hands >= 2, used discards >= amt of discards or 2
    -- 3) Having few discards - discards <= 2
    return 0
end}, true)

SMODS.Blind:take_ownership("club", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    local score_o = 0
    -- 1) Winning hands involving clubs - 65% of winning cards - worth max: 0.60
    local total_cards, qual_cards = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.winning_hand then
                for b, n in pairs(v.full_hand) do
                    total_cards = total_cards + 1
                    if n:is_suit('Clubs', true) then
                        qual_cards = qual_cards + 1
                    end
                end
            end
        end
    end
    if qual_cards > 0 then
        local add_val = aij_curve((qual_cards/total_cards), 0.60, 65)
        score_o = score_o + add_val
    end
    -- 2) A joker that includes the word "club" - worth max: 0.40
    local clubs = 0
    if G.jokers then
        for i = 1, #G.jokers.cards do
            local text = retrieve_joker_text(G.jokers.cards[i])
 
            if text:find('Clubs') or text:find('clubs') or text:find('Club') or text:find('club') then
                clubs = clubs + 1
            end
        end
    end
    if clubs > 0 then
        local add_val = aij_curve((clubs/5), 0.40, 1)
        score_o = score_o + add_val
    end
    --   OR
    local score_i = 0
    -- 3) Many enhanced clubs - 60% of total cards are club, 70% of total club cards are enhanced - worth max: 1.00
    local total_cards_o, club_cards, enhanced_cards = 0, 0, 0
    for k, v in pairs(G.playing_cards) do
        total_cards_o = total_cards_o + 1
        if v:is_suit('Clubs', true) then
            club_cards = club_cards + 1
            if v.config.center ~= G.P_CENTERS.c_base then
                enhanced_cards = enhanced_cards + 1
            end
        end
    end
    if club_cards > 0 then
        local add_val = aij_curve((club_cards/total_cards_o), 0.50, 60)
        score_i = score_i + add_val
    end
    if enhanced_cards > 0 then
        local add_val = aij_curve((enhanced_cards/club_cards), 0.50, 70)
        score_i = score_i + add_val
    end
    return score_o > score_i and score_o or score_i
end}, true)

SMODS.Blind:take_ownership("manacle", {
    aij_calculate_counter_score = function()
    -- Generally a low-risk blind, -1 hand size is fairly small
    local score = 0
    -- Max counter should require:
    -- 1) Already having small hand size - handsize <= 5
    -- 2) Winning hands involve 5-card hands
    score = score/(4/2)
    return score
end}, true)

SMODS.Blind:take_ownership("tooth", {
    aij_calculate_counter_score = function()
    -- Generally a low-risk blind, only affects money
    local score = 0
    -- Max counter should require:
    -- 1) Having low money - $ <= 20
    -- 2) Winning hands involve 5-card hands
    -- 3) Playing many hands - used hands >= 2
    score = score/(4/2)
    return score
end}, true)

SMODS.Blind:take_ownership("wall", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning blinds often get only just above blind requirement - within 30% of blind size
    -- 2) Winning blinds do not have many hands remaining - remaining hands <= 2
    return 0
end}, true)

SMODS.Blind:take_ownership("house", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    local score = 0
    -- Max counter should require:
    -- 1) Large hand size - handsize >= 10
    -- 2) Few hands + discards - hands >= 3, discards <= 2
    score = score/(4/3)
    return score
end}, true)

SMODS.Blind:take_ownership("mark", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    local score = 0
    -- 1) Winning hands involving face cards - 60% of winning cards - worth max: 0.70
    local total_cards, qual_cards = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.winning_hand then
                for b, n in pairs(v.full_hand) do
                    total_cards = total_cards + 1
                    if n:is_face(true) then
                        qual_cards = qual_cards + 1
                    end
                end
            end
        end
    end
    if qual_cards > 0 then
        local add_val = aij_curve((qual_cards/total_cards), 0.70, 60)
        score = score + add_val
    end
    -- 2) A joker that includes the word "face", "king", "queen" or "jack" - worth max: 0.30
    local faces = 0
    if G.jokers then
        for i = 1, #G.jokers.cards do
            local text = retrieve_joker_text(G.jokers.cards[i])
            local has_king = text:find('Kings') or text:find('King') or text:find('kings') or text:find('king')
            local has_queen = text:find('Queens') or text:find('Queen') or text:find('queens') or text:find('queen')
            local has_jack = text:find('Jacks') or text:find('Jack') or text:find('jacks') or text:find('jack')
            local has_face = text:find('Faces') or text:find('Face') or text:find('faces') or text:find('face')
 
            if has_king or has_queen or has_jack or has_face then
                faces = faces + 1
            end
        end
    end
    if faces > 0 then
        local add_val = aij_curve((faces/5), 0.30, 1)
        score = score + add_val
    end
    return score
end}, true)

SMODS.Blind:take_ownership("wheel", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    local score = 0
    -- Max counter should require:
    -- 1) Increased probabilities - probabilities >= 2
    -- 2) Few hands + discards - hands >= 3, discards <= 2
    score = score/(4/3)
    return score
end}, true)

SMODS.Blind:take_ownership("arm", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands being mid-level (levels 2 through ~5)
    --  - mid-tier downgrades will take away a greater percentage of the score
    -- 2) Winning blinds often get only just above blind requirement - within 30% of blind size
    -- 3) Winning blinds involve playing the same hand multiple times - 70% of winning hands are the same hand type
    return 0
end}, true)

SMODS.Blind:take_ownership("psychic", {
    aij_calculate_counter_score = function()
    -- The Hook is a low-danger blind. Can safely assume to rarely counter a build.
    local score = 0
    -- Max counter should require:
    -- 1) 4 hand size or fewer - worth 1.00
    score = score/(4/2)
    return score
end}, true)

SMODS.Blind:take_ownership("goad", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    local score_o = 0
    -- 1) Winning hands involving spades - 65% of winning cards - worth max: 0.60
    local total_cards, qual_cards = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.winning_hand then
                for b, n in pairs(v.full_hand) do
                    total_cards = total_cards + 1
                    if n:is_suit('Spades', true) then
                        qual_cards = qual_cards + 1
                    end
                end
            end
        end
    end
    if qual_cards > 0 then
        local add_val = aij_curve((qual_cards/total_cards), 0.60, 65)
        score_o = score_o + add_val
    end
    -- 2) A joker that includes the word "spade" - worth max: 0.40
    local spades = 0
    if G.jokers then
        for i = 1, #G.jokers.cards do
            local text = retrieve_joker_text(G.jokers.cards[i])
 
            if text:find('Spades') or text:find('spades') or text:find('Spade') or text:find('spade') then
                spades = spades + 1
            end
        end
    end
    if spades > 0 then
        local add_val = aij_curve((spades/5), 0.40, 1)
        score_o = score_o + add_val
    end
    --   OR
    local score_i = 0
    -- 3) Many enhanced spades - 60% of total cards are spade, 70% of total spade cards are enhanced - worth max: 1.00
    local total_cards_o, spade_cards, enhanced_cards = 0, 0, 0
    for k, v in pairs(G.playing_cards) do
        total_cards_o = total_cards_o + 1
        if v:is_suit('Spades', true) then
            spade_cards = spade_cards + 1
            if v.config.center ~= G.P_CENTERS.c_base then
                enhanced_cards = enhanced_cards + 1
            end
        end
    end
    if spade_cards > 0 then
        local add_val = aij_curve((spade_cards/total_cards_o), 0.50, 60)
        score_i = score_i + add_val
    end
    if enhanced_cards > 0 then
        local add_val = aij_curve((enhanced_cards/spade_cards), 0.50, 70)
        score_i = score_i + add_val
    end
    return score_o > score_i and score_o or score_i
end}, true)

SMODS.Blind:take_ownership("water", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Many discards + Few hands - hands >= 5, discards <= 2
    -- 2) Winning blinds use more discards + hands than hands
    -- 3) Winning blinds requires difficult hands to draw - 60% of winning hands are higher in poker hand list
    return 0
end}, true)

SMODS.Blind:take_ownership("eye", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Winning hands being spread around multiple hands of the same type - 70% of winning hands are the same hand type - worth max: 0.85
    -- Partial credit: - things below give a slight increase to counter value
    -- Winning hands being an easy to create hand - 60% of winning hands are lower in poker hand list - worth max: 0.15
    return 0
end}, true)

SMODS.Blind:take_ownership("plant", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    local score_o = 0
    -- 1) Winning hands involving face cards - 65% of winning hands contain a face card - worth max: 0.60
    local total_cards, qual_cards = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.winning_hand then
                for b, n in pairs(v.full_hand) do
                    total_cards = total_cards + 1
                    if n:is_face(true) then
                        qual_cards = qual_cards + 1
                    end
                end
            end
        end
    end
    if qual_cards > 0 then
        local add_val = aij_curve((qual_cards/total_cards), 0.60, 65)
        score_o = score_o + add_val
    end
    -- 2) A joker that includes the word "face", "king", "queen" or "jack" - worth max: 0.40
    local faces = 0
    if G.jokers then
        for i = 1, #G.jokers.cards do
            local text = retrieve_joker_text(G.jokers.cards[i])
            local has_king = text:find('Kings') or text:find('King') or text:find('kings') or text:find('king')
            local has_queen = text:find('Queens') or text:find('Queen') or text:find('queens') or text:find('queen')
            local has_jack = text:find('Jacks') or text:find('Jack') or text:find('jacks') or text:find('jack')
            local has_face = text:find('Faces') or text:find('Face') or text:find('faces') or text:find('face')
 
            if has_king or has_queen or has_jack or has_face then
                faces = faces + 1
            end
        end
    end
    if faces > 0 then
        local add_val = aij_curve((faces/5), 0.40, 1)
        score_o = score_o + add_val
    end
    --   OR
    local score_i = 0
    -- 3) Many enhanced faces - 60% of total cards are face, 70% of total face cards are enhanced - worth max: 1.00
    local total_cards_o, face_cards, enhanced_cards = 0, 0, 0
    for k, v in pairs(G.playing_cards) do
        total_cards_o = total_cards_o + 1
        if v:is_face(true) then
            face_cards = face_cards + 1
            if v.config.center ~= G.P_CENTERS.c_base then
                enhanced_cards = enhanced_cards + 1
            end
        end
    end
    if face_cards > 0 then
        local add_val = aij_curve((face_cards/total_cards_o), 0.50, 60)
        score_i = score_i + add_val
    end
    if enhanced_cards > 0 then
        local add_val = aij_curve((enhanced_cards/face_cards), 0.50, 70)
        score_i = score_i + add_val
    end
    return score_o > score_i and score_o or score_i
end}, true)

SMODS.Blind:take_ownership("needle", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    -- 1) Many hands + Few discards - hands >= 5, discards <= 2
    -- 2) Winning blinds use more hands + discards than discards - unsure
    -- 3) Winning blinds requires difficult hands to draw - 60% of winning hands are higher in poker hand list
    -- 4) Winning hands have never individually exceeded X1 mult - 70% of winning hands are not > 1x blind size
    return 0
end}, true)

SMODS.Blind:take_ownership("head", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    local score_o = 0
    -- 1) Winning hands involving hearts - 65% of winning cards - worth max: 0.60
    local total_cards, qual_cards = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.winning_hand then
                for b, n in pairs(v.full_hand) do
                    total_cards = total_cards + 1
                    if n:is_suit('Hearts', true) then
                        qual_cards = qual_cards + 1
                    end
                end
            end
        end
    end
    if qual_cards > 0 then
        local add_val = aij_curve((qual_cards/total_cards), 0.60, 65)
        score_o = score_o + add_val
    end
    -- 2) A joker that includes the word "heart" - worth max: 0.40
    local hearts = 0
    if G.jokers then
        for i = 1, #G.jokers.cards do
            local text = retrieve_joker_text(G.jokers.cards[i])
 
            if text:find('Hearts') or text:find('hearts') or text:find('Heart') or text:find('heart') then
                hearts = hearts + 1
            end
        end
    end
    if hearts > 0 then
        local add_val = aij_curve((hearts/5), 0.40, 1)
        score_o = score_o + add_val
    end
    --   OR
    local score_i = 0
    -- 3) Many enhanced hearts - 60% of total cards are heart, 70% of total heart cards are enhanced - worth max: 1.00
    local total_cards_o, heart_cards, enhanced_cards = 0, 0, 0
    for k, v in pairs(G.playing_cards) do
        total_cards_o = total_cards_o + 1
        if v:is_suit('Hearts', true) then
            heart_cards = heart_cards + 1
            if v.config.center ~= G.P_CENTERS.c_base then
                enhanced_cards = enhanced_cards + 1
            end
        end
    end
    if heart_cards > 0 then
        local add_val = aij_curve((heart_cards/total_cards_o), 0.50, 60)
        score_i = score_i + add_val
    end
    if enhanced_cards > 0 then
        local add_val = aij_curve((enhanced_cards/heart_cards), 0.50, 70)
        score_i = score_i + add_val
    end
    return score_o > score_i and score_o or score_i
end}, true)

SMODS.Blind:take_ownership("window", {
    aij_calculate_counter_score = function()
    -- Max counter should require:
    local score_o = 0
    -- 1) Winning hands involving diamonds - 65% of winning cards - worth max: 0.60
    local total_cards, qual_cards = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.winning_hand then
                for b, n in pairs(v.full_hand) do
                    total_cards = total_cards + 1
                    if n:is_suit('Diamonds', true) then
                        qual_cards = qual_cards + 1
                    end
                end
            end
        end
    end
    if qual_cards > 0 then
        local add_val = aij_curve((qual_cards/total_cards), 0.60, 65)
        score_o = score_o + add_val
    end
    -- 2) A joker that includes the word "diamond" - worth max: 0.40
    local diamonds = 0
    if G.jokers then
        for i = 1, #G.jokers.cards do
            local text = retrieve_joker_text(G.jokers.cards[i])
 
            if text:find('Diamonds') or text:find('diamonds') or text:find('Diamond') or text:find('diamond') then
                diamonds = diamonds + 1
            end
        end
    end
    if diamonds > 0 then
        local add_val = aij_curve((hearts/5), 0.40, 1)
        score_o = score_o + add_val
    end
    --   OR
    local score_i = 0
    -- 3) Many enhanced diamonds - 60% of total cards are diamond, 70% of total diamond cards are enhanced - worth max: 1.00
    local total_cards_o, diamond_cards, enhanced_cards = 0, 0, 0
    for k, v in pairs(G.playing_cards) do
        total_cards_o = total_cards_o + 1
        if v:is_suit('Diamonds', true) then
            diamond_cards = diamond_cards + 1
            if v.config.center ~= G.P_CENTERS.c_base then
                enhanced_cards = enhanced_cards + 1
            end
        end
    end
    if diamond_cards > 0 then
        local add_val = aij_curve((diamond_cards/total_cards_o), 0.50, 60)
        score_i = score_i + add_val
    end
    if enhanced_cards > 0 then
        local add_val = aij_curve((enhanced_cards/diamond_cards), 0.50, 70)
        score_i = score_i + add_val
    end
    return score_o > score_i and score_o or score_i
end}, true)

SMODS.Blind:take_ownership("serpent", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    local score = 0
    -- Max counter should require:
    -- 1) Winning hands score 4 or more cards - 70% of winning hands - worth max: 0.65
    local total_hands, qual_hands = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.winning_hand then
                total_hands = total_hands + 1
                if #v.scoring_hand >= 4 then
                    qual_hands = qual_hands + 1
                end
            end
        end
    end
    if qual_hands > 0 then
        local add_val = aij_curve((qual_hands/total_hands), 0.65, 70)
        score = score + add_val
    end
    -- 2) No held in hand effects - no held in hand enhancements in deck - worth max: 0.35
    local total_cards, enhanced_cards = 0, 0
    for k, v in pairs(G.playing_cards) do
        total_cards = total_cards + 1
        if v.config.center ~= G.P_CENTERS.c_base then
            local t = v.config.center.config
            if t['h_mult'] or t['h_x_mult'] or t['h_dollars'] or t['h_chips'] or t['h_x_chips'] then
                enhanced_cards = enhanced_cards + 1
            end
        end
    end
    if enhanced_cards <= 10 then
        local add_val = aij_curve(1-(enhanced_cards/total_cards), 0.35, 99)
        score = score + add_val
    end
    score = score/(4/3)
    return score
end}, true)

SMODS.Blind:take_ownership("pillar", {
    aij_calculate_counter_score = function()
    -- Generally a mid-risk blind, with less potential for ruining a run
    local score = 0
    -- Max counter should require:
    -- 1) Many cards having been played previously - 70% of total cards - worth max: 0.75
    local total_cards, played_cards, enhanced_cards = 0, 0, 0
    for k, v in pairs(G.playing_cards) do
        total_cards = total_cards + 1
        if v.ability.played_this_ante then
            played_cards = played_cards + 1
            if v.config.center ~= G.P_CENTERS.c_base then
                enhanced_cards = enhanced_cards + 1
            end
        end
    end
    if played_cards > 0 then
        local add_val = aij_curve((played_cards/total_cards), 0.75, 70)
        score = score + add_val
    end
    -- 2) Many previously played cards are enhanced - 60% of played cards - worth max: 0.25
    if enhanced_cards > 0 then
        local add_val = aij_curve((enhanced_cards/played_cards), 0.25, 60)
        score = score + add_val
    end
    score = score/(4/3)
    return score
end}, true)

SMODS.Blind:take_ownership("flint", {
    aij_calculate_counter_score = function()
    local score = 0
    -- Max counter should require:
    -- 1) Winning hands being quite high level - 10 or higher, 70% of winning hands - worth max: 0.70
    local total_hands, qual_hands = 0, 0
    if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_run) do
            if v.scoring_name and G.GAME.hands[v.scoring_name] and v.winning_hand then
                total_hands = total_hands + 1
                if G.GAME.hands[v.scoring_name].level >= 10 then
                    qual_hands = qual_hands + 1
                end
            end
        end
    end
    if qual_hands > 0 then
        local add_val = aij_curve((qual_hands/total_hands), 0.70, 70)
        score = score + add_val
    end
    -- 2) Low amount of +mult and +chip from cards and jokers - +chips <= 30, +mult <= 15 - worth max: 0.30
    return score
end}, true)

return { name = { "Pit Blinds" }, items = { the_assistant } }
