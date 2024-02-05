{
  programs.foot = {
    enable = true;
    settings = {
      main = {
	font = "MapleMonoNF:size=10";
      	underline-offset = 1;
      	underline-thickness = 1;
	box-drawings-uses-font-glyphs = true;      	
	dpi-aware = true;
	
	initial-window-size-pixels = "350x250";
	pad = "12x12 center";
      };

      cursor = {
	style = "block";
	blink = true;
      };

      colors = {
        background = "1C1E26";
	foreground = "D5D8DA";
	
	regular0 = "232530";
	regular1 = "E95678";
	regular2 = "29D398";
	regular3 = "FAB795";
	regular4 = "26BBD9";
	regular5 = "EE64AE";
	regular6 = "59E3E3";
	regular7 = "F9CBBE";

	bright0 = "2E303E";
	bright1 = "EC6A88";
	bright2 = "3FDAA4";
	bright3 = "FBC3A7";
	bright4 = "3FC6DE";
	bright5 = "F075B7";
	bright6 = "6BE6E6";
	bright7 = "FADAD1";
      };

      key-bindings.search-start = "Control+Shift+f";
    };
  };
}
