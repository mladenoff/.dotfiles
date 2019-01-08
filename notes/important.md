# Important shit to remember

## Git

* Remove a file from all commits on the _current branch_
  * `git filter-branch --tree-filter 'rm -f [filename]' HEAD`
* Find branches that have been merged into [branchname]
  * `git branch --merged [branchname]`
* Fetch a remote branch and make a local one
  * `git fetch [reponame] [remotebranch]:[localbranch]`

## Networking

### Get my ip address

```sh
ifconfig | grep inet
```

Should be the first `192.168.` result.

## React Native

### Something is gummed up

Can be tests using old code or Metro bundler not bundling.

```sh
rm -rf $TMPDIR/react-* && rm -rf $TMPDIR/metro* && rm -rf $TMPDIR/haste*
```

## Ruby

* Turn `Hash` keys to snakecase from camel (say, after `JSON#parse!`)
  * ```ruby
    json_string = '{"iWasJson": "but now im a hash"}'
    json_hash = JSON.parse!(json_string)
    snake_hash = json_hash.deep_transform_keys { |key| key.to_s.underscore }
    snake_hash
    ```

```ruby
    ENV['CONTENTFUL_PUBLISHED_API_KEY' = '3e38777bc9b923715f2e07bccff29a7e52f3a884f7c8cdaad7e226fa9d76125f'
```

## Shell

* Set up shell integration
  * https://www.iterm2.com/documentation-shell-integration.html
  * This allows 'jump to last mark' (scroll to last input)
  * Must also add something to .bashprofile
