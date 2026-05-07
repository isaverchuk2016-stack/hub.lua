 local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 Eperty9 God Hub | V6",
   LoadingTitle = "Загрузка eperty9...",
   LoadingSubtitle = "Stable Edition",
   ConfigurationSaving = { Enabled = false }
})

local Tab1 = Window:CreateTab("Игрок", 4483362458)
local Tab2 = Window:CreateTab("ESP", 4483362458)

-- СКОРОСТЬ И ПРЫЖОК
Tab1:CreateSlider({
   Name = "Скорость (Безопасно)",
   Range = {16, 100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Tab1:CreateButton({
   Name = "Бесконечный прыжок",
   Callback = function()
       game:GetService("UserInputService").JumpRequest:Connect(function()
           game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
       end)
   end,
})

-- ТРИ КНОПКИ ESP (УПРОЩЕННЫЕ)
Tab2:CreateButton({
   Name = "1. ПОДСВЕТИТЬ ТОРНАДО",
   Callback = function()
       for _, v in pairs(game.Workspace:GetDescendants()) do
           if v.Name == "Tornado" or v.Name == "Twister" or v.Name:find("Storm") then
               local p = Instance.new("Part", v)
               p.Size = Vector3.new(20, 2000, 20)
               p.Anchored = true
               p.CanCollide = false
               p.Color = Color3.fromRGB(255, 0, 0)
               p.Transparency = 0.5
               p.Material = "Neon"
           end
       end
   end,
})

Tab2:CreateButton({
   Name = "2. ПОДСВЕТИТЬ ЗОНДЫ",
   Callback = function()
       for _, v in pairs(game.Workspace:GetDescendants()) do
           if v.Name:lower():find("probe") or v.Name:lower():find("sensor") then
               local p = Instance.new("Part", v)
               p.Size = Vector3.new(5, 1000, 5)
               p.Anchored = true
               p.CanCollide = false
               p.Color = Color3.fromRGB(0, 255, 0)
               p.Transparency = 0.5
               p.Material = "Neon"
           end
       end
   end,
})

Tab2:CreateButton({
   Name = "3. КУДА ДВИЖЕТСЯ",
   Callback = function()
       for _, v in pairs(game.Workspace:GetDescendants()) do
           if v.Name == "Tornado" or v.Name == "Twister" then
               local b = Instance.new("Part", workspace)
               b.Size = Vector3.new(2, 2, 500)
               b.Anchored = true
               b.CanCollide = false
               b.Color = Color3.fromRGB(0, 255, 255)
               b.CFrame = v.CFrame * CFrame.new(0
