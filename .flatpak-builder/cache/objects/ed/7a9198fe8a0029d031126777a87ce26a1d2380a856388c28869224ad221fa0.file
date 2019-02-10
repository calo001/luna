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
            this.window.add (this.app_view);
            this.application.add_window (window);

            this.app_view.close_clicked.connect( ()=> {
                quit ();
            });
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
