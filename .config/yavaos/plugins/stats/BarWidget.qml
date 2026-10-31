import QtQuick
import Quickshell.Io
import qs.Ui
import qs.Commons
import qs.Commons as Commons

BarWidget {
  id: root
  moduleName: "stats"

  property string duration: "—"
  property string dollar: "—"
  property string gold: "—"
  property bool popupOpen: false
  // No birth time was supplied; count from midnight in the local timezone.
  readonly property date bornAt: new Date(1999, 4, 4)
  property date now: new Date()
  readonly property string ageTimer: formatAge(now)

  function formatAge(current) {
    var months = (current.getFullYear() - bornAt.getFullYear()) * 12
      + current.getMonth() - bornAt.getMonth()
    if (current.getDate() < bornAt.getDate()) months--
    months = Math.max(0, months)
    var anniversary = new Date(bornAt.getFullYear(), bornAt.getMonth() + months, bornAt.getDate())
    // Compare local calendar dates as UTC dates so DST cannot add or lose a day.
    var days = Math.max(0, Math.round((Date.UTC(current.getFullYear(), current.getMonth(), current.getDate())
      - Date.UTC(anniversary.getFullYear(), anniversary.getMonth(), anniversary.getDate())) / 86400000))
    function unit(value, name) { return value + " " + name + (value === 1 ? "" : "s") }
    return unit(Math.floor(months / 12), "year") + ", " + unit(months % 12, "month")
      + ", " + unit(days, "day") + "\n"
      + unit(current.getHours(), "hour") + ", " + unit(current.getMinutes(), "minute")
      + ", " + unit(current.getSeconds(), "second")
  }


  function close() { popupOpen = false }

  function updateHover() {
    if (button.tooltipHovered || popup.containsMouse) {
      closeTimer.stop()
      popupOpen = true
    } else {
      closeTimer.restart()
    }
  }
  property string status: "Waiting for stats"
  readonly property string statsFile: "/home/ainyava/.local/state/yavaos/irstats.json"

  function refresh() {
    if (readProc.running) return
    readProc.command = ["cat", "--", statsFile]
    readProc.running = true
  }

  function compact(value) {
    return Math.floor(Number(String(value).replace(/,/g, "")) / 10000).toLocaleString(Qt.locale("en_US"), "f", 0)
  }

  onSettingsChanged: refresh()
  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Process {
    id: readProc
    onExited: function(exitCode) {
      if (exitCode !== 0) root.status = "Cannot read " + root.statsFile
    }
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        try {
          var stats = JSON.parse(String(text || ""))
          root.duration = String(stats.duration || "—")
          root.dollar = root.compact(stats.dollar)
          root.gold = root.compact(stats.gold_18)
          root.status = "Updated " + Qt.formatTime(new Date(), "HH:mm") + " · " + root.statsFile
        } catch (error) {
          root.status = "Invalid JSON in " + root.statsFile
        }
      }
    }
  }

  Timer {
    interval: 60000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.refresh()
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.now = new Date()
  }

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "󰄨"
    active: root.popupOpen
    onTooltipHoveredChanged: root.updateHover()
    onPressed: root.refresh()
  }

  Timer {
    id: closeTimer
    interval: 200
    onTriggered: if (!button.tooltipHovered && !popup.containsMouse) root.close()
  }

  PopupCard {
    id: popup
    anchorItem: button
    bar: root.bar
    owner: root
    triggerMode: "hover"
    open: root.popupOpen
    onContainsMouseChanged: root.updateHover()
    contentWidth: popup.fittedContentWidth(Style.space(280))
    contentHeight: popup.fittedContentHeight(details.implicitHeight)

    Column {
      id: details
      width: parent.width
      spacing: Style.space(12)

      Text {
        text: "Stats"
        color: Commons.Color.foreground
        font.family: button.fontFamily
        font.pixelSize: Style.font.body
        font.bold: true
      }

      Column {
        width: parent.width
        spacing: Style.space(4)

        Text {
          text: "Your age · May 4, 1999"
          color: Commons.Color.muted
          font.family: button.fontFamily
          font.pixelSize: Style.font.caption
        }

        Text {
          width: parent.width
          wrapMode: Text.WordWrap
          text: root.ageTimer
          color: Commons.Color.foreground
          font.family: button.fontFamily
          font.pixelSize: Style.font.body
          font.bold: true
        }
      }

      Repeater {
        model: [
          { label: "🚗  Commute", value: root.duration },
          { label: "💵  Dollar", value: root.dollar },
          { label: "🪙  Gold (18K)", value: root.gold }
        ]

        delegate: Row {
          required property var modelData
          width: details.width
          spacing: Style.space(12)

          Text {
            width: parent.width - statValue.width - parent.spacing
            text: modelData.label
            textFormat: Text.PlainText
            color: Commons.Color.foreground
            font.family: button.fontFamily
            font.pixelSize: Style.font.body
          }

          Text {
            id: statValue
            text: modelData.value
            textFormat: Text.PlainText
            color: Commons.Color.foreground
            font.family: button.fontFamily
            font.pixelSize: Style.font.body
          }
        }
      }

      Text {
        width: parent.width
        text: root.status
        textFormat: Text.PlainText
        wrapMode: Text.WrapAnywhere
        color: Commons.Color.muted
        font.family: button.fontFamily
        font.pixelSize: Style.font.caption
      }
    }
  }
}
