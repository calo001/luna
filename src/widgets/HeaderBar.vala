/*
* Copyright (C) 2018  Calo001 <calo_lrc@hotmail.com>
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

using Gtk;
using App.Configs;
using App.Views;
using App.Enums;

namespace App.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        public signal void today_clicked ();
        public signal void prev ();
        public signal void next ();
        public signal void main_btn ();
        public signal void show_shadow (bool shadow);

        public Button menu_button { get; private set; }
        public Button today_button { get; private set; }
        public Button btn_prev { get; private set; }
        public Button btn_next { get; private set; }
        public Button btn_main { get; private set; }
        public Box box_buttons  { get; private set; }
        public Box box_header  { get; private set; }
        
        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see App.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {

            /*
            * Menu colors
            */
            menu_button = new Button.from_icon_name ("view-more-symbolic", IconSize.SMALL_TOOLBAR);
            menu_button.tooltip_text = _("Colors");

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

            menu_button.focus_out_event.connect (() => {
                popup.set_visible (false);
                return true;
            });

            today_button = new Button.from_icon_name ("office-calendar-symbolic", IconSize.SMALL_TOOLBAR);
            today_button.tooltip_text = _("Go today");

            today_button.clicked.connect (() => {
                today_clicked ();
            });
            
            /*
            * Linked buttons
            */
            btn_prev = new Button.from_icon_name ("pan-start-symbolic", IconSize.MENU);
            btn_next = new Button.from_icon_name ("pan-end-symbolic", IconSize.MENU);
            btn_main = new Button.with_label ("");

            btn_prev.clicked.connect ( () => {
                prev();
            });

            btn_next.clicked.connect ( () => {
                next();
            });

            btn_main.clicked.connect ( () => {
                main_btn();
            });

            //btn_prev.get_style_context ().remove_class ("image-button");
            //btn_next.get_style_context ().remove_class ("image-button");
            btn_prev.width_request = 35;
            btn_next.width_request = 35;
            btn_main.width_request = 200;
            btn_main.get_style_context ().add_class ("btn-header");
            btn_main.get_style_context ().add_class ("h2");
            btn_prev.get_style_context ().add_class ("btn-header");
            btn_next.get_style_context ().add_class ("btn-header");

            /*
            * Box for Linked buttons
            */
            box_buttons = new Box(Orientation.HORIZONTAL, 0);
            box_buttons.margin = 10;
            box_buttons.get_style_context ().add_class (STYLE_CLASS_LINKED);
            
            box_buttons.pack_start (btn_prev);
            box_buttons.pack_start (btn_main);
            box_buttons.pack_start (btn_next);

            /*
            * Adding custom title to HeaderBar
            */
            this.pack_start (today_button);
            this.pack_end (menu_button);
            this.set_custom_title (box_buttons);
        }

        private void change_color (string color) {
            var settings = App.Configs.Settings.get_instance ();
            var css_provider = new Gtk.CssProvider ();
            var url_css = Constants.URL_CSS_WHITE;

            if (color == Color.WHITE.to_string ()) {
                url_css =  Constants.URL_CSS_WHITE;
                show_shadow (true);
            } else if (color == Color.BLACK.to_string ()) {
                url_css =  Constants.URL_CSS_DARK;
                show_shadow (true);
            } else if (color == Color.PINK.to_string ()) {
                url_css =  Constants.URL_CSS_PINK;
                show_shadow (true);
            } else if (color == Color.RED.to_string ()) {
                url_css =  Constants.URL_CSS_RED;
                show_shadow (true);
            } else if (color == Color.ORANGE.to_string ()) {
                url_css =  Constants.URL_CSS_ORANGE;
                show_shadow (true);
            } else if (color == Color.YELLOW.to_string ()) {
                url_css =  Constants.URL_CSS_YELLOW;
                show_shadow (true);
            } else if (color == Color.GREEN.to_string ()) {
                url_css =  Constants.URL_CSS_GREEN;
                show_shadow (true);
            } else if (color == Color.BLUE.to_string ()) {
                url_css =  Constants.URL_CSS_BLUE;
                show_shadow (true);
            } else if (color == Color.PURPLE.to_string ()) {
                url_css =  Constants.URL_CSS_PURPLE;
                show_shadow (true);
            } else if (color == Color.COCO.to_string ()) {
                url_css =  Constants.URL_CSS_COCO;
                show_shadow (true);
            } else if (color == Color.GRADIENT_BLUE_GREEN.to_string ()) {
                url_css =  Constants.URL_CSS_GRADIENT_BLUE_GREEN;
                show_shadow (true);
            } else if (color == Color.GRADIENT_PURPLE_RED.to_string ()) {
                url_css =  Constants.URL_CSS_GRADIENT_PURPLE_RED;
                show_shadow (true);
            } else if (color == Color.GRADIENT_PRIDE.to_string ()) {
                url_css =  Constants.URL_CSS_PRIDE;
                show_shadow (true);
            } else if (color == Color.TRANS_WHITE.to_string ()) {
                url_css =  Constants.URL_CSS_LIGHT_TRANS;
                show_shadow (false);
            } else if (color == Color.TRANS_BLACK.to_string ()) {
                url_css =  Constants.URL_CSS_DARK_TRANS;
                show_shadow (false);
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

        public void change_main_text (string txt_header) {
            btn_main.label = txt_header;
        }
    }
}