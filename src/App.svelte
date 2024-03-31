<script>
import Router from 'svelte-spa-router';
import Use from './lib/Use.svelte';
import Layout from "./lib/Layout.svelte";
import Save from './lib/Save.svelte';
import Download from './lib/Download.svelte';

const routes = {
    '/': Use,
    '/save' : Save,
    '/download' : Download
}
</script>


<Layout>
<Router {routes}/>
</Layout>