// ------- List of Colors ------- \\

import 'package:flutter/material.dart';

const vPrimaryColor = Color(0xFF2da6bf);
const vSecondaryColor = Color(0xFF015571);
const vTertiaryColor = Color(0xFF73c4d4);
const vQuaternaryColor = Color(0xFFf0dcd6);
const vQuintenaryColor = Color(0xFF96d2df);
const vAccentColor = Color(0xFF12424c);
const vTitleColor = Color(0xFFFBFBFB);
const vDefaultGrayL = Color(0xFFC8C8C8);
const vDefaultGrayD = Color(0xFF434343);

final vCardBgLightColor = const Color(0xFFFBFBFB).withOpacity(0.7);
final vCardBgDarkColor = const Color(0xFF2B2B2B).withOpacity(0.7);
const vScafoldLightColor = Color(0xFFe5f1f5);
const vScafoldDarkColor = Color(0xFF252525);
final vFormBgLightColor = const Color(0xFFFBFBFB).withOpacity(0.3);
final vFormBgDarkColor = const Color(0xFF1e1e1e).withOpacity(0.3);
const vLightColor = Color(0xFFFBFBFB);
const vDarkColor = Color(0xFF1e1e1e);

const vAlertColor = Color(0xFFF4980E);
const vGold = Color(0xFFEDC33B);
const vSilver = Color(0xFFc3c5cd);
const vBronze = Color(0xFF9E6227);

// ------- List of gradients------- \\

const bgLightGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.03, 0.08, 0.24, 0.36, 0.42, 0.58],
  colors: [
    Color(0xFF12424c),
    Color(0xFF015571),
    Color(0xFF1fa7c2),
    Color(0xFF92ccde),
    Color(0xFFf0dcd6),
    Color(0xFFFBFBFB),
  ],
);
const bgDarkGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.03, 0.08, 0.24, 0.36, 0.42, 0.58],
  colors: [
    Color(0xFF00222c),
    Color(0xFF012835),
    Color(0xFF104954),
    Color(0xFF454D51),
    Color(0xFF3f3938),
    Color(0xFF1e1e1e),
  ],
);
const bgLightGradientHeaderSmall = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.070, 0.15, 0.56, 0.96, 0.99],
  colors: [
    Color(0xFF12424c),
    Color(0xFF015571),
    Color(0xFF1fa7c2),
    Color(0xFF92ccde),
    Color(0xFFf0dcd6),
  ],
);
const bgDarkGradientHeaderSmall = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.070, 0.15, 0.56, 0.96, 0.99],
  colors: [
    Color(0xFF00222c),
    Color(0xFF012835),
    Color(0xFF104954),
    Color(0xFF454D51),
    Color(0xFF3f3938),
  ],
);
final bottomLightGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: const [0.10, 0.26, 0.62],
  colors: [
    const Color(0xFFFBFBFB).withOpacity(0.1),
    const Color(0xFFFBFBFB).withOpacity(0.3),
    const Color(0xFFFBFBFB),
  ],
);
final bottomDarkGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: const [0.10, 0.26, 0.62],
  colors: [
    const Color(0xFF1e1e1e).withOpacity(0.1),
    const Color(0xFF1e1e1e).withOpacity(0.3),
    const Color(0xFF1e1e1e),
  ],
);
