# Script assets

Script assets are customizable assets containing JavaScript code that runs in the context of the broadcast. They allow for advanced functionality and interactivity beyond what standard file assets provide. Script assets exist in their own layer and cannot modify other assets directly, but they can respond to events and manipulate their own properties at will.

## Structure

A script asset consists of the following components:

* Title
* Description
* JavaScript code
* Logo (optional)
* Attachments (optional)

![Create](./create.png)

It is also possible to select the 'Make script public in the marketplace' option. This will make the script available for other Imgfloat users to add to their broadcasts through the asset marketplace. Users who import your script will be able to customize its settings, but cannot modify your copy.

## JavaScript API

The JavaScript code must conform to the following format:

```typescript
type Asset = {
    id: string;
    url?: string;
    name?: string;
    mediaType?: string;
    blob?: Blob;
    [key: string]: any;
};


type ChatTextFragment = {
    type: "text";
    text: string;
}

type ChatEmoteFragment = {
    type: "emote";
    id: string;
    name: string;
    text: string;
    url: string;
}

type ChatSystemFragment = {
    type?: string;
    text?: string;
    url?: string;
    [key: string]: any;
}

type ChatFragment = ChatTextFragment | ChatEmoteFragment | ChatSystemFragment

type ChatMessage = {
    message?: string;
    fragments?: ChatFragment[];
    timestamp?: number;
    displayName?: string;
    tags?: {
        color?: string;
        [key: string]: any;
    };
    [key: string]: any;
};

type EmoteCatalogEntry = {
    id?: string;
    name?: string;
    url?: string;
    [key: string]: any;
};

type ScriptContext = {
    canvas: OffscreenCanvas;
    ctx: OffscreenCanvasRenderingContext2D;
    channelName: string;
    width: number;
    height: number;
    now: number;        
    deltaMs: number;    
    elapsedMs: number;  
    assets: Asset[];
    chatMessages: ChatMessage[];
    emoteCatalog: EmoteCatalogEntry[];
    playAudio: (attachment: string | { id?: string } | null | undefined) => void;
};
```

Where the final script conforms to:

```ts
type ScriptInstance = {
    init: (context: ScriptContext, state: any) => void | Promise<void>;
    tick: (context: ScriptContext, state: any) => void;
};
```

Although the types here are defined in TypeScript notation for clarity, the actual script code should be written in plain JavaScript.

While the context is pre-defined, the state is completely up to the script author. The state object is persistent between calls to `tick` and can be used to store any data the script needs to maintain.

Let's see this in practice with a simple example in the next section.
