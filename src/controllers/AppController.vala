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

using App.Views;
using App.Widgets;

namespace App.Controllers {

    /**
     * The {@code AppController} class.
     *
     * @since 1.0.0
     */
    public class AppController {

        private Gtk.Application            application;
        private AppView                    app_view;
        private Window                     window { get; private set; default = null; } 

        /**
         * Constructs a new {@code AppController} object.
         */
        public AppController (Gtk.Application application) {
            var header = new HeaderBar ();
            
            this.application = application;
            this.window = new Window (this.application);
            this.app_view = new AppView (header);
            this.window.set_titlebar (header);

            //var content = this.window.get_content_area () as Gtk.Box;
            //content.add (this.app_view);
            this.window.add (this.app_view);

            //var actions = this.window.get_action_area () as Gtk.Box;
            //actions.visible = false;

            header.show_shadow.connect ( (shadow) => {
                toogle_shadow (shadow);
            });

            this.window.set_default_size (350, 350);
            this.window.set_size_request (350, 350);
            this.application.add_window (window);
        }

        private void toogle_shadow (bool shadow) {
            if (!shadow) {
                this.window.get_style_context ().add_class ("csd-transparent");
            } else {
                this.window.get_style_context ().remove_class ("csd-transparent");
            }
        }

        public void activate () {
            window.show_all ();
            app_view.activate ();
        }

        public void quit () {
            window.destroy ();
        }
    }
}
