local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() --// the main ui.
local Window = Library.CreateLib("Universal Hub (Build A Boat Edition)", "Sentinel") --// the theme and the tab name.

local Tab = Window:NewTab("Main") --// creates a tab

local MainSection = Tab:NewSection("Main") --// creates a section for the tab

MainSection:NewButton("E to fly!", "Press E to fly!", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Samhith89492/CFrame-Fly/main/Cframe-fly"))() --// executes a script on my github
end)

MainSection:NewSlider("Speed", "Increases your movement", 500, 16, function(v) --// changes your walkspeed to the slider value
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

MainSection:NewSlider("JumpPower", "Increases your jumppower", 500, 50, function(v) --// changes your jump power to the slider value
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

MainSection:NewKeybind("Toggle UI", "Press a key to toggle the UI", Enum.KeyCode.F, function() --// the keybind to toggle the ui
	Library:ToggleUI()
end)

MainSection:NewButton("CtrlClickTP", "Press Ctrl+Click to TP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Samhith89492/Ctrl-click-TP/main/CtrlClickTP"))() --// executes a script from my github
end)


MainSection:NewSlider("FOVChanger", "Changes your FOV", 120, 80, function(v) --// changes your field of view to the slider value
    workspace.CurrentCamera.FieldOfView = v
end)

local Tab = Window:NewTab("Misc") --// creates another tab

local MiscSection = Tab:NewSection("Misc") --// creates another section for the new tab

MiscSection:NewButton("Force Respawn", "Allows you to respawn forcefully", function() --// forces your character to respawn on games which dont let you reset, might not work on some games.
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

MainSection:NewSlider("Gravity", "Changes your Gravity", 196, 0, function(v) --// changes the workspace gravity to the slider value
    game.Workspace.Gravity = v
end)


function V1() --// runs the function "V1" so when you go look at autofarm v1 button you can see its only 1 line of code for the function.
    game.workspace.Gravity = 0
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-51.1823959, 80.6168747, -536.437805) --// uses tweenservice as simply teleporting to the chest wont work since you need to touch the black walls,the cframe of where the tween teleports you is mentioned in this line
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(22, Enum.EasingStyle.Linear) --// the tween info and setting
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character:WaitForChild("HumanoidRootPart"), -- creates the tweenservice and more tween info
        tweenInfo,
        {CFrame = CFrame.new(-60.5737877, 53.9498825, 8666.35059)}
    )
    tween:Play() --// directly executing the 8 lines wont work, this is the module that plays the tween
    wait(22) -- waits the amount of time to reach the end
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0, Enum.EasingStyle.Linear) -- creates another tween which teleports you to the chest
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character:WaitForChild("HumanoidRootPart"), --// creates the tween and even more tween info
        tweenInfo,
        {CFrame = CFrame.new(-55.5486526, -360.063782, 9489.0498)} --// the cframe of where the tween teleports you to
    )
    tween:Play() -- plays the tween
    wait(15) -- the amount of wait time for you to respawn after claiming the chest
    game.workspace.Gravity = 196.2 --// why did i add this when its not like im making the autofarm function of this a toggle
end --// ends the function

MainSection:NewButton("Autofarm V1", "A simple tweenservice autofarm", function(v) --// had to put "v" even tho its not a toggle or else it wouldnt work.
    repeat
        V1()
    until v == false --// this does litterally nothing since you cant toggle it but i had to or else the script wouldnt work, i know i said it does nothing but it prevents you from crashing or maybe not.
end)
   
MainSection:NewButton("Autofarm V2", "A better version of tweenservice autofarms", function()
    local players = game:GetService("Players") --// variable for players
 
    local stages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages") --// variable for the stages
    local penguin, gold = workspace:WaitForChild("ChangeCharacter"), workspace:WaitForChild("ClaimRiverResultsGold") --// variable for penguin and gold
     
    local client = players.LocalPlayer --// variable for localplayer
     

    _G.Busy = true --// sets the global value as true
    while _G.Busy do --// basically while true do
        local bodyVelocity = Instance.new("BodyVelocity") --// creates new instance
        bodyVelocity.Velocity = Vector3.new(0, -4, 0) --// creates a new vector3
        bodyVelocity.Parent = client.Character.HumanoidRootPart --// variable for the humanoidrootpart of the player
        
        for i = 1, 9 do --// idk
            if not client.Character or not client.Character:FindFirstChild("Humanoid") then --// idk
                repeat wait() until client.Character and client.Character:FindFirstChild("Humanoid") --// idk
            end --// ends the module
     
            client.Character.HumanoidRootPart.CFrame = stages["CaveStage"..i].DarknessPart.CFrame wait(0.1) --// dont ask me what this is
            
            if not _G.Busy then --// these 4 lines are useless since its a button and not a toggle
                client.Character.Humanoid.Health = 0
                exit(0)
            end
            
            if i == 1 then --// idk
                wait(4) --// waits 4 secs
            else --// dont ask me why this is here
                wait(2) --// waits 2 seconds
            end --// ends the module
            
            gold:FireServer() --// fires the variable
        end --// ends the module
     
        penguin:FireServer("PenguinCharacter") --// equips the penguin character even if you dont own it in the shop
        client.Character:Remove() --// dont ask me why this is here
     
        repeat wait() --// repeats the function wait() but with no value (makes the script wait for the shortest amount of time)
        until client.Character and client.Character:FindFirstChild("HumanoidRootPart") --// dont ask me what this is
    end --// ends the whole module but not the one below
end)






