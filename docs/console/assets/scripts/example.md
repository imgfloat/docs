# Script asset example

This example script asset renders a circle on screen, that changes color every second.

```javascript
function init(context, state) {}

function tick(context, state) {
    const { ctx, width, height, elapsedMs } = context;

    ctx.clearRect(0, 0, width, height);

    const seconds = Math.floor(elapsedMs / 1000);
    const r = (seconds * 50) % 256;
    const g = (seconds * 80) % 256;
    const b = (seconds * 110) % 256;
    const color = `rgb(${r}, ${g}, ${b})`;

    const radius = 50;
    ctx.fillStyle = color;
    ctx.beginPath();
    ctx.arc(width / 2, height / 2, radius, 0, Math.PI * 2);
    ctx.fill();
}
```

Here's what it looks like in the admin console view:

![Script asset example](./script_asset_example.png)

And here's what it looks like in the broadcaster view:

![Script asset broadcaster view](./script_asset_broadcaster_view.gif)
