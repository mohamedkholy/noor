import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';

class ElectronicSibhaShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Save the canvas state
    canvas.save();

    // Calculate bounds of the original shape
    const double originalMinX = -71.6449769;
    const double originalMaxX = 118.39857743;
    const double originalMinY = -0.25455469;
    const double originalMaxY = 228.63398435;

    const double originalWidth = originalMaxX - originalMinX;
    const double originalHeight = originalMaxY - originalMinY;

    // Calculate scale to fit while maintaining aspect ratio
    final double scaleX = size.width / originalWidth;
    final double scaleY = size.height / originalHeight;
    final double scale = scaleX < scaleY ? scaleX : scaleY;

    // Calculate center position
    final double scaledWidth = originalWidth * scale;
    final double scaledHeight = originalHeight * scale;
    final double centerX = (size.width - scaledWidth) / 2;
    final double centerY = (size.height - scaledHeight) / 2;

    // Apply transformations: translate to center and scale
    canvas.translate(
      centerX - (originalMinX * scale),
      centerY - (originalMinY * scale),
    );
    canvas.scale(scale);

    // Create the path with original coordinates
    final Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.cubicTo(
      1.0923143,
      -0.00960754,
      2.1846286,
      -0.01921509,
      3.31004333,
      -0.02911377,
    );
    path_0.cubicTo(
      5.06321617,
      -0.03548859,
      5.06321617,
      -0.03548859,
      6.85180664,
      -0.04199219,
    );
    path_0.cubicTo(
      8.07291641,
      -0.04769226,
      9.29402618,
      -0.05339233,
      10.55213928,
      -0.05926514,
    );
    path_0.cubicTo(
      13.13680154,
      -0.06870005,
      15.72147575,
      -0.07524312,
      18.30615234,
      -0.07910156,
    );
    path_0.cubicTo(
      22.21677334,
      -0.08875563,
      26.12685688,
      -0.1197732,
      30.03735352,
      -0.15136719,
    );
    path_0.cubicTo(
      54.37159464,
      -0.25455469,
      54.37159464,
      -0.25455469,
      66.32446289,
      3.16113281,
    );
    path_0.cubicTo(
      67.95363647,
      3.61153931,
      67.95363647,
      3.61153931,
      69.61572266,
      4.07104492,
    );
    path_0.cubicTo(
      85.20375912,
      8.59253472,
      99.81032795,
      19.22374043,
      108.32446289,
      33.16113281,
    );
    path_0.cubicTo(
      110.39205833,
      38.0802212,
      111.93025037,
      43.01501506,
      113.32446289,
      48.16113281,
    );
    path_0.cubicTo(
      113.55907227,
      49.02222656,
      113.79368164,
      49.88332031,
      114.03540039,
      50.77050781,
    );
    path_0.cubicTo(
      118.39857743,
      68.60262266,
      117.25123084,
      87.26714799,
      111.15620422,
      104.48591614,
    );
    path_0.cubicTo(
      104.41513667,
      123.63517817,
      103.96279625,
      142.22481685,
      104.46142578,
      162.35473633,
    );
    path_0.cubicTo(
      104.52801938,
      165.2836613,
      104.56975096,
      168.21220923,
      104.60961914,
      171.14160156,
    );
    path_0.cubicTo(
      104.6547036,
      172.45429268,
      104.6547036,
      172.45429268,
      104.70069885,
      173.79350281,
    );
    path_0.cubicTo(
      104.85258681,
      186.50559825,
      97.27756186,
      195.35659753,
      88.82446289,
      204.09863281,
    );
    path_0.cubicTo(
      80.33237823,
      212.56287457,
      70.7494944,
      218.39075575,
      59.76196289,
      223.09863281,
    );
    path_0.cubicTo(
      59.11461182,
      223.38134033,
      58.46726074,
      223.66404785,
      57.80029297,
      223.95532227,
    );
    path_0.cubicTo(
      47.02955128,
      228.28407392,
      35.41332573,
      228.51229824,
      23.95874023,
      228.47680664,
    );
    path_0.cubicTo(
      21.82622564,
      228.47363543,
      19.69508995,
      228.49725648,
      17.56274414,
      228.52246094,
    );
    path_0.cubicTo(
      -6.84502756,
      228.63398435,
      -27.01532502,
      219.41175352,
      -44.30053711,
      202.62597656,
    );
    path_0.cubicTo(
      -53.43456553,
      193.42928795,
      -53.43456553,
      193.42928795,
      -55.98803711,
      187.97363281,
    );
    path_0.cubicTo(
      -56.29354492,
      187.34070313,
      -56.59905273,
      186.70777344,
      -56.91381836,
      186.05566406,
    );
    path_0.cubicTo(
      -58.78310892,
      181.40640293,
      -58.69487116,
      177.22245919,
      -58.44897461,
      172.26660156,
    );
    path_0.cubicTo(
      -58.38278141,
      170.66590414,
      -58.31789087,
      169.06515244,
      -58.25415039,
      167.46435547,
    );
    path_0.cubicTo(
      -58.22001038,
      166.62866028,
      -58.18587036,
      165.79296509,
      -58.1506958,
      164.9319458,
    );
    path_0.cubicTo(
      -57.37321729,
      144.87906463,
      -57.90287201,
      126.11590848,
      -64.40209961,
      106.95019531,
    );
    path_0.cubicTo(
      -70.77984237,
      87.97347605,
      -71.6449769,
      69.38072785,
      -67.48803711,
      49.72363281,
    );
    path_0.cubicTo(
      -67.29218018,
      48.79534668,
      -67.09632324,
      47.86706055,
      -66.89453125,
      46.91064453,
    );
    path_0.cubicTo(
      -64.2607658,
      35.81632398,
      -58.56584889,
      28.21247136,
      -50.67553711,
      20.16113281,
    );
    path_0.cubicTo(
      -49.78608398,
      19.21753906,
      -49.78608398,
      19.21753906,
      -48.87866211,
      18.25488281,
    );
    path_0.cubicTo(-36.69395886, 6.39366726, -16.68098412, 0.11938571, 0, 0);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = MyColors.primary;
    canvas.drawPath(path_0, paint0Fill);
    final borderPaint = Paint()
      ..color = Color.lerp(MyColors.primary, Colors.black, 0.2)!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawPath(path_0, borderPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
