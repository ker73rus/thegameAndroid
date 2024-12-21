abstract class BuyEvent{
  const BuyEvent();
}
class LoadBuyedEvent extends BuyEvent{
  const LoadBuyedEvent();
}

class ChangeBuyEvent extends BuyEvent{
  final String id;

  ChangeBuyEvent(this.id);
}