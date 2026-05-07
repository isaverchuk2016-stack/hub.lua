local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🚩 Eperty9 Raven | Twisted", HidePremium = false, SaveConfig = true, ConfigFolder = "EpertyRaven"})

-- ВКЛАДКА ИГРОК
local Tab1 = Window:MakeTab({
	Name = "Персонаж",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab1:AddSlider({
	Name = "Скорость (Anti-Kick)",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "km/h",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab1:AddButton({
	Name = "Бесконечный Прыжок",
	Callback = function()
        _G.Jump = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.Jump then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
  	end    
})

-- ВКЛАДКА ESP (САМАЯ МОЩНАЯ)
local Tab2 = Window:MakeTab({
	Name = "Охота (ESP)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab2:AddButton({
	Name = "1. Найти ТОРНАДО (Highlight)",
	Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
                local hl = Instance.new("Highlight")
                hl.Parent = v
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end
        end
        OrionLib:MakeNotification({Name = "ESP", Content = "Торнадо подсвечено!", Image = "rbxassetid://4483345998", Time = 5})
  	end    
})

Tab2:AddButton({
	Name = "2. Найти ЗОНДЫ",
	Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("probe") or v.Name:lower():find("sensor") then
                local hl = Instance.new("Highlight")
                hl.Parent = v
                hl.FillColor = Color3.fromRGB(0, 255, 0)
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end
        end
        OrionLib:MakeNotification({Name = "ESP", Content = "Зонды светятся зеленым!", Time = 5})
  	end    
})

Tab2:AddButton({
	Name = "3. Траектория Движения",
	Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
                local b = Instance.new("Part", workspace)
                b.Size = Vector3.new(4, 4, 1200)
                b.Anchored = true
                b.CanCollide = false
                b.Material = Enum.Material.Neon
                b.Color = Color3.fromRGB(0, 255, 255)
                b.CFrame = v.CFrame * CFrame.new(0, 0, -600)
            end
        end
  	end    
})

Tab2:AddButton({
	Name = "Убрать Туман",
	Callback = function()
        game:GetService("Lighting").FogEnd = 100000
        if game:GetService("Lighting"):FindFirstChild("Atmosphere") then
            game:GetService("Lighting").Atmosphere:Destroy()
        end
  	end    
})

OrionLib:Init()
