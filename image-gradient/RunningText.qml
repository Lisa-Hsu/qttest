import QtQuick 2.5
import QtGraphicalEffects 1.0
Flickable {
    property int state0Interval: 5000
    property int state1Interval: 100
    property int state1ShiftX: 1
    property int state2Interval: 3000
    property alias text: _text
    property bool showShadow: false
    property bool isrun:false
    property int runtimes:0

//    width: 220

    height: _text.height
    contentWidth: _text.width
    contentHeight: _text.height

    clip: true
    interactive: false

    onIsrunChanged: {
        console.log("_text.contentWidth...."+_text.contentWidth);
    }

    Timer {
        property int state: 0
        interval: 50
        repeat: true
        running: isrun
        triggeredOnStart: false
        onTriggered: {
            parent.contentX = parent.contentX + state1ShiftX;
            if((parent.contentX) == Math.round(_text2.x)) {
                parent.contentX = 0;
                isrun = false;
            }
            if(parent.contentX == 0){
                isrun = false;
            }
        }
    }

    Text {
        id: _text
        color: "#ffffff"
        text: ""//qsTr("See You Again ( feat. Charlie Puth)")
        font.pixelSize: 20
        width:parent.width
        elide: if(isrun) return Text.ElideNone  ; else return Text.ElideMiddle;
    }

    Text{
        id:_text2
        color:_text.color
        text:_text.text
        font.pixelSize: _text.font.pixelSize
        x:(_text.contentWidth + parent.width*1/2)
        visible:isrun
    }

    DropShadow {
        anchors.fill: _text
        horizontalOffset: 0
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#000000"
        source: _text
        visible: showShadow
    }

    Rectangle{
        anchors.fill: parent
        color:"transparent"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                isrun = !isrun;
            }
        }
    }
}
