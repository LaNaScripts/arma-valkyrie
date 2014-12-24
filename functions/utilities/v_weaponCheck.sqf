/*

  file: v_weaponCheck
  about: compare one weapon to another

*/

_target   = _this select 0;
_expected = _this select 1;

_result = (_target == _expected);

_result;
