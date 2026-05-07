local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🔥 Eperty9 Raven | Twisted V8", HidePremium = false, SaveConfig = false})

-- ВКЛАДКА ИГРОК
local Tab1 = Window:MakeTab({
	Name = "Игрок",
	Icon = "rbxassetid://4483345998"
})

Tab1:AddSlider({
	Name = "Скорость",
	Min = 16, Max = 150, Default = 16,
	Increment = 1,
	Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end    
})

Tab1:AddButton({
	Name = "Бесконечный Прыжок",
	Callback = function()
        _G.Jump = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.Jump then game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
        end)
  	end    
})

-- ВКЛАДКА ESP
local Tab2 = Window:MakeTab({
	Name = "Охота (ESP)",
	Icon = "rbxassetid://4483345998"
})

Tab2:AddButton({
	Name = "1. ПОДСВЕТИТЬ ТОРНАДО",
	Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
                local hl = Instance.new("Highlight", v)
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.DepthMode = "AlwaysOnTop"
            end
        end
  	end    
})

Tab2:AddButton({
	Name = "2. ПОДСВЕТИТЬ ЗОНДЫ",
	Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("probe") or v.Name:lower():find("sensor") then
                local hl = Instance.new("Highlight", v)
                hl.FillColor = Color3.fromRGB(0, 255, 0)
                hl.DepthMode = "AlwaysOnTop"
            end
        end
  	end    
})

Tab2:AddButton({
	Name = "3. ПУТЬ ТОРНАДО",
	Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("tornado") or v.Name:lower():find("twister") then
                local b = Instance.new("Part", workspace)
                b.Size = Vector3.new(4, 4, 1500)
                b.Anchored, b.CanCollide = true, false
                b.Material, b.Color = "Neon", Color3.fromRGB(0, 255, 255)
                b.CFrame = v.CFrame * CFrame.new(0, 0, -750)
            end
        end
  	end    
})

Tab1:AddButton({
	Name = "УДАЛИТЬ ТУМАН",
	Callback = function()
        game:GetService("Lighting").FogEnd = 100000
        if game:GetService("Lighting"):FindFirstChild("Atmosphere") then
            game:GetService("Lighting").Atmosphere:Destroy()
        end
  	end    
})

OrionLib:Init()
