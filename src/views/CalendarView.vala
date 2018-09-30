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
     * The {@code CalendarView} class. Show a grid for days in a month
     *
     * @since 1.0.0
     */

using Gtk;
using App.Enums;
using App.Configs;
using App.Widgets;

namespace App.Views {
    public class CalendarView : Box {

        private static List<DayItem> labels;
        private Grid day_grid;
        private Hemisphere hemisphere;

        public CalendarView () {
            this.orientation = Gtk.Orientation.VERTICAL;
            this.hemisphere = Hemisphere.NONE;
            int max_labels = 42;
            var days_header = new DaysRow();

            get_location.begin ();
            
            /*
             * Grid that contains any number of days
             * day_of_week is the start day(m,t,w,t,f,s,s) of month
             * end_day is the final number day
             */
            day_grid = new Grid ();
            
            var col = 0;
            var row = 0;

            for (int i = 0; i < max_labels; i++) {
                var label_day = new DayItem("");
                //label_day.get_style_context ().add_class ("label-day");
                //label_day.expand = true;
                //label_day.halign = Align.CENTER;
                //label_day.valign = Align.START;

                day_grid.attach (label_day, col, row, 1, 1);
                col++;
                if (col != 0 && col % 7 == 0) {
                    row++;
                    col = 0;
                }
                labels.append(label_day);
            }

            this.pack_start (days_header);
            this.pack_end (day_grid);
        }

        public async void get_location () {
            try {
                var simple = yield new GClue.Simple (Constants.ID, GClue.AccuracyLevel.CITY, null);

                simple.notify["location"].connect (() => {
                    on_location_updated (simple.location.latitude, simple.location.longitude);
                });
    
                on_location_updated (simple.location.latitude, simple.location.longitude);
                
            } catch (Error e) {
                warning ("Failed to connect to GeoClue2 service: %s", e.message);
                return;
            }
        }

        public void on_location_updated (double latitude, double longitude) {
            var lat = latitude;
            print (@"\nLatitude: $lat\n");
        }

        public void fill_grid_days (int start_day, int max_day, int current_day) {
            /*
             * All days in interation to add a new Label
             */
            var day_number = 1;

            for (int i = 0; i < 42; i++) {
                DayItem label = labels.nth_data (i);
                //label.get_style_context ().remove_class ("label-today");
                label.toogle_label_today (false);
                label.visible = true;
                /*
                 * max_day + start_day, it is necessary to 
                 * find the correct label in list
                 */
                if (i < start_day || i >= max_day + start_day) {
                    print ("\nMe pongo invisible");
                    label.visible = false;
                } else {
                
                    /*
                     * current_day + start_day, it is necessary to 
                     * find the correct label in list
                     */
                    if ( current_day != -1 && (i+1) == current_day + start_day ) {
                        //label.get_style_context ().add_class ("label-today");
                        label.toogle_label_today (true);
                    }
                    //label.set_label (day_number.to_string());
                    label.change_day (day_number.to_string());
                    day_number++;
                }
            }
        }
    }
}