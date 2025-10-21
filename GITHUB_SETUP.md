# 📦 GitHub Setup Instructies

Volg deze stappen om je Inovoproductions Hub op GitHub te zetten.

## 📝 Stap 1: Repository Aanmaken

1. Ga naar [GitHub.com](https://github.com)
2. Klik op de **+** knop rechtsboven → **New repository**
3. Vul in:
   - **Repository name:** `inovoproductions`
   - **Description:** `🎮 Moderne Roblox Script Hub`
   - **Public** (aanvinken)
   - **Add README** (NIET aanvinken, we hebben al een README)
4. Klik **Create repository**

## 💻 Stap 2: Code Uploaden

### Optie A: Via GitHub Website (Makkelijkst)

1. Op je nieuwe repository pagina, klik **uploading an existing file**
2. Sleep alle bestanden naar de browser:
   - `loader.lua`
   - `main.lua`
   - `ui-library.lua`
   - `README.md`
   - `.gitignore`
3. Scroll naar beneden, klik **Commit changes**

### Optie B: Via Git Command Line

```bash
# Navigeer naar je project folder
cd C:\Users\Arda\Desktop\data

# Initialiseer Git
git init

# Voeg alle bestanden toe
git add .

# Maak eerste commit
git commit -m "🎉 Initial release - Inovoproductions Hub v1.0.0"

# Voeg GitHub als remote toe (vervang YOURNAME met je username)
git remote add origin https://github.com/YOURNAME/inovoproductions.git

# Push naar GitHub
git branch -M main
git push -u origin main
```

## 🔗 Stap 3: Raw URL Verkrijgen

Na het uploaden:

1. Ga naar je repository op GitHub
2. Klik op `loader.lua`
3. Klik op de **Raw** knop
4. Kopieer de URL uit de adresbalk

De URL ziet er zo uit:
```
https://raw.githubusercontent.com/YOURNAME/inovoproductions/main/loader.lua
```

## ✅ Stap 4: Testen

Test je script met deze code in een Roblox executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/inovoproductions/main/loader.lua"))()
```

**Vervang `YOURNAME` met je echte GitHub username!**

## 🎨 Stap 5: README Aanpassen (Optioneel)

Bewerk de volgende bestanden en vervang `YOURNAME`:

1. `loader.lua` - regel 5
2. `main.lua` - regel 3
3. `README.md` - regel 23

Dit kan je doen via:
- GitHub website (klik op bestand → potlood icoon)
- Of lokaal aanpassen en opnieuw uploaden

## 🚀 Klaar!

Je Inovoproductions Hub is nu live op GitHub! 

### Delen met anderen:

Geef ze deze code:
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/inovoproductions/main/loader.lua"))()
```

### Updates Maken:

Als je scripts wilt toevoegen of aanpassen:

1. Bewerk de bestanden lokaal
2. Upload opnieuw naar GitHub (overschrijft oude versie)
3. De loadstring code blijft hetzelfde!

## 💡 Tips

- ⭐ Vraag mensen om je repo te sterren
- 📝 Update de README met nieuwe features
- 🐛 Gebruik GitHub Issues voor bug reports
- 💬 Voeg je Discord toe aan de README
- 🔄 Maak releases voor belangrijke updates

## ❓ Problemen?

### "Permission denied" error
→ Check of je ingelogd bent op GitHub

### Scripts laden niet
→ Controleer of de files echt op GitHub staan (klik door de bestanden)
→ Check of de URL klopt (geen spaties, juiste username)

### Veranderingen zichtbaar maken
→ Het kan 1-2 minuten duren voordat GitHub updates toont
→ Clear je cache of gebruik Ctrl+F5

---

**Succes met je Inovoproductions Hub! 🎮✨**

