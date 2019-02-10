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
 * The {@code Bottom} class. Contains a bottombar for calendar widget
 *
 * @since 1.0.0
 */
using Gtk;
using App.Enums;
using App.Configs;

namespace App.Views {
    public class BottomBar : Box {
        public signal void today_clicked ();
        public signal void close_clicked ();

        public Button menu_button { get; private set; }
        public Button close_button { get; private set; }
        public Button today_button { get; private set; }
        
        public BottomBar () {
            get_style_context ().add_class ("buttombar");
            
            /*
            * Menu colors
            */
            menu_button = new Button.from_icon_name ("view-more-horizontal-symbolic", LARGE_TOOLBAR );
            menu_button.tooltip_text = _("Colors");
            menu_button.get_style_context ().add_class ("flat");
            menu_button.margin = 8;

            close_button = new Button.from_icon_name ("window-close-symbolic", LARGE_TOOLBAR );
            close_button.tooltip_text = _("Close");
            close_button.get_style_context ().add_class ("flat");
            close_button.margin = 8;

            var popup = new Popover(menu_button);
            popup.position = Gtk.PositionType.BOTTOM;
            popup.modal = false;

            var colors = new ColorSelector ();
            colors.show_all ();
            popup.add (colors);

            colors.color_selected.connect ( (color) => {
                change_color (color);
                toggle_popup (popup);
            });
            
            menu_button.clicked.connect (() => {
                toggle_popup (popup);
            });

            close_button.clicked.connect (() => {
                close_clicked ();
            });

            menu_button.focus_out_event.connect (() => {
                popup.set_visible (false);
                return true;
            });

            today_button = new Button.with_label (_("Go today"));
            today_button.margin = 8;
            today_button.get_style_context ().add_class ("gotoday");
            today_button.clicked.connect (() => {
                today_clicked ();
            });

            pack_start (close_button);
            pack_start (today_button);
            pack_end (menu_button);
        }

        private void change_color (string color) {
            var settings = App.Configs.Settings.get_instance ();
            var css_provider = new Gtk.CssProvider ();
            var url_css = Constants.URL_CSS_WHITE;

            if (color == Color.WHITE.to_string ()) {
                url_css =  Constants.URL_CSS_WHITE;
            } else if (color == Color.BLACK.to_string ()) {
                url_css =  Constants.URL_CSS_DARK;
            } else if (color == Color.PINK.to_string ()) {
                url_css =  Constants.URL_CSS_PINK;
            } else if (color == Color.RED.to_string ()) {
                url_css =  Constants.URL_CSS_RED;
            } else if (color == Color.ORANGE.to_string ()) {
                url_css =  Constants.URL_CSS_ORANGE;
            } else if (color == Color.YELLOW.to_string ()) {
                url_css =  Constants.URL_CSS_YELLOW;
            } else if (color == Color.GREEN.to_string ()) {
                url_css =  Constants.URL_CSS_GREEN;
            } else if (color == Color.TEAL.to_string ()) {
                url_css =  Constants.URL_CSS_TEAL;
            } else if (color == Color.BLUE.to_string ()) {
                url_css =  Constants.URL_CSS_BLUE;
            } else if (color == Color.PURPLE.to_string ()) {
                url_css =  Constants.URL_CSS_PURPLE;
            } else if (color == Color.COCO.to_string ()) {
                url_css =  Constants.URL_CSS_COCO;
            } else if (color == Color.GRADIENT_BLUE_GREEN.to_string ()) {
                url_css =  Constants.URL_CSS_GRADIENT_BLUE_GREEN;
            } else if (color == Color.GRADIENT_PURPLE_RED.to_string ()) {
                url_css =  Constants.URL_CSS_GRADIENT_PURPLE_RED;
            } else if (color == Color.GRADIENT_PRIDE.to_string ()) {
                url_css =  Constants.URL_CSS_PRIDE;
            } else if (color == Color.TRANS_WHITE.to_string ()) {
                url_css =  Constants.URL_CSS_LIGHT_TRANS;
            } else if (color == Color.TRANS_BLACK.to_string ()) {
                url_css =  Constants.URL_CSS_DARK_TRANS;
            } else if (color == Color.SEMITRANS_WHITE.to_string ()) {
                url_css =  Constants.URL_CSS_LIGHT_SEMITRANS;
            } else if (color == Color.SEMITRANS_BLACK.to_string ()) {
                url_css =  Constants.URL_CSS_DARK_SEMITRANS;
            } else {
                settings.color = Color.WHITE.to_string ();
                url_css =  Constants.URL_CSS_WHITE;
            }

            settings.color = color;

            css_provider.load_from_resource (url_css);
            
            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (),
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );
        }

        private void toggle_popup (Popover popover) {
            if (popover.is_visible()) {
                popover.set_visible (false);
            } else {
                popover.set_visible (true);
            }
        }
    }
}