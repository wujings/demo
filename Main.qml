import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "QML Command Runner"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        TextField {
            id: commandInput
            placeholderText: "Enter a command..."
            Layout.fillWidth: true
        }

        Button {
            text: "Run Command"
            onClicked: {
                commandRunner.runCommand(commandInput.text)  // 使用 TextField 的文本作为命令
            }
        }

        TextArea {
            id: outputArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            readOnly: true
            wrapMode: TextArea.Wrap
        }
    }

    Connections {
        target: commandRunner
        onOutputReceived: {
            outputArea.append("Output: " + output + '\n')
        }
        onErrorOccurred: {
            outputArea.append("Error: " + error + '\n')
        }
    }
}
