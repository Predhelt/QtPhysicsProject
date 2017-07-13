import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Page1 {
        id: mainPage
        anchors.centerIn: parent
    }

    MouseArea {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        acceptedButtons: Qt.RightButton// | Qt.LeftButton
        onClicked: {
            //if(mouse.button === Qt.RightButton)
            rCMenu.x = mouseX
            rCMenu.y = mouseY
            rCMenu.visible = true
        }
    }
    RCMenu {
        id: rCMenu
        visible: false
    }

}
