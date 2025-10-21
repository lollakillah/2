# 🎮 Inovoproductions Game Hub

Een moderne, krachtige script hub voor Roblox games met een prachtige UI geïnspireerd door Sirius.menu.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Status](https://img.shields.io/badge/status-beta-orange.svg)
![Platform](https://img.shields.io/badge/platform-Roblox-red.svg)

## ✨ Features

- 🎨 **Moderne UI** - Professionele interface met smooth animaties
- 🌍 **Universal Scripts** - Werken in alle Roblox games
- 🎮 **Game Detection** - Automatische detectie van populaire games
- 🚀 **Prestaties** - Geoptimaliseerd voor snelheid en stabiliteit
- 📱 **Gebruiksvriendelijk** - Intuïtieve tabs en knoppen
- 🔧 **Aanpasbaar** - Makkelijk uit te breiden met eigen scripts

## 📥 Installatie

### Methode 1: Direct Laden (Aanbevolen)

Kopieer en plak deze code in je Roblox executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/inovoproductions/main/loader.lua"))()
```

### Methode 2: Via Clipboard

1. Kopieer de loader code
2. Open je Roblox executor
3. Plak en voer uit

## 🎯 Ondersteunde Games

De hub detecteert automatisch de volgende games en laadt specifieke scripts:

| Game | Game ID | Features |
|------|---------|----------|
| 🌊 Blox Fruits | 2753915549 | Auto Farm, Level Farm |
| 🚪 Doors | 6516141723 | Entity ESP, Key ESP |
| 🔫 Arsenal | 286090429 | Aimbot, ESP |
| 🔒 Prison Life | 155615604 | Auto Escape, Get Guns |
| 🐾 Adopt Me | 920587237 | Auto Collect, Auto Age |

Voor andere games zijn alle **Universal Scripts** beschikbaar!

## 🌍 Universal Scripts

Deze scripts werken in **alle** Roblox games:

### Movement
- 💨 **Speed Boost** - Verhoog je WalkSpeed
- 🦘 **Jump Power** - Spring hoger
- 👻 **Noclip** - Loop door muren
- 🌟 **Infinite Jump** - Oneindig springen
- 🚁 **Fly** - Vlieg door de map

### Visual
- 📍 **Player ESP** - Zie andere spelers door muren
- 🔆 **FullBright** - Zie alles in het donker
- 🎯 **Remove Fog** - Verwijder mist

### Player
- 🎨 **Rainbow Character** - Regenboog kleuren
- 👁️ **God Mode** - Probeer onsterfelijk te worden
- 🎒 **Remove Accessories** - Verwijder accessoires
- 🎭 **Reset Character** - Reset je karakter

## 🎨 UI Preview

De hub bevat:
- ✅ Modern dashboard met game info
- ✅ Meerdere tabs voor organisatie
- ✅ Smooth animaties en transitions
- ✅ Draggable window
- ✅ Minimize/Close functies
- ✅ Mooie kleuren en iconen

## 🛠️ Voor Developers

### Project Structuur

```
inovoproductions/
├── loader.lua          # Main loader script
├── ui-library.lua      # UI framework
├── main.lua            # Hub core met alle scripts
└── README.md           # Deze file
```

### Eigen Scripts Toevoegen

Om je eigen scripts toe te voegen, edit `main.lua`:

```lua
YourTab:AddButton("Script Naam", function()
    -- Je script code hier
    Notify("Notificatie", "Script uitgevoerd!", 3)
end)
```

### UI Library Gebruiken

```lua
local Library = loadstring(game:HttpGet("URL"))()
local Window = Library:CreateWindow("Window Title")
local Tab = Window:CreateTab("Tab Name", "🔥")

Tab:AddButton("Button", function()
    print("Clicked!")
end)

Tab:AddToggle("Toggle", false, function(state)
    print("Toggle:", state)
end)

Tab:AddLabel("Label Text")
```

## 📋 Changelog

### Version 1.0.0 (Beta)
- 🎉 Initial release
- ✅ Modern UI geïmplementeerd
- ✅ Universal scripts toegevoegd
- ✅ Game detection systeem
- ✅ 5+ populaire games ondersteund

## ⚠️ Disclaimer

**Let op:** Deze script hub is alleen voor educatieve doeleinden. Het gebruik van scripts in Roblox kan tegen de Terms of Service zijn. Gebruik op eigen risico.

- ❌ We zijn niet verantwoordelijk voor bans
- ❌ Gebruik alleen in private servers als mogelijk
- ✅ Respecteer andere spelers
- ✅ Gebruik verantwoord

## 🤝 Contributing

Wil je bijdragen aan Inovoproductions Hub?

1. Fork de repository
2. Maak een feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit je changes (`git commit -m 'Add some AmazingFeature'`)
4. Push naar de branch (`git push origin feature/AmazingFeature`)
5. Open een Pull Request

## 📞 Contact & Support

- 💬 Discord: `discord.gg/inovoproductions` (Voorbeeld)
- 🐛 Issues: Gebruik GitHub Issues
- ⭐ Als je de hub leuk vindt, geef een ster!

## 📜 License

Dit project is open source en beschikbaar onder de MIT License.

---

<div align="center">

**Gemaakt met ❤️ door Inovoproductions**

⭐ Star dit project als je het nuttig vindt! ⭐

</div>

