<script lang="ts">
    import { Block, BlockTitle, Button, Card, Link } from "konsta/svelte";
    import { onMount } from "svelte";
    import translate from "./locales/translations";

    let loading = true;
    let alreadySaved = false;
    let savedImage: string | null;
    let savedPosition: string | null;

    onMount(() => {
        if (localStorage.getItem("image") !== null) {
            savedImage = localStorage.getItem("image");
            alreadySaved = true;
        }
        if (localStorage.getItem("position") !== null) {
            savedPosition = localStorage.getItem("position");
            alreadySaved = true;
        }
        loading = false;
    });
</script>
<Block>
    <Button rounded large href="/" class="k-color-brand-yellow"
        >{translate("quit")}
    </Button>
</Block> 
{#if alreadySaved}
        <div
            class="h-full w-full max-w-[600px] max-h-[800px] flex items-end text-white ios:font-bold bg-cover bg-center material:rounded-xl"
            style="background-image: url({savedImage || "/car.jpg"})"
        />
{/if}