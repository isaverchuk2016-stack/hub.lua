local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Eperty9 Raven | Twisted V8",
   LoadingTitle = "Raven Hub Loading...",
   LoadingSubtitle = "by eperty9",
   ConfigurationSaving = { Enabled = false }
})

-- Создаем вкладки
local Tab1 = Window:CreateTab("Игрок", 4483362458)
local Tab2 = Window:CreateTab("Охота (ESP)", 4483362458)

-- Наполняем вкладку ИГРОК
Tab1:CreateSlider({
   Name = "Скорость бега",
   Range = {16, 150},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Tab1:CreateButton({
   Name = "Бесконечный прыжок",
   Callback = function()
       _G.JumpEnabled = true
       game:GetService("UserInputService").JumpRequest:Connect(function()
           if _G.JumpEnabled then
               game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
           end
       end)
   end,
})

-- Наполняем вкладку ESP
Tab2:CreateButton({
   Name = "1. ПОДСВЕТИТЬ ТОРНАДО",
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

Tab2:AddButton({
   Name = "2. ПОДСВЕТИТЬ ЗОНДЫ",
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

Tab2:AddButton({
   Name = "3. ПУТЬ ТОРНАДО",
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

Tab1:CreateButton({
   Name = "УДАЛИТЬ ТУМАН",
   Callback = function()
       game:GetService("Lighting").FogEnd = 100000
       if game:GetService("Lighting"):FindFirstChild("Atmosphere") then
           game:GetService("Lighting").Atmosphere:Destroy()
       end
   end,
})
