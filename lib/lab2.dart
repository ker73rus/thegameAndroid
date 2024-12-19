class Upgrade {
  final int cost;
  final String name;
  final Type type;

  Upgrade(this.cost, this.name, this.type);
}

enum Type { byClick, perSecond }

extension ToText on Type {
  String toText() {
    switch (this) {
      case Type.byClick:
        return "За нажатие";
      case Type.perSecond:
        return "В секунду";
      default:
        return "Неизвестно";
    }
  }
}

void main() {
  var list = [
    Upgrade(450, "Улучшение1", Type.byClick),
    Upgrade(100, "Улучшение2", Type.perSecond),
    Upgrade(200, "Улучшение3", Type.byClick)
  ];
  list.add(Upgrade(300, "Улучшение4", Type.perSecond));

  for (Upgrade upg in list) {
    if (upg.type == Type.byClick) {
      print(upg.toText());
    }
  }
  printThis(list);
}

Future<void> printThis(List<Upgrade> t) async {
  await Future.delayed(const Duration(milliseconds: 1500),
      () => print("Подождём 1500 мс и напишем: ${t[0].name}"));
  await Future.delayed(const Duration(milliseconds: 1500),
      () => print("Подождём 1500 мс и напишем: ${t[1].name}"));
  await Future.delayed(const Duration(milliseconds: 1500),
      () => print("Подождём 1500 мс и напишем: ${t[2].name}"));
  await Future.delayed(const Duration(milliseconds: 1500),
      () => print("Подождём 1500 мс и напишем: ${t[3].name}"));
}

extension toString on Upgrade {
  String toText() {
    return "Название: $name; Цена:$costТип: ${type.toText()}";
  }
}
