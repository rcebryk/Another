import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("IT AD Rzeszów 2015!")

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
            MenuItem {
                text: qsTr("Open Default")
                onTriggered: stack.push(view);
            }
            MenuItem {
                text: qsTr("Back")
                onTriggered: stack.pop();
            }
        }
    }

    statusBar: StatusBar {
        Label {
            text: "Stack depth: "+stack.depth
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: view


        Component {
            id: view
            Column {
                id: kolumna
                property int numerKoloru: 0
                property var kolory: ["yellow", "red", "blue", "purple"]

                Rectangle {
                    id: kolorowyKwadrat
                    color: kolumna.kolory[kolumna.numerKoloru]
                    height: 50
                    width: parent.width
                }

                Button {
                    text: "Zmien kolor"
                    onClicked: kolumna.numerKoloru = (kolumna.numerKoloru + 1) % kolumna.kolory.length;
                    width: parent.width
                }
                Component.onCompleted: kolumna.kolory.push("orange");
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

