# Overwrite parts of the yavaos-menu with user-specific submenus.
# See $YAVAOS_PATH/bin/yavaos-menu for functions that can be overwritten.
#
# WARNING: Overwritten functions will obviously not be updated when YavaOS changes.
#
# Example of minimal system menu:
#
# show_system_menu() {
#   case $(menu "System" "  Lock\n󰐥  Shutdown") in
#   *Lock*) yavaos-lock-screen ;;
#   *Shutdown*) yavaos-system-shutdown ;;
#   *) back_to show_main_menu ;;
#   esac
# }
#
# Example of overriding just the about menu action: (Using zsh instead of bash (default))
#
# show_about() {
#   exec yavaos-launch-or-focus-tui "zsh -c 'fastfetch; read -k 1'"
# }
