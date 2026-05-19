#!/bin/bash
# MGS Dotfiles - install script
# Replica el tema Metal Gear Solid en una nueva máquina Omarchy
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$HOME/.config/omarchy/themes/metal-gear-solid"
BRANDING_DIR="$HOME/.config/omarchy/branding"

echo "=== MGS Dotfiles Installer ==="
echo ""

# Verificar que Omarchy está instalado
if ! command -v omarchy &>/dev/null; then
  echo "ERROR: Omarchy no encontrado. Instálalo primero."
  exit 1
fi

echo "[1/9] Activando bluetooth..."
if ! systemctl is-enabled bluetooth.service &>/dev/null; then
  sudo pacman -S --noconfirm bluez bluez-utils
  sudo systemctl enable --now bluetooth.service
else
  sudo systemctl start bluetooth.service
fi
sudo sed -i 's/AutoEnable=false/AutoEnable=true/' /etc/bluetooth/main.conf

echo "[2/9] Instalando dependencias..."
sudo pacman -S --noconfirm --needed \
  python-pywal \
  inotify-tools \
  fzf \
  chafa \
  cliamp

echo "[3/9] Copiando tema Metal Gear Solid..."
mkdir -p "$THEME_DIR/backgrounds"
cp -r "$SCRIPT_DIR/themes/metal-gear-solid/." "$THEME_DIR/"

echo "[4/9] Copiando branding (fastfetch ASCII art)..."
mkdir -p "$BRANDING_DIR"
cp "$SCRIPT_DIR/configs/branding/about.txt" "$BRANDING_DIR/about.txt"

echo "[5/9] Generando wallpapers..."
magick -size 1920x1080 \
  radial-gradient:"#062A06-#010801" \
  -modulate 100,70,100 \
  "$THEME_DIR/backgrounds/codec.jpg"

magick -size 1920x1080 xc:"#010801" \
  -font "DejaVu-Sans-Bold" \
  -pointsize 900 \
  -fill "#041A04" \
  -gravity Center \
  -annotate +0-60 "!" \
  -pointsize 60 \
  -fill "#062A06" \
  -annotate +0+380 "METAL  GEAR  SOLID" \
  "$THEME_DIR/backgrounds/alert.jpg"

echo "[6/9] Copiando configs de waybar e hyprland..."
cp "$SCRIPT_DIR/configs/waybar/style.css"      "$HOME/.config/waybar/style.css"
cp "$SCRIPT_DIR/configs/waybar/config.jsonc"   "$HOME/.config/waybar/config.jsonc"
cp "$SCRIPT_DIR/configs/hypr/monitors.lua"     "$HOME/.config/hypr/monitors.lua"
cp "$SCRIPT_DIR/configs/hypr/looknfeel.lua"    "$HOME/.config/hypr/looknfeel.lua"
cp "$SCRIPT_DIR/configs/hypr/hyprlock.conf"    "$HOME/.config/hypr/hyprlock.conf"
cp "$SCRIPT_DIR/configs/hypr/input.lua"        "$HOME/.config/hypr/input.lua"
cp "$SCRIPT_DIR/configs/hypr/bindings.lua"     "$HOME/.config/hypr/bindings.lua"

echo "[7/9] Instalando scripts MGS..."
mkdir -p "$HOME/.local/bin"
cp "$SCRIPT_DIR/bin/mgs-wal"       "$HOME/.local/bin/mgs-wal"
cp "$SCRIPT_DIR/bin/mgs-wal-watch" "$HOME/.local/bin/mgs-wal-watch"
cp "$SCRIPT_DIR/bin/music"         "$HOME/.local/bin/music"
chmod +x "$HOME/.local/bin/mgs-wal" \
         "$HOME/.local/bin/mgs-wal-watch" \
         "$HOME/.local/bin/music"

echo "[8/9] Instalando servicio systemd de colores adaptativos..."
mkdir -p "$HOME/.config/systemd/user"
cp "$SCRIPT_DIR/configs/systemd/mgs-wal.service" \
   "$HOME/.config/systemd/user/mgs-wal.service"
systemctl --user daemon-reload
systemctl --user enable --now mgs-wal.service

echo "[9/9] Aplicando tema y reiniciando..."
omarchy theme set "Metal Gear Solid"
mgs-wal
omarchy restart waybar
hyprctl reload

echo ""
echo "=== Listo. Tactical Espionage Action activado. ==="
