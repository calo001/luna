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
using Gtk;

namespace App.Views {
    /**
     * The {@code CalendarView} class. Show a grid 12x12 for months and years
     *
     * @since 1.0.0
     */
    public class TwelveGridView : Gtk.Grid {
        private List<Button> labels;
        public signal void option_click (string name, string value);

        public TwelveGridView (List<string> items) {
            this.margin = 5;
            this.column_spacing = 4;
            this.row_spacing = 20;

            int name = 1;
            int row = 0;
            int column = 0;
            foreach ( var item in items ) {
                var label_item = new Button.with_label(item);
                label_item.name = name.to_string();
                label_item.expand = true;
                label_item.halign = Align.FILL;
                label_item.valign = Align.FILL;
                label_item.get_style_context ().add_class ("label-day");
                label_item.get_style_context ().add_class ("circle");

                // Adding listener
                label_item.clicked.connect ( ()=>{
                    option_click (label_item.name, label_item.label);
                });

                labels.append(label_item);
                this.attach(label_item, column, row);
                name++;
                column++;
                if (column % 4 == 0) {
                    column = 0;
                    row++;
                }
            }
        }

        public void fill_grid (List<string> items) {
            var elements = labels.length ();
            var new_elements = items.length ();
            if (elements == new_elements) {
                for (int i = 0; i < elements; i++) {
                    var label = labels.nth_data (i);
                    label.label = items.nth_data (i);
                }
            }
        }
    }
}