/**
 * Supporting expand/collapse view in metaschema mapping
 *
 */

function switch_view(who,flag) {
  var view_here     = document.getElementById(who);
  var collapsed_view = view_here.children[0];
  var expanded_view = view_here.children[1];

  collapsed_view.classList.toggle(flag);
  expanded_view.classList.toggle(flag);
};
