local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 Eperty9 Ultra Hub | Twisted",
   LoadingTitle = "Активация eperty_ultra...",
   LoadingSubtitle = "Версия 5.0 (Full Search)",
   ConfigurationSaving = { Enabled = false }
})

local Tab1 = Window:CreateTab("Главная", 4483362458)
local Tab2 = Window:CreateTab("Охота (ESP)", 4483362458)

-- ПЕРСОНАЖ
Tab1:CreateSlider({
   Name = "Скорость бега (Безопасно)",
   Range = {16, 60},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Tab1:CreateButton({
   Name = "Убрать туман (Видеть далеко)",
   Callback = function()
       game:GetService("Lighting").FogEnd = 100000
       if game:GetService("Lighting"):FindFirstChild("Atmosphere") then
           game:GetService("Lighting").Atmosphere:Destroy()
       end
       Rayfield:Notify({Title = "eperty9", Content = "Небо чистое! Теперь ищи торнадо на горизонте."})
   end,
})

-- УЛЬТРА ESP (Ищет все скрытые объекты)
Tab2:CreateButton({
   Name = "Сканнер Торнадо + Зонды",
   Callback = function()
       local count = 0
       for _, obj in pairs(game:GetDescendants()) do
           -- Ищем Торнадо (по части имени или классу)
           if obj.Name:lower():find("tornado") or obj.Name:lower():find("twister") then
               if obj:IsA("BasePart") or obj:IsA("Model") then
                   local hl = Instance.new("Highlight")
                   hl.Parent = obj
                   hl.FillColor = Color3.fromRGB(255, 0, 0)
                   hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                   hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                   count = count + 1
               end
           end
           
           -- Ищем Зонды (Probes)
           if obj.Name:lower():find("probe") or obj.Name:lower():find("sensor") then
               local hl = Instance.new("Highlight")
               hl.Parent = obj
               hl.FillColor = Color3.fromRGB(0, 255, 0)
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
               count = count + 1
           end
       end
       
       if count > 0 then
           Rayfield:Notify({Title = "eperty9", Content = "Найдено объектов: " .. count})
       else
           Rayfield:Notify({Title = "eperty9", Content = "Объекты не найдены. Жди начала шторма!"})
       end
   end,
})
