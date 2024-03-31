<script>
    // @ts-ignore
    import { App, Page, Navbar, Panel, Link} from 'konsta/svelte';
    let leftPanelOpened = true;
    import Download from './Download.svelte';
  </script>
  
  <App theme="ios">
      <Page>
        <Navbar title="Locapark" />

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
        <slot></slot>
      </Page>
  </App>