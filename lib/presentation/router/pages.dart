enum Pages {
  login(pageName: "/login"),
  home(pageName: "/home"),
  blackJack(pageName: "/black_jack"),
  blackJackTables(pageName: "/black_jack_tables");

  const Pages({required this.pageName});
  final String pageName;
}
