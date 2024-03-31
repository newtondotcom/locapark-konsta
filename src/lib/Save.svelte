<script lang="ts">
    let imageloaded = false;
    let positionloaded = false;
    import { Block, BlockTitle, Button, MenuList, MenuListItem } from "konsta/svelte";
    import translate from "./locales/translations";
    import DemoIcon from "./DemoIcon.svelte";
    let textPosition = "";
    let textPicture = "";
    $: {
        textPosition = positionloaded
            ? translate("positionsaved")
            : translate("setpos");
        textPicture = imageloaded
            ? translate("imagesaved")
            : translate("picture");
    }

    async function submitPosition() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(async function (position) {
                console.log(
                    position.coords.latitude + ";" + position.coords.longitude,
                );
                localStorage.setItem(
                    "position",
                    position.coords.latitude + ";" + position.coords.longitude,
                );
                positionloaded = true;
            });
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }

    async function submitFile() {
        var input = document.createElement("input");
        input.type = "file";

        input.onchange = function (e) {
            var file = e.target.files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                const base64String = reader.result;
                localStorage.setItem("image", base64String.toString());
            };
            reader.readAsDataURL(file);
            imageloaded = true;
        };

        input.click();
    }
</script>

<BlockTitle>{translate("header")}</BlockTitle>
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

{#if imageloaded || positionloaded}
<Block>
    <Button rounded large href="/" class="k-color-brand-yellow"
        >{translate("saveit")}
    </Button>
</Block>
{/if}
