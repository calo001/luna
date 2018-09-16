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
    public enum Month {
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

        public string to_string () {
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
    }
}