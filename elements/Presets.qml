import QtQuick 2.7
import QtQuick.Controls 2.1

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property int    value:     tumb.currentIndex
    property string text:  "TEXT"
    property string nameValue:  ""
    anchors.fill:  parent

    Column
    {
        anchors.fill:  parent
        Item
        {
            width:  parent.width
            height: parent.height/100*80
            Tumbler
            {
                id: tumb
                model: 10
                anchors.horizontalCenter: parent.horizontalCenter
                visibleItemCount: 1
                height: parent.height
                width: parent.width
                anchors.centerIn: parent.Center
                delegate: Text
                {
                    text: modelData
                    opacity: 0.1 + Math.max(0, 1 - Math.abs(Tumbler.displacement)) * 0.6
                    color: "Red"
                    font.pixelSize: parent.height*0.9
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment:   Text.AlignVCenter
                    font.bold: true
                    font.family: "Arial Black"
                }

                MouseArea
                {
                    anchors.fill: parent
                    onWheel:
                    {
                        tumb.currentIndex += (wheel.angleDelta.y/120);
                    }
                }
            }
        }

        Item
        {
            width:  parent.width
            height: parent.height/100*20
            Text
            {
                anchors.fill:  parent
                color:  devColor
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: parent.height/1.1
                text: main.text
            }
        }
    }

    function up()
    {
        tumb.currentIndex++;
    }

    function down()
    {
        tumb.currentIndex--;
    }

    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((main.nameValue.length>0)&&(nameParam.indexOf(main.nameValue)>=0))
                tumb.currentIndex=value;
        }
    }
}
