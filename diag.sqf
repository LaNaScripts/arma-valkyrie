private [ "_fps", "_tmpCnt", "_tmpgrp" ];

_fps = round diag_fps;

sleep 2;

_tmpCnt = 0;
_tmpgrp = [];

{ _tmpgrp = _tmpgrp + [ [ _x, count ( units _x ) ] ]; _tmpCnt = _tmpCnt + 1; } count allGroups;
hint parseText format [ "FPS: %3<br />Gruppen: %1<br />Einheiten %4<br />_________________________<br />%2", _tmpCnt, _tmpgrp, _fps, count allUnits ];