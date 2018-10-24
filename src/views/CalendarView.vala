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

        private static List<Label> labels;
        private Grid day_grid;

        public CalendarView () {
            this.orientation = Gtk.Orientation.VERTICAL;
            int max_labels = 42;
            var days_header = new DaysRow();
            
            /*
             * Grid that contains any number of days
             * day_of_week is the start day(m,t,w,t,f,s,s) of month
             * end_day is the final number day
             */
            day_grid = new Grid ();
            day_grid.column_homogeneous = true;
            day_grid.row_homogeneous = false;
            
            var col = 0;
            var row = 0;

            for (int i = 0; i < max_labels; i++) {
                var label_day = new Label("");
                label_day.width_request = 42;
                label_day.height_request = 42;
                label_day.get_style_context ().add_class ("label-day");
                //label_day.expand = false;
                label_day.halign = Align.CENTER;
                label_day.valign = Align.CENTER;

                day_grid.attach (label_day, col, row, 1, 1);
                col++;
                if (col != 0 && col % 7 == 0) {
                    row++;
                    col = 0;
                }
                label_day.no_show_all = true;
                labels.append(label_day);
            }

            this.pack_start (days_header);
            this.pack_end (day_grid);
        }

        public void fill_grid_days (int start_day, int max_day, int current_day) {
            /*
             * All days in interation to add a new Label
             */
            var day_number = 1;

            for (int i = 0; i < 42; i++) {
                Label label = labels.nth_data (i);
                label.get_style_context ().remove_class ("day-empty");
                label.get_style_context ().remove_class ("label-today");
                label.visible = true;
                /*
                 * max_day + start_day, it is necessary to 
                 * find the correct label in list
                 */
                if (i < start_day || i >= max_day + start_day) {
                    print ("\nMe pongo invisible");
                    label.get_style_context ().add_class ("day-empty");
                    label.visible = false;
                } else {
                    /*
                     * current_day + start_day, it is necessary to 
                     * find the correct label in list
                     */
                    if ( current_day != -1 && (i+1) == current_day + start_day ) {
                        label.get_style_context ().add_class ("label-today");
                    }
                    //label.set_label (day_number.to_string());
                    label.label = day_number.to_string();
                    day_number++;
                }
            }
        }
    }
}