# 1. Git
- [1. Git](#1-git)
- [2. The Deep Down](#2-the-deep-down)
  - [2.1. Graphs & Directories:](#21-graphs--directories)
  - [2.2. PsuedoCode:](#22-psuedocode)
  - [2.3. SHA & Hash Functions:](#23-sha--hash-functions)
- [3. Interactive Section](#3-interactive-section)
  - [3.1. Local Branches Example](#31-local-branches-example)
    - [3.1.1. Staging vs Commit:](#311-staging-vs-commit)
    - [3.1.2. Branching Commands:](#312-branching-commands)
    - [3.1.3. Explaining `commit <SHA> (HEAD -> master)`:](#313-explaining-commit-sha-head---master)
    - [3.1.4. Note on `Fast-forward`:](#314-note-on-fast-forward)
    - [3.1.5. Note on `Merge Conflicts`:](#315-note-on-merge-conflicts)
    - [3.1.6. **Question on `Branching`:**](#316-question-on-branching)
  - [3.2. Git Remotes Example](#32-git-remotes-example)
    - [3.2.1. Remote Commands](#321-remote-commands)


# 2. The Deep Down  


## 2.1. Graphs & Directories:

![directory and branch](images/graphs.png)

> * foo `tree (folder)`
>   * bar.txt `blob (file)`
> * baz `tree (folder)`
>   
<br>

## 2.2. PsuedoCode:

```C
type blob = array<byte>

type tree = map <string, tree | blob>

type commit = struct {
    parents array<commit>
    String author
    String message
    tree snapshot
}

type object = blob | tree | commit
objects = map<String, object>

def store(o):
    id = SHA1(o)
    object[id] = 0

references = map <String, String>
```  
<br>


## 2.3. SHA & Hash Functions:

<p>Nothing too crazy here. Just review of hash functions</p>  
<br><br>

# 3. Interactive Section

## 3.1. Local Branches Example


### 3.1.1. Staging vs Commit:

<p>Nothing too crazy here. Just review of staging area and commits ("snapshots")</p>  
<br>


### 3.1.2. Branching Commands:  
<br>

|     Command     | Arguments                   |   Flags   |                   Explanation                    |
| :-------------: | :-------------------------- | :-------: | :----------------------------------------------: |
|  `git commit`   | `<blob> ` `<tree>`          | `-a` `-m` |         "Snapshot" of the current state          |
|    `git log`    |                             |   `lol`   |      Lists history of git   commits + graph      |
|    `git add`    | `<blob>`, `<tree>`          |           |  Brings files to staging area. Ready to commit.  |
| `git checkout`  | `<SHA>`, `<branch>`, `HEAD` | `-f` `-b` |          Move HEAD and preserve commits          |
|   `git diff`    | `<blob>`, `<tree>`, `<SHA>` |           |     Display which files / lines have changed     |
|  `git branch`   | `<string>`                  |   `-vv`   |         Branches off from current branch         |
|   `git merge`   | `<branch>`                  | `--abort` |       Merge `<branch>` to branch at `HEAD`       |
| `git mergetool` |                             |           | Loads configured tool to resolve merge conflicts |
<br><br>





### 3.1.3. Explaining `commit <SHA> (HEAD -> master)`:
* `master / main`: refers to commits
* `HEAD`  
<br>

### 3.1.4. Note on `Fast-forward`:
* This comes up when running `git merge <branch>` such that the current branch is a predecessor to `<branch>`
* This essentially means that the current branch will now point to where `<branch>` was pointing  
<br>

### 3.1.5. Note on `Merge Conflicts`:
* This happens when more than one branch in your merge affects the same files/lines
  * Git will try its best to auto merge but may request you to fix it 
  * If so you will have to review the code and determine how to best harmonize both pieces of code  
  <br>


### 3.1.6. **Question on `Branching`:**
* Is it best practice to keep branches relatively independent to reduce merge conflicts?  
<br><br>


## 3.2. Git Remotes Example


### 3.2.1. Remote Commands

|     Command      | Arguments                               |     Flags      |            Explanation             |
| :--------------: | :-------------------------------------- | :------------: | :--------------------------------: |
| `git remote add` | `<name> <url>`                          |                | Adds git remote for collaborating  |
|    `git push`    | `<remote> <localbranch>:<remotebranch>` |                | Pushes branch in remote repository |
|   `git clone`    | `<url> <localfolder>`                   |                |      Used to download a repo       |
|   `git branch`   |                                         | `set upstream` |                                    |
