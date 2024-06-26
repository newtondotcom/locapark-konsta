<script lang="ts">
    import { onMount } from "svelte";
    import translate from "./locales/translations";
    import { Block, BlockTitle, Card } from "konsta/svelte";

    let platform = "IOS";

    function checkOS(n) {
        if (n.userAgentData) {
            const hints = [
                "architecture",
                "model",
                "platform",
                "platformVersion",
                "uaFullVersion",
            ];
            n.userAgentData.getHighEntropyValues(hints).then((ua) => {
                if (ua.platform === "iOS") {
                    platform = "IOS";
                } else if (ua.platform === "Android") {
                    platform = "Android";
                }
            });
        } else {
            if (n.userAgent.includes("iPhone") || n.userAgent.includes("iPad")) {
                platform = "IOS";
            } else if (n.userAgent.includes("Android")) {
                platform = "Android";
            }
            return "navigator.userAgentData is not supported!";
        }
    }

    onMount(() => {
        checkOS(navigator);
    });
</script>

<Block strongIos>
    <span class="font-bold text-md-light-primary">Locapark</span>
    {translate("description1")}
    <br><br><br>
    {translate("pwainstall")}
</Block>

<BlockTitle>
    <span class="font-bold text-md-light-primary">{translate("tutorial")}</span>
</BlockTitle>

<Block strong>
    {#if platform === "IOS"}
        <div class="flex justify-center items-center">
            <div class="flex flex-col justify-center font-bold">
                <p>1. Launch Safari on your iPhone or iPad.</p>
                <p>
                    2. Navigate to the site that you want to create a Home
                    screen shortcut to.
                </p>
                <p>
                    3. Tap the Share icon (the square with an arrow pointing out
                    of it) at the bottom of the screen.
                </p>
                <p>
                    4. Scroll down to the list of actions and tap Add to Home
                    Screen.
                </p>
                <span class="font-light"
                    >(If you don't see the action, scroll to the bottom and tap
                    Edit Actions, then tap Add next to the Add to Home Screen
                    action. After that, you'll be able to select it from the
                    Share Sheet.)</span
                >
            </div>
        </div>
    {:else if platform === "Android"}
        <div class="flex justify-center items-center">
            <div class="flex flex-col justify-center p-4 rounded-md text-5xl">
                <p>
                    1. Open a URL address of a PWA you want to install in your
                    browser.
                </p>
                <p>2. Open your browser’s settings.</p>
                <p>3. Scroll down and tap Add to Home screen.</p>
                <p>4. Confirm by tapping Add.</p>
            </div>
        </div>
    {/if}
</Block>
<Block>
    <div class="relative bottom-4 mx-auto text-center">
        <ul class="mt-12 flex justify-center gap-6 md:gap-8">
            <li>
                <a
                    href="https://www.linkedin.com/in/robin-augereau/"
                    rel="noreferrer"
                    target="_blank"
                    class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">LinkedIn</span>
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="w-6 h-6"
                        fill="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            d="M4.98 3.5c0 1.381-1.11 2.5-2.48 2.5s-2.48-1.119-2.48-2.5c0-1.38 1.11-2.5 2.48-2.5s2.48 1.12 2.48 2.5zm.02 4.5h-5v16h5v-16zm7.982 0h-4.968v16h4.969v-8.399c0-4.67 6.029-5.052 6.029 0v8.399h4.988v-10.131c0-7.88-8.922-7.593-11.018-3.714v-2.155z"
                        />
                    </svg>
                </a>
            </li>
            <li>
                <a
                    href="https://github.com/newtondotcom/locapark-konsta"
                    rel="noreferrer"
                    target="_blank"
                    class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">GitHub</span>
                    <svg
                        class="w-8 h-8"
                        fill="currentColor"
                        viewBox="0 0 24 24"
                        aria-hidden="true"
                    >
                        <path
                            fill-rule="evenodd"
                            d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                            clip-rule="evenodd"
                        />
                    </svg>
                </a>
            </li>

            <li>
                <a
                    href="https://www.instagram.com/newton.creations/"
                    rel="noreferrer"
                    target="_blank"
                    class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">Instagram</span>
                    <svg
                        class="w-8 h-8"
                        fill="currentColor"
                        viewBox="0 0 24 24"
                        aria-hidden="true"
                    >
                        <path
                            fill-rule="evenodd"
                            d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                            clip-rule="evenodd"
                        />
                    </svg>
                </a>
            </li>
        </ul>
    </div>
</Block>
