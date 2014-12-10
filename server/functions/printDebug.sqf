//debug_console.hpp
private [
  "_string",
  "_vars",
  "_type",
  "_strOut",
  "_output"
];

_string = [_this, 0, "", ""] call BIS_fnc_param;
_vars   = [_this, 1, [], []] call BIS_fnc_param;

_strOut = "\n" + _string;

{
  _type = (typename _x);
  _strOut = _strOut + format ["\n %1 => %2", ) _x, _type];

} forEach _vars;

"debug_console" callExtension (_strOut + "#0101");

//#define conBeep() "debug_console" callExtension ("A")
//#define conClear() "debug_console" callExtension ("C")
//#define conClose() "debug_console" callExtension ("X")
//#define conWhite(_msg) "debug_console" callExtension (_msg + "#1110")
//#define conWhiteTime(_msg) "debug_console" callExtension (_msg + "#1111")
//#define conRed(_msg) "debug_console" callExtension (_msg + "#1000")
//#define conRedTime(_msg) "debug_console" callExtension (_msg + "#1001")
//#define conGreen(_msg) "debug_console" callExtension (_msg + "#0100")
//#define conGreenTime(_msg) "debug_console" callExtension (_msg + "#0101")
//#define conBlue(_msg) "debug_console" callExtension (_msg + "#0010")
//#define conBlueTime(_msg) "debug_console" callExtension (_msg + "#0011")
//#define conYellow(_msg) "debug_console" callExtension (_msg + "#1100")
//#define conYellowTime(_msg) "debug_console" callExtension (_msg + "#1101")
//#define conPurple(_msg) "debug_console" callExtension (_msg + "#1010")
//#define conPurpleTime(_msg) "debug_console" callExtension (_msg + "#1011")
//#define conCyan(_msg) "debug_console" callExtension (_msg + "#0110")
//#define conCyanTime(_msg) "debug_console" callExtension (_msg + "#0111")
//#define conFile(_msg) "debug_console" callExtension (_msg + "~0000")
//#define conFileTime(_msg) "debug_console" callExtension (_msg + "~0001")
