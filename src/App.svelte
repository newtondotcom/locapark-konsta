<script>
import Router from 'svelte-spa-router';
import Use from './lib/Use.svelte';
import Layout from "./lib/Layout.svelte";
import Save from './lib/Save.svelte';
import Display from './lib/Display.svelte';
import { Link, Navbar, Panel } from 'konsta/svelte';

const routes = {
    '/': Use,
    '/save' : Save,
    '/display' : Display
}
</script>


<Layout>
<Router {routes}/>
</Layout>