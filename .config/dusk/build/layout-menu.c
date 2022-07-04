
From e45e286b3d639b90ef202996d87054cced1fd80e Mon Sep 17 00:00:00 2001
From: tdu <tdukv@protonmail.com>
Date: Mon, 31 Aug 2020 00:07:32 +0300
Subject: [PATCH] Right clicking the layout symbol opens an xmenu prompt to
 select layout.

Xmenu need to be installed for this to work.
Edit layoutmenu.sh with the correct layout table, and place in PATH.
---
 config.def.h  |  3 ++-
 dwm.c         | 19 +++++++++++++++++++
 layoutmenu.sh |  7 +++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100755 layoutmenu.sh

diff --git a/config.def.h b/config.def.h
index 1c0b587..c9e0833 100644
--- a/config.def.h
+++ b/config.def.h
@@ -58,6 +58,7 @@ static const Layout layouts[] = {
 static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
 static const char *termcmd[]  = { "st", NULL };
+static const char *layoutmenu_cmd = "layoutmenu.sh";
 
 static Key keys[] = {
 	/* modifier                     key        function        argument */
@@ -101,7 +102,7 @@ static Key keys[] = {
 static Button buttons[] = {
 	/* click                event mask      button          function        argument */
 	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
-	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
+	{ ClkLtSymbol,          0,              Button3,        layoutmenu,     {0} },
 	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
 	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
 	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
diff --git a/dwm.c b/dwm.c
index 4465af1..2508a0a 100644
--- a/dwm.c
+++ b/dwm.c
@@ -177,6 +177,7 @@ static void grabkeys(void);
 static void incnmaster(const Arg *arg);
 static void keypress(XEvent *e);
 static void killclient(const Arg *arg);
+static void layoutmenu(const Arg *arg);
 static void manage(Window w, XWindowAttributes *wa);
 static void mappingnotify(XEvent *e);
 static void maprequest(XEvent *e);
@@ -1014,6 +1015,24 @@ killclient(const Arg *arg)
 	}
 }
 
+void
+layoutmenu(const Arg *arg) {
+	FILE *p;
+	char c[3], *s;
+	int i;
+
+	if (!(p = popen(layoutmenu_cmd, "r")))
+		 return;
+	s = fgets(c, sizeof(c), p);
+	pclose(p);
+
+	if (!s || *s == '\0' || c == '\0')
+		 return;
+
+	i = atoi(c);
+	setlayout(&((Arg) { .v = &layouts[i] }));
+}
+
 void
 manage(Window w, XWindowAttributes *wa)
 {
diff --git a/layoutmenu.sh b/layoutmenu.sh
new file mode 100755
index 0000000..1bf95f2
--- /dev/null
+++ b/layoutmenu.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+cat <<EOF | xmenu
+[]= Tiled Layout	0
+><> Floating Layout	1
+[M] Monocle Layout	2
+EOF
-- 
2.28.0

