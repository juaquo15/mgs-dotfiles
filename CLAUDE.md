# MGS Dotfiles — Metal Gear Solid Aesthetic

CachyOS + Omarchy personalizado con estética Metal Gear Solid: codec screen verde,
verde terminal #00FF41, fondo near-black, elementos ASCII tácticos.

## Sistema
- OS: CachyOS (Arch-based), kernel 7.0.8-1-cachyos
- WM: Hyprland vía Omarchy
- Bootloader: Limine
- Máquina: ThinkpadJuaquo15
- Almacenamiento: nvme1n1 (CachyOS, LUKS) + nvme0n1 (/data, ext4)

## Estructura del proyecto

```
mgs-dotfiles/
├── CLAUDE.md          ← estás aquí
├── README.md
├── install.sh         ← replica en otra máquina
└── configs/           ← snapshots de configs activas
```

El tema vive en `~/.config/omarchy/themes/metal-gear-solid/`.

## Paleta de colores MGS

| Variable    | Color     | Uso                    |
|-------------|-----------|------------------------|
| background  | #010801   | fondo near-black       |
| foreground  | #00FF41   | verde codec (primario) |
| accent      | #FF6B00   | naranja alerta (!)     |
| color1/9    | #CC1A00 / #FF2200 | rojo peligro  |
| color3/11   | #FFAA00 / #FFD700 | ámbar radar   |
| color6/14   | #00CCAA / #44DDCC | cian sweep    |

## Archivos clave

| Archivo | Propósito |
|---------|-----------|
| `~/.config/omarchy/themes/metal-gear-solid/colors.toml` | Paleta terminal |
| `~/.config/omarchy/themes/metal-gear-solid/btop.theme` | Colores btop |
| `~/.config/omarchy/branding/about.txt` | ASCII art fastfetch (codec screen) |

## Cómo aplicar el tema

```bash
omarchy theme set "Metal Gear Solid"
```

## Tareas pendientes / ideas

- [ ] Waybar: agregar estilo MGS (bordes verdes, tipografía monospace, iconos ASCII)
- [ ] Hyprland: border_color verde (#00FF41), animaciones más rápidas/tácticas
- [ ] Hyprlock: pantalla de bloqueo estilo codec con ASCII art
- [ ] Walker: launcher con estilo codec screen
- [ ] Neovim: explorar tema green más específico (ej. matrix.nvim)
- [x] Wallpaper: 7 wallpapers 1920x1080 en `~/.config/omarchy/themes/metal-gear-solid/backgrounds/` (codec.jpg, alert.jpg, wallhaven-9m9rr1, wallhaven-4vjvkl, wallhaven-dpejeo, mgs-531883, mgs-531891, mgs-601895)
- [ ] Alert sound: reproducir el "!" de MGS en eventos del sistema

## Cómo replicar en otra máquina

```bash
cd ~/Documentos/mgs-dotfiles
./install.sh
```

## Teclado

- Layouts activos: `latam` (español) + `us intl` (inglés con AltGr para ñ/tildes)
- Cambiar layout: `SUPER+SHIFT+K`
- Config: `~/.config/hypr/input.lua`, `~/.config/hypr/bindings.lua`

## Sesiones anteriores con Claude

- 2026-05-18: creación inicial del proyecto, tema base, ASCII art fastfetch, wallpapers
- 2026-05-18: nuevo ASCII Snake en about.txt (bandana, ojos ◉, nariz, boca, collar ▓), +6 wallpapers descargados de wallhaven/alphacoders
- 2026-05-18: layout de teclado latam/us-intl con toggle SUPER+SHIFT+K, indicador ES/EN en Waybar
- 2026-05-18: bluetooth AutoEnable=true en /etc/bluetooth/main.conf (arranca encendido)
