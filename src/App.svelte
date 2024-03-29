<script>
import Router from 'svelte-spa-router';

import Use from './lib/Use.svelte';

const routes = {
    // Exact path
    '/': Use,

    // Using named parameters, with last being optional
    '/author/:first/:last?': Use,

    // Wildcard parameter
    '/book/*': Use,

    // Catch-all
    // This is optional, but if present it must be the last
    '*': Use,
}
</script>

<Router {routes}/>