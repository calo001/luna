/*
* Copyright (C) 2018  Carlos Lopez <calo_lrc@hotmail.com>
* 
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero General Public License as published
* by the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Affero General Public License for more details.
* 
* You should have received a copy of the GNU Affero General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
* 
*/
     /**
     * The {@code ColorSelector} class. Contains a grid of available color 
     * for custom interface
     *
     * @since 1.0.0
     */

using Gtk;
using App.Enums;

namespace App.Views {
    public class ColorSelector : Grid {
        
        private Button btn_white;
        private Button btn_black;
        private Button btn_pink;
        private Button btn_red;
        private Button btn_orange;
        private Button btn_yellow;
        private Button btn_green;
        private Button btn_blue;
        private Button btn_purple;
        private Button btn_coco;

        private Button btn_blue_green;
        private Button btn_purple_red;
        private Button btn_pride;

        private Button btn_trans_white;
        private Button btn_trans_black;

        private Button btn_semitrans_white;
        private Button btn_semitrans_black;

        private const int BTN_SIZE = 25;
        public signal void color_selected (string color);

        public ColorSelector () {
            this.margin = 8;
            this.row_spacing = 8;
            this.column_spacing = 8;

            var img = new Image.from_icon_name ("preferences-color" , IconSize.DIALOG);
            var label = new Label (_("Select a theme color"));
            var separator = new Separator (Gtk.Orientation.HORIZONTAL);
            label.get_style_context (). add_class("h3");

            btn_white = new Button();
            btn_white.name = Color.WHITE.to_string ();
            btn_black = new Button();
            btn_black.name = Color.BLACK.to_string ();
            btn_pink  = new Button();
            btn_pink.name = Color.PINK.to_string ();
            btn_red = new Button();
            btn_red.name = Color.RED.to_string ();
            btn_orange = new Button();
            btn_orange.name = Color.ORANGE.to_string ();
            btn_yellow = new Button();
            btn_yellow.name = Color.YELLOW.to_string ();
            btn_green = new Button();
            btn_green.name = Color.GREEN.to_string ();
            btn_blue = new Button();
            btn_blue.name = Color.BLUE.to_string ();
            btn_purple  = new Button();
            btn_purple.name = Color.PURPLE.to_string ();
            btn_coco  = new Button();
            btn_coco.name = Color.COCO.to_string ();

            btn_blue_green = new Button();
            btn_blue_green.name = Color.GRADIENT_BLUE_GREEN.to_string ();
            btn_purple_red = new Button();
            btn_purple_red.name = Color.GRADIENT_PURPLE_RED.to_string ();
            btn_pride = new Button();
            btn_pride.name = Color.GRADIENT_PRIDE.to_string ();

            btn_trans_white  = new Button();
            btn_trans_white.name = Color.TRANS_WHITE.to_string ();
            btn_trans_black  = new Button();
            btn_trans_black.name = Color.TRANS_BLACK.to_string ();

            btn_semitrans_white  = new Button();
            btn_semitrans_white.name = Color.SEMITRANS_WHITE.to_string ();
            btn_semitrans_black  = new Button();
            btn_semitrans_black.name = Color.SEMITRANS_BLACK.to_string ();

            List<Button> buttons = new List<Button> ();
            buttons.append(btn_white);
            buttons.append(btn_black);
            buttons.append(btn_pink);
            buttons.append(btn_red);
            buttons.append(btn_orange);
            buttons.append(btn_yellow);
            buttons.append(btn_green);
            buttons.append(btn_blue);
            buttons.append(btn_purple);
            buttons.append(btn_coco);
            buttons.append(btn_blue_green);
            buttons.append(btn_purple_red);
            buttons.append(btn_pride);
            buttons.append(btn_trans_white);
            buttons.append(btn_trans_black);
            buttons.append(btn_semitrans_white);
            buttons.append(btn_semitrans_black);

            foreach (var btn in buttons) {
                btn.get_style_context ().add_class ("button_colors");
                btn.width_request = BTN_SIZE;
                btn.height_request = BTN_SIZE;
                btn.button_press_event.connect ( () => {
                    color_selected (btn.name);
                    return true;
                });
            }

            // Adding individual classes to set color
            btn_white.get_style_context ().add_class ("btn_white");
            btn_black.get_style_context ().add_class ("btn_black");
            btn_pink.get_style_context ().add_class ("btn_pink");
            btn_red.get_style_context ().add_class ("btn_red");
            btn_orange.get_style_context ().add_class ("btn_orange");
            btn_green.get_style_context ().add_class ("btn_green");
            btn_yellow.get_style_context ().add_class ("btn_yellow");
            btn_blue.get_style_context ().add_class ("btn_blue");
            btn_purple.get_style_context ().add_class ("btn_purple");
            btn_coco.get_style_context ().add_class ("btn_coco");
            btn_blue_green.get_style_context ().add_class ("btn_gradient_blue_green");
            btn_purple_red.get_style_context ().add_class ("btn_gradient_purple_red");
            btn_pride.get_style_context ().add_class ("btn_gradient_pride");
            btn_trans_black.get_style_context ().add_class ("btn_trans_dark");
            btn_trans_white.get_style_context ().add_class ("btn_trans_white");
            btn_semitrans_black.get_style_context ().add_class ("btn_semitrans_dark");
            btn_semitrans_white.get_style_context ().add_class ("btn_semitrans_white");
            

            // Adding individual tooltip text
            btn_white.set_tooltip_text (_("White"));
            btn_black.set_tooltip_text (_("Black"));
            btn_pink.set_tooltip_text (_("Pink"));
            btn_red.set_tooltip_text (_("Red"));
            btn_orange.set_tooltip_text (_("Orange"));
            btn_green.set_tooltip_text (_("Green"));
            btn_yellow.set_tooltip_text (_("Yellow"));
            btn_blue.set_tooltip_text (_("Blue"));
            btn_purple.set_tooltip_text (_("Purple"));
            btn_coco.set_tooltip_text (_("Coco"));
            btn_blue_green.set_tooltip_text (_("Blue to Green"));
            btn_purple_red.set_tooltip_text (_("Purple to Red"));
            btn_pride.set_tooltip_text (_("Pride"));
            btn_trans_black.set_tooltip_text (_("Transparent black"));
            btn_trans_white.set_tooltip_text (_("Transparent white"));
            btn_semitrans_black.set_tooltip_text (_("Semi Transparent black"));
            btn_semitrans_white.set_tooltip_text (_("Semi Transparent white"));

            this.attach (img,            0, 0, 6, 1);
            this.attach (label,          0, 1, 6, 1);
            this.attach (separator,      0, 2, 6, 1);

            this.attach (btn_white,      0, 3, 1, 1);
            this.attach (btn_black,      1, 3, 1, 1);
            this.attach (btn_pink,       2, 3, 1, 1);
            this.attach (btn_red,        3, 3, 1, 1);
            this.attach (btn_orange,     4, 3, 1, 1);
            this.attach (btn_yellow,     5, 3, 1, 1);
            this.attach (btn_green,      0, 4, 1, 1);
            this.attach (btn_blue,       1, 4, 1, 1);
            this.attach (btn_purple,     2, 4, 1, 1);
            this.attach (btn_coco,       3, 4, 1, 1);

            this.attach (btn_blue_green, 4, 4, 1, 1);
            this.attach (btn_purple_red, 5, 4, 1, 1);
            this.attach (btn_pride,      0, 5, 1, 1);

            this.attach (btn_trans_white,1, 5, 1, 1);
            this.attach (btn_trans_black,2, 5, 1, 1);

            this.attach (btn_semitrans_white, 3, 5, 1, 1);
            this.attach (btn_semitrans_black, 4, 5, 1, 1);
        }
    }
}