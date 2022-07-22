import QtQuick 2.15
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3

//import ImgClass 1.0



ApplicationWindow {


//    ImageClass{
//        id: myImageClass
//    }

    Connections{
        target: myImageClass
       // onIsConnectedChanged:\
        onUpdateView: {
            sb_resizeX.value = myImageClass.getImgX();
            sb_resizeY.value = myImageClass.getImgY();

        }

    }

//    Connections{
//        target: imageProvider
//       // onNewFrameReceived: image.reload();
//    }



    width: 1024
    height: 850
    minimumWidth: 1024
    minimumHeight: 850
    visible: true
    title: qsTr("ImageChanger")


    function urlToPath(urlString) { //funkcja dostosowujaca sciezke do pliku
        var s
        if (urlString.startsWith("file:///")) {
            var k = urlString.charAt(9) === ':' ? 8 : 7
            s = urlString.substring(k)
        } else {
            s = urlString
        }
        return decodeURIComponent(s);
    }



    menuBar: MenuBar{
            Menu{
                title: "File"
                MenuItem{
                    text: "Open"
                    onTriggered: openFileDialog.open()
                }
                MenuItem{
                    id: saveNormal
                    enabled: false
                    text: "Save"
                    onTriggered: {
                        if(myImageClass.saveImg()==true)
                        {
                            hintLabel.text = "Image saved correctly";
                        }
                        else{
                            hintLabel.text = "Failed save image";
                        }
                    }
                }

                MenuItem{
                    id: saveAs
                    text: "Save as.."
                    enabled: false
                    onTriggered: saveFileDialog.open()
                }
                MenuItem{
                    text: "Quit"
                    onTriggered: Qt.quit()
                }

            }
            Menu{
                title: "About"
                MenuItem{
                    text: "Help"
                    onTriggered: helpAppDialog.open()
                }
                MenuItem{
                    text: "Info"
                    onTriggered: {
                        aboutAppDialog.open()
                    }
                }

            }



    //        Menu{
    //            title: "About"
    //            onClicked: aboutAppDialog.open()
    //        }
        }

    Dialog{  //ABOUT APP - DIALOG
        id: aboutAppDialog
        title: "About application"

        width: 500
        height: 500
        anchors.centerIn: parent;

        Rectangle{
            id: rectangleAppDialog

            anchors.top: aboutAppDialog.top

            //anchors.fill: parent

            width: parent.width
            height: parent.height - 80
         //   border.width: 1
         //   border.color: "yellow"
         Rectangle{
             id: headerDialog
             color: "gray"

             width: aboutAppDialog.width - 2
             height: 40 - 2
             anchors.top: aboutAppDialog.top
             anchors.left: aboutAppDialog.left
             anchors.leftMargin: 0
             x: -11; y: -49;

         }

         ScrollView{
             id: scrollViewTxt
             anchors.fill: parent
             width: 400
            height: 600

             ScrollBar.vertical.policy: ScrollBar.AlwaysOn
             ScrollBar.horizontal.policy: ScrollBar.AlwaysOff


             clip: true
             Text{
                 anchors.fill: scrollViewTxt
                 anchors.top: scrollViewTxt.top
                 anchors.left: scrollViewTxt.left
                 padding: 20
                 leftPadding: 5


                    width: scrollViewTxt.width
                    height:  scrollViewTxt.height
                    horizontalAlignment: Text.AlignJustify
                   // verticalAlignment: Text.AlignJustify
                    text: "Something about app. 2022 \n

                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non imperdiet lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pharetra mollis lacus, nec finibus nunc facilisis pellentesque. Duis iaculis eros eu imperdiet semper. Aenean nisi mi, sollicitudin vulputate tristique at, lobortis nec velit. Vivamus et mi felis. Integer ut diam dapibus, eleifend turpis quis, lacinia ex. In nec eros lectus.
                    Nullam laoreet blandit libero in egestas. Proin fermentum velit a dolor efficitur viverra. Nam quis est turpis. Quisque ac eleifend lorem. Vestibulum et augue enim. Fusce consectetur risus eros, eu imperdiet nibh vulputate congue. Aliquam iaculis justo in commodo tincidunt. Nulla facilisi. Cras id eros mollis, scelerisque leo eget, euismod leo. Nunc euismod pharetra lobortis. In blandit feugiat justo ut bibendum. Duis at porta neque, vitae sodales turpis. Fusce sagittis mollis felis, ut vestibulum risus suscipit vitae. Duis eu maximus ipsum. Ut vel metus sed nibh pellentesque condimentum vitae in eros.

                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non imperdiet lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pharetra mollis lacus, nec finibus nunc facilisis pellentesque. Duis iaculis eros eu imperdiet semper. Aenean nisi mi, sollicitudin vulputate tristique at, lobortis nec velit. Vivamus et mi felis. Integer ut diam dapibus, eleifend turpis quis, lacinia ex. In nec eros lectus.
                    Nullam laoreet blandit libero in egestas. Proin fermentum velit a dolor efficitur viverra. Nam quis est turpis. Quisque ac eleifend lorem. Vestibulum et augue enim. Fusce consectetur risus eros, eu imperdiet nibh vulputate congue. Aliquam iaculis justo in commodo tincidunt. Nulla facilisi. Cras id eros mollis, scelerisque leo eget, euismod leo. Nunc euismod pharetra lobortis. In blandit feugiat justo ut bibendum. Duis at porta neque, vitae sodales turpis. Fusce sagittis mollis felis, ut vestibulum risus suscipit vitae. Duis eu maximus ipsum. Ut vel metus sed nibh pellentesque condimentum vitae in eros.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non imperdiet lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pharetra mollis lacus, nec finibus nunc facilisis pellentesque. Duis iaculis eros eu imperdiet semper. Aenean nisi mi, sollicitudin vulputate tristique at, lobortis nec velit. Vivamus et mi felis. Integer ut diam dapibus, eleifend turpis quis, lacinia ex. In nec eros lectus.
                    Nullam laoreet blandit libero in egestas. Proin fermentum velit a dolor efficitur viverra. Nam quis est turpis. Quisque ac eleifend lorem. Vestibulum et augue enim. Fusce consectetur risus eros, eu imperdiet nibh vulputate congue. Aliquam iaculis justo in commodo tincidunt. Nulla facilisi. Cras id eros mollis, scelerisque leo eget, euismod leo. Nunc euismod pharetra lobortis. In blandit feugiat justo ut bibendum. Duis at porta neque, vitae sodales turpis. Fusce sagittis mollis felis, ut vestibulum risus suscipit vitae. Duis eu maximus ipsum. Ut vel metus sed nibh pellentesque condimentum vitae in eros.

                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non imperdiet lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pharetra mollis lacus, nec finibus nunc facilisis pellentesque. Duis iaculis eros eu imperdiet semper. Aenean nisi mi, sollicitudin vulputate tristique at, lobortis nec velit. Vivamus et mi felis. Integer ut diam dapibus, eleifend turpis quis, lacinia ex. In nec eros lectus.
                    Nullam laoreet blandit libero in egestas. Proin fermentum velit a dolor efficitur viverra. Nam quis est turpis. Quisque ac eleifend lorem. Vestibulum et augue enim. Fusce consectetur risus eros, eu imperdiet nibh vulputate congue. Aliquam iaculis justo in commodo tincidunt. Nulla facilisi. Cras id eros mollis, scelerisque leo eget, euismod leo. Nunc euismod pharetra lobortis. In blandit feugiat justo ut bibendum. Duis at porta neque, vitae sodales turpis. Fusce sagittis mollis felis, ut vestibulum risus suscipit vitae. Duis eu maximus ipsum. Ut vel metus sed nibh pellentesque condimentum vitae in eros.
                    "

                    wrapMode: Text.WordWrap
             }
        }

        }
        Button{
            text: "OK"
            width: 50
            height: 20
           // anchors.right: aboutAppDialog.right
           // anchors.top: rectangleAppDialog.Bottom
            x: 425
            y: 420
            anchors.margins: 5
            onClicked:
                aboutAppDialog.close()
        }

    }

    Dialog{  //HELP - DIALOG (test text as HTML)
        id: helpAppDialog
        title: "Help"

        width: 700
        height: 700
        anchors.centerIn: parent;

        Rectangle{
            id: h_rectangleAppDialog

            anchors.top: helpAppDialog.top

            //anchors.fill: parent

            width: parent.width
            height: parent.height - 80
         //   border.width: 1
         //   border.color: "yellow"
         Rectangle{
             id: h_headerDialog
             color: "gray"

             width: helpAppDialog.width - 2
             height: 40 - 2
             anchors.top: helpAppDialog.top
             anchors.left: helpAppDialog.left
             anchors.leftMargin: 0
             x: -11; y: -49;

         }

         ScrollView{
             id: h_scrollViewTxt
             anchors.fill: parent
             width: 600
            height: 650

             ScrollBar.vertical.policy: ScrollBar.AlwaysOn
             ScrollBar.horizontal.policy: ScrollBar.AlwaysOff


             clip: true
             Text{
                 anchors.fill: h_scrollViewTxt
                 anchors.top: h_scrollViewTxt.top
                 anchors.left: h_scrollViewTxt.left
                 padding: 20
                 leftPadding: 5


                    width: h_scrollViewTxt.width
                    height:  h_scrollViewTxt.height
                    horizontalAlignment: Text.AlignJustify
                    textFormat: Text.RichText
                   // verticalAlignment: Text.AlignJustify
                    text: "<h1>Help</h1>
                    Jakiś pomocy do aplikacji. <p color='red'>Testowy czerwony napis</p>
                    <h3>Spis treści</h3>
                    <ol type='1'>
                        <li><a id='wprowadzenie'>Wprowadzenie</a></li>
                        <li>Warunki użytkowania</li>
                        <li>Główny interfejs</li>
                        <li>Przegląd narzędzi</li>
                        <ol>
                            <li>Resize</li>
                            <li>Rotate</li>
                            <li>Mirror</li>
                            <li>RGB</li>
                        </ol>
                        <li>Wnioski</li>
                    <br />
                    <h3 id='wprowadzenie'>Wprowadzenie</h3>
                    <p align='justify'> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non imperdiet lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pharetra mollis lacus, nec finibus nunc facilisis pellentesque. Duis iaculis eros eu imperdiet semper. Aenean nisi mi, sollicitudin vulputate tristique at, lobortis nec velit. Vivamus et mi felis. Integer ut diam dapibus, eleifend turpis quis, lacinia ex. In nec eros lectus.
                    Nullam laoreet blandit libero in egestas. Proin fermentum velit a dolor efficitur viverra. Nam quis est turpis. Quisque ac eleifend lorem. Vestibulum et augue enim. Fusce consectetur risus eros, eu imperdiet nibh vulputate congue. Aliquam iaculis justo in commodo tincidunt. Nulla facilisi. Cras id eros mollis, scelerisque leo eget, euismod leo. Nunc euismod pharetra lobortis. In blandit feugiat justo ut bibendum. Duis at porta neque, vitae sodales turpis. Fusce sagittis mollis felis, ut vestibulum risus suscipit vitae. Duis eu maximus ipsum. Ut vel metus sed nibh pellentesque condimentum vitae in eros.</p>
                    <hr/>
                    <h3>Warunki użytkowania</h3>
                    <p align='justify'> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non imperdiet lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pharetra mollis lacus, nec finibus nunc facilisis pellentesque. Duis iaculis eros eu imperdiet semper. Aenean nisi mi, sollicitudin vulputate tristique at, lobortis nec velit. Vivamus et mi felis. Integer ut diam dapibus, eleifend turpis quis, lacinia ex. In nec eros lectus.
                    Nullam laoreet blandit libero in egestas. Proin fermentum velit a dolor efficitur viverra. Nam quis est turpis. Quisque ac eleifend lorem. Vestibulum et augue enim. Fusce consectetur risus eros, eu imperdiet nibh vulputate congue. Aliquam iaculis justo in commodo tincidunt. Nulla facilisi. Cras id eros mollis, scelerisque leo eget, euismod leo. Nunc euismod pharetra lobortis. In blandit feugiat justo ut bibendum. Duis at porta neque, vitae sodales turpis. Fusce sagittis mollis felis, ut vestibulum risus suscipit vitae. Duis eu maximus ipsum. Ut vel metus sed nibh pellentesque condimentum vitae in eros.</p>
                    <hr/>
                    "

                    wrapMode: Text.WordWrap
             }
        }

        }
        Button{
            text: "OK"
            width: 50
            height: 20
           // anchors.right: aboutAppDialog.right
           // anchors.top: rectangleAppDialog.Bottom
            x: 625
            y: 620
            anchors.margins: 5
            onClicked:
                helpAppDialog.close()
        }

    }

    FileDialog{ //OPEN FILE
        id: openFileDialog
        title: "Select image.."
        nameFilters: ["Image files (*.png *.jpg *.JPG *.PNG *.jpeg *.JPEG)"]


        onAccepted:{
            image.source = "image://imageProvider/mainImage.png" //openFileDialog.fileUrl

          //  image.source(fileUrl)
            if(myImageClass.loadImage(urlToPath(fileUrl)) != true)
            {
                hintLabel.text = "Image load error.";
            }
            else{
                hintLabel.text = "Image loaded correctly.";
                saveNormal.enabled = true;
                saveAs.enabled = true;
                leftTools.enabled = true;
                bottomTools.enabled = true;
                rightTools.enabled = true;
                sb_resizeX.value = myImageClass.getImgX();
                sb_resizeY.value = myImageClass.getImgY();
                image.reload();
                //image.source = "image://"+ urlToPath(fileUrl)
            }


            //cos tam
        }

        onRejected: {
            hintLabel.text = "Please select image once again";
        }
    }

    FileDialog{  //SAVE AS.. FILE
        id: saveFileDialog
        title: "Save as image.."
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)

        selectExisting: false
        //<malpa>disable-check M16
      //  fileMode: Platform.FileDialog.SaveFile
        nameFilters: ["Image files (*.png *.jpg *.JPG *.PNG *.jpeg *.JPEG)"]
       // selectFolder: true
//        fileMode: FileDialog.SaveFile
        onAccepted:{
            myImageClass.saveAsImg(urlToPath(fileUrl))
            hintLabel.text = "Image saved in path: "+ urlToPath(fileUrl);
        }

        onRejected: {
            hintLabel.text = "Save image failed.";
        }
    }

