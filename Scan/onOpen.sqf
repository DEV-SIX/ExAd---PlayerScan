_cooldownTime = 300;
_onlyScanforXM8Online = false;
_scanDistance = 750;
if(isNil "LastUsedCheck")then{
LastUsedCheck = 0;
};
if((LastUsedCheck == 0) || (diag_tickTime - LastUsedCheck > _cooldownTime))then{
  _display = (findDisplay 24015) closeDisplay 0;
  _playersNearby = 0;
  _playerPos = getPos player;
  {
      _playerSelected = _x;
      _playerSelectedPos = getPos _playerSelected;
    if(_onlyScanforXM8Online)then{
      if ((_playerSelected getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then{
        if(_playerPos distance _playerSelectedPos <= _scanDistance)then{
          _playersNearby = _playersNearby + 1;
        };
      };
    }
    else
    {
      if(_playerPos distance _playerSelectedPos <= _scanDistance)then{
        _playersNearby = _playersNearby + 1;
      };
    };
  } forEach allPlayers - [player];
  LastUsedCheck = diag_tickTime;
["SuccessTitleAndText", ["Player Scan", format ["There are %1 player(s) nearby", _PlayersNearby]]] call ExileClient_gui_toaster_addTemplateToast;
};