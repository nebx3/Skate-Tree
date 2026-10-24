local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Skate3 = ReplicatedStorage:WaitForChild("Skate3")
local host = Skate3:WaitForChild("host")


LocalPlayer:SetAttribute("S3Staff", true)
LocalPlayer:SetAttribute("S3Admin", true)
LocalPlayer:SetAttribute("S3AdminOwner", true)
LocalPlayer:SetAttribute("S3RoleTitle", "owner")
LocalPlayer:SetAttribute("S3RoleTitlesHeld", "owner,rne,cc")
LocalPlayer:SetAttribute("S3EcoPoints", 999999)
LocalPlayer:SetAttribute("S3EcoCandy", 9999)

pcall(function()
    local AdminPanel = require(host.AdminPanel)
    AdminPanel.is_admin = function() return true end
    AdminPanel.is_owner = function() return true end
    AdminPanel.allowed = function() return true end
    if AdminPanel.update then AdminPanel.update() end
end)

pcall(function()
    local EconomyClient = require(host.EconomyClient)
    EconomyClient.is_admin = function() return true end
    EconomyClient.is_owner = function() return true end
    EconomyClient.unlimited = function() return true end
end)

local colors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 165, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 150, 255),
    Color3.fromRGB(150, 0, 255)
}
local i = 1

RunService.Heartbeat:Connect(function()
    i = i % #colors + 1
    LocalPlayer:SetAttribute("S3RoleTitle", "owner")

    local hostState = _G.S3_HOST
    if hostState and hostState.engine and hostState.engine.physics and hostState.engine.physics.board then
        local bodies = hostState.engine.physics.board.bodies
        if bodies then
            for _, body in pairs(bodies) do
                if body and body.rates and body.rates.linear_velocity then
                    local v = body.rates.linear_velocity
                    v.x = v.x * 1.8
                    v.z = v.z * 1.8
                end
            end
        end
    end
end)

-- silly nigga notice
task.spawn(function()
    while true do
        pcall(function()
            local AdminNotice = require(host.AdminNotice)
            if AdminNotice and AdminNotice.show then
                AdminNotice.show({
                    text = "Credibility - free - custom",
                    style = "event",
                    seconds = 4,
                    from = "@Muppet61 On discord!"
                })
            end
        end)
        task.wait(8)
    end
end)

print("Fuck Niggers")
