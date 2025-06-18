#!/bin/sh

cat ./node_modules/@swc/wasm-typescript/LICENSE >> ./LICENSE
echo 'const swc = ((require, module, exports = module.exports) => {' > ./amaro.js
cat ./node_modules/@swc/wasm-typescript/wasm.js >> ./amaro.js
echo 'return module.exports;
})(
  name => {
    switch (name) {
      case "util": return { TextEncoder, TextDecoder };
      case "node:buffer": return { Buffer: { from(base64) {
        return Uint8Array.from(atob(base64), c => c.charCodeAt(0)).buffer;
      } } }
    }
  },
  { exports: {} },
);

export const transformSync = (source, options) => {
  return swc.transformSync(String(source ?? ""), {
    mode: "strip-only",
    deprecatedTsModuleAsError: true,
    transform: {
      verbatimModuleSyntax: true,
      nativeClassProperties: true,
      noEmptyExport: true,
      importNotUsedAsValues: "preserve",
    },
    ...options,
  });
};
' >> ./amaro.js
