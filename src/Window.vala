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
using App.Controllers;
using App.Views;
using App.Enums;

namespace App {

    /**
     * Class responsible for creating the u window and will contain contain other widgets. 
     * allowing the user to manipulate the window (resize it, move it, close it, ...).
     *
     * @see Gtk.ApplicationWindow
     * @since 1.0.0
     */
    public class Window : Gtk.Window {
         
        /**
         * Constructs a new {@code Window} object.
         *
         * @see App.Configs.Constants
         * @see style_provider
         * @see build
         */

        private App.Configs.Settings settings;
        
        public Window (Gtk.Application app) {
            Object (
                application: app,
                icon_name: Constants.APP_ICON,
                resizable: false
            );
            get_style_context ().add_class ("widget_background");
            
            set_keep_below (true);
            stick ();

            settings = App.Configs.Settings.get_instance ();
            int x = settings.window_x;
            int y = settings.window_y;
            string css = settings.color;

            if (x != -1 && y != -1) {
                move (x, y);
            }

            var css_provider = new Gtk.CssProvider ();
            var css_path = Color.string_to_css_path (css);
            css_provider.load_from_resource (css_path);
            
            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (),
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );

            // Handle dragging the entire widget
            button_press_event.connect ((e) => {
                if (e.button == Gdk.BUTTON_PRIMARY) {
                    begin_move_drag ((int) e.button, (int) e.x_root, (int) e.y_root, e.time);
                    return true;
                }
                return false;
            });
        }

        public override bool configure_event (Gdk.EventConfigure event) {
            int root_x, root_y;
            get_position (out root_x, out root_y);
            settings.window_x = root_x;
            settings.window_y = root_y;
    
            return base.configure_event (event);
        }
    }
}
