import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/routers/route_handlers.dart';

class FluroPrincipalRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    // Rutas
    router.define('/:page', handler: homeHandler);

    
    //404
    router.notFoundHandler = homeHandler;     
  }
}
