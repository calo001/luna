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

namespace App.Enums {
    enum Month {
        JANUARY,
        FEBRUARY,
        MARCH,
        APRIL,
        MAY,
        JUNE,
        JULY,
        AUGUST,
        SEPTEMBER,
        OCTOBER,
        NOVEMBER,
        DECEMBER;

        public string to_string() {
            switch (this) {
                case JANUARY:   return _("JAN");
                case FEBRUARY:  return _("FEB");
                case MARCH:     return _("MAR");
                case APRIL:     return _("APR");
                case MAY:       return _("MAY");
                case JUNE:      return _("JUN");
                case JULY:      return _("JUL");
                case AUGUST:    return _("AUG");
                case SEPTEMBER: return _("SEP");
                case OCTOBER:   return _("OCT");
                case NOVEMBER:  return _("NOV");
                case DECEMBER:  return _("DEC");
                default:        assert_not_reached ();
            }
        }

        public static List<string> all () {
            List<string> MONTHS = new List<string>();
            MONTHS.append(JANUARY.to_string());
            MONTHS.append(FEBRUARY.to_string());
            MONTHS.append(MARCH.to_string());
            MONTHS.append(APRIL.to_string());
            MONTHS.append(MAY.to_string());
            MONTHS.append(JUNE.to_string());
            MONTHS.append(JULY.to_string());
            MONTHS.append(AUGUST.to_string());
            MONTHS.append(SEPTEMBER.to_string());
            MONTHS.append(OCTOBER.to_string());
            MONTHS.append(NOVEMBER.to_string());
            MONTHS.append(DECEMBER.to_string());

            return MONTHS;
        }

        public static string from_number(int month) {
            switch (month) {
                case 1:  return _("January");
                case 2:  return _("February");
                case 3:  return _("March");
                case 4:  return _("April");
                case 5:  return _("May");
                case 6:  return _("June");
                case 7:  return _("July");
                case 8:  return _("August");
                case 9:  return _("September");
                case 10: return _("October");
                case 11: return _("November");
                case 12: return _("December");
                default: assert_not_reached ();
            }
        }

        public static DateMonth int_to_DateMont (int month) {
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
    }
}