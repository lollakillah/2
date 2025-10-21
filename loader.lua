-- Inovoproductions Game Hub Loader
-- Load via: loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/inovoproductions/main/loader.lua"))()

local version = "1.0.0"

print("🚀 Loading Inovoproductions Hub v" .. version)

-- Load the main hub
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/inovoproductions/main/main.lua"))()
end)

if not success then
    warn("❌ Failed to load Inovoproductions Hub: " .. tostring(result))
else
    print("✅ Inovoproductions Hub loaded successfully!")
end

