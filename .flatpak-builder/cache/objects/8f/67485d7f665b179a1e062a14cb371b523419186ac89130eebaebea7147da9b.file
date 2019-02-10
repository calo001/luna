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
                case JANUARY:   return S.JANUARY;
                case FEBRUARY:  return S.FEBRUARY;
                case MARCH:     return S.MARCH;
                case APRIL:     return S.APRIL;
                case MAY:       return S.MAY;
                case JUNE:      return S.JUNE;
                case JULY:      return S.JULY;
                case AUGUST:    return S.AUGUST;
                case SEPTEMBER: return S.SEPTEMBER;
                case OCTOBER:   return S.OCTOBER;
                case NOVEMBER:  return S.NOVEMBER;
                case DECEMBER:  return S.DECEMBER;
                default:        assert_not_reached ();
            }
        }

        public static List<string> all () {
            List<string> MONTHS = new List<string>();
            MONTHS.append(JANUARY.to_string().slice (0, 3).up());
            MONTHS.append(FEBRUARY.to_string().slice (0, 3).up());
            MONTHS.append(MARCH.to_string().slice (0, 3).up());
            MONTHS.append(APRIL.to_string().slice (0, 3).up());
            MONTHS.append(MAY.to_string().slice (0, 3).up());
            MONTHS.append(JUNE.to_string().slice (0, 3).up());
            MONTHS.append(JULY.to_string().slice (0, 3).up());
            MONTHS.append(AUGUST.to_string().slice (0, 3).up());
            MONTHS.append(SEPTEMBER.to_string().slice (0, 3).up());
            MONTHS.append(OCTOBER.to_string().slice (0, 3).up());
            MONTHS.append(NOVEMBER.to_string().slice (0, 3).up());
            MONTHS.append(DECEMBER.to_string().slice (0, 3).up());

            return MONTHS;
        }

        public static string from_number(int month) {
            switch (month) {
                case 1:  return S.JANUARY;
                case 2:  return S.FEBRUARY;
                case 3:  return S.MARCH;
                case 4:  return S.APRIL;
                case 5:  return S.MAY;
                case 6:  return S.JUNE;
                case 7:  return S.JULY;
                case 8:  return S.AUGUST;
                case 9:  return S.SEPTEMBER;
                case 10: return S.OCTOBER;
                case 11: return S.NOVEMBER;
                case 12: return S.DECEMBER;
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