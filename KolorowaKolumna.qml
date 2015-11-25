import QtQuick 2.5
import QtQuick.Controls 1.4

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
}
