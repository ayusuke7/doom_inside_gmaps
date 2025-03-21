final fiapSP = Coordinates(
  url:
      'https://www.google.com/maps/@-23.5645958,-46.6527813,3a,90y,46.24h,111.1t/data=!3m7!1e1!3m5!1smAfH4C6BlfDMrhhCtm78_w!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D-21.099999999999994%26panoid%3DmAfH4C6BlfDMrhhCtm78_w%26yaw%3D46.24!7i16384!8i8192?entry=ttu&g_ep=EgoyMDI1MDMxOC4wIKXMDSoJLDEwMjExNDUzSAFQAw%3D%3D',
  width: '248px',
  height: '205px',
  top: '57px',
  left: '32.3%',
  transform: 'perspective(300px) rotate3d(1.5, 0, 0.5, 18deg)',
);

final timeSquare = Coordinates(
  url:
      'https://www.google.com/maps/@40.7587119,-73.9850228,3a,90y,325h,98.53t/data=!3m7!1e1!3m5!1sCsbLPgL0Kbb5M2r6kbAeVw!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D-8.532041662995752%26panoid%3DCsbLPgL0Kbb5M2r6kbAeVw%26yaw%3D325.00416430940084!7i16384!8i8192?entry=ttu&g_ep=EgoyMDI1MDMxOC4wIKXMDSoASAFQAw%3D%3D',
  width: '276px',
  height: '170px',
  top: '21%',
  left: '27%',
  transform: 'perspective(1000px) rotateX(22deg) rotateY(45deg) skewX(357deg)',
);

class Coordinates {
  final String url;
  final String width;
  final String height;
  final String top;
  final String left;
  final String transform;

  Coordinates({
    required this.url,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
    required this.transform,
  });
}
