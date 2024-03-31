<script lang="ts">
    import {Block, BlockTitle, Button, Card, Link} from 'konsta/svelte';
    import { onMount } from 'svelte';
    import translate from './locales/translations';
    export let goToSave : any;
    
    let loading = true; 
    let alreadySaved = false;
    let savedImage: string | null;
    let savedPosition: string | null;

    onMount(() => {
        if (localStorage.getItem('image') !== null) {
            savedImage = localStorage.getItem('image');
            alreadySaved = true;
        }
        if (localStorage.getItem('position') !== null) {
            savedPosition = localStorage.getItem('position');
            alreadySaved = true;
        }
        loading = false;
    })

    function handleWaypoint() {
        const isMobile = /Android|iOS|iPhone|iPad|iPod|Windows Phone/i.test(navigator.userAgent);

        if (isMobile) {
            const isiOS = /iPad|iPhone|iPod/.test(navigator.userAgent);
            if (isiOS) {
                const [latitude, longitude] = savedPosition.split(';');
                const appleMapsURL = `https://maps.apple.com/?q=${latitude},${longitude}`;
                console.log(appleMapsURL);
                window.location.href = appleMapsURL;
            } else {
                const [latitude, longitude] = savedPosition.split(';');
                const googleMapsURL = `https://www.google.com/maps?q=${latitude},${longitude}`;
                window.location.href = googleMapsURL;
            }
        } else {
            alert('Navigation is only supported on mobile devices.');
        }
    }

    function openFullScreen() {
        let w = window.open('about:blank');
        let image = new Image();
        image.src = savedImage;
        setTimeout(function(){
            w.document.write("<style>body{margin:0px;}img{heigh:90vh;width:100vw;}a{position:absolute;top:10px;left:10px;background-color:purple;border-radius:20px;border:none;height:40px;width:40px;text-decoration:none;align-items:center;color:white;display:flex;align-items:center;justify-content:center;}</style>")
            w.document.write("<a href=\"https://locapark.duckdns.org/\"><</a>");
            w.document.write(image.outerHTML);
        }, 0);
    }

