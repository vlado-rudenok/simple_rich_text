enum Commands {
  openLink('http'),
  popRoute('pop'),
  pushRoute('push'),
  replaceRoute('repl');

  const Commands(this.rawValue);

  final String rawValue;
}
