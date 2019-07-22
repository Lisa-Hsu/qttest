import QtQuick 2.5

Rectangle {
    property alias mouseArea: mouseArea

    width: 360
    height: 360

    Image{
        anchors.fill: parent
        source:"test.png"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
}
