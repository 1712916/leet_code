void measureExecutionTime(Function func) {
  print('****Measure Execution Time - START****');
  final stopwatch = Stopwatch()..start();
  func();
  print('****Measure Execution Time - END: ${stopwatch.elapsed}****');
}
