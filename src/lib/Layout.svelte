<script>
    // @ts-ignore
    import { App, Page, Navbar, Block } from 'konsta/svelte';
  </script>
  
  <App theme="ios">
      <Page>
        <Navbar title="Locapark" />
        <slot></slot>
      </Page>
  </App>