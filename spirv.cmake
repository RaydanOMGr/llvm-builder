set(LLVM_ENABLE_PROJECTS "clang" CACHE STRING "")

set(LLVM_RUNTIME_TARGETS "spirv64-unknown-unknown" CACHE STRING "")

set(RUNTIMES_spirv64-unknown-unknown_LIBCLC_USE_SPIRV_BACKEND ON CACHE BOOL "")
set(RUNTIMES_spirv64-unknown-unknown_LLVM_ENABLE_RUNTIMES "libclc" CACHE STRING "")
