import 'package:dartseid/dartseid.dart';
import 'package:dartseid_example/app/controllers/example_controller.dart';

const exampleController = ExampleController();

void defineRoutes() {
  Route.get('/', exampleController.index);
  Route.post('/', exampleController.post);
}
