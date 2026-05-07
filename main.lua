local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("👑 Eperty9 God Hub", "SkylineTheme")

-- ВКЛАДКА ИГРОК
local Tab1 = Window:NewTab("Игрок")
local Section1 = Tab1:NewSection("Настройки")

Section1:NewSlider("Скорость", "Меняет скорость бега", 100, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section1:NewButton("Бесконечный прыжок", "Прыгай в воздухе", function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)

-- ВКЛАДКА ESP
local Tab2 = Window:NewTab("ESP (Охота)")
local Section2 = Tab2:NewSection("3 Кнопки")

Section2:NewButton("1. ПОДСВЕТИТЬ ТОРНАДО", "Красный столб", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
            local p = Instance.new("Part", v)
            p.Size = Vector3.new(30, 5000, 30)
            p.Anchored = true
            p.CanCollide = false
            p.Color = Color3.fromRGB(255, 0, 0)
            p.Material = "Neon"
        end
    end
end)

Section2:NewButton("2. ПОДСВЕТИТЬ ЗОНДЫ", "Зеленый столб", function()
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

Section2:NewButton("3. КУДА ДВИЖЕТСЯ", "Синяя линия", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
            local b = Instance.new("Part", workspace)
            b.Size = Vector3.new(5, 5, 800)
            b.Anchored = true
            b.CanCollide = false
            b.Color = Color3.fromRGB(0, 255, 255)
            b.
