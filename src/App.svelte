<script>
import Router from 'svelte-spa-router';
import Use from './lib/Use.svelte';
import Layout from "./lib/Layout.svelte";
import Save from './lib/Save.svelte';
import Download from './lib/Download.svelte';
import { Link, Navbar, Panel } from 'konsta/svelte';

const routes = {
    '/': Use,
    '/save' : Save
}

let leftPanelOpened = true;
</script>


<Layout>
<Router {routes}/>
<Panel
    side="left"
    opened={leftPanelOpened}
    onBackdropClick={() => (leftPanelOpened = false)}
>      
<Navbar title="Left Panel">
    <Link slot="right" navbar onClick={() => (leftPanelOpened = false)}>
      Close
    </Link>
  </Navbar>
<Download/>
</Panel>
</Layout>