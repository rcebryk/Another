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
        Menu {
            title: "Inner Page"
            MenuItem {
                text: "Przywróc binding";
                onTriggered: stack.recoverLocalBinding();
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
        initialItem: anotherBlue
        signal recoverLocalBinding

        Component {
            id: view
            Column {
                Component.onCompleted: stack.recoverLocalBinding.connect(kolumna.recover)
                 Component.onDestruction: stack.recoverLocalBinding.disconnect(kolumna.recover)
                KolorowaKolumna {
                    id: kolumna
                    Component.onCompleted: kolumna.kolory.push("orange");
                    width: parent.width
                    function recover() {
                        kolumna.state = "ColorMatched";
                    }
                }
                Button {
                    text: "Pierwszy kolor"
                    onClicked: kolumna.numerKoloru=0;
                    anchors.left: parent.left
                    anchors.right: parent.horizontalCenter
                }
                Button {
                    text: "Ustaw zielony"
                    onClicked: {
                        kolumna.kolorowyKwadrat.color = "green";
                        kolumna.state = "default";
                    }
                    anchors.left: parent.horizontalCenter
                    anchors.right: parent.right
                }

                Button {
                    text: "Otwórz animacje"
                    anchors.left: parent.left
                    anchors.right: parent.horizontalCenter
                    property Component animatedPage: AnimatedPage {}
                    onClicked: stack.push(animatedPage);
                }
            }
        }
    }

    Component {
        id: anotherBlue
        Rectangle {
            color: "blue"

            Label {
                anchors.centerIn: parent
                text: ""+currentDatetime
                color: "yellow"
            }
        }
    }

    Component {
        id: anotherRed
        Rectangle {
            color: "red"
        }
    }
}

