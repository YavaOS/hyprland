import QtQuick
import QtQuick.Controls

ComboBox {
    id: control
    height: 48
    textRole: "name"
    font.family: "VictorMono Nerd Font"
    font.pixelSize: 15
    activeFocusOnTab: true

    background: Rectangle {
        radius: 10
        color: "#9c11111b"
        border.color: control.activeFocus ? "#89b4fa" : "#66cdd6f4"
        border.width: 1
    }

    contentItem: Text {
        leftPadding: 15
        rightPadding: 38
        text: control.displayText
        color: "#cdd6f4"
        font: control.font
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    indicator: Text {
        x: control.width - width - 15
        anchors.verticalCenter: parent.verticalCenter
        text: "▾"
        color: "#cdd6f4"
        font.pixelSize: 16
    }

    delegate: ItemDelegate {
        width: control.width - 2
        height: 42
        highlighted: control.highlightedIndex === index
        contentItem: Text {
            text: model.name
            color: "#cdd6f4"
            font: control.font
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle {
            radius: 8
            color: highlighted ? "#334866" : "transparent"
        }
    }

    popup: Popup {
        y: control.height + 6
        width: control.width
        padding: 1
        implicitHeight: Math.min(contentItem.implicitHeight + 2, 220)
        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            ScrollIndicator.vertical: ScrollIndicator { }
        }
        background: Rectangle {
            radius: 10
            color: "#1e1e2e"
            border.color: "#66cdd6f4"
        }
    }
}
