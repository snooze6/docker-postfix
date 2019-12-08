# Docker postfix

This is a simple dockerfile recipe for creating a postfix docker and send spam.

## Build

```bash
docker build --rm -t snooze/postfix .
```

By the way, clean all the <none> images you have by doint the following command:

```bash
sh -c 'docker rmi $(docker images -f "dangling=true" -q)'
```

## Test from host

```bash
sendemail -s <containter ip>:25 -f someone@domain.com -t someone@gmail.com -u Hello again  -m Hello again 
```