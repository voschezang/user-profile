# Regex

Cheatsheet for regexes. 
Technically this file doesn't in this repo but it does relate to [`vi` usage](# vi/sed).

> "the plural of regex is regret"

See also: 
- [regexr.com](https://regexr.com/)
- [cheatsheet](https://learnbyexample.github.io/gnu-bre-ere-cheatsheet/)

Some definitions:

- BRE Basic Regular Expressions: for `grep, sed, vi`
- ERE Extended Regular Expressions: for `awk, grep -E, sed -E`

Note, the longest match has precedence over shorter matches.


## Anchors
Query limits, selection bounds
```
^   BOL
$   EOL
\<  begin of word
\>  end of word
```


## Scopes
```
[abc]       match any of abc
[^abc]      match any of NOT abc
```

## Select
```
\w      match word chars: alphanumerical, i.e. [a-zA-Z0-9_]
\W      match non-word chars
\s      match whitespace
\S      match non-whitespace
.       match any char, incl. \n
```

### Repeat
```
?       match zero or once
*       match 0 or more times
+       match 1 or more times
{M,N}   match M to N times, \{ in BRE mode
{M,}    match at least M times
{,N}    match up to N times
```


## Logic
```     
(                   scope, or \( in BRE mode
|                   logic OR
aa(1|2)bb           
prefix.*suffix      match with wildcard in middle
aa.*bb|bb.*aa       match aa*bb OR bb*aa
```


## vi/sed

`:%s.prefix_\(suffix\).\1.g`        replace `prefix_suffix` with `suffix`

`:%s.prefix_\(\w*\).new_\1.g`   replace `prefix_***` with `new_***`, where `***` is any word

`def \w*`                       find any python function definition, until `()`

`def.*:`                        find any python function definition, incl. `(..):`

`\<\w*suffix\>`                 find words ending with `suffix`

`\<[a-zA-Z]*suffix`             find terms ending with `suffix`

`%s/term.*/"&"/g`               find & insert matched text`
