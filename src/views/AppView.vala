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

        CalendarView calendar;
        TwelveGridView months;
        TwelveGridView years;

        /*
         * Data of current date
         */
        private DateTime current_date;
        private int start_day_today;
        private int max_months_day_today;
        private int current_day;
        private int current_month;
        private int current_year;

        /*
         * Data of date on navigate
         */
        private DateTime nav_date;
        private int start_day_nav;
        private int max_months_day_nav;
        private int nav_day;
        private int nav_month;
        private int nav_year;

        private string current_stack = Constants.STACK_CALENDAR;

        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView (App.Widgets.HeaderBar header) {
            this.header = header;
            this.interpolate_size = true;
            this.transition_duration = 200;
            this.transition_type = StackTransitionType.SLIDE_RIGHT;

            current_date = new DateTime.now_local ();
            nav_date     = new DateTime.now_local ();

            // Containers
            get_info_date (current_date,
                           out start_day_today, 
                           out max_months_day_today,
                           out current_day,
                           out current_month,
                           out current_year);

            print(@"\nstart_day_today $start_day_today
                    \nmax_months_day_today $max_months_day_today
                    \ncurrent_day $current_day
                    \ncurrent_month $current_month
                    \ncurrent_year $current_year");

            calendar = new CalendarView ();
            months   = new TwelveGridView (Month.all());
            years    = new TwelveGridView (list_of_years(current_year));

            calendar.fill_grid_days(start_day_today, max_months_day_today, current_day);
            modify_date_by_month (0);
            
            /*
             * Detect all signals from HeaderBar
            */

            header.today_clicked.connect (() => {

                nav_date = new DateTime.now_local ();

                get_info_date (nav_date,
                           out start_day_nav, 
                           out max_months_day_nav,
                           out nav_day,
                           out nav_month,
                           out nav_year);

                header.change_main_text ( generare_mm_yyyy (nav_month, nav_year) );
                calendar.fill_grid_days(start_day_nav, max_months_day_nav, nav_day);
                this.set_visible_child_name (Constants.STACK_CALENDAR);
                current_stack = Constants.STACK_CALENDAR;
            });

            header.prev.connect ( () => {
                switch (current_stack) {
                    case Constants.STACK_CALENDAR:
                        modify_date_by_month (-1);
                        break;
                    case Constants.STACK_MONTHS:
                        modify_date_by_years (-1);
                        break;
                    case Constants.STACK_YEARS:
                        break;
                    default:
                        break;
                }
            });

            header.next.connect ( () => {
                switch (current_stack) {
                    case Constants.STACK_CALENDAR:
                        modify_date_by_month (1);
                        break;
                    case Constants.STACK_MONTHS:
                        modify_date_by_years (1);
                        break;
                    case Constants.STACK_YEARS:
                        break;
                    default:
                        break;
                }
            });

            header.main_btn.connect ( () => {
                switch (current_stack) {
                    case Constants.STACK_CALENDAR:
                        header.change_main_text ( nav_year.to_string () );
                        this.set_visible_child_name (Constants.STACK_MONTHS);
                        current_stack = Constants.STACK_MONTHS;
                        break;
                    case Constants.STACK_MONTHS:
                        header.change_main_text ( generare_yyyy_yyyy (nav_year) );
                        years.fill_grid ( generare_year_list (nav_year) );
                        this.set_visible_child_name (Constants.STACK_YEARS);
                        current_stack = Constants.STACK_YEARS;
                        break;
                    case Constants.STACK_YEARS:
                        header.change_main_text ( generare_mm_yyyy (nav_month, nav_year) );
                        this.set_visible_child_name (Constants.STACK_CALENDAR);
                        current_stack = Constants.STACK_CALENDAR;
                        break;
                    default:
                        header.change_main_text ( nav_year.to_string () );
                        this.set_visible_child_name (Constants.STACK_CALENDAR);
                        current_stack = Constants.STACK_CALENDAR;
                        break;
                }
            });

            this.add_named (calendar, Constants.STACK_CALENDAR);
            this.add_named (years, Constants.STACK_YEARS);
            this.add_named (months, Constants.STACK_MONTHS);
        }

        private void modify_date_by_month (int num) {
            
            nav_date = nav_date.add_months(num);

            get_info_date (nav_date,
                           out start_day_nav, 
                           out max_months_day_nav,
                           out nav_day,
                           out nav_month,
                           out nav_year);

            if ( compare_actual_date () ) {
                calendar.fill_grid_days(start_day_nav, max_months_day_nav, nav_day);
            } else {
                calendar.fill_grid_days(start_day_nav, max_months_day_nav, -1);
            }

            header.change_main_text (generare_mm_yyyy (nav_month, nav_year) );
        }

        private void modify_date_by_years (int num) {
            nav_date = nav_date.add_years(num);

            get_info_date (nav_date,
                           out start_day_nav, 
                           out max_months_day_nav,
                           out nav_day,
                           out nav_month,
                           out nav_year);

            if ( compare_actual_date () ) {
                calendar.fill_grid_days(start_day_nav, max_months_day_nav, nav_day);
            } else {
                calendar.fill_grid_days(start_day_nav, max_months_day_nav, -1);
            }
            
            header.change_main_text ( nav_year.to_string() );
        }

        private bool compare_actual_date () {
            bool equal = true;
            equal = nav_day == current_day &&
                    nav_month == current_month &&
                    nav_year == current_year;
            return equal;
        }

        private string generare_mm_yyyy (int month, int year) {
            string m = Month.from_number (month);
            return @"$m  $(year.to_string())";
        }

        private string generare_yyyy_yyyy (int year) {
            string year_min = (year-1).to_string ();
            string year_max = (year+10).to_string ();
            return @"$year_min - $year_max";
        }

        private List<string> generare_year_list (int year) {
            List<string> list = new List<string>();
            int y_start = year - 1;
            int y_end = year + 11;
            for (int i = y_start ; i < y_end; i++) {
                list.append(i.to_string());
            }
            return list;
        }

        private void get_info_date (DateTime date_time,
                                    out int start_day, 
                                    out int max_months_day,
                                    out int day,
                                    out int month,
                                    out int year) {
            // Today date DD/MM/YYY
            date_time.get_ymd (out year, out month, out day); 

            // Get first week of month and start day
            // (1 is Monday, 2 is Tuesday... 7 is Sunday).
            // -1 to ensure that grid shows it in correct position
            var firts_week = new DateTime.local (year, month, 1, 0, 0, 0);
            start_day = firts_week.get_day_of_week () - 1;

            // Get max of days in current month
            max_months_day = Date.get_days_in_month (int_to_DateMont(month), (GLib.DateYear) year);
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
