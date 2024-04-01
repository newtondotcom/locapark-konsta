<script>
import Router from 'svelte-spa-router';
import Use from './lib/Use.svelte';
import Layout from "./lib/Layout.svelte";
import Save from './lib/Save.svelte';
import Desktop from './lib/Desktop.svelte';
import { Link, Navbar, Panel } from 'konsta/svelte';
let isMobile = window.innerWidth < 768;

const routes = {
    '/': Use,
    '/save' : Save
}
</script>

{#if isMobile}
<Layout>
<Router {routes}/>
</Layout>
{:else}
<Desktop/>
{/if}