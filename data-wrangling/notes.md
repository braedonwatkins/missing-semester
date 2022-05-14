- [1. Data Wrangling](#1-data-wrangling)
  - [1.1. Talks about ssh here a little + GREPs for ssh in his log](#11-talks-about-ssh-here-a-little--greps-for-ssh-in-his-log)
  - [1.2. less (command):](#12-less-command)
- [2. Regex](#2-regex)
- [3. Data Analysis](#3-data-analysis)
- [4. Additional Tools](#4-additional-tools)
- [5. Types of Data Wrangling](#5-types-of-data-wrangling)
- [6. Testing Math Environment](#6-testing-math-environment)
- [7. Testing Code Environment](#7-testing-code-environment)
- [8. Testing Other Formatting](#8-testing-other-formatting)
  
## 1. Data Wrangling
<ul>
  <li>basically transforming any data to another kind of data</li>
  <ul><li>i.e. GREP</li></ul>
</ul>
<br>


###  1.1. Talks about ssh here a little + GREPs for ssh in his log
<br>

### 1.2. less (command):
* Stops from long returns filling up screen and taking up all the space.
  - think of git log  
<br><br>


## 2. Regex
* sed (command):
  - stream editor
  - lets you make changes to contents (replacements)
  - takes in regular expressions
  - E Flag (-E): helps support more modern regex notation <br>

* Example Regex: _'s/.*Disconnected from//'_
  - Dot (.): Any Single Character
  - Star/Kleene Closure (*): Zero or more of preceding char
    - Non-Greedy (*?<expression>): will stop at the first instance of the following regex 
  - (??) Substitute (s/<chars>/<chars>/): Substitute first set with second <br>

* More Regex Notations:
  - Square Brackets([<chars>]): select whichever char in list shows up first
  - Global Modifier(<command>g): do this as many times as it keeps matching
  - Question Mark (<expression>? ): 0 or 1 occurences of the preceding
  - Plus (<expression>+): 1 or more (like star++)
  - Anchoring: 
    - States the regex has to match the complete line
    - Beginning Line( ^ )
    - End Line ( $ )
  - Logical: 
    - Or ( | ): will match either expression before or after <br>

* Regex Capture Group: Any Brackets / Parenthesis which will remember value
  - Refer to Capture Group (\<order of capture group>)
  - Example: sed -E 's/^... (a | b) ... (.*) ...$/ \2/' | head -n100  <br>

* Regex Debuggers (regex101.com): Helps to show how a regex evaluates  <br><br><br>

## 3. Data Analysis
* Terminal Commands:
  - Line Count (wc -l)
  - Sort (sort)
    - Numeric Sort (sort -n)
    - Select White Space Seperated Column(sort -k<beginColumn>,<endColumn>)
  - Only Print Unique Lines (uniq)
    - Count Duplicates (uniq -c)
  - Only Give Last Ten Lines (tail -n10)
  - (??) Columnar Data Stuff [print second of a given column] (awk `{print $2}`)
    - Can take regular expressions [print users that only appear once and start with 'c' and end with 'e'] (awk '$1 == 1 && $2 ~ /^c.*e$/ {print $0}') 
    - This will print out the 	second column of a column data
  - (??) Takes Lines and Paste Them as One Line w/ Comma Delimiter (paste -sd) <br><br><br>


## 4. Additional Tools
* Berkeley Calculator (bc -l): Just a calculator <br>

* R Programming (R):
  - Examples:
    - (R --slave --r 'x <- scan(file="stdin",quiet=True); summary(x)') <br>

* Plotting Graphs (gnuplot):
  - Example: (gnuplot -p -e 'set boxwidth 0.5; plot "-" using 1:xtic(2) with boxes') <br><br><br>  


## 5. Types of Data Wrangling
* Command Line Argument Wrangling:
  - Turn Piped Inputs to Arguments for a Given Command (xargs <command(s)>)
    - Example: [Takes listed info, searches for the redundant installs, then xArgs passes this list into an uninstall command] (rustup toolchain list | grep nightly | grep -v 'nightly-x86' | grep 2019 | sed 's/-x86.*//' | xargs echo rustup toolchain uninstall) 

  - Encoding/Decoding Video + Image (ffmpeg)
    - Example: [Take a Photo, convert to gray, send it to server, then send it back, and finally display] (ffmpeg -loglevel panic  -i /dev/video0 -frames 1 -f image2 - | convert - -colorspace gray - | gzip | ssh tsp 'gzip -d | tee copy.png' | feh - <br><br><br>

## 6. Testing Math Environment
$$ \int_{a}^{b} x^2 \,dx \rightarrow a \,|\, \{ a \epsilon \natnums,\, a \geq 4,\,  a\,mod(2) == 0 \}$$
<br><br><br>


## 7. Testing Code Environment
Here we have some code

```json
{
  "firstName" : "John",
  "lastName" : "Smith",
  "age" : 25
}
```

Here we have some other stuff in the form of regex `awk '$1 == 1 && $2 ~ /^c.*e$/ {print $0}`


## 8. Testing Other Formatting
I need to ==highlight words== 