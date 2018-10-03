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
     * The {@code DaysRow} class. Contains a row of labels with days
     *
     * @since 1.0.0
     */

    using Gtk;
    using App.Enums;

    namespace App.Views {
        public class DaysRow : Grid {
            public DaysRow () {
                this.margin_top = 5;
                this.margin_bottom = 5;
                this.column_homogeneous = true;
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

                this.attach (label_monday, 0, 1, 1, 1);
                this.attach (label_tuesday, 1, 1, 1, 1);
                this.attach (label_wednesday, 2, 1, 1, 1);
                this.attach (label_thursday, 3, 1, 1, 1);
                this.attach (label_friday, 4, 1, 1, 1);
                this.attach (label_saturday, 5, 1, 1, 1);
                this.attach (label_sunday, 6, 1, 1, 1);
            }
        }
    }