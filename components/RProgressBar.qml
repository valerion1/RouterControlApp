import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "../components"

ProgressBar{
    id: pRoot;
    property color innerColor: "transparent";
    property color outerColor: "gray";
    property color activeColor: "white";

    style: ProgressBarStyle{

       panel : Rectangle{
          color: "transparent";
          implicitWidth: 15 * settings.pixelDensity;
          implicitHeight: implicitWidth;

          Rectangle{
             id: outerRing;
             z: 0;
             anchors.fill: parent;
             radius: Math.max(width, height) / 2;
             color: pRoot.innerColor;
             border.color: pRoot.outerColor;
          }

          Rectangle{
             id: innerRing;
             z: 1;
             anchors.fill: parent;
             anchors.margins: (outerRing.border.width - border.width) / 2;
//                 radius: outerRing.radius
             radius: width * 0.5;
             color: pRoot.innerColor;
             border.color: control.value == 100 ? pRoot.activeColor : pRoot.outerColor;
             border.width: 3 * settings.pixelDensity;

             ConicalGradient
             {
                 ShaderEffectSource{
                     id: sourceouterRing;
                     sourceItem: innerRing;
                     recursive: true;
                 }
                source: sourceouterRing;
                anchors.fill: parent;
                gradient: Gradient
                {
                   GradientStop { position: 0.00; color: pRoot.activeColor }
                   GradientStop { position: (control.value / 100); color: pRoot.activeColor }
                   GradientStop { position: (control.value / 100) + 0.01; color: pRoot.innerColor }
                   GradientStop { position: 1.00; color: pRoot.innerColor }
                }
             }
          }

          Text
          {
             id: progressLabel
             anchors.centerIn: parent
             color: "white"
             text: control.value.toFixed() + "%"
          }
       }
    }
}
