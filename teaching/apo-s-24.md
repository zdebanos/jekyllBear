---
layout: page
title: Summer 2024/2025 APO
permalink: /teaching/apo-s-24
---

This page serves as a page for additional materials.
The main page is [CourseWare](https://cw.fel.cvut.cz/wiki/courses/b35apo/start).

## Lab1 Examples
Binary to decimal conversion and vice versa, hexadecimal numbers, two's complement,
C binary operators. [Slides](../../assets/APO-Sem1.pdf).

## Lab2 Examples
Multiplication, IEEE 754. [Slides](../../assets/APO-Sem2.pdf)

## Lab7 Examples
Jump predictions. [Slides](../../assets/APO-Sem7.pdf)

## Lab9
Virtual memory, OS syscalls. [Slides](../../assets/APO-Sem9.pdf)

## Lab10
How to communicate with your MZAPO board using UDP/IP.
The example features two source codes, one for the sender (the host PC),
the second one for the receiver (the MZAPO board).

`sender.c`: The code also switches the terminal to the raw mode, so no enter
pressed are needed and makes the control intuitive.
Usage: `argv[1]` is the MZAPO IP address, `argv[2]` is the UDP port.
```
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>

#define MAX_BUF 100

int main(int argc, char* argv[])
{
  int sockd;
  struct sockaddr_in my_addr, srv_addr;
  char buf[MAX_BUF];
  int count;
  int addrlen;

  if (argc < 3)
  {
    fprintf(stderr, "Usage: %s ip_address port_number\n", argv[0]);
    exit(1);
  }
  /* Create a UDP socket */
  sockd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockd == -1)
  {
    perror("Socket creation error");
    exit(1);
  }

  /* Configure client address */
  my_addr.sin_family = AF_INET;
  my_addr.sin_addr.s_addr = INADDR_ANY;
  my_addr.sin_port = 0;

  bind(sockd, (struct sockaddr*)&my_addr, sizeof(my_addr));

  /* Set server address */
  srv_addr.sin_family = AF_INET;
  inet_aton(argv[1], &srv_addr.sin_addr);
  srv_addr.sin_port = htons(atoi(argv[2]));

  /* The raw mode */
  struct termios params, old;
  tcgetattr(0, &params);
  old = params;
  cfmakeraw(&params);
  tcsetattr(0, TCSANOW, &params);

  while (1) {
    /* Read without any enter presses */
    char c = getchar();
    if (c == 'q' || c == 'Q') {
      /* If q or Q is pressed, quit */
      break;
    }
    buf[0] = c;
    sendto(sockd, buf, 1, 0, (struct sockaddr*)&srv_addr, sizeof(srv_addr));
  }

  tcsetattr(0, TCSANOW, &old);
  close(sockd);
  return 0;
}
```

`receiver.c`: run using `make run TARGET_IP=...`
```
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAX_BUF 1024
#define MZAPO_PORT 5000

int main(int argc, char* argv[])
{
  int sockd;
  struct sockaddr_in my_name, cli_name;
  char buf[MAX_BUF];
  int status;
  int addrlen;

  /* Create a UDP socket */
  sockd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockd == -1)
  {
    perror("Socket creation error");
    exit(1);
  }

  /* Configure server address */
  my_name.sin_family = AF_INET;
  my_name.sin_addr.s_addr = INADDR_ANY;
  my_name.sin_port = htons(MZAPO_PORT); /* Defined in a macro */

  status = bind(sockd, (struct sockaddr*)&my_name, sizeof(my_name));

  while (1) {
    addrlen = sizeof(cli_name);
    status = recvfrom(sockd, buf, MAX_BUF, 0,
        (struct sockaddr*)&cli_name, &addrlen);
    printf("Received %d bytes. ", status);
    for (int i = 0; i < status; ++i) {
      putchar(buf[i]);
    }
    putchar('\n');
  }

  close(sockd);
  return 0;
}
```
