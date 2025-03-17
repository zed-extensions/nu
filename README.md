# Zed Nu

This extension adds support for the [Nu](https://github.com/nushell/nushell) language.

## Override Default Configuration (Optional)

You can minimize the configuration autoloaded when the server starts,
which may improve performance as complicated Nushell configurations can slow down the language server.

```json
{
  "lsp": {
    "nu": {
      "binary": {
        "command": "nu",
        "arguments": ["--config", "~/.config/nushell/lsp.nu", "--lsp"]
      }
    }
  }
}
```

### Example of Minimal lsp.nu

```nushell
# Configure PATH to search for external command completions
$env.PATH = $env.PATH
| split row (char esep)
| append ($env.HOME | path join ".cargo" "bin")
| uniq

# Set up external completer (requires carapace)
$env.CARAPACE_LENIENT = 1
$env.CARAPACE_BRIDGES = 'zsh'
$env.config.completions.external.completer = {|spans: list<string>|
  carapace $spans.0 nushell ...$spans
  | from json
  | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

# Define extra library directories to load definitions from
const NU_LIB_DIRS = ["some/extra/lib"]
```
