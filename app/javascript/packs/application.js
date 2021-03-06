import "bootstrap";
import { displayRoute } from '../plugins/displaySegment';
import { fixFooter } from '../plugins/footer';
import { filtersRisks } from '../plugins/filters';
import { resetFilters } from '../plugins/resetFilters';
import { navbar, navbarShow } from '../plugins/navbar';
import 'mapbox-gl/dist/mapbox-gl.css';

fixFooter();
navbar();

if (document.getElementById("map")) {
  displayRoute();
  navbarShow();
}

if (document.getElementById('reset')) {
  resetFilters();
}
