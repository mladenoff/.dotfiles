# Important shit to remember

## Git

* Fetch a remote branch and make a local one
  * `git fetch [reponame] [remotebranch]:[localbranch]`
* Find branches that have been merged into [branchname]
  * `git branch --merged [branchname]`
* Remove a file from all commits on the _current branch only_
  * `git filter-branch --tree-filter 'rm -f [filename]' HEAD`
* Delete all branches that are merged in `development` (but don't delete `master`, `development`, or `staging`)
  * `git branch --merged development | egrep -v "(^\*|master|development|staging)" | xargs git branch --delete`
* List ten oldest branches that have been merged into `development`
  * `g for-each-ref --sort=committerdate --count=10 refs/heads --format='%(refname:short)' --merged development`

`g for-each-ref --sort=committerdate --count=10 refs/heads --format='%(refname:short)' --merged development | egrep -v "(^\*|master|development|staging)" | xargs git branch --delete`

`g for-each-ref --sort=committerdate --count=2 refs/heads --format='%(refname:short)' --merged development | egrep -v "(^\*|master|development|staging)" | xargs git branch --delete`

* See what time of day you make your commits
`git log --author="Isak" --date=iso | perl -nalE 'if (/^Date:\s+[\d-]{10}\s(\d{2})/) { say $1+0 }' | sort | uniq -c|perl -MList::Util=max -nalE '$h{$F[1]} = $F[0]; }{ $m = max values %h; foreach (0..23) { $h{$_} = 0 if not exists $h{$_} } foreach (sort {$a <=> $b } keys %h) { say sprintf "%02d - %4d %s", $_, $h{$_}, "*"x ($h{$_} / $m * 50); }'`

## Networking

### Get my ip address

* Wireless
  * `ipconfig getifaddr en0`
* Wired
  * `ipconfig getifaddr en1`
* OR
  * `ifconfig | grep inet
    * Should be the first `192.168.` result.

## React Native

### Something is gummed up

Can be tests using old code or Metro bundler not bundling.

```sh
rm -rf $TMPDIR/react-* && rm -rf $TMPDIR/metro* && rm -rf $TMPDIR/haste*
```

## Ruby

* Turn `Hash` keys to snakecase from camel (say, after `JSON#parse!`)
  *

  ```ruby
    json_string = '{"iWasJson": "but now im a hash"}'
    json_hash = JSON.parse!(json_string)
    snake_hash = json_hash.deep_transform_keys { |key| key.to_s.underscore }
    snake_hash
    ```

```ruby
    ENV['CONTENTFUL_PUBLISHED_API_KEY' = '3e38777bc9b923715f2e07bccff29a7e52f3a884f7c8cdaad7e226fa9d76125f'
```

## Shell

* Pipe to clipbaord (macOS)
  * `| pbcopy`

* Set up shell integration
  * <https://www.iterm2.com/documentation-shell-integration.html>
  * This allows 'jump to last mark' (scroll to last input)
  * Must also add something to .bashprofile
