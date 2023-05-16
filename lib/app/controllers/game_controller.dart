import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/settings/game_setting.dart';
import 'package:jogo_da_memoria/app/models/game_opcao_model.dart';
import 'package:jogo_da_memoria/app/models/game_play_model.dart';
import 'package:jogo_da_memoria/app/repositories/records_repository.dart';
import 'package:mobx/mobx.dart';
part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOpcao> gameCards = [];

  @observable
  int gameScore = 0;

  @observable
  bool venceu = false;

  @observable
  bool perdeu = false;

  late GamePlay _gamePlay;
  List<GameOpcao> _escolha = [];
  List<Function> _escolhaCallback = [];
  int _acertos = 0;
  int _numPares = 0;
  RecordsRepository recordesRepository;

  @computed
  bool get jogadaCompleta => _escolha.length == 2;

  GameControllerBase({required this.recordesRepository});

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _acertos = 0;
    _numPares = (_gamePlay.nivel / 2).round();
    venceu = false;
    perdeu = false;
    _resetScore();
    _generateCards();
  }

  _resetScore() {
    _gamePlay.modo == Modo.normal ? gameScore = 0 : gameScore = _gamePlay.nivel;
  }

  _generateCards() {
    List<int> cardOpcoes = GameSetting.cardOpcoes.sublist(0)..shuffle();
    cardOpcoes = cardOpcoes.sublist(0, _numPares);
    gameCards = [...cardOpcoes, ...cardOpcoes]
        .map((opcao) => GameOpcao(
              opcao: opcao,
              matched: false,
              selected: false,
            ))
        .toList();
    gameCards.shuffle();
  }

  escolher(GameOpcao opcao, Function resetCard) async {
    opcao.selected = true;
    _escolha.add(opcao);
    _escolhaCallback.add(resetCard);
    await _compararEscolhas();
  }

  _compararEscolhas() async {
    if (jogadaCompleta) {
      if (_escolha[0].opcao == _escolha[1].opcao) {
        _acertos++;
        _escolha[0].matched = true;
        _escolha[1].matched = true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _escolha[i].selected = false;
            _escolhaCallback[i]();
          }
        });
      }
      _resetJogada();
      _updateScore();
      _checkGameStatus();
    }
  }

  _resetJogada() {
    _escolha = [];
    _escolhaCallback = [];
  }

  _updateScore() {
    _gamePlay.modo == Modo.normal ? gameScore++ : gameScore--;
  }

  _checkGameStatus() async {
    bool allMatched = _acertos == _numPares;
    if (_gamePlay.modo == Modo.normal) {
      await _checkGameStatusNormal(allMatched);
    } else {
      await _checkGameStatusRound6(allMatched);
    }
  }

  _checkGameStatusNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), () => venceu = allMatched);
  }

  _checkGameStatusRound6(bool allMatched) async {
    if (_chancesAcabaram()) {
      await Future.delayed(const Duration(seconds: 1), () => perdeu = true);
    }
    if (allMatched && gameScore >= 0) {
      await Future.delayed(
          const Duration(seconds: 1), () => venceu = allMatched);
    }
  }

  _chancesAcabaram() => gameScore < _numPares - _acertos;

  restartGame() {
    startGame(gamePlay: _gamePlay);
  }

  nextLevel() {
    int nivelIndex = 0;
    if (_gamePlay.nivel != GameSetting.niveis.last) {
      nivelIndex = GameSetting.niveis.indexOf(_gamePlay.nivel) + 1;
    }
    _gamePlay.nivel = GameSetting.niveis[nivelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
