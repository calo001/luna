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

        /*
         * This var is used to navigate in year interval 
         * in year stock
         */
        private int nav_year_interval;

        private string current_stack = Constants.STACK_CALENDAR;

        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView (App.Widgets.HeaderBar header) {
            this.header = header;
            this.interpolate_size = true;
            this.transition_duration = 200;
            this.transition_type = StackTransitionType.SLIDE_RIGHT;

            // Current date and navigation date are determinated
            // Current date only change depends the local time
            // Navigation date change on avery interaction with this widget
            current_date = new DateTime.now_local ();
            nav_date     = new DateTime.now_local ();

            // Get the basic data from current date
            get_info_date (current_date,
                           out start_day_today, 
                           out max_months_day_today,
                           out current_day,
                           out current_month,
                           out current_year);

            // Setup the views for used in Stock
            calendar = new CalendarView ();
            months   = new TwelveGridView (Month.all());
            years    = new TwelveGridView (generare_year_list(current_year));

            // This method is used in constructor because is used
            // for update the headerbar and setup current date in calendarview
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
                        modify_year_interval (-1);
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
                        modify_year_interval (1);
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
                        nav_year_interval = nav_year;
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
                        header.change_main_text ( generare_mm_yyyy (nav_month, nav_year) );
                        this.set_visible_child_name (Constants.STACK_CALENDAR);
                        current_stack = Constants.STACK_CALENDAR;
                        break;
                }
            });

            months.option_click.connect ( (name, value)=>{
                int new_month = int.parse (name);

                nav_date = new DateTime.local (nav_year, new_month, 1, 0, 0, 0);

                get_info_date (nav_date,
                           out start_day_nav, 
                           out max_months_day_nav,
                           out nav_day,
                           out nav_month,
                           out nav_year);

                if ( compare_actual_month_year () ) {
                    nav_day = current_day;
                    calendar.fill_grid_days(start_day_nav, max_months_day_nav, nav_day);
                } else {
                    calendar.fill_grid_days(start_day_nav, max_months_day_nav, -1);
                }

                header.change_main_text ( generare_mm_yyyy (nav_month, nav_year) );
                this.set_visible_child_name (Constants.STACK_CALENDAR);
                current_stack = Constants.STACK_CALENDAR;
            });

            years.option_click.connect ( (name, value)=>{
                int new_year = int.parse (value);

                nav_date = new DateTime.local (new_year, nav_month, 1, 0, 0, 0);

                get_info_date (nav_date,
                           out start_day_nav, 
                           out max_months_day_nav,
                           out nav_day,
                           out nav_month,
                           out nav_year);

                header.change_main_text ( nav_year.to_string () );
                this.set_visible_child_name (Constants.STACK_MONTHS);
                current_stack = Constants.STACK_MONTHS;
            });

            this.add_named (calendar, Constants.STACK_CALENDAR);
            this.add_named (years, Constants.STACK_YEARS);
            this.add_named (months, Constants.STACK_MONTHS);
        }

        /*
         * This method increase o decrease by a month the navigation date
         * if num is positive, the navigation date wil increase that mount of months
         * if num is negative, the navigation date wil decrease that mount of months
         * And then, the navigation data is update and 
         * the calendar stock is update depending the month navigation
         * Is used in buttons navigation on Calendar Stock and this class constructor
         */

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

        /*
         * This method increase o decrease by a year the navigation date
         * if num is positive, the navigation date wil increase that mount of years
         * if num is negative, the navigation date wil decrease that mount of years
         * And then, the navigation data is update and 
         * the calendar stock is update depending the year navigation
         * Is used in buttons navigation on Month Stock
         */

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

        /*
         * Method that change the interval showing in years stock
         * The next parameter is use to determinate if the interval increase or
         * decrease
         * next == 1 means that interval increase
         * next == -1 means that interval decrease
         */
        private void modify_year_interval (int next) {
            var new_list = new List<string>();
            if (next == 1) {
                nav_year_interval += 12;
                new_list = generare_year_list (nav_year_interval);
                header.change_main_text ( generare_yyyy_yyyy (nav_year_interval) );
            } else if (next == -1) {
                nav_year_interval -= 12;
                new_list = generare_year_list (nav_year_interval);
                header.change_main_text ( generare_yyyy_yyyy (nav_year_interval) );
            }
            years.fill_grid (new_list);
        }

        /*
         * Compare if navigation date and current date are the same
         * This cover day, month and year
         * Used in methods:
         * > modify_date_by_month
         * > modify_date_by_years
         * Is necessary at the moment to select a new date in next a prev buttons 
         */

        private bool compare_actual_date () {
            return nav_day == current_day &&
                   nav_month == current_month &&
                   nav_year == current_year;
        }

        /*
         * Compare if navigation date and current date are the same
         * But only in month and year
         * Is necessary at the moment to select a new month and avoid that 
         * if a month is different and day nav is not allowed in that month
         * day nav must to be change to 1
         */

        private bool compare_actual_month_year () {
            return nav_month == current_month &&
                   nav_year == current_year;
        }

        /*
         * Thie method build a string to calendar stock header
         * The string indicate the month and year
         * Build with a month a year parameters
         */

        private string generare_mm_yyyy (int month, int year) {
            string m = Month.from_number (month);
            return @"$m  $(year.to_string())";
        }

        /*
         * Thie method build a string to years stock header
         * The string indicate the min year and max year separete
         * by a (-) between they
         */

        private string generare_yyyy_yyyy (int year) {
            string year_min = (year - 1).to_string ();
            string year_max = (year + 10).to_string ();
            return @"$year_min - $year_max";
        }

        /*
         * This method recived a dateTime, normally the navigation DateTime
         * Get the year, month and day from a date time
         * And exports the data to globals variables
         * Normally the navigation variables, because this changes every time
         * Then calculates the first day in a month (M;T;W;T;F;S;S)
         * And finally the max days in a month depends of a year
         */
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
            max_months_day = Date.get_days_in_month (Month.int_to_DateMont(month), (GLib.DateYear) year);
        }

        /*
         * Return an interval of years on function to a year
         * The interval first year is the parameter year - 1
         * The interval last year is the parameter year + 10
         * For example: if parameter = 2018
         * interval [2017, 2028]
         */
        private List<string> generare_year_list (int year) {
            List<string> years = new List<string> ();
            int min_year = year - 1;
            int max_year = year + 10;
            for (int i = min_year; i <= max_year; i++) {
                years.append (i.to_string());
            }
            return years;
        }
    }
}