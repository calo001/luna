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
        public signal void month_btn ();
        public signal void year_btn ();

        public Button menu_button { get; private set; }
        public Button today_button { get; private set; }
        public Button btn_prev { get; private set; }
        public Button btn_next { get; private set; }
        public Button btn_year { get; private set; }
        public Button btn_month { get; private set; }
        private Box main_box;
        public Box box_buttons  { get; private set; }
        public Box box_header  { get; private set; }
        
        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see App.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
            get_style_context ().add_class ("transition");
            
            /*
            * Linked buttons
            */
            btn_prev = new Button.from_icon_name ("pan-start-symbolic", IconSize.MENU);
            btn_next = new Button.from_icon_name ("pan-end-symbolic", IconSize.MENU);
            btn_month = new Button.with_label ("Febrary");
            btn_year = new Button.with_label ("2019");

            btn_prev.clicked.connect ( () => {
                prev();
            });

            btn_next.clicked.connect ( () => {
                next();
            });

            btn_month.clicked.connect ( () => {
                month_btn();
            });

            btn_year.clicked.connect ( () => {
                year_btn();
            });

            // Mainbox
            main_box = new Box(Gtk.Orientation.VERTICAL, 0);
            btn_year.get_style_context ().add_class ("btn-header");
            btn_year.get_style_context ().add_class ("h2");
            btn_month.get_style_context ().add_class ("btn-header");
            btn_month.get_style_context ().add_class ("h1");
            main_box.margin_top = 6;
            main_box.margin_bottom = 6;
            btn_year.expand = true;
            btn_month.expand = true;

            main_box.add (btn_year);
            main_box.add (btn_month);
            
            // Navigation
            btn_prev.get_style_context ().add_class ("btn-header");
            btn_next.get_style_context ().add_class ("btn-header");

            /*
            * Box for Linked buttons
            */
            box_buttons = new Box(Orientation.HORIZONTAL, 0);
            box_buttons.expand = true;
            box_buttons.get_style_context ().add_class (STYLE_CLASS_LINKED);
            box_buttons.get_style_context ().add_class ("topbar");
            
            box_buttons.pack_start (btn_prev);
            box_buttons.pack_start (main_box);
            box_buttons.pack_start (btn_next);

            /*
            * Adding custom title to HeaderBar
            */
            //this.pack_start (today_button);
            //this.pack_end (menu_button);
            this.set_custom_title (box_buttons);
        }

        public void change_main_text (string? year, string? month) {
            if (year != null) {
                btn_year.label = year;
            }
            if (month != null) {
                btn_month.label = month;
            }
        }
    }
}
