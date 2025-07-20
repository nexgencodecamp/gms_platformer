draw_set_font(fnt_score);
draw_set_color(make_colour_rgb(255, 75, 172));
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var p = instance_find(oPlayer, 0);
if (instance_exists(p)) {
    draw_text(40, 5, "SCORE: " + string_repeat("0", SCORE_NUM_ZEROS - string_length(string(p.player_score))) + string(p.player_score));
} else {
    draw_text(40, 5, "SCORE: --");
}


