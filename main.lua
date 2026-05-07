 local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 Eperty9 God Hub | Twisted",
   LoadingTitle = "Активация eperty9 Premium...",
   LoadingSubtitle = "Anti-Cheat Bypass + Path",
   ConfigurationSaving = { Enabled = false }
})

local Tab1 = Window:CreateTab("Игрок", 4483362458)
local Tab2 = Window:CreateTab("Охота (ESP)", 4483362458)

-- ПЕРСОНАЖ (ОБХОД АНТИЧИТА)
local SectionSpeed = Tab1:CreateSection("Bypass Speed")

_G.SpeedEnabled = false
_G.SpeedValue = 16

Tab1:CreateToggle({
   Name = "Активировать обход скорости",
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
   Callback = function(Value)
       _G.SpeedValue = Value
   end,
})

-- INFINITE JUMP
local InfiniteJumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
	if InfiniteJumpEnabled then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end
end)

Tab1:CreateToggle({
   Name = "Бесконечный прыжок",
   CurrentValue = false,
   Callback = function(Value)
       InfiniteJumpEnabled = Value
   end,
})

-- ОХОТА И ТРАЕКТОРИЯ
Tab2:CreateButton({
   Name = "Показать куда движется Торнадо",
   Callback = function()
       for _, obj in pairs(game:GetDescendants()) do
           if obj.Name:lower():find("tornado") or obj.Name:lower():find("twister") then
               local root = obj:IsA("Model") and obj.PrimaryPart or obj
               if root then
                   -- Рисуем линию пути
                   local beam = Instance.new("Part", workspace)
                   beam.Size = Vector3.new(1, 1, 100)
                   beam.Anchored = true
                   beam.CanCollide = false
                   beam.Color = Color3.fromRGB(0, 170, 255)
                   beam.Material = Enum.Material.Neon
                   -- Ставим линию перед торнадо (направление)
                   beam.CFrame = root.CFrame * CFrame.new(0, 0, -50)
                   
                   Rayfield:Notify({Title = "eperty9", Content = "Траектория отмечена синим цветом!"})
               end
           end
       end
   end,
})

Tab1:CreateButton({
   Name = "Убрать туман",
   Callback = function()
       game:GetService("Lighting").FogEnd = 100000
       if game:GetService("Lighting"):FindFirstChild("Atmosphere") then
           game:GetService("Lighting").Atmosphere:Destroy()
       end
   end,
})
