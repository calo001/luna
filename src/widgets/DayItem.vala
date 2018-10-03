/*
* Copyright (C) 2018  Calo001 <calo_lrc@hotmail.com>
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

using Gtk;
using App.Configs;
using App.Views;
using App.Enums;

namespace App.Widgets {
    /**
     * The {@code DayItem} class is responsible for displaying
     * a number day o an image for a representative fact in a day
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class DayItem : Stack {
        private Label       label_day;
        private Label       label_day_small;
        private Image       image;
        private Box         box_label;
        private Box         box_image;
        public DayItem (string number_day) {
            //this.expand = true;
            this.halign = Align.CENTER;
            this.valign = Align.CENTER;
            this.homogeneous = true;
            this.hhomogeneous = true;
            this.interpolate_size = true;
            this.transition_type = StackTransitionType.CROSSFADE;
            
            /* 
             * Simple day that show only a day
             */
            label_day = new Label("");
            label_day.label = number_day;
            label_day.get_style_context ().add_class ("label-day");
            label_day.expand = true;

            box_label = new Box (Orientation.VERTICAL, 0);
            box_label.pack_start (label_day);

            /* 
             * Day with season of year
             */
            
            label_day_small = new Label("");
            label_day_small.label = number_day;
            label_day_small.expand = true;
            label_day_small.get_style_context ().add_class ("label-day-small");
            image = new Image.from_resource (Constants.ICON_SPRING);

            box_image = new Box (Orientation.HORIZONTAL, 1);
            box_image.name = "box-season";
            box_image.pack_start (image);
            box_image.pack_start (label_day_small);
            box_image.set_tooltip_text ("Primavera");

            this.add_named (box_label, "day");
            this.add_named (box_image, "day-image");
            
            
        }

        public void change_day (string day) {
            label_day.label = day;
            label_day_small.label = day;
        }

        public void change_season (string season) {
            image.set_from_resource (season);
        }

        public void toogle_label_today (bool today) {
            if (today) {
                this.get_style_context ().add_class ("label-today");
            } else {
                this.get_style_context ().remove_class ("label-today");
            }
        }

    }

}