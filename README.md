# Basic usage 
To use it please rename vimrc for .vimrc and place under your user directory.    
TMUX config is also included. Configurations are self explanatory.  

# Some VIM Syntax  
  
## verbs    
d: delete  
c: change  
y: yank/copy  
v: visual  
  
## modifiers  
i: inside  
a: around  
t: till finds a char  
f: till except not including the char  
/: find a string or regex  
\*: next instance of the current cursor positioned word

## text objects  
w: word  
s: sentence  
p: paragraph  
b: block/parenthesis  
t: tag for html/xml  
  
## some examples  
diw: delete inside word  
cis: change inside sentence  
ci': change inside quote  
c/foo: change until next occurence of foo  
ctX: change all to the letter X  
vap: visual select around the paragraph  

## working with files  
:tabe : open a new tab  
:th  :tabfirst<CR>  
:tj  :tabnext<CR>  
:tk  :tabprev<CR>  
:tl  :tablast<CR>  
:tt  :tabedit<Space>  
:tn  :tabnext<Space>  
:tm  :tabm<Space>  
:td  :tabclose<CR>  
:edit 

## modes
v : visual mode  
C-v : block visual mode

## moving around  
h   move one character left  
j   move one row down  
k   move one row up  
l   move one character right  
w   move to beginning of next word  
b   move to previous beginning of word  
e   move to end of word  
W   move to beginning of next word after a whitespace  
B   move to beginning of previous word before a whitespace  
E   move to end of word before a whitespace  
  
0   move to beginning of line  
$   move to end of line  
_   move to first non-blank character of the line  
g\_  move to last non-blank character of the line  
  
gg  move to first line  
G   move to last line  
nG  move to n'th line of file (n is a number; 12G moves to line 12)  
  
H   move to top of screen  
M   move to middle of screen  
L   move to bottom of screen  
  
z.  scroll the line with the cursor to the center of the screen  
zt  scroll the line with the cursor to the top  
zb  scroll the line with the cursor to the bottom  
  
Ctrl-D  move half-page down  
Ctrl-U  move half-page up  
Ctrl-B  page up  
Ctrl-F  page down  
Ctrl-O  jump to last (older) cursor position  
Ctrl-I  jump to next cursor position (after Ctrl-O)  
Ctrl-Y  move view pane up  
Ctrl-E  move view pane down  

n   next matching search pattern  
N   previous matching search pattern  
\*   next whole word under cursor  
\#   previous whole word under cursor  
g\*  next matching search (not whole word) pattern under cursor  
g#  previous matching search (not whole word) pattern under cursor  
  
%   jump to matching bracket { } [ ] ( )  
  
fX  to next 'X' after cursor, in the same line (X is any character)  
FX  to previous 'X' before cursor (f and F put the cursor on X)  
tX  til next 'X' (similar to above, but cursor is before X)  
TX  til previous 'X'  
;   repeat above, in same direction  
,   repeat above, in reverse direction  
C-R X - Finds the correspondent record (X) within / for example

## commands
:g// runs a command in each line following a pattern

## config related
:so % : reload vimrc while editing the config file  

## plugin

### surroundings
yssb or yss) or yss(: select the word and surround it with ()  
cst`<strong>` : change the surround tag to `<strong>`
dst : delete surround tag

## special considerations
git config --global core.editor vim


