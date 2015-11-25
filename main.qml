import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("Stack Option")
            MenuItem {
                text: qsTr("Open Blue")
                onTriggered: stack.push(anotherBlue);
            }
            MenuItem {
                text: qsTr("Open Red")
                onTriggered: stack.push(anotherRed);
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: view


        Component {
            id: view
            Column {
                Rectangle {
                    id: kolorowyKwadrat
                    color: "yellow"
                    height: 50
                    width: parent.width
                }
            }
        }
    }

    Component {
        id: anotherBlue
        Rectangle {
            color: "blue"
        }
    }

    Component {
        id: anotherRed
        Rectangle {
            color: "red"
        }
    }
}

