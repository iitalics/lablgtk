(* $Id$ *)

open Misc
open Gtk
open Tags
open GtkBase

module TreeItem2 = struct
  let cast w : tree_item obj =
    if Object.is_a w "GtkTreeItem2" then Obj.magic w
    else invalid_arg "Gtk.TreeItem2.cast"
  external create : unit -> tree_item obj = "ml_gtk_tree_item2_new"
  external create_with_label : string -> tree_item obj
      = "ml_gtk_tree_item2_new_with_label"
  let create ?:label ?(_ : unit option) =
    match label with None -> create ()
    | Some label -> create_with_label label
  external set_subtree : [> treeitem] obj -> [> widget] obj -> unit
      = "ml_gtk_tree_item2_set_subtree"
  let setter w :cont ?:subtree =
    may subtree fun:(set_subtree w);
    cont w
  external remove_subtree : [> treeitem] obj -> unit
      = "ml_gtk_tree_item2_remove_subtree"
  external expand : [> treeitem] obj -> unit
      = "ml_gtk_tree_item2_expand"
  external collapse : [> treeitem] obj -> unit
      = "ml_gtk_tree_item2_collapse"
  external subtree : [> treeitem] obj -> [widget container tree] obj
      = "ml_GTK_TREE_ITEM2_SUBTREE"
  let subtree t = try subtree t with Misc.Null_pointer -> raise Not_found
  module Signals = struct
    open GtkSignal
    let expand : ([> treeitem],_) t =
      { name = "expand"; marshaller = marshal_unit }
    let collapse : ([> treeitem],_) t =
      { name = "collapse"; marshaller = marshal_unit }
  end
end

module Tree2 = struct
  let cast w : tree obj =
    if Object.is_a w "GtkTree2" then Obj.magic w
    else invalid_arg "Gtk.Tree2.cast"
  external coerce : [> tree] obj -> tree obj = "%identity"
  external create : unit -> tree obj = "ml_gtk_tree2_new"
  external insert : [> tree] obj -> [> treeitem] obj -> ?pos:int -> unit
      = "ml_gtk_tree2_insert"
  external insert : [> tree] obj -> [> treeitem] obj -> pos:int -> unit
      = "ml_gtk_tree2_insert"
  external remove_items : [> tree] obj -> [> treeitem] obj list -> unit
      = "ml_gtk_tree2_remove_items"
  external clear_items : [> tree] obj -> start:int -> end:int -> unit
      = "ml_gtk_tree2_clear_items"
  external select_item : [> tree] obj -> pos:int -> unit
      = "ml_gtk_tree2_select_item"
  external unselect_item : [> tree] obj -> pos:int -> unit
      = "ml_gtk_tree2_unselect_item"
  external select_child : [> tree] obj -> [> widget] obj -> unit
      = "ml_gtk_tree2_select_child"
  external unselect_child : [> tree] obj ->  [> widget] obj -> unit
      = "ml_gtk_tree2_unselect_child"
  external child_position : [> tree] obj -> [> treeitem] obj -> int
      = "ml_gtk_tree2_child_position"
  external item_up : [> tree] obj -> pos:int -> unit
      = "ml_gtk_tree2_item_up"
  external select_next_child : [> tree] obj -> [> treeitem] obj -> bool -> unit
      = "ml_gtk_tree2_select_next_child"
  external select_prev_child : [> tree] obj -> [> treeitem] obj -> unit
      = "ml_gtk_tree2_select_prev_child"
(*  external set_selection_mode : [> tree] obj -> selection_mode -> unit
      = "ml_gtk_tree2_set_selection_mode"
  external set_view_mode : [> tree] obj -> [LINE ITEM] -> unit
      = "ml_gtk_tree2_set_view_mode"
*)
  external set_view_lines : [> tree] obj -> bool -> unit
      = "ml_gtk_tree2_set_view_lines"
  external selection : [> tree] obj -> tree_item obj list =
    "ml_gtk_tree2_selection"
  external children : [> tree] obj -> tree_item obj list =
    "ml_gtk_tree2_children"
  let setter w :cont ?:selection_mode ?:view_mode ?:view_lines =
    let may_set f = may fun:(f w) in
(*    may_set set_selection_mode selection_mode;
    may_set set_view_mode view_mode;
*)
    may_set set_view_lines view_lines;
    cont w
  module Signals = struct
    open GtkSignal
    let selection_changed : ([> tree],_) t =
      { name = "selection_changed"; marshaller = marshal_unit }
    let select_child : ([> tree],_) t =
      { name = "select_child"; marshaller = Widget.Signals.marshal }
    let unselect_child : ([> tree],_) t =
      { name = "unselect_child"; marshaller = Widget.Signals.marshal }
  end
end
