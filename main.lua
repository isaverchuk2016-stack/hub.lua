local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 Eperty9 God Hub | Twisted V8",
   LoadingTitle = "Загрузка Raven Edition...",
   LoadingSubtitle = "by eperty9",
   ConfigurationSaving = { Enabled = false }
})

-- 1 ВКЛАДКА: MAIN
local Tab1 = Window:CreateTab("Main", 4483362458)

Tab1:CreateSlider({
   Name = "Скорость (Anti-Kick)",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Tab1:CreateButton({
   Name = "Бесконечный Прыжок",
   Callback = function()
       _G.JumpEnabled = true
       game:GetService("UserInputService").JumpRequest:Connect(function()
           if _G.JumpEnabled then
               game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
           end
       end)
   end,
})

-- 2 ВКЛАДКА: ESP
local Tab2 = Window:CreateTab("ESP", 4483362458)

Tab2:CreateButton({
   Name = "Подсветить Торнадо (Красный)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
               local hl = Instance.new("Highlight", v)
               hl.FillColor = Color3.fromRGB(255, 0, 0)
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
           end
       end
   end,
})

Tab2:CreateButton({
   Name = "Найти Зонды (Зеленый)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("probe") or v.Name:lower():find("sensor") then
               local hl = Instance.new("Highlight", v)
               hl.FillColor = Color3.fromRGB(0, 255, 0)
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
           end
       end
   end,
})

Tab2:CreateButton({
   Name = "КУДА ДВИЖЕТСЯ (Траектория)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
               local b = Instance.new("Part", workspace)
               b.Size = Vector3.new(8, 1, 2500) -- Длинная полоса
               b.Anchored = true
               b.CanCollide = false
               b.Material = Enum.Material.Neon
               b.Color = Color3.fromRGB(0, 255, 255)
               b.Transparency = 0.4
               b.CFrame = v.CFrame * CFrame.new(0, -8, -1250) -- Рисует путь вперед
           end
       end
   end,
})
