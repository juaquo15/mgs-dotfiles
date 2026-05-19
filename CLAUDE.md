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
├── install.sh         ← replica en otra máquina (9 pasos)
├── bin/               ← scripts instalados en ~/.local/bin/
│   ├── mgs-wal        ← colores adaptativos vía pywal
│   ├── mgs-wal-watch  ← daemon inotify (detecta cambio de fondo)
│   └── music          ← selector fzf → cliamp
└── configs/           ← snapshots de configs activas
    ├── branding/      ← ASCII art fastfetch
    ├── hypr/          ← monitors.lua, looknfeel, bindings, etc.
    ├── systemd/       ← mgs-wal.service
    └── waybar/        ← config.jsonc + style.css
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

## Colores adaptativos al wallpaper

`mgs-wal` extrae una paleta del fondo activo (pywal) y la aplica a:
- **Waybar**: texto, íconos, reloj, borde inferior→superior
- **Walker**: texto y borde del launcher
- **Mako**: texto y borde de notificaciones
- **Terminal** (alacritty): foreground y cursor en `alacritty.toml`
- **Hyprland**: borde de ventanas activas vía `hyprctl eval`

El verde MGS del terminal se reemplaza por el color dominante del fondo.
Se dispara automáticamente al cambiar wallpaper gracias al servicio systemd `mgs-wal.service` (inotifywait sobre `~/.config/omarchy/current/`).

## Archivos clave

| Archivo | Propósito |
|---------|-----------|
| `~/.config/omarchy/themes/metal-gear-solid/colors.toml` | Paleta terminal |
| `~/.config/omarchy/themes/metal-gear-solid/btop.theme` | Colores btop |
| `~/.config/omarchy/branding/about.txt` | ASCII art fastfetch (codec screen) |
| `~/.config/omarchy/current/theme/waybar.css` | Variables de color waybar (escrito por mgs-wal) |
| `~/.config/omarchy/current/theme/alacritty.toml` | Colores terminal (escrito por mgs-wal) |
| `~/.config/omarchy/current/theme/mako.ini` | Colores notificaciones (escrito por mgs-wal) |
| `~/.config/omarchy/current/theme/walker.css` | Colores launcher (escrito por mgs-wal) |
| `~/.local/bin/mgs-wal` | Script principal de colores adaptativos |
| `~/.local/bin/mgs-wal-watch` | Daemon inotify que dispara mgs-wal |
| `~/.config/systemd/user/mgs-wal.service` | Servicio systemd del daemon |

## Display

- Escala Hyprland: **1.25** — óptimo para ThinkPad 1080p (antes estaba en 1.50 que se veía muy grande)
- GDK_SCALE: **1**
- Config: `~/.config/hypr/monitors.lua`

## Waybar

- Posición: **abajo**
- Borde: superior (border-top) con color adaptativo
- Config: `~/.config/waybar/config.jsonc` + `style.css`

## Música

Comando `music` — abre selector fzf con todos los discos de cliamp, Enter para reproducir.

```bash
music   # menú de discos → cliamp
```

Playlists generadas por álbum con `cliamp playlist create`.

## Cómo aplicar el tema

```bash
omarchy theme set "Metal Gear Solid"
mgs-wal   # aplicar colores del wallpaper actual
```

## Cómo replicar en otra máquina

```bash
git clone https://github.com/juaquo15/mgs-dotfiles ~/Documentos/mgs-dotfiles
cd ~/Documentos/mgs-dotfiles
./install.sh
```

## Teclado

- Layouts activos: `latam` (español) + `us intl` (inglés con AltGr para ñ/tildes)
- Cambiar layout: `SUPER+SHIFT+K`
- Config: `~/.config/hypr/input.lua`, `~/.config/hypr/bindings.lua`

## Tareas pendientes / ideas

- [x] Waybar: estilo MGS abajo con colores adaptativos
- [x] Hyprland: border_color adaptativo al wallpaper
- [x] Walker: launcher con colores adaptativos
- [x] Wallpapers: 40+ fondos MGS1/2/3 en `~/.config/omarchy/backgrounds/metal-gear-solid/`
- [ ] Hyprlock: pantalla de bloqueo estilo codec con ASCII art
- [ ] Neovim: explorar tema green más específico (ej. matrix.nvim)
- [ ] Alert sound: reproducir el "!" de MGS en eventos del sistema

## Sesiones con Claude

- 2026-05-18: creación inicial del proyecto, tema base, ASCII art fastfetch, wallpapers
- 2026-05-18: nuevo ASCII Snake en about.txt (bandana, ojos ◉, nariz, boca, collar ▓), +40 wallpapers MGS1/2/3
- 2026-05-18: layout de teclado latam/us-intl con toggle SUPER+SHIFT+K, indicador ES/EN en Waybar
- 2026-05-18: bluetooth AutoEnable=true en /etc/bluetooth/main.conf
- 2026-05-18: colores adaptativos al wallpaper (mgs-wal + systemd), waybar abajo, escala 1.25, comando music, repo GitHub
