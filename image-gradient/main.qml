import QtQuick 2.5
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
//import QtQuick.Window 2.2

Rectangle{
    width:1024
    height:768
    color:"black"


        Rectangle {
            id: rect_songtitle
            x: 125
            y: 60
            //z: 20
            width: 500
            height: 50
            color: "transparent"
            clip: true
            border.width: 2
            border.color: "yellow"
            RunningText {
                id: songTitle
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                text.text: "AAC_Transformers_Soundtrack_-_Arrival_to_Earth_&_Scorponok(Piano).aac"
                text.color: "#ffffff"
                text.font.pixelSize: 36
                showShadow: true
            }

        }

        Rectangle{
            x:100
            y:200
            width:200
            height: 200
            color:"white"
            ListView{
                id:list_view
                clip: true
                anchors.fill: parent

                model:nameModel
                delegate: nameDelegate

                onMovementStarted: {
                    console.log("listview onMovementStarted");
                }

                onMovementEnded: {
                    console.log("listview onMovementEnded");
                }

                onFlickStarted: {
                    console.log("listview onFlickStarted");
                }

                onFlickEnded: {
                    console.log("listview onFlickEnded");
                }

            }

            ListModel {
                id: nameModel
                ListElement { name: "Alice"; team: "Crypto" }
                ListElement { name: "Bob"; team: "Crypto" }
                ListElement { name: "Jane"; team: "QA" }
                ListElement { name: "Victor"; team: "QA" }
                ListElement { name: "Wendy"; team: "Graphics" }
            }
            Component {
                id: nameDelegate
                Rectangle{
                    width: parent.width
                    height:50
                    Text {
                        text: name;
                        font.pixelSize: 24
                        anchors.left: parent.left
                        anchors.leftMargin: 2
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("Delegate onClicked");
                        }
                        onPressed: {
                            console.log("Delegate onPressed");
                        }
                        onReleased: {
                            console.log("Delegate onRelease");
                        }
                        onPressAndHold: {
                            console.log("Delegate onPressandHold");
                        }
                        onDoubleClicked: {
                            console.log("Delegate onDoubleclicked");
                        }
                        onWheel: {
                            console.log("Delegate onWheel");
                        }
                    }
                }
            }
        }


        Image{
            x:400
            y:400
            width: 50 ;height:50
            source:"cover1.png"
//            color:"yellow"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("Rectangle onClicked");
                }
                onPressed: {
                    console.log("Rectangle onPressed");
                }
                onReleased: {
                    console.log("Rectangle onRelease");
                }
                onPressAndHold: {
                    console.log("Rectangle onPressandHold");
                }
                onDoubleClicked: {
                    console.log("Rectangle onDoubleclicked");
                }
                onWheel: {
                    console.log("Rectangle onWheel");
                }
                onEntered: {
                    console.log("Rectangle onEntered");
                }
                onExited: {
                    console.log("Rectangle onExited");
                }
                onCanceled: {
                    console.log("Rectangle onCanceled");
                }
            }
        }



Item {
    width: 250
    height: 250
    id: item_cover
    x: 700
    y: 50
//    z: PathView.z
//    scale:0.8
    // The coverflow item consists of two images with white borders.

    // The second image is flipped and has some opacity for nice mirror effect.
//    Column  {
//        id: column
////        y: 2
//        spacing: 5
        // White borders around the image
        Rectangle {
            id: re_normalcover
            // The rectangle is a square.
            width: item_cover.width
            height: re_normalcover.width
            color: "transparent"
            // Should go on top of the reflection image when zooming.
            Image {
                id: normalcover
                width: re_normalcover.width
                height: re_normalcover.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                clip: true
                // Don't stretch the image, and use asynchronous loading.
//                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                // The image will be provided by the model
                source: "cover1.png"
                // Smoothing slows down the scrolling even more. Use it with consideration.
                smooth: true
            }
            FastBlur{
                id:fastblur1
                anchors.fill: normalcover
                source: normalcover
                radius: 5
            }

        }
        // Reflection
        Item {
            width: normalcover.width
            height: normalcover.height
            anchors.top: re_normalcover.bottom
            anchors.topMargin: 2
            Image {
                id: reflect_normalcover
                width: normalcover.width
                height: normalcover.height
                anchors.centerIn: parent
//                clip: true
                // The reflection uses the same image as the delegateImage.
                // This way there's no need to ask the image again from the provider.
                source: normalcover.source
//                    sourceSize: Qt.size(delegateImage.width,delegateImage.height)
//                opacity: 0.6
//                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                smooth: true  // Use with consideration.
                visible:false
            }

            FastBlur{
                id:fastblur
                anchors.fill: reflect_normalcover
                source:reflect_normalcover
                radius: 5
                visible:false
            }

            LinearGradient{
                id:linearmask
                anchors.fill: reflect_normalcover
                start: Qt.point(0, 0)
                end: Qt.point(0, normalcover.height)
                gradient: Gradient {
                    GradientStop { position: 1.0; color: "black" }
                    GradientStop { position: 0.85; color: "transparent" }
                }
                visible:false
            }

            OpacityMask{
                anchors.fill:fastblur
                source:fastblur
                maskSource: linearmask
            }

            transform : Scale {
                yScale: -1
                origin.y: normalcover.height / 2//gap in the middle
            }
        }

//    }
}




}



