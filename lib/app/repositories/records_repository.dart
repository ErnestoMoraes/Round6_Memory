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

  updateRecordes({required GamePlay gameplay, required int score}) {
    final key = gameplay.modo.toString();

    if (_gamePlay.modo == Modo.normal &&
        (recordsNormal[gameplay.nivel] == null ||
            score < recordsNormal[gameplay.nivel])) {
      recordsNormal[gameplay.nivel] = score;
      _recordsBox.put(key, recordsNormal);
    } else if (_gamePlay.modo == Modo.round6 &&
        (recordsRound6[gameplay.nivel] == null ||
            score > recordsRound6[gameplay.nivel])) {
      recordsRound6[gameplay.nivel] = score;
      _recordsBox.put(key, recordsRound6);
    }
  }
}
