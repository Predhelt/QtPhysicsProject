import QtQuick 2.7
import QtQuick.Controls 2.0

Menu {
    id: rCMenu

    MenuItem {
        text: qsTr("Copy")
    }
    MenuItem {
        text: qsTr("Paste")
    }
    MenuItem {
        text: qsTr("best")
        width: 60

        background: Image {
            fillMode: Image.Stretch
            source: "qrc:///customPencil.png"
        }
    }
}
