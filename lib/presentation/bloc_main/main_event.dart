abstract class MainEvent{
  const MainEvent();
}
class LoadMainEvent extends MainEvent{
  const LoadMainEvent();
}

class ChangeMainEvent extends MainEvent{
  final double score;
  final double byClick;
  final double PerSecond;

  ChangeMainEvent(this.score, this.byClick, this.PerSecond);
}