import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mobx/mobx.dart';

part 'to_do_card_store.g.dart';

class ToDoCardStore = ToDoCardStoreBase with _$ToDoCardStore;

abstract class ToDoCardStoreBase with Store {

  @observable
  double markTodayButtonOpacity = 0.0;

  @action
  void changeMarkTodayButtonOpacity(){
    markTodayButtonOpacity = markTodayButtonOpacity == 0.0 ? 1.0 : 0.0;
  }

  @action 
  void changeMarkDoneButtonOpacity(int index, List<ToDoModel> toToModels){
    toToModels[index].markDoneButtonOpacity = toToModels[index].markDoneButtonOpacity  == 0.0 ? 1.0 : 0.0;
    
  }
}
