class Chat {
  String name;
  String message;
  String time;
  String avatarUrl;

  Chat({this.avatarUrl, this.message, this.name, this.time});
}

List<Chat> fakeData = [
  Chat(
      avatarUrl:
          ("https://yt3.ggpht.com/a-/AAuE7mCszIm7020G8iHuJT6Ln0z97uhny-Kkv1uqLA=s900-mo-c-c0xffffffff-rj-k-no"),
      message: "Hello World!",
      name: "John",
      time: "13.3"),
];
