#include "shared_config.h"

/* Default settings; can be overriden by command line. */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	font /* set in shared_config.h */
};

/* -p  option; prompt to the left of input field */
/* colorscheme; also set in shared_config.h */
static const char *colors[SchemeLast][2] = {
	/*               fg                  bg                 */
	[SchemeNorm] = { col_normal_fore,    col_normal_back    },
	[SchemeSel]  = { col_selection_fore, col_selection_back },
	[SchemeOut]  = { col_normal_back,    col_normal_fore    },
};

static const char *prompt = NULL;

/* -b  option; if 0, dmenu appears at bottom */
static int topbar = 1;

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
