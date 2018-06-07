# Important shit to remember

## Bash

* Set up shell integration
  * https://www.iterm2.com/documentation-shell-integration.html
  * This allows 'jump to last mark' (scroll to last input)
  * Must also add something to .bashprofile

## Git

* Remove a file from all commits on the _current branch_
  * `git filter-branch --tree-filter 'rm -f [filename]' HEAD`
* Find branches that have been merged into [branchname]
  * `git branch --merged [branchname]`
* Fetch a remote branch and make a local one
  * `git fetch [reponame] [remotebranch]:[localbranch]`

## Ruby

* Turn `Hash` keys to snakecase from camel (say, after `JSON#parse!`)
  * ```ruby
    json_string = '{"iWasJson": "but now im a hash"}'
    json_hash = JSON.parse!(json_string)
    snake_hash = json_hash.deep_transform_keys { |key| key.to_s.underscore }
    snake_hash
    ```