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

            var content = this.window.get_content_area () as Gtk.Box;
            content.add (this.app_view);

            var actions = this.window.get_action_area () as Gtk.Box;
            actions.visible = false;

            this.window.set_default_size (440, 470);
            this.window.set_size_request (440, 470);
            this.application.add_window (window);
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
