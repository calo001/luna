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

using App.Enums;

namespace App.Configs {

    /**
     * The {@code Constants} class is responsible for defining all 
     * the constants used in the application.
     *
     * @since 1.0.0
     */

    public class Constants {
    
        public abstract const string ID = "com.github.calo001.luna";
        public abstract const string VERSION = "1.0.1";
        public abstract const string PROGRAME_NAME = "Luna";
        public abstract const string APP_YEARS = "2018";
        public abstract const string APP_ICON = "com.github.calo001.luna";
        public abstract const string ABOUT_COMMENTS = "An amazing calendar widget ";
        public abstract const string TRANSLATOR_CREDITS = "Translators";
        public abstract const string MAIN_URL = "{{ website-url }}";
        public abstract const string BUG_URL = "https://github.com/calo001/luna/issues";
        public abstract const string HELP_URL = "https://github.com/calo001/luna/wiki";
        public abstract const string TRANSLATE_URL = "https://github.com/calo001/luna";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE = "Website";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE_URL = "{{ website-url }}";
        public abstract const string [] ABOUT_AUTHORS = { "Carlos Lopez <calo_lrc@hotmail.com>" };
        public abstract const Gtk.License ABOUT_LICENSE_TYPE = Gtk.License.CUSTOM;

        public abstract const string STACK_CALENDAR = "calendar";
        public abstract const string STACK_YEARS = "years";
        public abstract const string STACK_MONTHS = "months";

        public abstract const string ICON_SUMMER = "/com/github/calo001/luna/images/summer.svg";
        public abstract const string ICON_SPRING = "/com/github/calo001/luna/images/spring.svg";
        public abstract const string ICON_AUTOMN = "/com/github/calo001/luna/images/autumn.svg";
        public abstract const string ICON_WINTER = "/com/github/calo001/luna/images/winter.svg";
        
        public abstract const string URL_CSS_WHITE = "/com/github/calo001/luna/css/style_white.css";
        public abstract const string URL_CSS_DARK = "/com/github/calo001/luna/css/style_dark.css";
        public abstract const string URL_CSS_PINK = "/com/github/calo001/luna/css/style_pink.css";
        public abstract const string URL_CSS_RED = "/com/github/calo001/luna/css/style_red.css";
        public abstract const string URL_CSS_ORANGE = "/com/github/calo001/luna/css/style_orange.css";
        public abstract const string URL_CSS_YELLOW = "/com/github/calo001/luna/css/style_yellow.css";
        public abstract const string URL_CSS_GREEN = "/com/github/calo001/luna/css/style_green.css";
        public abstract const string URL_CSS_BLUE = "/com/github/calo001/luna/css/style_blue.css";
        public abstract const string URL_CSS_PURPLE = "/com/github/calo001/luna/css/style_purple.css";
        public abstract const string URL_CSS_COCO = "/com/github/calo001/luna/css/style_coco.css";

        public abstract const string URL_CSS_GRADIENT_BLUE_GREEN = "/com/github/calo001/luna/css/style_gradient_blue_green.css";
        public abstract const string URL_CSS_GRADIENT_PURPLE_RED = "/com/github/calo001/luna/css/style_gradient_purple_red.css";
        public abstract const string URL_CSS_PRIDE = "/com/github/calo001/luna/css/style_gradient_pride.css";
        public abstract const string URL_CSS_LIGHT_TRANS = "/com/github/calo001/luna/css/style_light_transparent.css";
        public abstract const string URL_CSS_DARK_TRANS = "/com/github/calo001/luna/css/style_dark_transparent.css";
        
    }
}
