<script lang="ts">
    let imageloaded= false;
    let positionloaded= false;
    import {Block, Button, List, ListInput, MenuList, MenuListItem, Notification} from 'konsta/svelte';
    import translate from './locales/translations';
    import DemoIcon from './DemoIcon.svelte';
    let header = "Locapark";
    let body = "test";
    let textPosition = "";
    let textPicture = "";
    $ :
    { 
        textPosition = positionloaded ? translate("positionsaved") : translate("setpos");
        textPicture = imageloaded ? translate("imageloaded") : translate("picture");
    }

    let notificationCloseOnClick = false;
    
        async function submitPosition() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(async function(position) {
                    console.log(position.coords.latitude+ ";" + position.coords.longitude);
                    localStorage.setItem('position', position.coords.latitude+ ";" + position.coords.longitude);
                    await openNotification("test")
                    positionloaded = true;
                });
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }
    
        async function submitFile(event: { preventDefault: () => void; }) {
            event.preventDefault();
            const fileInput = document.getElementById('fileInput');
            const file = fileInput.files[0];
    
            if (file) {
                const reader = new FileReader();
                reader.onloadend = async function () {
                    const base64String = reader.result;
                    localStorage.setItem('image', base64String.toString()); 
                    await openNotification("test")
                };
                reader.readAsDataURL(file);
                imageloaded = true;
            } else {
                alert('No file selected.');
            }
        } 
        
        async function openNotification(bodyl: string){
            notificationCloseOnClick = true;
            body = bodyl;
            setTimeout(()=>{
                notificationCloseOnClick = false;
            },3000)
        }
</script>
<MenuList>
    <MenuListItem
    title={translate("picture")}
    subtitle={textPicture}
      active={imageloaded}
      onClick={submitFile}
    >
      <DemoIcon slot="media" />
    </MenuListItem>
    <MenuListItem
      title={translate("position")}
      subtitle={textPosition}
      active={positionloaded}
      onClick={submitPosition}
    >
      <DemoIcon slot="media" />
    </MenuListItem>
  </MenuList>

  <!--
<div class="flex flex-col justify-center items-center h-screen w-full border-opacity-50 text-black text-xl font-semibold">
            <div class="grid bg-gray-300 rounded-xl h-200 text-4xl card rounded-box place-items-center w-4/5 mx-4 my-7 pt-8">
                {translate("picture")}
                <input id="fileInput" class="file-input file-input-bordered max-w-xs  m-8 text-4xl file:w-full file:border file:rounded-full file:border-blue-600 file:bg-blue-600 file:px-12 file:py-3 file:font-medium file:text-white hover:file:bg-transparent hover:file:text-blue-600 focus:file:outline-none focus:ring active:file:text-blue-500 file:text-4xl file:items-center file:justify-center" on:change={submitFile} type="file" accept="image/*"/>
            </div>
            <div class="divider text-4xl">{translate("andor")}</div>
            <div class="grid bg-gray-300 rounded-xl h-200 text-4xl card rounded-box place-items-center w-4/5 mx-4 my-7 pt-8">
                {translate("position")}
                    <button class="inline-block rounded-full border border-blue-600 bg-blue-600 px-12 py-3 font-medium text-white hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-white active:bg-blue-600 text-4xl items-center justify-center m-8" on:click={submitPosition}>                
                        {#if positionloaded}
                            <svg viewBox="0 0 24 24" class="h-6 w-6 text-white " fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M4 12.6111L8.92308 17.5L20 6.5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                        {:else}    
                            <div class="text-4xl">{translate("setpos")}</div>
                        {/if}
                    </button>
            </div>
</div>
-->
    
    <!--
    <Success bind:imageloaded bind:positionloaded goToRecent={goToHome} />
    -->

    <Notification
    opened={notificationCloseOnClick}
    title={header}
    titleRightText="now"
    subtitle={body}
    text={translate("close")}
    onClick={() => (notificationCloseOnClick = false)}
    >    
    <DemoIcon slot="icon" />
</Notification>