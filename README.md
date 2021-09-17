# Simple Chat Room

> Shangyu Ko

Simple Chat Room is a C-language-based server-client system with no User Interface. This project is for Socket Programming and Protocol practicing. It provides users to:
- sing up/log in/auto log in
- add/modify friend list
- add/modify black list
- chat with built-in stickers
- send files
- send message to off-line users / check the unread message

## Build

- Simple Chat Room is built in GCC compiler. To build Simple Chat Room, run:

```bash
$make
```

- This will compile two binary files, `server` and `client`.

## Configuration

- To set the maximum online client, modify the file `src/common.h`:

```c
#define MAX_ONLINE_CLIENT 20
```

## Run the Application

- To run the application, user needs to run the server first, then run the client. In the server's command line, run the following command, and user can leave server alone.

```bash
$./server [port]
```

- And in the client's command line, run:

```bash
$./client [server IP]:[server port]
$./client [server Host]:[server port]
```

- If user already has an account (signup is in the following section), user can use auto-login function

```bash
$./client [server IP]:[server port] -auto [client name] [client password]
$./client [server Host]:[server port] -auto [client name] [client password]
```

## Functions

### Sign Up and Log in

- The command line will provide the choices, and user just needs to type the character and press enter.

```C
Please enter sign-up[s] or login[l] or quit[q]
s
username: Steve
password: steveCool123
```

### In the Lobby

- User can choose either chat, modify the white-list and black-list, or quit

```c
user are in the lobby now.
Enter specific command
    - chat-with-friend[c]
    - quit[q]
    - good-friend show/add/delete[gf s/a/d]
    - bad-friend show/add/delete[bf s/a/d]
```

### White List and Black List

- As the above tips, user can view the white-list and black-list with the below interface. 

```c
gf s
==== good-friend ====
Bob
=====================

bf s
==== bad-friend ====
[empty]
=====================
```

### In the Chat Room

- When user enters the chat room, he will see the unread messages(if he sent user when user was off-line).
- To see the whole conversation history, user can type `$ h`. Please start the command with `$` character.

```c
user are in the chat room now.
Feel free to chat!
Enter specific command
- history[$ h]
- send-file[$ s [fileName]]
- stop-chat[$ sc]
===== un read message =====
Bob:q
===========================
Bob: hello
Bob: byebye
user 'Bob' is not online, but user can still send the message.
user 'Bob' is online, now.
Bob: hello
```

- To send the file, please make sure the file path is correct, or user's file won't be sent. The sending process used the new thread, so user can chat with other directly.

```c
(in the 'Steve' side)
$ send a.txt

(in the 'Bob' side)
=> get file from 'Steve', fileName is 'a.txt'
```

### Quit

- To quit the chat and the application, it is recommend to use the provide command, [`$sc`] and [`q`]
- But users can also use `Ctr+C` If they prefer.

