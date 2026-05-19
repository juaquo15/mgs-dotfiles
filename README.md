# MGS Dotfiles

Tema **Metal Gear Solid** para CachyOS + Omarchy + Hyprland.  
Verde codec `#00FF41`, fondo near-black `#010801`, estética táctica.

---

## Requisitos

- [Omarchy](https://omarchy.org/) instalado
- CachyOS / Arch Linux

---

## Instalación

```bash
git clone <repo> ~/Documentos/mgs-dotfiles
cd ~/Documentos/mgs-dotfiles
./install.sh
```

El script instala dependencias, copia configs, activa el servicio de colores adaptativos y aplica el tema.

---

## Qué incluye

### Tema visual
- Paleta MGS en terminal: verde `#00FF41`, fondo `#010801`, rojo alerta, ámbar radar, cian radar
- ASCII art de Solid Snake en fastfetch (codec screen)
- 40+ wallpapers de MGS1, MGS2 y MGS3 (concept art + gameplay)

### Colores adaptativos al wallpaper
El script `mgs-wal` extrae una paleta del fondo activo con pywal y la aplica a:

| Componente | Qué cambia |
|------------|-----------|
| Waybar | texto, íconos, reloj, borde |
| Walker | texto, borde del launcher |
| Mako | texto y borde de notificaciones |
| Terminal | color de primer plano y cursor |
| Hyprland | borde de ventanas activas |

El verde `#00FF41` del terminal se reemplaza por el color dominante del fondo.  
El cambio se dispara automáticamente al cambiar wallpaper vía `omarchy theme bg next`.

### Waybar
- Posición: **abajo**
- Estilo: borde superior con color adaptativo, tipografía monospace, sin decoraciones
- Animaciones de alerta en batería crítica y CPU

### Display
- Escala Hyprland: **1.25** (óptimo para ThinkPad 1080p)
- GDK_SCALE: 1

### Música
Comando `music` — selector de disco con fzf → reproduce en cliamp.

```bash
music   # abre menú de discos, Enter para reproducir
```

---

## Estructura

```
mgs-dotfiles/
├── bin/
│   ├── mgs-wal          # colores adaptativos (pywal)
│   ├── mgs-wal-watch    # daemon inotify para detectar cambio de fondo
│   └── music            # selector fzf → cliamp
├── configs/
│   ├── branding/        # ASCII art fastfetch
│   ├── hypr/            # monitors.lua (escala), looknfeel, bindings, etc.
│   ├── systemd/         # mgs-wal.service
│   └── waybar/          # config.jsonc + style.css
├── themes/
│   └── metal-gear-solid/  # colors.toml, btop.theme, backgrounds/
└── install.sh
```

---

## Dependencias instaladas por install.sh

| Paquete | Uso |
|---------|-----|
| `python-pywal` | extracción de paleta del wallpaper |
| `inotify-tools` | detección de cambio de fondo |
| `fzf` | selector de discos en `music` |
| `chafa` | render de imágenes en terminal |
| `cliamp` | reproductor de música |

---

## Paleta MGS

| Color | Hex | Uso |
|-------|-----|-----|
| background | `#010801` | fondo near-black |
| foreground | `#00FF41` | verde codec (base) |
| accent | `#FF6B00` | naranja alerta |
| danger | `#FF2200` | rojo peligro |
| caution | `#FFAA00` | ámbar radar |
| sweep | `#00CCAA` | cian radar |

---

## Historial

- **2026-05-18** — setup inicial: tema, ASCII art, wallpapers, colores adaptativos, waybar MGS, escala 1.25, comando `music`
