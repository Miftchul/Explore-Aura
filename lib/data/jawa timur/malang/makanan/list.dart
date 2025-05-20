import 'bakso.dart';
import 'mie.dart';
import 'pecel.dart';
import 'rawon.dart';
import 'segoresek.dart';

final malangMakananRoutes = {
  '/bakso': (context) => BaksoPage(),
  '/mie': (context) => const mie(),
  '/pecel': (context) => const pecel(),
  '/rawon': (context) => const rawon(),
  '/segoresek': (context) => const segoresek(),
};
