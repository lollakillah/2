-- Simple test om te checken of GitHub connectie werkt
print("✅ GitHub connectie werkt!")
print("✅ Als je dit ziet, is het probleem opgelost!")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Test Geslaagd!";
    Text = "GitHub werkt! Nu kun je de echte hub laden.";
    Duration = 5;
})

