<script>
import Router from 'svelte-spa-router';
import Use from './lib/Use.svelte';
import Layout from "./lib/Layout.svelte";

const routes = {
    // Exact path
    '/': Use,
}
</script>


<Layout>
<Router {routes}/>
</Layout>