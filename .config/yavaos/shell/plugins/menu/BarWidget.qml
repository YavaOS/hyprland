import QtQuick
import qs.Ui

BarWidget {
  id: root
  moduleName: "yavaos.menu"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf40e"
    fontFamily: "VictorMono Nerd Font"
    onPressed: function(button) {
      if (!root.bar) return
      if (button === Qt.RightButton) root.bar.run("xdg-terminal-exec")
      else root.bar.run("yavaos-shell shell toggle yavaos.menu '{\"menu\":\"root\"}'")
    }
  }
}