</script>

    <BlockTitle withBlock={false}>Styled Cards</BlockTitle>
    <div class="lg:grid lg:grid-cols-2">
        {#if alreadySaved}
      <Card outline>
        <div
          class="ios:-mx-4 ios:-mt-4 h-48 p-4 flex items-end text-white ios:font-bold bg-cover bg-center material:rounded-xl mb-4 material:text-[22px]"
          style="background-image: url(https://cdn.framework7.io/placeholder/nature-1000x600-3.jpg)"
        >
        </div>
        <p>
          Quisque eget vestibulum nulla. Quisque quis dui quis ex ultricies
          efficitur vitae non felis. Phasellus quis nibh hendrerit...
        </p>
        <svelte:fragment slot="footer">
          <div class="flex justify-between material:hidden">
          <Button class="mx-4" large rounded onClick={handleWaypoint}> 
            <!-- {translate("waypoint")} -->
            <svg viewBox="0 0 24 24" class="w-6 h-6" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M5.36328 12.0523C4.01081 11.5711 3.33457 11.3304 3.13309 10.9655C2.95849 10.6492 2.95032 10.2673 3.11124 9.94388C3.29694 9.57063 3.96228 9.30132 5.29295 8.76272L17.8356 3.68594C19.1461 3.15547 19.8014 2.89024 20.2154 3.02623C20.5747 3.14427 20.8565 3.42608 20.9746 3.7854C21.1106 4.19937 20.8453 4.85465 20.3149 6.16521L15.2381 18.7078C14.6995 20.0385 14.4302 20.7039 14.0569 20.8896C13.7335 21.0505 13.3516 21.0423 13.0353 20.8677C12.6704 20.6662 12.4297 19.99 11.9485 18.6375L10.4751 14.4967C10.3815 14.2336 10.3347 14.102 10.2582 13.9922C10.1905 13.8948 10.106 13.8103 10.0086 13.7426C9.89876 13.6661 9.76719 13.6193 9.50407 13.5257L5.36328 12.0523Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
        
        </Button>
          <Button class="mx-4" large rounded onClick={openFullScreen}> 
            <!-- {translate("seefullscreen")} --> 
            <svg class="w-6 h-6"  viewBox="0 0 20 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="currentColor"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>full_screen [#904]</title> <desc>Created with Sketch.</desc> <defs> </defs> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Dribbble-Light-Preview" transform="translate(-300.000000, -4199.000000)" fill="currentColor"> <g id="icons" transform="translate(56.000000, 160.000000)"> <path d="M262.4445,4039 L256.0005,4039 L256.0005,4041 L262.0005,4041 L262.0005,4047 L264.0005,4047 L264.0005,4039.955 L264.0005,4039 L262.4445,4039 Z M262.0005,4057 L256.0005,4057 L256.0005,4059 L262.4445,4059 L264.0005,4059 L264.0005,4055.955 L264.0005,4051 L262.0005,4051 L262.0005,4057 Z M246.0005,4051 L244.0005,4051 L244.0005,4055.955 L244.0005,4059 L246.4445,4059 L252.0005,4059 L252.0005,4057 L246.0005,4057 L246.0005,4051 Z M246.0005,4047 L244.0005,4047 L244.0005,4039.955 L244.0005,4039 L246.4445,4039 L252.0005,4039 L252.0005,4041 L246.0005,4041 L246.0005,4047 Z" id="full_screen-[#904]"> </path> </g> </g> </g> </g></svg>
        </Button>
          </div>
          <div
            class="flex justify-start ios:hidden space-x-2 rtl:space-x-reverse"
          >
            <Button rounded inline>Like</Button>
            <Button rounded inline outline>Read more</Button>
          </div>
        </svelte:fragment>
      </Card>
      {:else}
      <Card>
        {translate("never")}
      </Card>
      {/if}
          <Button large rounded>                
            {#if alreadySaved}{translate("change")}{:else}{translate("save")}{/if}
          </Button>
    </div>


<!--
<div class="flex flex-col justify-center items-center min-h-full">
{#if loading}    
    <span class="loading loading-spinner loading-lg"></span>
{:else}
    <div class="font-extrabold leading-none tracking-tight text-yellow-300 text-7xl absolute top-4 left-28">{translate("previouslocation")}</div>
    
    {#if alreadySaved}
        {#if savedPosition}    
            <button class="font-bold w-2/3 mx-auto text-4xl px-4 py-7 bg-gray-300 mt-[200px] rounded-xl" on:click={handleWaypoint}>{translate("waypoint")}</button>
        {/if}
        {#if savedImage}
        <div class="flex flex-col justify-center items-center rounded-3xl text-white text-3xl mt-40">
                <img src={savedImage} class="object-cover rounded-lg w-4/5" alt="Your parking spot" />

                <Button large outline>Outline</Button>
                <button on:click={openFullScreen}
                class="bg-gray-300 text-black rounded-3xl w-full py-7 px-4 font-extrabold leading-none tracking-tight text-4xl mx-[120px]"
                 >
                 {translate("seefullscreen")}
                </button>
        </div>
        {:else}
            <div class="h-1/3"/>
        {/if}
    {:else}
    <div class="flex text-4xl font-extrabold leading-none tracking-tight mt-40"></div>
    {/if}

    <div class="absolute bottom-[200px] left-0 flex-row justify-center items-center w-full">
        <div class="flex justify-center items-center w-full py-7 px-4">
            <button on:click={()=>goToSave()}
            class="bg-gray-300 rounded-3xl w-full py-7 px-4 font-extrabold leading-none tracking-tight text-4xl mx-[120px]">
                {#if alreadySaved}{translate("change")}{:else}{translate("save")}{/if}
            </button>
        </div>  
    </div>     
{/if}
</div>  
-->

<style lang="postcss">
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>