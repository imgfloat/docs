# Using attachments

> **_NOTE:_**  The interface currently doesn't support adding attachments before the asset is created. To add attachments, first create the script asset, then open it for editing to add the attachments.

Attachments allow you to include additional files for use in your custom script assets, such as images, documents, or other media. These files can be accessed and manipulated through your script's JavaScript code, enabling you to create more dynamic and interactive overlays.

Let's create a custom script asset, which has a single image asset, which is continously rotated on the canvas:

![Rotating image attachment](./rotate_asset.png)

```javascript
async function init(context, state) {
    const asset = Array.isArray(context.assets) ? context.assets[0] : null;
    if (!asset?.blob) {
        return;
    }
    state.rotation = 0;
    state.imageReady = false;
    state.image = await createImageBitmap(asset.blob);
    state.imageReady = true;
}

function tick(context, state) {
    const { ctx, width, height, deltaMs } = context;
    if (!ctx) {
        return;
    }
    ctx.clearRect(0, 0, width, height);
    const image = state?.image;
    if (!image || !state.imageReady) {
        return;
    }
    const size = Math.min(width, height) * 0.35;
    state.rotation = (state.rotation + (deltaMs || 0) * 0.002) % (Math.PI * 2);
    ctx.save();
    ctx.translate(width / 2, height / 2);
    ctx.rotate(state.rotation);
    ctx.drawImage(image, -size / 2, -size / 2, size, size);
    ctx.restore();
}
```

The final result looks like this in the broadcaster view:

![Rotating image attachment broadcaster view](./rotate.gif)
