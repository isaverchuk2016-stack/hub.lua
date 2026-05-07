local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Eperty9 Raven | Twisted V8",
   LoadingTitle = "Загрузка Raven Hub...",
   LoadingSubtitle = "by eperty9",
   ConfigurationSaving = { Enabled = false }
})

local Tab1 = Window:CreateTab("Игрок", 4483362458)
local Tab2 = Window:CreateTab("Охота (ESP)", 4483362458)

-- ПЕРСОНАЖ
Tab1:AddSlider({
   Name = "Скорость бега",
   Min = 16,
   Max = 150,
   Default = 16,
   Color = Color3.fromRGB(255, 255, 255),
   Increment = 1,
   ValueName = "Speed",
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Tab1:AddButton({
   Name = "Бесконечный прыжок",
   Callback = function()
       _G.InfJump = true
       game:GetService("UserInputService").JumpRequest:Connect(function()
           if _G.InfJump then
               game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
           end
       end)
   end,
})

-- ОХОТА (ESP)
Tab2:AddButton({
   Name = "1. ПОДСВЕТИТЬ ТОРНАДО (Красный)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
               local hl = Instance.new("Highlight", v)
               hl.FillColor = Color3.fromRGB(255, 0, 0)
               hl.OutlineColor = Color3.fromRGB(255, 255, 255)
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
           end
       end
       Rayfield:Notify({Title = "Eperty9", Content = "Торнадо подсвечено!"})
   end,
})

Tab2:AddButton({
   Name = "2. ПОДСВЕТИТЬ ЗОНДЫ (Зеленый)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("probe") or v.Name:lower():find("sensor") then
               local hl = Instance.new("Highlight", v)
               hl.FillColor = Color3.fromRGB(0, 255, 0)
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
           end
       end
       Rayfield:Notify({Title = "Eperty9", Content = "Зонды подсвечены!"})
   end,
})

Tab2:AddButton({
   Name = "3. КУДА ДВИЖЕТСЯ (Линия)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
               local b = Instance.new("Part", workspace)
               b.Size = Vector3.new(4, 4, 1500)
               b.Anchored = true
               b.CanCollide = false
               b.Material = Enum.Material.Neon
               b.Color = Color3.fromRGB(0, 255, 255)
               b.CFrame = v.CFrame * CFrame.new(0, 0, -750)
           end
       end
   end,
})

Tab2:AddButton({
   Name = "УДАЛИТЬ ТУМАН",
   Callback = function()
       game:GetService("Lighting").FogEnd = 100000
       if game:GetService("Lighting"):FindFirstChild("Atmosphere") then
           game:GetService("Lighting").Atmosphere:Destroy()
       end
   end,
})
