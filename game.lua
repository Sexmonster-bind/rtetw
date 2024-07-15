local Players = game:GetService("Players")

local SPEED_MULTIPLIER = 2 -- Adjust this value to change the speed boost multiplier

local function applySpeedBoost(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = humanoid.WalkSpeed * SPEED_MULTIPLIER
    end
end

local function onCharacterAdded(character)
    applySpeedBoost(character)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(onCharacterAdded)
    local character = player.Character
    if character then
        applySpeedBoost(character)
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in Players:GetPlayers() do
    onPlayerAdded(player)
end
