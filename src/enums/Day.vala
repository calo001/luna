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
    public enum Day {
        MONDAY,
        TUESDAY,
        WEDNESDAY,
        THURSDAY,
        FRIDAY,
        SATURDAY,
        SUNDAY;

        public string to_string () {
            switch (this) {
                case MONDAY:    return _("MON");
                case TUESDAY:   return _("TUE");
                case WEDNESDAY: return _("WED");
                case THURSDAY:  return _("THU");
                case FRIDAY:    return _("FRI");
                case SATURDAY:  return _("SAT");
                case SUNDAY:    return _("SUN");
                default:        assert_not_reached ();
            }
        }
    }
}