/* Loaded by Firefox on every start; generated from the selected YavaOS theme. */
:root {
  --lwt-accent-color: {{ dark_background }} !important;
  --lwt-text-color: {{ foreground }} !important;
  --toolbar-bgcolor: {{ background }} !important;
  --toolbar-color: {{ foreground }} !important;
  --toolbar-field-background-color: {{ lighter_background }} !important;
  --toolbar-field-color: {{ foreground }} !important;
  --toolbar-field-border-color: {{ muted }} !important;
  --toolbar-field-focus-background-color: {{ background }} !important;
  --toolbar-field-focus-color: {{ foreground }} !important;
  --toolbar-field-focus-border-color: {{ accent }} !important;
  --tab-selected-bgcolor: {{ background }} !important;
  --tab-selected-textcolor: {{ foreground }} !important;
  --arrowpanel-background: {{ background }}ee !important;
  --arrowpanel-color: {{ foreground }} !important;
  --arrowpanel-border-color: {{ muted }} !important;
  --panel-background: {{ background }}ee !important;
  --panel-color: {{ foreground }} !important;
  --panel-border-color: {{ muted }} !important;
  --sidebar-background-color: {{ background }} !important;
  --sidebar-text-color: {{ foreground }} !important;
  --sidebar-border-color: {{ muted }} !important;
  --yavaos-menu-bg: {{ background }}ee;
  --yavaos-menu-fg: {{ foreground }};
  --yavaos-menu-accent: {{ accent }};
  --yavaos-menu-hover: {{ lighter_background }};
}

#navigator-toolbox,
#TabsToolbar,
#nav-bar,
#PersonalToolbar {
  background-color: {{ background }} !important;
  color: {{ foreground }} !important;
}

#TabsToolbar {
  background-color: {{ dark_background }} !important;
}

#urlbar-background,
#searchbar {
  background-color: {{ lighter_background }} !important;
  color: {{ foreground }} !important;
  border-color: {{ muted }} !important;
}

#urlbar[focused] #urlbar-background {
  border-color: {{ accent }} !important;
}

.tab-background[selected] {
  background: {{ background }} !important;
  border-top: 2px solid {{ accent }} !important;
}

.tab-label[selected] {
  color: {{ foreground }} !important;
}

#sidebar-box,
#sidebar-header {
  background: {{ background }} !important;
  color: {{ foreground }} !important;
}

menupopup,
panel[type="arrow"] {
  --panel-background: var(--yavaos-menu-bg) !important;
  --panel-color: var(--yavaos-menu-fg) !important;
  --arrowpanel-background: var(--yavaos-menu-bg) !important;
  --arrowpanel-color: var(--yavaos-menu-fg) !important;
}

menupopup > menu,
menupopup > menuitem,
.subviewbutton {
  color: var(--yavaos-menu-fg) !important;
}

menupopup > :is(menu, menuitem):hover,
.subviewbutton:hover {
  background-color: var(--yavaos-menu-hover) !important;
}

/* This blurs content behind an in-window menu where Firefox supports it. */
menupopup::part(content),
panel::part(content) {
  backdrop-filter: blur(18px) !important;
}
