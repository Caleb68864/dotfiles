/* See LICENSE file for copyright and license details. */
/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";

static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char col_select[]      = "#005577";
static const char selbordercolor[]  = "#ffffff";
static const char selbgcolor[]      = "#ffffff"; /*Sets color behind icon or text*/
static const char selfgcolor[]      = "#000000"; /*Sets color of icon or text*/

static const char *colors[][3]      = {
	/*               fg           bg           border   */
	[SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
	[SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                         instance       title       tags mask     isfloating   monitor */
	{ "Wfica_Seamless",              NULL,      NULL,           0,            0,           -1 },
	{ "Wfica_Seamless",              NULL,      "Notification Area",          0,            1,           -1 },
	{ "Gimp",                        NULL,      NULL,           0,            1,           -1 },
	{ "Inkscape",                    NULL,      NULL,           0,            1,           -1 },
	{ "Firefox",                     NULL,      NULL,           1,            0,           -1 },
	{ "Google-chrome",               NULL,      NULL,           1,            0,           -1 },
	{ "Vivaldi-stable",              NULL,      NULL,           1,            0,           -1 },
	{ "Vivaldi",                     NULL,      NULL,           1,            0,           -1 },
	{ "Surf",                        NULL,      NULL,           1,            0,           -1 },
	{ "Chromium",                    NULL,      NULL,           1,            0,           -1 },
	{ NULL,                          NULL,      "st",           2,            0,           -1 },
	{ "Terminator",                  NULL,      NULL,           2,            0,           -1 },
	{ "URxvt",                       NULL,      NULL,           2,            0,           -1 },
	{ "Xterm",                       NULL,      NULL,           2,            0,           -1 },
	{ NULL,                          NULL,      "ranger",       1 << 2,       0,           -1 },
	{ "Filezilla",                   NULL,      NULL,           1 << 2,       0,           -1 },
	{ "vlc",                         NULL,      NULL,           1 << 3,       0,           -1 },
	{ "mpv",                         NULL,      NULL,           1 << 3,       0,           -1 },
	{ "calibre",                     NULL,      NULL,           1 << 4,       0,           -1 },
	{ "libreoffice",                 NULL,      NULL,           1 << 4,       0,           -1 },
	{ NULL,                          NULL,      "LibreOffice",           1 << 4,       0,           -1 },
	{ "libreoffice-startcenter",     NULL,      NULL,           1 << 4,       0,           -1 },
	{ "libreoffice-writer",          NULL,      NULL,           1 << 4,       0,           -1 },
	{ "libreoffice-calc",            NULL,      NULL,           1 << 4,       0,           -1 },
	{ "libreoffice-impress",         NULL,      NULL,           1 << 4,       0,           -1 },
	{ "libreoffice-draw",            NULL,      NULL,           1 << 4,       0,           -1 },
	{ "libreoffice-math",            NULL,      NULL,           1 << 4,       0,           -1 },
	{ "okular",                      NULL,      NULL,           1 << 4,       0,           -1 },
	{ "mupdf",                       NULL,      NULL,           1 << 4,       0,           -1 },
	{ "Zathura",                     NULL,      NULL,           1 << 4,       0,           -1 },
	{ "Remmina",                     NULL,      NULL,           1 << 5,       0,           -1 },
	{ "Pithos",                      NULL,      NULL,           1 << 6,       0,           -1 },
	{ NULL,                          NULL,      "pianobar",     1 << 6,       0,           -1 },
	{ "mpd",                         NULL,      NULL,           1 << 6,       0,           -1 },
	{ "Gpodder",                     NULL,      NULL,           1 << 6,       0,           -1 },
	{ "KeePass",                     NULL,      NULL,           1 << 7,       0,           -1 },
	{ NULL,                          NULL,      "*KeePass",     1 << 7,       0,           -1 },
	{ "keepassxc",                   NULL,      NULL,           1 << 7,       0,           -1 },
	{ NULL,                          NULL,      "*keepassxc",   1 << 7,       0,           -1 },
	{ "Steam",                       "Steam",   NULL,           1 << 8,       0,           -1 },
	{ "Steam",                       NULL,      "Friends List", 1 << 8,       0,           -1 },
	{ NULL,                          NULL,      "Steam",       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
#include "vanitygaps.c"
#include "tcl.c"
#include "grid.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "[=||=]",   tcl },
	{ "[+]",      grid },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *roficmd[] = { "rofi", "-show", "run", NULL };
static const char *rangercmd[] = { "st", "-e", "ranger", NULL };
/*static const char *newsboatcmd[] = { "st", "-e", "tmux new -A -s NewsBoat newsboat", NULL };*/
static const char *nmtuicmd[] = { "st", "-e", "nmtui", NULL };
static const char *termcmd[]  = { "st", NULL };
/* static const char *webcmd[]  = { "google-chrome", NULL };*/
/*For Arch change to above for ubuntu*/
/*static const char *webcmd[]  = { "google-chrome-stable", NULL };*/
static const char *webcmd[]  = { "vivaldi-stable", NULL };
static const char *surfcmd[]  = { "surf", NULL };
/*static const char *pithoscmd[]  = { "pithos", NULL };*/
static const char *pianobarcmd[] = { "st", "-e", "pianobar", NULL };
static const char *remminacmd[]  = { "remmina", NULL };
static const char *lockcmd[]  = { "slock", NULL };
#include <X11/XF86keysym.h>
#include "shiftview.c"
static const char *volupcmd[]  = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+1%", NULL };
static const char *voldwncmd[]  = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-1%", NULL };
static const char *volmutecmd[]  = { "pactl", "set-sink-mute", "0", "toggle", NULL };
static const char *brightupcmd[]  = { "xbacklight", "-inc", "10", NULL };
static const char *brightdwncmd[]  = { "xbacklight", "-dec", "10", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", "-e", "tmux", "attach-session", "-t", "ScratchPad", NULL };
static const char *powercmd[]  = { "/home/caleb/dotfiles/Scripts/rofi-power.sh", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	/*{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },*/
	{ MODKEY,                       XK_space,  spawn,          {.v = roficmd } },
	{ MODKEY|ShiftMask,             XK_space,  spawn,          {.v = dmenucmd } },
	{ MODKEY          ,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_grave,  togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY|ShiftMask,             XK_f,      spawn,          {.v = rangercmd } },
/*	{ MODKEY|ShiftMask,             XK_n,      spawn,          {.v = newsboatcmd } },*/
	{ MODKEY,                       XK_n,      spawn,          {.v = nmtuicmd } },
	{ MODKEY|ShiftMask,             XK_w,      spawn,          {.v = webcmd } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = surfcmd } },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          {.v = pianobarcmd } },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          {.v = remminacmd } },
	{ MODKEY|ControlMask,           XK_l,      spawn,          {.v = lockcmd } },
	
	/*{ 0,         XF86XK_AudioMute,             spawn,          {.v = volmutecmd } },
	{ 0,         XF86XK_AudioRaiseVolume,      spawn,          {.v = volupcmd } },
	{ 0,         XF86XK_AudioLowerVolume,      spawn,          {.v = voldwncmd } },
	{ 0,         XF86XK_MonBrightnessUp,       spawn,          {.v = brightupcmd } },
	{ 0,         XF86XK_MonBrightnessDown,     spawn,          {.v = brightdwncmd } },*/
	
	{ 0, XF86XK_AudioMute,		spawn,		SHCMD("pamixer -t; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioRaiseVolume,	spawn,		SHCMD("pamixer --allow-boost -i 3; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioLowerVolume,	spawn,		SHCMD("pamixer --allow-boost -d 3; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioPrev,		spawn,		SHCMD("mpc prev") },
	{ 0, XF86XK_AudioNext,		spawn,		SHCMD("mpc next") },
	{ 0, XF86XK_AudioPause,		spawn,		SHCMD("mpc pause") },
	{ 0, XF86XK_AudioPlay,		spawn,		SHCMD("mpc play") },
	{ 0, XF86XK_AudioStop,		spawn,		SHCMD("mpc stop") },
	{ 0, XF86XK_AudioRewind,	spawn,		SHCMD("mpc seek -10") },
	{ 0, XF86XK_AudioForward,	spawn,		SHCMD("mpc seek +10") },
	{ 0, XF86XK_AudioMedia,		spawn,		SHCMD("st -e ncmpcpp") },
	{ 0, XF86XK_PowerOff,		spawn,		SHCMD("sysact") },
	{ 0, XF86XK_Calculator,		spawn,		SHCMD("st -e bc -l") },
	{ 0, XF86XK_Sleep,		spawn,		SHCMD("sudo -A zzz") },
	{ 0, XF86XK_WWW,		spawn,		SHCMD("$BROWSER") },
	{ 0, XF86XK_DOS,		spawn,		SHCMD("st") },
	{ 0, XF86XK_ScreenSaver,	spawn,		SHCMD("slock & xset dpms force off; mpc pause; pauseallmpv") },
	{ 0, XF86XK_TaskPane,		spawn,		SHCMD("st -e htop") },
	{ 0, XF86XK_Mail,		spawn,		SHCMD("st -e neomutt ; pkill -RTMIN+12 dwmblocks") },
	{ 0, XF86XK_MyComputer,		spawn,		SHCMD("st -e lf /") },
	/* { 0, XF86XK_Battery,		spawn,		SHCMD("") }, */
	{ 0, XF86XK_Launch1,		spawn,		SHCMD("xset dpms force off") },
	{ 0, XF86XK_TouchpadToggle,	spawn,		SHCMD("(synclient | grep 'TouchpadOff.*1' && synclient TouchpadOff=0) || synclient TouchpadOff=1") },
	{ 0, XF86XK_TouchpadOff,	spawn,		SHCMD("synclient TouchpadOff=1") },
	{ 0, XF86XK_TouchpadOn,		spawn,		SHCMD("synclient TouchpadOff=0") },
	{ 0, XF86XK_MonBrightnessUp,	spawn,		SHCMD("xbacklight -inc 15") },
	{ 0, XF86XK_MonBrightnessDown,	spawn,		SHCMD("xbacklight -dec 15") },
	
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_c,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY,                       XK_o,      setlayout,      {.v = &layouts[6]} },
	{ MODKEY|ControlMask,    		XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
	{ MODKEY|ShiftMask|ControlMask, XK_space,  setlayout,      {0} },
	{ MODKEY|ControlMask,           XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,                       XK_Left,   cycle,          {.i = -1 } }, /* Cycle to Previous Tag */
    { MODKEY,                       XK_Right,  cycle,          {.i = +1 } }, /* Cycle to Next Tag */
    { MODKEY|ShiftMask,             XK_Left,   tagcycle,       {.i = -1 } }, /* Move Focsed Window to Previous Tag */
    { MODKEY|ShiftMask,             XK_Right,  tagcycle,       {.i = +1 } }, /* Move Focsed Window to Next Tag */
	{ MODKEY,                       XK_period, focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask|ControlMask, XK_q,      quit,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      spawn,          {.v = powercmd } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
/*static Button buttons[] = {
	/* click                event mask      button          function        argument 
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button1,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};*/
	
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkStatusText,        ShiftMask,      Button1,        sigdwmblocks,   {.i = 6} },
	{ ClkStatusText,        ShiftMask,      Button3,        spawn,          SHCMD("st -e nvim ~/dotfiles/dwmblocks/config.h") },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        defaultgaps,	{0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkClientWin,		MODKEY,		Button4,	incrgaps,	{.i = +1} },
	{ ClkClientWin,		MODKEY,		Button5,	incrgaps,	{.i = -1} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkTagBar,		0,		Button4,	shiftview,	{.i = -1} },
	{ ClkTagBar,		0,		Button5,	shiftview,	{.i = 1} },
	{ ClkRootWin,		0,		Button2,	togglebar,	{0} },
};

