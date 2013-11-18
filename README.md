# Cssspec
Generates style guide from stylesheets.

## Installation
```sh
# shell-command
gem install cssspec
```

## Usage
```ruby
stylesheets = Cssspec::StylesheetsFinder.find("stylesheets/**/*.scss")
stylesheets.size #=> 2
stylesheets[0].path #=> #<Pathname:stylesheets/foo/bar.scss>
stylesheets[0].sections[0].code #=> '<button class="button">button</button>'
stylesheets[0].sections[0].render #=> "<p>Button</p>\n\n<pre> ... </pre>"
```
