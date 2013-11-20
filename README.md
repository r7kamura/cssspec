# Cssspec
Generates style guide from stylesheets.

## Installation
```sh
# shell-command
gem install cssspec
```

## Server
```sh
# shell-command
rackup
```

    /*
      # .button
      basic button design

      ```
      <button class="button">
        button
      </button>

      <button class="button danger">
        danger
      </button>
      ```
    */
    .button {
      ...
    }

![](http://dl.dropboxusercontent.com//u/5978869/image/20131126_005907.png)

## Objects
```ruby
stylesheets = Cssspec::StylesheetsFinder.find("stylesheets/**/*.scss")
stylesheets.size #=> 2
stylesheets[0].path #=> #<Pathname:stylesheets/foo/bar.scss>
stylesheets[0].sections[0].code #=> '<button class="button">button</button>'
stylesheets[0].sections[0].render #=> "<p>Button</p>\n\n<pre> ... </pre>"
```
