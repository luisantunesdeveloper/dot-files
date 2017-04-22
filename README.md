* To use it please rename vimrc for .vimrc and place under your user directory

* Some VIM Syntax

** verbs  
d: delete
c: change
y: yank/copy
v: visual

** modifiers
i: inside
a: around
t: till finds a char
f: till except not including the char
/: find a string or regex

** text objects
w: word
s: sentence
p: paragraph
b: block/parenthesis
t: tag for html/xml

** some examples
diw: delete inside word
cis: change inside sentence
ci': change inside quote
c/foo: change until next occurence of foo
ctX: change all to the letter X
vap: visual select arounf the paragraph
