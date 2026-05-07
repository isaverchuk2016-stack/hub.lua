local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 Eperty9 Hub Premium | Twisted",
   LoadingTitle = "Авторизация eperty9...",
   LoadingSubtitle = "Лучший софт для охоты",
   ConfigurationSaving = { Enabled = true, FolderName = "EpertyData", FileName = "Hub" }
})

local Tab1 = Window:CreateTab("Персонаж", 4483362458)
local Tab2 = Window:CreateTab("Торнадо ESP", 4483362458)

-- Настройки игрока
Tab1:CreateSlider({
   Name = "Скорость (Safe Mode)",
   Range = {16, 60},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Tab1:CreateButton({
   Name = "Анти-регдолл (Не падать)",
   Callback = function()
       game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
   end,
})

-- Настройки ESP
Tab2:CreateToggle({
   Name = "Подсветка Торнадо",
   CurrentValue = false,
   Callback = function(Value)
       _G.TornadoVisible = Value
       while _G.TornadoVisible do
           task.wait(2)
           for _, v in pairs(workspace:GetChildren()) do
               if v.Name == "Tornado" or v:FindFirstChild("Cloud") then
                   if not v:FindFirstChild("Highlight") then
                       local h = Instance.new("Highlight", v)
                       h.FillColor = Color3.fromRGB(255, 0, 0)
                   end
               end
           end
       end
   end,
})

Tab2:CreateButton({
   Name = "Найти все зонды (ESP)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name == "Probe" or v.Name == "Sensor" then
               local h = Instance.new("Highlight", v)
               h.FillColor = Color3.fromRGB(0, 255, 0)
               h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
           end
       end
       Rayfield:Notify({Title = "eperty9", Content = "Все зонды подсвечены зеленым!"})
   end,
})

Rayfield:Notify({Title = "Успех", Content = "Eperty9 Hub готов к работе!", Duration = 5})
