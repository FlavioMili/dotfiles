"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
async function main() {
    while (!(Spicetify === null || Spicetify === void 0 ? void 0 : Spicetify.showNotification)) {
        await new Promise((resolve) => setTimeout(resolve, 100));
    }
    const downloadDirectory = "%USERPROFILE%\\Music";
    async function downloadSong(uris) {
        let uriObject = Spicetify.URI.fromString(uris[0]);
        let downloadCommand = `spotdl ${uriObject.toURL()} --output ${downloadDirectory}`;
        await Spicetify.Platform.ClipboardAPI.copy(downloadCommand);
        Spicetify.showNotification("Download cmd copied to clipboard", false, 2000);
    }
    function shouldDisplayContextMenu(uris) {
        let shouldDisplay = Spicetify.URI.isTrack(uris[0]);
        return shouldDisplay;
    }
    const contextMenu = new Spicetify.ContextMenu.Item("Download song", downloadSong, shouldDisplayContextMenu);
    contextMenu.register();
}
exports.default = main;
