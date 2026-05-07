 local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 Eperty9 God Hub | Twisted",
   LoadingTitle = "Финальная сборка eperty9...",
   LoadingSubtitle = "Version 6.0 (Fixed ESP)",
   ConfigurationSaving = { Enabled = false }
})

local Tab1 = Window:CreateTab("Игрок", 4483362458)
local Tab2 = Window:CreateTab("Охота (ESP)", 4483362458)

-- ВКЛАДКА ИГРОК
Tab1:CreateToggle({
   Name = "Активировать обход скорости (Anti-Kick)",
   CurrentValue = false,
   Callback = function(Value)
       _G.SpeedEnabled = Value
       spawn(function()
           while _G.SpeedEnabled do
               local char = game.Players.LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                   local hum = char:FindFirstChild("Humanoid")
                   if hum.MoveDirection.Magnitude > 0 then
                       char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (hum.MoveDirection * (_G.SpeedValue / 50))
                   end
               end
               task.wait()
           end
       end)
   end,
})

Tab1:CreateSlider({
   Name = "Настройка скорости",
   Range = {1, 100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) _G.SpeedValue = Value end,
})

Tab1:CreateToggle({
   Name = "Бесконечный прыжок",
   CurrentValue = false,
   Callback = function(Value) _G.InfJump = Value end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
	if _G.InfJump then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end
end)

-- ВКЛАДКА ESP (3 КНОПКИ)
local SectionESP = Tab2:CreateSection("Визуалы")

-- 1. Кнопка для Торнадо
Tab2:CreateButton({
   Name = "1. Подсветить ТОРНАДО (Красный)",
   Callback = function()
       for _, obj in pairs(game:GetDescendants()) do
           if obj.Name:lower():find("tornado") or obj.Name:lower():find("twister") then
               local hl = Instance.new("Highlight", obj)
               hl.FillColor = Color3.fromRGB(255, 0, 0)
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
           end
       end
       Rayfield:Notify({Title = "ESP", Content = "Торнадо подсвечено красным!"})
   end,
})

-- 2. Кнопка для Зондов (тех самых штук)
Tab2:CreateButton({
   Name = "2. Подсветить ЗОНДЫ (Зеленый)",
   Callback = function()
       for _, obj in pairs(game:GetDescendants()) do
           if obj.Name:lower():find("probe") or obj.Name:lower():find("sensor") or obj.Name:lower():find("station") then
               local hl = Instance.new("Highlight", obj)
               hl.FillColor = Color3.fromRGB(0, 255, 0)
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
           end
       end
       Rayfield:Notify({Title = "ESP", Content = "Зонды подсвечены зеленым!"})
   end,
})

-- 3. Кнопка для Направления
Tab2:CreateButton({
   Name = "3. КУДА ДВИЖЕТСЯ (Линия)",
   Callback = function()
       for _, obj in pairs(game:GetDescendants()) do
           if obj.Name:lower():find("tornado") or obj.Name:lower():find("twister") then
               local root = obj:IsA("Model") and obj.PrimaryPart or obj
               if root then
                   local beam = Instance.new("Part", workspace)
                   beam.Size = Vector3.new(2, 2, 300)
                   beam.Anchored = true
                   beam.CanCollide = false
                   beam.Color = Color3.fromRGB(
