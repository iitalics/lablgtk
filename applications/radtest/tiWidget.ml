
let new_class_list = [
  "window",          TiWindow.new_tiwindow;
  "hbox",            TiPack.new_tihbox;
  "vbox",            TiPack.new_tivbox;
  "button",          TiButton.new_tibutton;
  "check_button",    TiButton.new_ticheck_button;
  "toggle_button",   TiButton.new_titoggle_button;
  "radio_button",    TiButton.new_tiradio_button;
  "toolbar",         TiButton.new_toolbar;
  "hseparator",      TiMisc.new_tihseparator;
  "vseparator",      TiMisc.new_tivseparator;
  "statusbar",       TiMisc.new_tistatusbar;
  "label",           TiMisc.new_tilabel;
  "notebook",        TiMisc.new_tinotebook;
  "frame",           TiBin.new_tiframe;
  "aspect_frame",    TiBin.new_tiaspect_frame;
  "handle_box",      TiBin.new_handle_box;
  "viewport",        TiBin.new_viewport;
  "event_box",       TiBin.new_event_box;
  "scrolled_window", TiBin.new_tiscrolled_window;
  "entry",           TiEdit.new_tientry;
  "spin_button",     TiEdit.new_tispin_button;
  "combo",           TiEdit.new_ticombo;
  "clist",           TiList.new_clist
]

let _ =
  TiBase.new_tiwidget :=
    (fun ~classe ?(pos = -1) ~name ~parent_tree ?insert_evbox ?(listprop = []) -> (List.assoc classe new_class_list) ~pos ~name ~parent_tree ?insert_evbox )

