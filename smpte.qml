import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import QtQuick.Window 2.15

ApplicationWindow {
    /* Refs:
    * [0] https://en.wikipedia.org/wiki/SMPTE_color_bars
    * [1] Figure 17-4: X248_04_010302 EIA-189-A Color Bar Pattern, "Audio/Video Connectivity Solutions for Virtex-II Pro and Virtex-4 FPGAs", p 358
    */

    id: root

    property var gray: Qt.rgba(104 / 255, 104 / 255, 104 / 255, 1)
    property var white: Qt.rgba(235 / 255, 235 / 255, 235 / 255, 1)
    property var yellow: Qt.rgba(180 / 255, 180 / 255, 16 / 255, 1)
    property var cyan: Qt.rgba(16 / 255, 180 / 255, 180 / 255, 1)
    property var green: Qt.rgba(16 / 255, 180 / 255, 16 / 255, 1)
    property var magenta: Qt.rgba(180 / 255, 16 / 255, 180 / 255, 1)
    property var red: Qt.rgba(180 / 255, 16 / 255, 16 / 255, 1)
    property var blue: Qt.rgba(16 / 255, 16 / 255, 180 / 255, 1)
    property var black: Qt.rgba(16 / 255, 16 / 255, 16 / 255, 1)
    // approximation
    property var i_minus: Qt.rgba(0, 33 / 255, 76 / 255, 1)
    property var q_plus: Qt.rgba(50 / 255, 0, 106 / 255, 1)
    property var top_row_ratio: 0.67
    property var middle_row_ratio: 0.08
    property var bottom_row_ratio: 0.25
    property var b: width / 7

    visible: true
    visibility: Window.FullScreen

    ColumnLayout {
        spacing: 0
        Layout.fillWidth: true
        Layout.fillHeight: true
        height: parent.height
        width: parent.width

        RowLayout {
            Layout.preferredHeight: parent.height * top_row_ratio
            spacing: 0

            Rectangle {
                color: gray
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: yellow
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: cyan
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: green
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: magenta
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: red
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: blue
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

        }

        RowLayout {
            Layout.preferredHeight: parent.height * middle_row_ratio
            spacing: 0

            Rectangle {
                color: blue
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: black
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: magenta
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: black
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: cyan
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: black
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Rectangle {
                color: gray
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

        }

        RowLayout {
            Layout.preferredHeight: parent.height * bottom_row_ratio
            spacing: 0

            RowLayout {
                Layout.preferredWidth: b * 5
                spacing: 0

                Rectangle {
                    color: i_minus
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Rectangle {
                    color: white
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Rectangle {
                    color: q_plus
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Rectangle {
                    color: black
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

            }

            RowLayout {
                Layout.preferredWidth: b
                spacing: 0

                Rectangle {
                    color: Qt.lighter(black, 0.8)
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Rectangle {
                    color: black
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Rectangle {
                    color: Qt.lighter(black, 1.2)
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

            }

            RowLayout {
                Layout.preferredWidth: b

                Rectangle {
                    color: black
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

            }

        }

    }

}
