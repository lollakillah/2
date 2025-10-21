-- Inovoproductions Game Hub Loader
-- Load via: loadstring(game:HttpGet("https://raw.githubusercontent.com/lollakillah/2/main/loader.lua"))()

local version = "1.0.1"

-- Error handling wrapper
local function SafeLoad()
    print("🚀 Loading Inovoproductions Hub v" .. version)
    
    -- Check if we're in a Roblox game
    if not game then
        warn("❌ Not running in Roblox environment!")
        return false
    end
    
    -- Try to load the main hub with proper error handling
    local success, mainScript = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/lollakillah/2/main/main.lua", true)
    end)
    
    if not success then
        warn("❌ Failed to download hub: " .. tostring(mainScript))
        warn("💡 Check your internet connection or GitHub URL")
        return false
    end
    
    if not mainScript or mainScript == "" then
        warn("❌ Downloaded script is empty!")
        return false
    end
    
    -- Try to execute the script
    local executeSuccess, executeResult = pcall(function()
        return loadstring(mainScript)()
    end)
    
    if not executeSuccess then
        warn("❌ Failed to execute hub: " .. tostring(executeResult))
        return false
    end
    
    print("✅ Inovoproductions Hub loaded successfully!")
    return true
end

-- Run the loader
local loaded = SafeLoad()

if not loaded then
    warn("━━━━━━━━━━━━━━━━━━━━━━━━━━")
    warn("⚠️ TROUBLESHOOTING TIPS:")
    warn("1. Make sure you uploaded files to GitHub")
    warn("2. Replace YOURNAME with your GitHub username")
    warn("3. Wait 1-2 minutes after uploading")
    warn("4. Check if HttpGet is enabled in your executor")
    warn("━━━━━━━━━━━━━━━━━━━━━━━━━━")
end
