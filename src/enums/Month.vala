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

        public string from_number(int num) {
            switch (num) {
                case 0:  return _("JAN");
                case 1:  return _("FEB");
                case 2:  return _("MAR");
                case 3:  return _("APR");
                case 4:  return _("MAY");
                case 5:  return _("JUN");
                case 6:  return _("JUL");
                case 7:  return _("AUG");
                case 8:  return _("SEP");
                case 9:  return _("OCT");
                case 10: return _("NOV");
                case 11: return _("DEC");
                default: assert_not_reached ();
            }
        }
    }
}