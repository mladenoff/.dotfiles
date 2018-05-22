# Important shit to remember

## Git
* Remove a file from all commits on a _branch_
  * `git filter-branch --tree-filter 'rm -f [filename]' HEAD`

## Ruby
* Turn `Hash` keys to snakecase from camel (say, after `JSON#parse!`)
  * ```
    json_string = '{"iWasJson": "but now im a hash"}'
    json_hash = JSON.parse!(json_string)
    snake_hash = json_hash.deep_transform_keys { |key| key.to_s.underscore }
    snake_hash
    ```