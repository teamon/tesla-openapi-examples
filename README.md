# Tesla OpenAPI Examples

Examples for [tesla OpenAPI generator](https://github.com/teamon/tesla/issues/487).

### Directory structure
- `priv/specs` - source of OpenAPI specifications (this is where you'd put the spec in real life)
- `lib` - examples using tesla OpenAPI
- `docs` - generated code documentation, [here in browser-friendly format](https://teamon.github.io/tesla-openapi-examples)
- `dump` - code generated behind the scenes, for showcase purposes only

## Contributing

If you'd like to help, submit a PR with some API spec using the guide below.

## Adding new examples

1. Add new spec to `Makefile`
2. Add new module in `lib/newapi.ex`
3. Compile & generate docs
  ```bash
  # Compile & dump
  mix compile

  # Run dialyzer
  mix dialyzer

  # Generate docs
  mix docs
  ```
4. Commit & push