GridLayout{ //MAIN GRID
    id: megaMasterGrid
    columns: 3
    anchors.centerIn: parent
    anchors.fill: parent

    Column{ // LEFT TOOLBOX
        id: leftTools
        spacing: 5
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 15
        enabled: false
        Text{
            text: "Tools\n"
        }
//        Grid{
//            columns: 3
//            anchors.left: parent.left

            Column{ // RESIZE TOOL


                Text{
                    text: "Image size: \n"
                }
                width: 50
                Text{
                    text: "width: [px]\n"
                }
                SpinBox{
                    id: sb_resizeX
                    height: 20
                    width: 150
                    to: 100000
                    editable: true

                }
            }
            Column{ // RESIZE TOOL
                width: 50
                Text{
                    text: "height: [px]\n"
                }
                SpinBox{
                    id: sb_resizeY
                    height: 20
                    width: 150
                    to: 100000
                    editable: true


                }
            }
            Column{ // RESIZE TOOL
                id: btn_resize
                width: 50
                Button{
                    text: "Resize";
                    height: 20
                    width: 150
                    //anchors.left: parent
                    onClicked: {
                        if(myImageClass.resizeImg(sb_resizeX.value, sb_resizeY.value) == true)
                        {
                             hintLabel.text = "Image size changed (w: "+myImageClass.getImgX()+"px, h: "+myImageClass.getImgY()+"px)";
                        }
                        else{
                             hintLabel.text = "Failed image size changed";
                        }

                        //imageProvider.updateImg(myImageClass.returnImg())
                        image.source = "image://imageProvider/mainImage.png"
                        image.reload();
                      //  sb_resizeX.valueFromText = myImageClass.getImgX()
                      //  sb_resizeY.value = myImageClass.getImgY()
                    }
                    //enabled: false

                }
            }
        }





    }

    Column{ //IMAGE VIEW
        id: megaMasterColumn
        spacing: 5
        anchors.top: parent.top
        anchors.centerIn: parent
        Rectangle {
            width: image.width
            height: image.height
            border.color: "gray"
            border.width: 1
            color: "transparent"


            Image{
                id: image
                anchors.top: parent.top
                anchors.fill: parent
                anchors.margins: 5
                anchors.centerIn: parent
                width: 600; height: 700

                fillMode: Image.Pad //Image.PreserveAspectFit
                cache: false

                source: "" //openFileDialog.fileUrl //"image://imageProvider/mainImage.png"

                function reload() {
                                var oldSource = image.source;
                                image.source = "";
                                image.source = oldSource;
                                console.log("reload")
                 }
                //source: no i tutaj dodac z open dialogu
            }
        }
        Column{ //BOTTOM TOOLS
            GridLayout{
                id: bottomTools
                enabled: false
                anchors.centerIn: image.horizontalCenter
                columns: 2
                width: image.width
                Row{
                    anchors{
                                    horizontalCenter: parent.horizontalCenter
                                    verticalCenter: parent.verticalCenter
                                }
                    spacing: 2

                    Button{ //L_ROTATE
                        id: leftRotate
                        text: "Rotate right (90)"
                        ///icon.name: "rightRotate"
                        icon.source: "left.png"
                        padding: 0
                        icon.height: 50
                        icon.width: 50

                        icon.color: "transparent"

                        width: 45
                        height: 45

                        onClicked:{
                            if(myImageClass.rotate(-90)== true)
                            {
                                hintLabel.text = "Image rotated: left 90";
                            }
                            //image.source = "image://imageProvider/mainImage.png"
                            image.reload();
                        }


                    }

                    Button{ //R_ROTATE
                        id: rightRotate
                        text: "Rotate right (90)"
                        ///icon.name: "rightRotate"
                        icon.source: "right.png"
                        padding: 0
                        icon.height: 50
                        icon.width: 50

                        icon.color: "transparent"

                        width: 45
                        height: 45
                        //display: Button.TextUnderIcon
                        onClicked:{
                            if(myImageClass.rotate(90)== true)
                            {
                                hintLabel.text = "Image rotated: right 90";
                            }

                            //image.source = "image://imageProvider/mainImage.png"
                            image.reload();
                        }
                    }

                    Button{ //FLIP_LR
                        id: mirrorLeftRight
                        text: "MirrorLeftRight"
                        ///icon.name: "rightRotate"
                        icon.source: "mirrorLeftRight.png"
                        padding: 0
                        icon.height: 50
                        icon.width: 50

                        icon.color: "transparent"

                        width: 45
                        height: 45

                        onClicked:{
                            if(myImageClass.flipLeftRight()== true)
                            {
                                hintLabel.text = "Image modified: flip left/right";
                            }
                            //image.source = "image://imageProvider/mainImage.png"
                            image.reload();
                        }


                    }

                    Button{ //FLIP_UD
                        id: mirrorUpDown
                        text: "MirrorUpDown"
                        ///icon.name: "rightRotate"
                        icon.source: "mirrorUpDown.png"
                        padding: 0
                        icon.height: 50
                        icon.width: 50

                        icon.color: "transparent"

                        width: 45
                        height: 45
                        //display: Button.TextUnderIcon
                        onClicked:{
                            if(myImageClass.flipUpDown()== true)
                            {
                                hintLabel.text = "Image modified: flip up/down";
                            }

                            //image.source = "image://imageProvider/mainImage.png"
                            image.reload();
                        }
                    }

                }
            }
        }
    }

    Column{ //RIGHT TOOLS
        id: rightTools
        spacing: 5
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 15
        enabled: false
        Text{
            text: "Inactive (yet..)"
        }

        Row{ //SLIDER Red
            Text{
                id: text_R
                color: "red"
                text: "R:"

                font.pixelSize: 15

                anchors.right: slider_R.anchors.left
                anchors.verticalCenter: slider_R.verticalCenter
            }

            Slider{ //SLIDER Red
                id: slider_R
                from: 0
                to: 255
                value: 100
                width: 120
                stepSize : 1.0

                onValueChanged: {

                    myImageClass.rgbRModify(slider_R.value);
                    image.reload();
                }
            }

            Rectangle{
                width: 30
                height: 20

                anchors.left: slider_R.anchors.right
                anchors.verticalCenter: slider_R.verticalCenter
                border.color: "#fff7f1"
                border.width: 1

                TextInput{
                    id: input_R
                    text: slider_R.value
                    anchors.centerIn: parent

                    font.pixelSize: 12
                }
            }
        }

        Row{ // SLIDER Green
            Text{
                id: text_G
                color: "green"
                text: "G:"

                font.pixelSize: 15

                anchors.right: slider_G.anchors.left
                anchors.verticalCenter: slider_G.verticalCenter
            }

            Slider{
                id: slider_G
                from: 0
                to: 255
                value: 100
                width: 120
                stepSize : 1.0

                onValueChanged: {
                    myImageClass.rgbGModify(slider_G.value);
                    image.reload();
                }
            }
            Rectangle{
                width: 30
                height: 20

                anchors.left: slider_G.anchors.right
                anchors.verticalCenter: slider_G.verticalCenter
                border.color: "#fff7f1" //92e1ff
                border.width: 1

                TextInput{
                    id: input_G
                    text: slider_G.value
                    anchors.centerIn: parent

                    font.pixelSize: 12
                }
            }
        }

        Row{ // SLIDER Blue
            Text{
                id: text_B
                color: "Blue"
                text: "B:"

                font.pixelSize: 15

                anchors.right: slider_B.anchors.left
                anchors.verticalCenter: slider_B.verticalCenter
            }

            Slider{
                id: slider_B
                from: 0
                to: 255
                value: 100
                width: 120
                stepSize : 1.0

                onValueChanged: {
                    myImageClass.rgbBModify(slider_B.value);
                    image.reload();
                }
            }
            Rectangle{
                width: 30
                height: 20

                anchors.left: slider_B.anchors.right
                anchors.verticalCenter: slider_B.verticalCenter
                border.color: "#fff7f1" //92e1ff
                border.width: 1

                TextInput{
                    id: input_B
                    text: slider_B.value
                    anchors.centerIn: parent

                    font.pixelSize: 12
                }
            }
        }

        Button{
            text: "Change color"
            width: 160

        }

        Path {
            startX: 200; startY: 200
            PathLine { x: 200; y: 100 }
        }





    }
