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
using App.Views;
using App.Enums;
using Gtk;

namespace App.Views {

    /**
     * The {@code AppView} class.
     *
     * @since 1.0.0
     */
    public class AppView : Gtk.Stack {

        private App.Widgets.HeaderBar header;
        private int start_day_today;
        private int max_months_day_today;
        private int current_day;
        private int current_year;

        private string current_stack = Constants.STACK_CALENDAR;

        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView (App.Widgets.HeaderBar header) {
            this.header = header;
            this.transition_type = StackTransitionType.SLIDE_RIGHT;
            // Containers
            get_current_date (out start_day_today, 
                              out max_months_day_today,
                              out current_day,
                              out current_year);

            print(@"\nstart_day_today $start_day_today
                    \nmax_months_day_today $max_months_day_today
                    \ncurrent_day $current_day");

            var calendar = new CalendarView (start_day_today, max_months_day_today, current_day);
            var months = new TwelveGridView (Month.all());
            var years = new TwelveGridView (list_of_years(2018));

            calendar.fill_grid_days(start_day_today, max_months_day_today, current_day);
            // Detect signals
            header.prev.connect ( () => {
                calendar.fill_grid_days(6, 31, -1);
            });

            header.next.connect ( () => {
                calendar.fill_grid_days(2, 29, -1);
            });

            header.main_btn.connect ( () => {
                switch (current_stack) {
                    case Constants.STACK_CALENDAR:
                        this.set_visible_child_name (Constants.STACK_MONTHS);
                        current_stack = Constants.STACK_MONTHS;
                        break;
                    case Constants.STACK_MONTHS:
                        this.set_visible_child_name (Constants.STACK_YEARS);
                        current_stack = Constants.STACK_YEARS;
                        break;
                    case Constants.STACK_YEARS:
                        this.set_visible_child_name (Constants.STACK_CALENDAR);
                        current_stack = Constants.STACK_CALENDAR;
                        break;
                    default:
                        this.set_visible_child_name (Constants.STACK_CALENDAR);
                        current_stack = Constants.STACK_CALENDAR;
                        break;
                }
            });

            this.add_named (calendar, Constants.STACK_CALENDAR);
            this.add_named (years, Constants.STACK_YEARS);
            this.add_named (months, Constants.STACK_MONTHS);
        }

        private void get_current_date (out int start_day_today, 
                                       out int max_months_day_today,
                                       out int current_day,
                                       out int current_year) {
            // Today date DD/MM/YYY
            var current_date = new DateTime.now_local ();
            int current_month;
            int current_d;
            current_date.get_ymd (out current_year, out current_month, out current_d);
            current_day = current_d - 1; 

            // Get first week of month and start day
            // (1 is Monday, 2 is Tuesday... 7 is Sunday).
            // -1 to ensure that grid shows it in correct position
            var firts_week = new DateTime.local (current_year, current_month, 1, 0, 0, 0);
            start_day_today = firts_week.get_day_of_week () - 1;

            // Get max of days in current month
            max_months_day_today = Date.get_days_in_month (int_to_DateMont(current_month), (GLib.DateYear) current_year);
        }

        private DateMonth int_to_DateMont (int month) {
            switch (month) {
                case 1: return DateMonth.JANUARY;
                case 2: return DateMonth.FEBRUARY;
                case 3: return DateMonth.MARCH;
                case 4: return DateMonth.APRIL;
                case 5: return DateMonth.MAY;
                case 6: return DateMonth.JUNE;
                case 7: return DateMonth.JULY;
                case 8: return DateMonth.AUGUST;
                case 9: return DateMonth.SEPTEMBER;
                case 10: return DateMonth.OCTOBER;
                case 11: return DateMonth.NOVEMBER;
                case 12: return DateMonth.DECEMBER;
                default: return DateMonth.BAD_MONTH;
            }
        }

        private List<string> list_of_years (int year) {
            List<string> years = new List<string> ();
            int min_year = year - 1;
            int max_year = year + 11;
            for (int i = min_year; i < max_year; i++) {
                years.append (i.to_string());
            }
            return years;
        }
    }
}
