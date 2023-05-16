import 'package:hive/hive.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/models/game_play_model.dart';
import 'package:mobx/mobx.dart';
part 'records_repository.g.dart';

class RecordsRepository = RecordsRepositoryBase with _$RecordsRepository;

abstract class RecordsRepositoryBase with Store {
  late final Box _recordsBox;
  late final GamePlay _gamePlay;
  @observable
  Map recordsRound6 = {};
  @observable
  Map recordsNormal = {};

  RecordsRepositoryBase() {
    _initRepository();
  }

  void _initRepository() async {
    await _initDatabase();
    await loadRecords();
  }

  _initDatabase() async {
    _recordsBox = await Hive.openBox('gameRecordes');
  }

  @action
  loadRecords() async {
    recordsRound6 = _recordsBox.get(Modo.round6.toString()) ?? {};
    recordsNormal = _recordsBox.get(Modo.normal.toString()) ?? {};
  }
}
