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
namespace App.Views {
    public class CalendarView : Gtk.Grid {
        public CalendarView () {

            var label_monday = new Label(Day.MONDAY.to_string());
            var label_tuesday = new Label(Day.TUESDAY.to_string());
            var label_wednesday = new Label(Day.WEDNESDAY.to_string());
            var label_thursday = new Label(Day.THURSDAY.to_string());
            var label_friday = new Label(Day.FRIDAY.to_string());
            var label_saturday = new Label(Day.SATURDAY.to_string());
            var label_sunday = new Label(Day.SUNDAY.to_string());

            label_monday.hexpand = true;
            label_tuesday.hexpand = true;
            label_wednesday.hexpand = true;
            label_thursday.hexpand = true;
            label_friday.hexpand = true;
            label_saturday.hexpand = true;
            label_sunday.hexpand = true;

            label_monday.get_style_context ().add_class ("day-header");
            label_tuesday.get_style_context ().add_class ("day-header");
            label_wednesday.get_style_context ().add_class ("day-header");
            label_thursday.get_style_context ().add_class ("day-header");
            label_friday.get_style_context ().add_class ("day-header");
            label_saturday.get_style_context ().add_class ("day-header");
            label_sunday.get_style_context ().add_class ("day-header");
            /*
             * Grid that contains any number of days
             * day_of_week is the start day(m,t,w,t,f,s,s) of month
             * end_day is the final number day
             */
            var day_grid = new Grid ();
            int week = 1; // number of week
            int day_of_week = 0; // Day 0 is monday
            int end_day = 31; // Days of a month

            /*
             * All days in interation to add a new button
             */
            for (int i = 0; i < end_day; i++) {
                var day_number = i + 1;
                var label_day = new Label(day_number.to_string());
                label_day.get_style_context ().add_class ("label-day");
                label_day.expand = true;
                label_day.halign = Align.CENTER;
                label_day.valign = Align.CENTER;

                // Dectect current day
                if (i == 16) {
                    label_day.get_style_context ().add_class ("label-today");
                }
                
                day_grid.attach (label_day, day_of_week, week, 1, 1);
                
                day_of_week++;
                //print("\nDay: " + day_of_week.to_string() + " Week: " + week.to_string());
                if (day_of_week % 7 == 0) {
                    week++;
                    day_of_week = 0;
                }
            }

            this.attach (label_monday, 0, 1, 1, 1);
            this.attach (label_tuesday, 1, 1, 1, 1);
            this.attach (label_wednesday, 2, 1, 1, 1);
            this.attach (label_thursday, 3, 1, 1, 1);
            this.attach (label_friday, 4, 1, 1, 1);
            this.attach (label_saturday, 5, 1, 1, 1);
            this.attach (label_sunday, 6, 1, 1, 1);
            this.attach (day_grid, 0, 2, 7, 1);
        }
    }
}