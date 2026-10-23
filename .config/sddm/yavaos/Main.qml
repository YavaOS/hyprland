import QtQuick 2.0

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#1e1e2e"

    property string currentUser: userModel.lastUser
    property int sessionIndex: sessionModel.lastIndex
    property bool busy: false

    function login() {
        if (busy || password.text.length === 0)
            return
        busy = true
        message.text = "Signing in…"
        sddm.login(currentUser, password.text, sessionIndex)
    }

    Connections {
        target: sddm
        onLoginFailed: {
            root.busy = false
            message.text = "Incorrect password. Try again."
            password.text = ""
            password.forceActiveFocus()
        }
        onLoginSucceeded: message.text = "Welcome back"
    }

    Image {
        id: wallpaper
        anchors.fill: parent
        source: "background.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors.fill: parent
        color: "#180e182a"
    }

    Rectangle {
        id: card
        width: Math.min(440, root.width - 40)
        height: 350
        anchors.centerIn: parent
        radius: 24
        color: "transparent"
        clip: true

        // This image uses the same crop and position as the wallpaper.
        // Clipping it to the card gives a consistent frosted backdrop in Qt 5 and 6.
        Image {
            x: -card.x
            y: -card.y
            width: root.width
            height: root.height
            source: "background-blur.jpg"
            fillMode: Image.PreserveAspectCrop
        }

        Rectangle {
            anchors.fill: parent
            color: "#b91e1e2e"
        }

        Column {
            anchors.fill: parent
            anchors.margins: 36
            spacing: 12

            Text {
                text: "Welcome back"
                color: "#f5e0dc"
                font.family: "VictorMono Nerd Font"
                font.pixelSize: 26
                font.bold: true
            }

            Text {
                text: root.currentUser
                color: "#cdd6f4"
                font.family: "VictorMono Nerd Font"
                font.pixelSize: 15
            }

            Item { width: 1; height: 22 }

            Text {
                text: "PASSWORD"
                color: "#bac2de"
                font.family: "VictorMono Nerd Font"
                font.pixelSize: 11
                font.bold: true
            }

            Rectangle {
                width: parent.width
                height: 48
                radius: 10
                color: "#9c11111b"
                border.color: password.activeFocus ? "#89b4fa" : "#66cdd6f4"
                border.width: 1

                TextInput {
                    id: password
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    verticalAlignment: TextInput.AlignVCenter
                    echoMode: TextInput.Password
                    passwordCharacter: "●"
                    color: "#f5e0dc"
                    font.family: "VictorMono Nerd Font"
                    font.pixelSize: 16
                    enabled: !root.busy
                    Keys.onReturnPressed: root.login()
                    Keys.onEnterPressed: root.login()
                }
            }

            Text {
                id: message
                height: 20
                text: ""
                color: "#f38ba8"
                font.family: "VictorMono Nerd Font"
                font.pixelSize: 12
            }

            Rectangle {
                width: parent.width
                height: 44
                radius: 10
                color: "#89b4fa"
                opacity: root.busy ? 0.6 : 1

                Text {
                    anchors.centerIn: parent
                    text: "Sign in"
                    color: "#1e1e2e"
                    font.family: "VictorMono Nerd Font"
                    font.pixelSize: 14
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.login()
                }
            }
        }

        Rectangle {
            anchors.fill: parent
            radius: card.radius
            color: "transparent"
            border.color: "#70ffffff"
            border.width: 1
        }
    }

    Component.onCompleted: password.forceActiveFocus()
}
