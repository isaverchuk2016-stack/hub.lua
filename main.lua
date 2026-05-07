local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 Eperty9 Hub Premium",
   LoadingTitle = "Исправляем ESP для eperty9...",
   LoadingSubtitle = "V3 Fixed",
   ConfigurationSaving = { Enabled = false }
})

local Tab1 = Window:CreateTab("Игрок", 4483362458)
local Tab2 = Window:CreateTab("Визуалы", 4483362458)

-- Игрок
Tab1:CreateSlider({
   Name = "Скорость (Безопасно)",
   Range = {16, 60},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- Исправленный ESP
Tab2:CreateButton({
   Name = "ПОДСВЕТИТЬ ВСЁ (Торнадо + Зонды)",
   Callback = function()
       -- Ищем вообще везде в игре
       for _, v in pairs(game:GetDescendants()) do
           -- Ищем Торнадо
           if v.Name == "Tornado" or v.Name == "TornadoModel" or v:FindFirstChild("TornadoRoot") then
               local b = Instance.new("BoxHandleAdornment")
               b.Size = Vector3.new(50, 200, 50) -- Огромный бокс для торнадо
               b.AlwaysOnTop = true
               b.ZIndex = 10
               b.Adornee = v:IsA("Model") and v.PrimaryPart or v
               b.Color3 = Color3.fromRGB(255, 0, 0)
               b.Transparency = 0.5
               b.Parent = v
           end
           
           -- Ищем Зонды и Станции
           if v.Name:find("Probe") or v.Name:find("Sensor") or v.Name:find("Station") then
               local b = Instance.new("BoxHandleAdornment")
               b.Size = Vector3.new(5, 15, 5)
               b.AlwaysOnTop = true
               b.ZIndex = 10
               b.Adornee = v:IsA("Model") and v.PrimaryPart or v
               b.Color3 = Color3.fromRGB(0, 255, 0)
               b.Transparency = 0.5
               b.Parent = v
           end
       end
       Rayfield:Notify({Title = "eperty9", Content = "ESP включен! Ищи красные и зеленые столбы."})
   end,
})

Rayfield:Notify({Title = "eperty9", Content = "Скрипт готов. Жми кнопку в Визуалах!"})
