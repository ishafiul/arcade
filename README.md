# Dartseid

## TODO

### Essentials

- [x] Parse path parameters
- [x] Make `RequestContext.json` return a sealed class to wrap possible errors
- [x] Add support for hot reload
- [x] Handle all errors defaulting to 500
- [ ] Add support for middlewares
- [ ] Add support for views. e.g. HTML views for websites
- [ ] Add support for cookies

### Essential but not urgent

- [ ] Add support for web sockets
- [ ] Add support for GraphQL

### Nice to haves

- [ ] Use `cli_util` to show progress in the CLI when reloading
- [ ] Add default headers. e.g. `Cache-Control`, `X-Powered-By`, etc. Cache-Control should be configurable, and
  default to `no-cache` for API routes (JSON)
