let wasmExports = null;

let wasmMemory = new WebAssembly.Memory({initial: 256, maximum: 256});

let wasmTable = new WebAssembly.Table({
  'initial': 1,
  "maximum" : 1,
  "element" : 'anyfunc'
})

let asmLibraryArg = {
  "emscripten_memcpy_big": () => {},
  "fd_write": () => {},
  "fd_close" : () => {},
  "setTempRet0": () => {},
  "args_sizes_get" : () => {},
  "args_get" : () => {},
  "proc_exit" : () => {},
  "fd_seek" : () => {},
  "memory" : wasmMemory,
  "table" : wasmTable
};

let info = {
  'env': asmLibraryArg,
  'wasi_snapshot_preview1': asmLibraryArg, 
};

async function loadWasm() {
  let response = await fetch("fast_rsqrt.wasm");
  let bytes = await response.arrayBuffer();
  let wasmObj = await WebAssembly.instantiate(bytes,info);
  wasmExports = wasmObj.instance.exports;
}


