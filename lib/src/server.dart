import 'dart:io';

import 'package:dartseid/src/helpers/request_helpers.dart';
import 'package:dartseid/src/helpers/response_helpers.dart';
import 'package:dartseid/src/helpers/route_helpers.dart';
import 'package:dartseid/src/helpers/server_helpers.dart';
import 'package:dartseid/src/route.dart';

Future<void> runServer({required int port}) async {
  final server = await HttpServer.bind(
    InternetAddress.anyIPv6,
    port,
  );

  server.listen(handleRequest);
  print('Server running');

  final hotreloader = await createHotReloader();

  // Close server and hot reloader when exiting
  setupProcessSignalWatchers(server, hotreloader);
}

Future<void> handleRequest(HttpRequest request) async {
  final HttpRequest(response: response, uri: uri) = request;
  final methodString = request.method;

  final method = getHttpMethod(methodString);

  if (method == null) {
    return methodNotAllowed(response);
  }

  final (route, notFoundRoute) = findMatchingRouteAndNotFoundRoute(
    routes: routes,
    method: method,
    uri: uri,
  );

  final context = makeRequestContext(request, route);

  print('Request: $methodString ${context.path}');

  if (route == null) {
    return writeNotFoundResponse(
      context: context,
      response: response,
      notFoundRouteHandler: notFoundRoute?.notFoundHandler,
    );
  }

  await writeResponse(
    context: context,
    route: route,
    response: response,
  );
}
