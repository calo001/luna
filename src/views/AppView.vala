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

using App.Configs;

namespace App.Views {

    /**
     * The {@code AppView} class.
     *
     * @since 1.0.0
     */
    public class AppView : Gtk.Box {

        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView () {
            
            // Containers
            var grid = new Gtk.Grid ();
            grid.column_spacing = 12;
            grid.margin_bottom = 6;
            grid.margin_left = 18;
            grid.margin_right = 18;
            grid.valign = Gtk.Align.CENTER;

            var starting_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
            starting_box.halign = Gtk.Align.END;
            starting_box.hexpand = true;

            var buttons_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 6);
            buttons_box.halign = Gtk.Align.END;
            buttons_box.hexpand = true;

            // Widgets
            var welcome_label = new Gtk.Label (_("Welcome"));
            welcome_label.get_style_context ().add_class ("h1");
            
            var get_started_label = new Gtk.Label (_("Get Started"));
            get_started_label.get_style_context ().add_class ("h3");

            var valadoc_button = new Gtk.Button.from_icon_name ("text-x-vala");
            valadoc_button.tooltip_text = _("The canonical source for Vala API references.");
            valadoc_button.clicked.connect (() => {
                try {
                    AppInfo.launch_default_for_uri ("https://valadoc.org/", null);
                } catch (Error e) {
                    warning (e.message);
                }
            });

            var elementary_button = new Gtk.Button.from_icon_name ("distributor-logo");
            elementary_button.tooltip_text = _("Read up on developing for elementary");
            elementary_button.clicked.connect (() => {
                try {
                    AppInfo.launch_default_for_uri ("https://elementary.io/", null);
                } catch (Error e) {
                    warning (e.message);
                }
            });

            buttons_box.add (valadoc_button);
            buttons_box.add (elementary_button);

            starting_box.add (get_started_label);
            starting_box.add (buttons_box);
            
            grid.attach (welcome_label, 0, 0);
            grid.attach (starting_box, 1, 0);
            this.add (grid);
        }
    }
}
