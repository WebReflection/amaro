# @webreflection/amaro

This is [@swc/wasm-typescript](https://www.npmjs.com/package/@swc/wasm-typescript), the one [used in NodeJS](https://github.com/nodejs/amaro/tree/main/lib), repackaged as browser friendly module, no more, hopefully no less.

```js
// https://esm.run/@webreflection/amaro
import { transformSync } from '@webreflection/amaro';

transformSync('const s:string = "amaro"').code;
// const s:       = "amaro"
// that's it 🥳
```