//}
    footer: Rectangle{ //FOOTER - BOTTOM APP
        height: 25
        color: "#EEE3E0"

        Text{
            anchors.margins: 5
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            text: qsTr("Made in Poland 2022 | JK")
        }

        Text {
            id: hintLabel
            anchors.margins: 5
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            text: qsTr("<Do something>")
        }


    }




    /*    Menu{ //Tool
            title: "Tools"
            GridLayout{
                columns: 3
              //  columnSpacing:
                Column{ // 1
                    Row{ // 1.1
                        ToolButton{
                            text: "tool1"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }

                    Row{ // 1.2
                        ToolButton{
                            text: "tool2"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }

                    Row{ //1.3
                        ToolButton{
                            text: "tool3"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }
                }

                Column{ // 2
                    Row{ // 2.1
                        ToolButton{
                            text: "tool4"
                            width: 50
                            height: 50
flat: false
//                                background: Rectangle {
//                                    anchors.fill: parent
//                                    color: ToolButton.hovered ? "yellow" : "black"
//                                }

                            onHoveredChanged:
                            {

                            }

                            //height: parent.height
                        }
                    }

                    Row{ // 2.2
                        ToolButton{
                            text: "tool5"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }

                    Row{ //2.3
                        ToolButton{
                            text: "tool6"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }
                }

                Column{ // 3
                    Row{ // 3.1
                        ToolButton{
                            text: "tool7"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }

                    Row{ // 3.2
                        ToolButton{
                            text: "tool8"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }

                    Row{ //3.3
                        ToolButton{
                            text: "tool9"
                            width: 50
                            height: 50
                            //height: parent.height
                        }
                    }
                }


            }


        }*/

}
