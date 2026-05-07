-- СОЗДАЕМ ПРОСТОЕ МЕНЮ (РАБОТАЕТ ВЕЗДЕ)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local JumpBtn = Instance.new("TextButton")
local ESP1 = Instance.new("TextButton")
local ESP2 = Instance.new("TextButton")
local ESP3 = Instance.new("TextButton")

-- Настройка окна
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Active = true
Frame.Draggable = true -- Можно двигать пальцем

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "EPERTY9 HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- ФУНКЦИИ КНОПОК
local function createBtn(btn, text, pos, color, cmd)
    btn.Parent = Frame
    btn.Text = text
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = color
    btn.MouseButton1Click:Connect(cmd)
end

-- КНОПКА 1: СКОРОСТЬ
createBtn(SpeedBtn, "СКОРОСТЬ 50", 50, Color3.fromRGB(70, 70, 70), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

-- КНОПКА 2: ПРЫЖОК
createBtn(JumpBtn, "БЕЗЛ. ПРЫЖОК", 100, Color3.fromRGB(70, 70, 70), function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)

-- КНОПКА 3: ESP ТОРНАДО
createBtn(ESP1, "1. ESP ТОРНАДО", 150, Color3.fromRGB(150, 0, 0), function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
            local p = Instance.new("Part", v)
            p.Size = Vector3.new(40, 5000, 40)
            p.Anchored = true
            p.CanCollide = false
            p.Color = Color3.fromRGB(255, 0, 0)
            p.Material = "Neon"
        end
    end
end)

-- КНОПКА 4: ESP ЗОНДЫ
createBtn(ESP2, "2. ESP ЗОНДЫ", 200, Color3.fromRGB(0, 150, 0), function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("probe") or v.Name:lower():find("sensor") then
            local p = Instance.new("Part", v)
            p.Size = Vector3.new(10, 2000, 10)
            p.Anchored = true
            p.CanCollide = false
            p.Color = Color3.fromRGB(0, 255, 0)
            p.Material = "Neon"
        end
    end
end)

-- КНОПКА 5: ТРАЕКТОРИЯ
createBtn(ESP3, "3. ПУТЬ ТОРНАДО", 250, Color3.fromRGB(0, 150, 150), function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
            local b = Instance.new("Part", workspace)
            b.Size = Vector3.new(5, 5, 1000)
            b.Anchored = true
            b.CanCollide = false
            b.Color = Color3.fromRGB(0, 255, 255)
            b.CFrame = v.CFrame * CFrame.new(0, 0, -500)
        end
    end
end)
