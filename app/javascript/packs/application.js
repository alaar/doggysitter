import "bootstrap";
import { initTabs } from "../components/tab"
import { geolocateFn } from "../components/doggymaps"
import { autocomplete } from '../components/autocomplete'

initTabs();
window.geolocate = geolocateFn;
autocomplete;
