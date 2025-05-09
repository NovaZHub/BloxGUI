local Games = {
   [2753915549] = "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Blox%20Fruit.lua", -- Sea 1
   [4442272183] = "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Blox%20Fruit.lua", -- Sea 2
   [7449423635] = "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Blox%20Fruit.lua"  -- Sea 3
}

local ScriptToLoad = Games[game.PlaceId]
if ScriptToLoad then
    loadstring(game:HttpGet(ScriptToLoad))()
else
    -- Se não for um Sea válido, exibe GUI com funções manuais
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")

    -- Botões
    local function makeButton(name, color, y, parent)
        local btn = Instance.new("TextButton")
        btn.Parent = parent
        btn.BackgroundColor3 = color
        btn.Position = UDim2.new(0, 10, 0, y)
        btn.Size = UDim2.new(0, 180, 0, 30)
        btn.Text = name
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.TextScaled = true
        return btn
    end

    -- GUI
    ScreenGui.Parent = game.CoreGui
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.Position = UDim2.new(0, 20, 0, 100)
    Frame.Size = UDim2.new(0, 200, 0, 200)
    Frame.Active = true
    Frame.Draggable = true

    local OnButton = makeButton("Ativar Auto Farm", Color3.fromRGB(0, 170, 0), 10, Frame)
    local OffButton = makeButton("Desativar Auto Farm", Color3.fromRGB(170, 0, 0), 50, Frame)
    local Tp1 = makeButton("TP: Monkey Island", Color3.fromRGB(0, 85, 170), 90, Frame)
    local Tp2 = makeButton("TP: Marine Fortress", Color3.fromRGB(0, 85, 170), 130, Frame)
    local Tp3 = makeButton("TP: Saber Expert", Color3.fromRGB(0, 85, 170), 170, Frame)

    -- Função de Auto Farm
    getgenv().AutoFarm = false

    function AutoFarm()
        while getgenv().AutoFarm do
            pcall(function()
                local player = game.Players.LocalPlayer
                local character = player.Character
                local enemy = nil

                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        enemy = v
                        break
                    end
                end

                if enemy then
                    repeat
                        wait()
                        character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                    until enemy.Humanoid.Health <= 0 or not getgenv().AutoFarm
                end
            end)
            wait(0.5)
        end
    end

    -- Conexões
    OnButton.MouseButton1Click:Connect(function()
        getgenv().AutoFarm = true
        AutoFarm()
    end)

    OffButton.MouseButton1Click:Connect(function()
        getgenv().AutoFarm = false
    end)

    Tp1.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1604, 8, 152)
    end)

    Tp2.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4505, 425, 4264)
    end)

    Tp3.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1400, 30, 6750)
    end)
end
