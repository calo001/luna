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

namespace App.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        public signal void menu_clicked ();
        public signal void today_clicked ();
        public signal void prev();
        public signal void next();
        public signal void main_btn();

        public MenuButton menu_button { get; private set; }
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
            //get_style_context ().add_class ("transition");
            //get_style_context ().add_class (STYLE_CLASS_FLAT);
            //get_style_context ().add_class ("default-decoration");

            /*
            * Menu colors
            */
            menu_button = new Gtk.MenuButton ();
            menu_button.set_image (new Gtk.Image .from_icon_name ("open-menu-symbolic", Gtk.IconSize.SMALL_TOOLBAR));
            menu_button.tooltip_text = _("Settings");
            
            menu_button.clicked.connect (() => {
                menu_clicked ();
            });

            /*
            * Menu colors
            */
            today_button = new Button.from_icon_name ("go-jump-rtl-symbolic", IconSize.SMALL_TOOLBAR);
            
            today_button.clicked.connect (() => {
                var css_provider = new Gtk.CssProvider ();
                css_provider.load_from_resource (Constants.URL_CSS_DARK);
            
                Gtk.StyleContext.add_provider_for_screen (
                    Gdk.Screen.get_default (),
                    css_provider,
                    Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
                );

                today_clicked ();
            });
            
            /*
            * Linked buttons
            */
            btn_prev = new Button.from_icon_name ("pan-start-symbolic", IconSize.MENU);
            btn_next = new Button.from_icon_name ("pan-end-symbolic", IconSize.MENU);
            btn_main = new Button.with_label ("September 2018");

            btn_prev.clicked.connect ( () => {
                prev();
            });

            btn_next.clicked.connect ( () => {
                next();
            });

            btn_main.clicked.connect ( () => {
                main_btn();
            });

            btn_prev.get_style_context ().remove_class ("image-button");
            btn_next.get_style_context ().remove_class ("image-button");
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
    }
}