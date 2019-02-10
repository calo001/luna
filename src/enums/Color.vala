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
    public enum Color {
        WHITE,
        BLACK,
        PINK,
        RED,
        ORANGE,
        YELLOW,
        GREEN,
        TEAL,
        BLUE,
        PURPLE,
        COCO,
        GRADIENT_BLUE_GREEN,
        GRADIENT_PURPLE_RED,
        GRADIENT_PRIDE,
        TRANS_WHITE,
        TRANS_BLACK,
        SEMITRANS_WHITE,
        SEMITRANS_BLACK;

        public string to_string () {
            switch (this) {
                case WHITE:                 return "white";
                case BLACK:                 return "black";
                case PINK:                  return "pink";
                case RED:                   return "red";
                case ORANGE:                return "orange";
                case YELLOW:                return "yellow";
                case GREEN:                 return "green";
                case BLUE:                  return "blue";
                case TEAL:                  return "teal";
                case PURPLE:                return "purple";
                case COCO:                  return "coco";
                case GRADIENT_BLUE_GREEN:   return "gradient_blue_green";
                case GRADIENT_PURPLE_RED:   return "gradient_purple_red";
                case GRADIENT_PRIDE:        return "gradient_pride";
                case TRANS_WHITE:           return "transparent_white";
                case TRANS_BLACK:           return "transparent_black";
                case SEMITRANS_WHITE:       return "semitransparent_white";
                case SEMITRANS_BLACK:       return "semitransparent_black";
                default:                    assert_not_reached ();
            }
        }

        public static string string_to_css_path (string color) {
            switch (color) {
                case "white":                 return Constants.URL_CSS_WHITE;
                case "black":                 return Constants.URL_CSS_DARK;
                case "pink":                  return Constants.URL_CSS_PINK;
                case "red":                   return Constants.URL_CSS_RED;
                case "orange":                return Constants.URL_CSS_ORANGE;
                case "yellow":                return Constants.URL_CSS_YELLOW;
                case "green":                 return Constants.URL_CSS_GREEN;
                case "teal":                  return Constants.URL_CSS_TEAL;
                case "blue":                  return Constants.URL_CSS_BLUE;
                case "purple":                return Constants.URL_CSS_PURPLE;
                case "coco":                  return Constants.URL_CSS_COCO;                
                case "gradient_blue_green":   return Constants.URL_CSS_GRADIENT_BLUE_GREEN;
                case "gradient_purple_red":   return Constants.URL_CSS_GRADIENT_PURPLE_RED;
                case "gradient_pride":        return Constants.URL_CSS_PRIDE;
                case "transparent_white":     return Constants.URL_CSS_LIGHT_TRANS;
                case "transparent_black":     return Constants.URL_CSS_DARK_TRANS;
                case "semitransparent_white": return Constants.URL_CSS_LIGHT_SEMITRANS;
                case "semitransparent_black": return Constants.URL_CSS_DARK_SEMITRANS;
                default:                      return Constants.URL_CSS_GRADIENT_BLUE_GREEN;
            }
        }

    }
}
