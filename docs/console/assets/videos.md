# Video assets

Video assets are media files that can be added to the broadcast canvas. They support common video formats such as MP4 and WebM. For a full list of supported formats, refer to the [developer documentation for the Imgfloat server](https://github.com/imgfloat/server). In addition to traditional image formats, GIF files are also treated as video assets in Imgfloat. This allows for better control over playback and performance. Uploading a GIF file will convert it to a video format behind the scenes.

Video assets support the same manipulation options as image assets, including resizing, repositioning, showing or hiding, and rotating using the canvas controls or the asset details panel when selected. All updates of these kinds are instantly reflected in the broadcast view. In addition, video assets support modification of the playback speed and volume through the asset details panel.

Video assets will continuously loop during playback by default. If you need fine grained control over when videos play, consider using [a script asset](./scripts/overview.md) instead.
