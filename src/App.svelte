<script>
import Router from 'svelte-spa-router';
import Use from './lib/Use.svelte';
import Layout from "./lib/Layout.svelte";
    import Save from './lib/Save.svelte';

const routes = {
    '/': Use,
    '/save' : Save,
}
</script>


<Layout>
<Router {routes}/>
</Layout>