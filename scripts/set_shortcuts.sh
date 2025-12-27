#!/bin/bash

# 既存のショートカットを無効化（干渉防止）
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" # 標準ランチャー

# カスタムショートカットの登録関数
set_custom_shortcut() {
    local name="$1"
    local command="$2"
    local binding="$3"
    local path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$4/"

    # リストに追加
    current_list=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
    if [[ "$current_list" == "@as []" ]]; then
        new_list="['$path']"
    elif [[ "$current_list" != *"$path"* ]]; then
        new_list="${current_list%]*}, '$path']"
    else
        new_list="$current_list"
    fi
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$new_list"

    # 詳細設定
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$path name "$name"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$path command "$command"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$path binding "$binding"
}

# 1. Rofi (Cmd + Space) - Kinto環境では Super+Space または Alt+F1 が Cmd+Space に相当
# ここでは先ほどの Alt+F1 を使用
set_custom_shortcut "Rofi Launcher" "/home/yamakoud/.nix-profile/bin/rofi -show drun" "<Alt>F1" "custom0"

# 2. Terminal (Cmd + Enter)
# Kinto環境では Super+Return が Cmd+Enter に相当
set_custom_shortcut "Launch Terminal" "io.elementary.terminal" "<Super>Return" "custom1"

# 3. Screenshot Area (Cmd + Shift + 4)
# elementary OS標準の範囲選択スクリーンショットを呼び出し
set_custom_shortcut "Mac Screenshot" "io.elementary.screenshot --area" "<Super><Shift>4" "custom2"

echo "Custom shortcuts have been configured."
