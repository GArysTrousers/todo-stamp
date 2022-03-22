include <roundedcube.scad>
include <prism.scad>

// Body
pageMargin = 5;
bodyDepth = 9;
lineWidth = 1.4;
numOfBoxes = 14;

// Label
labelWidth = 30;

// Box
boxWidth = 6;
boxHeight = 6;
boxGap = 1.5;
boxRadius = 2;

innerLabelWidth = labelWidth - lineWidth;
innerBoxWidth = boxWidth - lineWidth;
innerBoxHeight = boxHeight * 2;
boxOffset = (bodyDepth - boxWidth) / 2;

// Base
cube([148, bodyDepth, 3]);

// Center Guide
translate([0,0,0])
prism(bodyDepth,bodyDepth,boxHeight+1);

// Label
// color("blue")
// translate([pageMargin, boxOffset, 0.1])
// difference() {
//     roundedcube([labelWidth, boxWidth, boxHeight], false, boxRadius, "z");
//     translate([lineWidth / 2, lineWidth / 2, 0])
//     roundedcube([innerLabelWidth, innerBoxWidth, innerBoxHeight], false, boxRadius * 0.66, "z");
// }

for (i = [0:(numOfBoxes - 1)]) {
    color("green")
    translate([pageMargin + labelWidth + boxGap + i * (boxWidth + boxGap), boxOffset, 0.1])
    difference() {
        roundedcube([boxWidth, boxWidth, boxHeight], false, boxRadius, "z");
        translate([lineWidth / 2, lineWidth / 2, 0])
        roundedcube([innerBoxWidth, innerBoxWidth, innerBoxHeight], false, boxRadius * 0.66, "z");
    }
}