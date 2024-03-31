<script lang="ts">
    import { onMount } from 'svelte';
    import translate from './locales/translations';
    import { Block, BlockTitle, Card } from 'konsta/svelte';

    let platform = 'IOS';

    function checkOS(n) {
        if (n.userAgentData) {
            const hints = ["architecture", "model", "platform", "platformVersion", "uaFullVersion"];
            n.userAgentData.getHighEntropyValues(hints)
            .then(ua => {
                console.log(ua);
            });
        } else {
            console.log(n.userAgent);
            return "navigator.userAgentData is not supported!";
        }
    }
    
    onMount(() => {
        checkOS(navigator);
    });
</script>
<Block strong outline>
        {translate("pwainstall")}
</Block>  
<BlockTitle>
    {translate("tutorial")}
</BlockTitle>
<Block strong>  
    {#if platform === 'IOS'}
    <div class="flex justify-center items-center">
      <div class="flex flex-col justify-center font-bold">
        <p>1. Launch Safari on your iPhone or iPad.</p>
        <p>2. Navigate to the site that you want to create a Home screen shortcut to.</p>
        <p>3. Tap the Share icon (the square with an arrow pointing out of it) at the bottom of the screen.</p>
        <p>4. Scroll down to the list of actions and tap Add to Home Screen. </p>
        <span class="font-light">(If you don't see the action, scroll to the bottom and tap Edit Actions, then tap Add next to the Add to Home Screen action.
          After that, you'll be able to select it from the Share Sheet.)</span>
      </div>
    </div>
    {:else if platform === 'Android'}
    <div class="flex justify-center items-center">
      <div class="flex flex-col justify-center p-4 rounded-md text-5xl">
        <p>1. Open a URL address of a PWA you want to install in your browser.</p>
        <p>2. Open your browser’s settings.</p>
        <p>3. Scroll down and tap Add to Home screen.</p>
        <p>4. Confirm by tapping Add.</p>
      </div>
    </div>
    {/if}
</Block>